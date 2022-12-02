using Microsoft.EntityFrameworkCore.Migrations;

namespace CartonManeger.Migrations
{
    public partial class CreateIsEnabled : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PostDiary_Account",
                table: "PostCarton");

            migrationBuilder.AddColumn<bool>(
                name: "IsEnabled",
                table: "Account",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddForeignKey(
                name: "FK_PostDiary_Account",
                table: "PostCarton",
                column: "AccountId",
                principalTable: "Account",
                principalColumn: "AccountId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PostDiary_Account",
                table: "PostCarton");

            migrationBuilder.DropColumn(
                name: "IsEnabled",
                table: "Account");

            migrationBuilder.AddForeignKey(
                name: "FK_PostDiary_Account",
                table: "PostCarton",
                column: "AccountId",
                principalTable: "Account",
                principalColumn: "AccountId",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
