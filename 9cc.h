//
// Created by pco2699 on 2020/08/24.
//

#ifndef INC_9CC_9CC_H
#define INC_9CC_9CC_H

#include <ctype.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


//
// parse.c
//

// node kind
typedef enum {
    ND_ADD, // +
    ND_SUB, // -
    ND_NUM, // 整数
    ND_MUL, // *
    ND_DIV, // /
    ND_EQ,  // ==
    ND_NEQ, // not equal
    ND_LET, // <=
    ND_LT   // <
} NodeKind;

// token kind
typedef enum {
    TK_RESERVED,
    TK_NUM,
    TK_EOF,
} TokenKind;

// token
typedef struct Token Token;
struct Token {
    TokenKind kind;
    Token *next;
    int val;
    char *str;
    int len;
};

// node
typedef struct Node Node;
struct Node {
    NodeKind kind;
    Node *lhs;
    Node *rhs;
    int val;
};

Node *expr();
Token *tokenize(char *p);



// codegen.c
void gen(Node *node);

// global variable
// Input Program
char *user_input;
// Current Token
Token *token;



#endif //INC_9CC_9CC_H
