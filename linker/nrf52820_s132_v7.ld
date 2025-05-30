SEARCH_DIR(.)
GROUP(-lgcc -lc -lnosys)

MEMORY
{
  FLASH (rx) : ORIGIN = 0x26000, LENGTH = 0x1A000  /* 104 KB for bootloader */
  RAM (rwx) :  ORIGIN = 0x20002000, LENGTH = 0x6000 /* 24 KB RAM */
  BOOTLOADER_CONFIG (r): ORIGIN = 0x3FC00, LENGTH = 0x400
  UICR_BOOTLOADER (r) : ORIGIN = 0x10001014, LENGTH = 0x04
  UICR_MBR_PARAM (r) : ORIGIN = 0x10001018, LENGTH = 0x04
}

SECTIONS
{
  . = ALIGN(4);
  .bootloaderConfig :
  {
    KEEP(*(.bootloaderConfig))
  } > BOOTLOADER_CONFIG

  . = ALIGN(4);
  .uicrBootloader :
  {
    KEEP(*(.uicrBootloader))
  } > UICR_BOOTLOADER

  .uicrMbrParam :
  {
    KEEP(*(.uicrMbrParam))
  } > UICR_MBR_PARAM
}

INCLUDE "nrf_common.ld"