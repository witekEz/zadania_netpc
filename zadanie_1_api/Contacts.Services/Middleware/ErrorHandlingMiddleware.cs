using Contacts.Services.Middleware.Exceptions;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Contacts.Services.Middleware
{
    public class ErrorHandlingMiddleware : IMiddleware
    {
        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            try
            {
                await next.Invoke(context);
            }
            catch (NotFoundException ex)
            {
                context.Response.StatusCode = 404;
                await context.Response.WriteAsync(ex.Message);
            }
            catch (BadRequestException ex)
            {
                context.Response.StatusCode = 400;
                await context.Response.WriteAsync(ex.Message);
            }
            catch (Exception)
            {
                context.Response.StatusCode = 500;
                await context.Response.WriteAsync("Something went wrong");
            }

        }
    }
}
