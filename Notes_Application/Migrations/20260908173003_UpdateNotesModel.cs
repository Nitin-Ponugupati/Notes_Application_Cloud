using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Notes_Application.Migrations
{
    /// <inheritdoc />
    public partial class UpdateNotesModel : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Name",
                table: "Notes",
                newName: "Title");

            migrationBuilder.AddColumn<string>(
                name: "Content",
                table: "Notes",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Content",
                table: "Notes");

            migrationBuilder.RenameColumn(
                name: "Title",
                table: "Notes",
                newName: "Name");
        }
    }
}
