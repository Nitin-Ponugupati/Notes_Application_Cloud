using Microsoft.AspNetCore.Mvc;
using Notes_Application.Models;
using Notes_Application.Services;

namespace Notes_Application.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NotesController : ControllerBase
    {
        private readonly NotesService _notesService;

        public NotesController(NotesService notesService)
        {
            _notesService = notesService;
        }

        [HttpGet(Name ="Health")]
        public ActionResult<string> Health()
        {
            return Ok("Notes API is running.");
        }
        [HttpGet(Name = "GetNotes")]
        public async Task<ActionResult<List<Notes>>> Get()
        {
            var notes = await _notesService.GetNotesAsync();
            return Ok(notes);
        }

        [HttpPost(Name = "PostNotes")]
        public async Task<ActionResult<Notes>> Post([FromBody] Notes note)
        {
            var addedNote = await _notesService.AddNoteAsync(note);
            return Ok(addedNote);
        }
    }
}
