using Microsoft.EntityFrameworkCore;
using Notes_Application.Models;

namespace Notes_Application.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }
        public DbSet<Notes> Notes { get; set; }
    }
}
