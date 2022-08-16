// for graphics
#include <raylib.h>
// assembly program exports
#include "colors.h"

int main() {
    SetTraceLogLevel(LOG_NONE);
    InitWindow(width,height,"Color Change");
    SetTargetFPS(60);
    
    while(!WindowShouldClose()) {
        BeginDrawing();
        if(IsKeyPressed(KEY_SPACE)) next_color();
        ClearBackground(*background_color);
        EndDrawing();

    } 
}
