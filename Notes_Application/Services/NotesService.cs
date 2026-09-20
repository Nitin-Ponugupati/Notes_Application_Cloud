using Microsoft.EntityFrameworkCore;
using Notes_Application.Data;
using Notes_Application.Models;

namespace Notes_Application.Services
{
    public class NotesService
    {
        private readonly AppDbContext _context;

        public NotesService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Notes>> GetNotesAsync()
        {
            return await _context.Notes.ToListAsync();
        }

        public async Task<Notes> AddNoteAsync(Notes note)
        {
            _context.Notes.Add(note);
            await _context.SaveChangesAsync();
            return note;
        }
    }
}
