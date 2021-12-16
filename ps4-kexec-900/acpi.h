/*
 * ps4-kexec - a kexec() implementation for Orbis OS / FreeBSD
 *
 * Copyright (C) 2015-2016 shuffle2 <godisgovernment@gmail.com>
 * Copyright (C) 2015-2016 Hector Martin "marcan" <marcan@marcan.st>
 *
 * This code is licensed to you under the 2-clause BSD license. See the LICENSE
 * file for more information.
 */

#ifndef ACPI_H
#define ACPI_H

#define PACKED __attribute__((packed))

void fix_acpi_tables(void *map_base, u64 phys_base);

#define PA_TO_DM(x) (((uintptr_t)x) | kern.dmap_base)

void disableMSI(u64 MSICapabilityRegAddr);

#endif
