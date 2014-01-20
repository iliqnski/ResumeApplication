using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ResumeApplication.Web.Startup))]
namespace ResumeApplication.Web
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
