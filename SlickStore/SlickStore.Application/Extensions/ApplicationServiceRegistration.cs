using Microsoft.Extensions.DependencyInjection;
using SlickStore.Application.Interfaces.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace SlickStore.Application.Extensions
{
   public static class ApplicationServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            // AutoMapper: scans all Profiles in the Application assembly
            services.AddAutoMapper(Assembly.GetExecutingAssembly());

            // Register services
            services.AddScoped<IUserService, UserService>();

            // You can also register validators or other application-wide services here
            // services.AddValidatorsFromAssembly(Assembly.GetExecutingAssembly());

            return services;
        }
    }
}
