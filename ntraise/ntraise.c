#include "ntdll.h"

int main(void) {
    /* don't ask me. the types are from those windows fuckers */
    PBOOLEAN retval1 = malloc(sizeof(BOOLEAN));
    PULONG retval2 = malloc(sizeof(ULONG));
    INT_PTR intPtrZero = malloc(sizeof(INT_PTR));
    intPtrZero = 0;

    RtlAdjustPrivilege(19, 1, 0, retval1);
    NtRaiseHardError(0xc0000022, 0, 0, intPtrZero, 6, retval2);

    return -1;
}