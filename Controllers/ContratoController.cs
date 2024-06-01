using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using APIINMOBILIARIA.Models;
using System.Security.Claims;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace APIINMOBILIARIA.Controllers
{
	[Route("api/[controller]")]
	[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
	[ApiController]
	public class ContratoController : Controller
	{
		private readonly DataContext contexto;

		public ContratoController(DataContext contexto)
		{
			this.contexto = contexto;
		}

		// GET: api/<controller>

[HttpGet("GetContrato")]
 // Requires valid JWT token for access
public IActionResult GetContrato(int id)
{     Console.WriteLine("hola");
    var user = HttpContext.User;

    var userIdClaim = user.FindFirstValue(ClaimTypes.NameIdentifier);
Console.WriteLine("hola");
      var inmueblesDelPropietario = contexto.Contratos
	    .Include (i=> i.Inquilino)
		.Include (i=> i.Inmueble)
        .Where(i => i.InmuebleId == id)
		
        .ToList();

    return Ok(inmueblesDelPropietario);

}


[HttpGet("GetInmueblescontrato")]
public async Task<IActionResult> GetInmueblescontrato()
{
    var user = HttpContext.User;
    var userIdClaim = user.FindFirstValue(ClaimTypes.NameIdentifier);

    if (int.TryParse(userIdClaim, out int userId))
    {
        // Obtén los inmuebles del propietario que tienen contratos asociados
        var inmueblesDelPropietario = await contexto.Inmuebles
            .Where(i => i.PropietarioId == userId && 
                        contexto.Contratos.Any(c => c.InmuebleId == i.Id))
            .ToListAsync();

        return Ok(inmueblesDelPropietario);
    }
    else
    {
        return BadRequest("Invalid user ID format in token");
    }
}

[HttpGet("inmueble/{id}")]
        public async Task<IActionResult> GetContratoPorInmueble(int id)
        {Console.WriteLine("caca");
            try
            {
                var usuario = User.Identity.Name;

                var propietario = await contexto.Propietarios
                    .FirstOrDefaultAsync(p => p.Email == usuario);

                if (propietario == null)
                {
                    return NotFound("Propietario no encontrado");
                }

                var contrato = await contexto.Contratos
                    .Include(c => c.Inquilino)
                    .Include(c => c.Inmueble) // Incluye el objeto Inmueble en la consulta
                    .FirstOrDefaultAsync(c => c.InmuebleId == id && c.Estado == true);

                if (contrato == null)
                {
                    return NotFound("Contrato no encontrado");
                }

                return Ok(contrato);
            }
            catch (Exception ex)
            {
                return BadRequest($"Error al obtener el contrato: {ex.Message}");
            }
        }
	}
}
