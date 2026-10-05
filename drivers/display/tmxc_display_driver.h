/*
 * TMXC OS - Volla Phone Quintus Display Driver Header
 * Copyright (c) 2026 Ödül Ensar Yılmaz. All rights reserved.
 *
 * Display driver for MediaTek Dimensity 7050 (MT6877)
 * Volla Phone Quintus specific implementation
 *
 * Hardware:
 * - Display: 6.78" AMOLED, 2400x1080, 120Hz
 * - Controller: MediaTek display controller
 */

#ifndef TMXC_DISPLAY_DRIVER_H
#define TMXC_DISPLAY_DRIVER_H

#include <stdint.h>

#define TMXC_DISPLAY_WIDTH 2400
#define TMXC_DISPLAY_HEIGHT 1080
#define TMXC_DISPLAY_BPP 32
#define TMXC_DISPLAY_REFRESH_RATE 120

#define TMXC_DISPLAY_BASE 0x14000000
#define TMXC_DISPLAY_CTRL_REG (TMXC_DISPLAY_BASE + 0x0000)
#define TMXC_DISPLAY_STATUS_REG (TMXC_DISPLAY_BASE + 0x0004)
#define TMXC_DISPLAY_TIMING_REG (TMXC_DISPLAY_BASE + 0x0008)
#define TMXC_DISPLAY_FIFO_REG (TMXC_DISPLAY_BASE + 0x000C)
#define TMXC_DISPLAY_CURSOR_REG (TMXC_DISPLAY_BASE + 0x0010)

typedef struct {
    uint32_t ctrl;
    uint32_t status;
    uint32_t timing;
    uint32_t fifo_level;
    uint32_t cursor_x;
    uint32_t cursor_y;
    uint8_t display_enabled;
    uint8_t backlight_enabled;
    uint8_t driver_initialized;
} tmxc_display_driver_t;

void tmxc_display_driver_init(void);
void tmxc_display_enable(uint8_t enable);
void tmxc_display_set_resolution(uint32_t width, uint32_t height);
void tmxc_display_set_cursor(uint32_t x, uint32_t y);
void tmxc_display_write_pixel(uint32_t x, uint32_t y, uint32_t color);
uint32_t tmxc_display_read_pixel(uint32_t x, uint32_t y);
void tmxc_display_fill_rect(uint32_t x, uint32_t y, uint32_t width, uint32_t height, uint32_t color);
void tmxc_display_clear(uint32_t color);

#endif
