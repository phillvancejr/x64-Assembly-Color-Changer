.global _width
.global _height
.global _title
.global _background_color

// functions
.global _next_color
.text
_next_color: 
    xorq %rdx, %rdx
    movl index(%rip),%eax
    // save old value of index 
    push %rax 
    incl %eax 
    // div by 4, the length of the color array
    movl $4, %ecx
    divl %ecx
    // edx contains the modulo value
    movl %edx, index(%rip)
    // pop back into eax
    pop %rax
    // scale old value by sizeof(Color) aka 4 bytes
    imull $4, %eax
    // use old index value to index the colors array
    // load the colors pointer
    lea colors(%rip), %rdx
    // incrememnt by the modulo value to index into the array
    addq %rax,%rdx
    movq %rdx, _background_color(%rip)
    // overall roughly
    // result = index
    // eax++
    // ecx = 4
    // index = eax % ecx
    // return result
    ret

.bss
.lcomm index, 4
.data
_width: .int 500
_height: .int 500
_title: .asciz "Color Changer\0"
_background_color: .quad white
colors: 
white:
.byte 255
.byte 255
.byte 255
.byte 255
red:
.byte 255
.byte 0
.byte 0
.byte 255
magenta:
.byte 255
.byte 0
.byte 255
.byte 255
blue:
.byte 0
.byte 0
.byte 255
.byte 255
