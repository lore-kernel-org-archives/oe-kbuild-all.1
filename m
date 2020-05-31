Content-Type: multipart/mixed; boundary="===============3167607961251715417=="
MIME-Version: 1.0
From: Dexuan Cui <decui@microsoft.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] x86/apic/flat64: Add back the early_param("apic", parse_apic)
Date: Sun, 31 May 2020 16:49:58 +0000
Message-ID: <
 <PS1P15301MB03314E6522DF5EB98B8D0C84BF8D0@PS1P15301MB0331.APCP153.PROD.OUTLOOK.COM>>
In-Reply-To: <202005311202.8nrEgV6m%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3167607961251715417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: kbuild test robot <lkp@intel.com>
> Sent: Saturday, May 30, 2020 9:27 PM
> [...]
> Hi Dexuan,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on tip/x86/core]
> [also build test WARNING on tip/auto-latest v5.7-rc7 next-20200529]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see
> [...]
> url: [...]
> base: [...]
> config: x86_64-defconfig (attached as .config)
> compiler: clang version 11.0.0 [...]
> reproduce (this is a W=3D1 build):
> [...]
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> =

> >> WARNING: modpost: vmlinux.o(.text+0x55232): Section mismatch in
> reference from the function flat_acpi_madt_oem_check() to the
> variable .init.data:disable_timer_pin_1
> The function flat_acpi_madt_oem_check() references
> the variable __initdata disable_timer_pin_1.
> This is often because flat_acpi_madt_oem_check lacks a __initdata
> annotation or the annotation of disable_timer_pin_1 is wrong.

The warning is not accurate because flat_acpi_madt_oem_check() has nothing
to do with the variable disable_timer_pin_1.

I just posted a v3 patch to fix the warning by adding the __init tag for =

flat_acpi_madt_oem_check().

Thanks,
-- Dexuan
--===============3167607961251715417==--

