Content-Type: multipart/mixed; boundary="===============1812806429018707300=="
MIME-Version: 1.0
From: Vignesh Raghavendra <vigneshr@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 6/6] spi: Move cadence-quadspi driver to drivers/spi/
Date: Thu, 28 May 2020 15:24:14 +0530
Message-ID: <3fd21609-cb9a-cbe9-f40f-a8a8a00491a2@ti.com>
In-Reply-To: <202005280400.IgqKbGTF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1812806429018707300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 28/05/20 2:28 am, kbuild test robot wrote:
> Hi Vignesh,
> =

[...]
> =

> In file included from include/linux/err.h:5,
> from include/linux/clk.h:12,
> from drivers/spi/spi-cadence-quadspi.c:9:
> include/linux/scatterlist.h: In function 'sg_set_buf':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned exp=
ression >=3D 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >=3D ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_map=
nr)
> |         ^~
> include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
> 78 | # define unlikely(x) __builtin_expect(!!(x), 0)
> |                                          ^
> include/linux/scatterlist.h:143:2: note: in expansion of macro 'BUG_ON'
> 143 |  BUG_ON(!virt_addr_valid(buf));
> |  ^~~~~~
> arch/xtensa/include/asm/page.h:201:32: note: in expansion of macro 'pfn_v=
alid'
> 201 | #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> |                                ^~~~~~~~~
> include/linux/scatterlist.h:143:10: note: in expansion of macro 'virt_add=
r_valid'
> 143 |  BUG_ON(!virt_addr_valid(buf));
> |          ^~~~~~~~~~~~~~~
> In file included from ./arch/xtensa/include/generated/asm/bug.h:1,
> from include/linux/bug.h:5,
> from include/linux/thread_info.h:12,
> from arch/xtensa/include/asm/current.h:18,
> from include/linux/mutex.h:14,
> from include/linux/notifier.h:14,
> from include/linux/clk.h:14,
> from drivers/spi/spi-cadence-quadspi.c:9:
> include/linux/dma-mapping.h: In function 'dma_map_resource':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned exp=
ression >=3D 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >=3D ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_map=
nr)
> |         ^~
> include/asm-generic/bug.h:139:27: note: in definition of macro 'WARN_ON_O=
NCE'
> 139 |  int __ret_warn_once =3D !!(condition);            |               =
            ^~~~~~~~~
> include/linux/dma-mapping.h:352:19: note: in expansion of macro 'pfn_vali=
d'
> 352 |  if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
> |                   ^~~~~~~~~
> In file included from include/linux/shm.h:6,
> from include/linux/sched.h:16,
> from include/linux/ratelimit.h:6,
> from include/linux/dev_printk.h:16,
> from include/linux/device.h:15,
> from include/linux/dma-mapping.h:7,
> from drivers/spi/spi-cadence-quadspi.c:12:
> drivers/spi/spi-cadence-quadspi.c: In function 'cqspi_direct_read_execute=
':
> arch/xtensa/include/asm/page.h:193:9: warning: comparison of unsigned exp=
ression >=3D 0 is always true [-Wtype-limits]
> 193 |  ((pfn) >=3D ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_map=
nr)
> |         ^~
> arch/xtensa/include/asm/page.h:201:32: note: in expansion of macro 'pfn_v=
alid'
> 201 | #define virt_addr_valid(kaddr) pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> |                                ^~~~~~~~~
>>> drivers/spi/spi-cadence-quadspi.c:911:26: note: in expansion of macro '=
virt_addr_valid'
> 911 |  if (!cqspi->rx_chan || !virt_addr_valid(buf)) {
> |                          ^~~~~~~~~~~~~~~


Thanks for the report! But it seems with ARCH=3Dxtensa and config that was
attached, I see above warning for every file in the kernel that uses
virt_addr_valid(), So, the fix for this warning is really in xtensa arch
code and therefore should not block this series from being merged.


Regards
Vignesh
--===============1812806429018707300==--

