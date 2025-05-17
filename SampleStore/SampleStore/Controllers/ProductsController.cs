 using Microsoft.AspNetCore.Mvc;
using SampleStore;

namespace Store.Controllers
{
    // ======================= NOTICE ============================
    // TODO: Un-comment for faster testing during development!
    // ===========================================================

    //[ApiController]
    //[Route("api/[controller]")]
    //public class ProductsController : Controller
    //{
    //    private readonly IUnitOfWork _unitOfWork; 
    //    public ProductsController(IUnitOfWork unitOfWork)
    //    {
    //        _unitOfWork = unitOfWork;
    //    }

    //    [HttpPost("create")]
    //    public async Task<ActionResult<List<sp_CreateProduct_Result>>> CreateProduct([FromBody] sp_CreateProduct_DTO model)
    //    {
    //        try
    //        {
    //            var result = await _unitOfWork.ProductsRepository.sp_CreateProduct(model);
    //            if (result == null || result.Count == 0)
    //                return NotFound(new { success = true, Response = "No data found", result = new List<object> { } });

    //            return Ok(new { success = true, Response = "Success", result = result });
    //        }
    //        catch (Exception ex)
    //        {

    //            return BadRequest(new { success = false, Response = ex, result = new List<object> { } });
    //        }
    //    }

    //    [HttpGet("all")]
    //    public async Task<ActionResult<List<sp_GetAllProducts_Result>>> GetAllProducts()
    //    {
    //        try
    //        {

    //            var result = await _unitOfWork.ProductsRepository.sp_GetAllProducts();
    //            if (result == null || result.Count == 0)
    //                return NotFound(new { success = true, Response = "No data found", result = new List<object> { } });

    //            return Ok(new { success = true, Response = "Success", result = result });
    //        }
    //        catch (Exception ex)
    //        {

    //            return BadRequest(new { success = false, Response = ex, result = new List<object> { } });
    //        }
    //    }

    //    [HttpGet("{id}")]
    //    public async Task<ActionResult<List<sp_GetProductById_Result>>> GetProductById(int id)
    //    {
    //        try
    //        {
    //            var result = await _unitOfWork.ProductsRepository.sp_GetProductById(new sp_GetProductById_DTO { ProductId = id });
    //            if (result == null || result.Count == 0)
    //                return NotFound(new { success = true, Response = "No data found", result = new List<object> { } });

    //            return Ok(new { success = true, Response = "Success", result = result });
    //        }
    //        catch (Exception ex)
    //        {

    //            return BadRequest(new { success = false, Response = ex, result = new List<object> { } });
    //        }
    //    }

    //    [HttpPut("update")]
    //    public async Task<IActionResult> UpdateProduct([FromBody] sp_UpdateProduct_DTO model)
    //    {
    //        try
    //        {

    //            var rowsAffected = await _unitOfWork.ProductsRepository.sp_UpdateProduct(model);
    //            if (rowsAffected == 0)
    //                return NotFound(new { success = true, Response = "No data updated"});

    //            return Ok(new { success = true, Response = "Success" });
    //        }
    //        catch (Exception ex)
    //        {

    //            return BadRequest(new { success = false, Response = ex});
    //        }
    //    }

    //    [HttpDelete("{id}")]
    //    public async Task<IActionResult> DeleteProduct(int id)
    //    {
    //        try
    //        {

    //            var result = await _unitOfWork.ProductsRepository.sp_DeleteProduct(new sp_DeleteProduct_DTO { ProductId = id });
    //            if (result == 0)
    //                return NotFound(new { success = true, Response = "No data deleted" });

    //            return Ok(new { success = true, Response = "Success" });
    //        }
    //        catch (Exception ex)
    //        {

    //            return BadRequest(new { success = false, Response = ex });
    //        }
    //    }
    //}
}
