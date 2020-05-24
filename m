Content-Type: multipart/mixed; boundary="===============4833600744641290101=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 1/4] bitops: Introduce the the for_each_set_clump macro
Date: Sun, 24 May 2020 22:44:37 +0800
Message-ID: <202005242236.NtfLt1Ae%lkp@intel.com>
In-Reply-To: <17cb2b080b9c4c36cf84436bc5690739590acc53.1590017578.git.syednwaris@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4833600744641290101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Syed,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce]

url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduc=
e-the-for_each_set_clump-macro/20200524-130931
base:    b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce
config: i386-tinyconfig (attached as .config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        # save the attached .config to linux build tree
        make ARCH=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from include/asm-generic/atomic-instrumented.h:20:0,
from arch/x86/include/asm/atomic.h:265,
from include/linux/atomic.h:7,
from include/linux/crypto.h:15,
from arch/x86/kernel/asm-offsets.c:9:
include/linux/bitmap.h: In function 'bitmap_get_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bitmap.h: In function 'bitmap_set_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
--
In file included from include/linux/bits.h:23:0,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/asm-generic/bug.h:19,
from arch/x86/include/asm/bug.h:83,
from include/linux/bug.h:5,
from include/linux/mmdebug.h:5,
from include/linux/gfp.h:5,
from arch/x86/mm/init.c:1:
include/linux/bitmap.h: In function 'bitmap_get_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bitmap.h: In function 'bitmap_set_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
arch/x86/mm/init.c: At top level:
arch/x86/mm/init.c:469:21: warning: no previous prototype for 'init_memory_=
mapping' [-Wmissing-prototypes]
unsigned long __ref init_memory_mapping(unsigned long start,
^~~~~~~~~~~~~~~~~~~
arch/x86/mm/init.c:711:13: warning: no previous prototype for 'poking_init'=
 [-Wmissing-prototypes]
void __init poking_init(void)
^~~~~~~~~~~
arch/x86/mm/init.c:860:13: warning: no previous prototype for 'mem_encrypt_=
free_decrypted_mem' [-Wmissing-prototypes]
void __weak mem_encrypt_free_decrypted_mem(void) { }
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
In file included from include/linux/bits.h:23:0,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/asm-generic/bug.h:19,
from arch/x86/include/asm/bug.h:83,
from include/linux/bug.h:5,
from include/linux/mmdebug.h:5,
from include/linux/mm.h:9,
from include/linux/memblock.h:13,
from arch/x86/mm/ioremap.c:10:
include/linux/bitmap.h: In function 'bitmap_get_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bitmap.h: In function 'bitmap_set_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
arch/x86/mm/ioremap.c: At top level:
arch/x86/mm/ioremap.c:484:12: warning: no previous prototype for 'arch_iore=
map_p4d_supported' [-Wmissing-prototypes]
int __init arch_ioremap_p4d_supported(void)
^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/ioremap.c:489:12: warning: no previous prototype for 'arch_iore=
map_pud_supported' [-Wmissing-prototypes]
int __init arch_ioremap_pud_supported(void)
^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/ioremap.c:498:12: warning: no previous prototype for 'arch_iore=
map_pmd_supported' [-Wmissing-prototypes]
int __init arch_ioremap_pmd_supported(void)
^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/ioremap.c:737:17: warning: no previous prototype for 'early_mem=
remap_pgprot_adjust' [-Wmissing-prototypes]
pgprot_t __init early_memremap_pgprot_adjust(resource_size_t phys_addr,
^~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
In file included from include/linux/bits.h:23:0,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from arch/x86/include/asm/percpu.h:45,
from arch/x86/include/asm/current.h:6,
from include/linux/sched.h:12,
from include/linux/uaccess.h:5,
from arch/x86/mm/extable.c:3:
include/linux/bitmap.h: In function 'bitmap_get_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bitmap.h: In function 'bitmap_set_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
arch/x86/mm/extable.c: At top level:
arch/x86/mm/extable.c:26:16: warning: no previous prototype for 'ex_handler=
_default' [-Wmissing-prototypes]
__visible bool ex_handler_default(const struct exception_table_entry *fixup,
^~~~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:36:16: warning: no previous prototype for 'ex_handler=
_fault' [-Wmissing-prototypes]
__visible bool ex_handler_fault(const struct exception_table_entry *fixup,
^~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:57:16: warning: no previous prototype for 'ex_handler=
_fprestore' [-Wmissing-prototypes]
__visible bool ex_handler_fprestore(const struct exception_table_entry *fix=
up,
^~~~~~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:72:16: warning: no previous prototype for 'ex_handler=
_uaccess' [-Wmissing-prototypes]
__visible bool ex_handler_uaccess(const struct exception_table_entry *fixup,
^~~~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:83:16: warning: no previous prototype for 'ex_handler=
_rdmsr_unsafe' [-Wmissing-prototypes]
__visible bool ex_handler_rdmsr_unsafe(const struct exception_table_entry *=
fixup,
^~~~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:100:16: warning: no previous prototype for 'ex_handle=
r_wrmsr_unsafe' [-Wmissing-prototypes]
__visible bool ex_handler_wrmsr_unsafe(const struct exception_table_entry *=
fixup,
^~~~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/extable.c:116:16: warning: no previous prototype for 'ex_handle=
r_clear_fs' [-Wmissing-prototypes]
__visible bool ex_handler_clear_fs(const struct exception_table_entry *fixu=
p,
^~~~~~~~~~~~~~~~~~~
--
In file included from include/linux/bits.h:23:0,
from include/linux/bitops.h:5,
from include/linux/kernel.h:12,
from include/asm-generic/bug.h:19,
from arch/x86/include/asm/bug.h:83,
from include/linux/bug.h:5,
from include/linux/mmdebug.h:5,
from include/linux/mm.h:9,
from arch/x86/mm/mmap.c:15:
include/linux/bitmap.h: In function 'bitmap_get_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
>> include/linux/bitmap.h:590:35: note: in expansion of macro 'GENMASK'
return (map[index] >> offset) & GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bitmap.h: In function 'bitmap_set_value':
include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
include/linux/bits.h:26:40: warning: comparison of unsigned expression < 0 =
is always false [-Wtype-limits]
__builtin_constant_p((l) > (h)), (l) > (h), 0)))
^
include/linux/build_bug.h:16:62: note: in definition of macro 'BUILD_BUG_ON=
_ZERO'
#define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
^
include/linux/bits.h:39:3: note: in expansion of macro 'GENMASK_INPUT_CHECK'
(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
^~~~~~~~~~~~~~~~~~~
include/linux/bitmap.h:630:11: note: in expansion of macro 'GENMASK'
value &=3D GENMASK(nbits - 1, 0);
^~~~~~~
arch/x86/mm/mmap.c: At top level:
arch/x86/mm/mmap.c:75:15: warning: no previous prototype for 'arch_mmap_rnd=
' [-Wmissing-prototypes]
unsigned long arch_mmap_rnd(void)
^~~~~~~~~~~~~
arch/x86/mm/mmap.c:216:5: warning: no previous prototype for 'valid_phys_ad=
dr_range' [-Wmissing-prototypes]
int valid_phys_addr_range(phys_addr_t addr, size_t count)
^~~~~~~~~~~~~~~~~~~~~
arch/x86/mm/mmap.c:222:5: warning: no previous prototype for 'valid_mmap_ph=
ys_addr_range' [-Wmissing-prototypes]
int valid_mmap_phys_addr_range(unsigned long pfn, size_t count)
^~~~~~~~~~~~~~~~~~~~~~~~~~
..

vim +/GENMASK +590 include/linux/bitmap.h

   569	=

   570	/**
   571	 * bitmap_get_value - get a value of n-bits from the memory region
   572	 * @map: address to the bitmap memory region
   573	 * @start: bit offset of the n-bit value
   574	 * @nbits: size of value in bits
   575	 *
   576	 * Returns value of nbits located at the @start bit offset within th=
e @map
   577	 * memory region.
   578	 */
   579	static inline unsigned long bitmap_get_value(const unsigned long *ma=
p,
   580						      unsigned long start,
   581						      unsigned long nbits)
   582	{
   583		const size_t index =3D BIT_WORD(start);
   584		const unsigned long offset =3D start % BITS_PER_LONG;
   585		const unsigned long ceiling =3D roundup(start + 1, BITS_PER_LONG);
   586		const unsigned long space =3D ceiling - start;
   587		unsigned long value_low, value_high;
   588	=

   589		if (space >=3D nbits)
 > 590			return (map[index] >> offset) & GENMASK(nbits - 1, 0);
   591		else {
   592			value_low =3D map[index] & BITMAP_FIRST_WORD_MASK(start);
   593			value_high =3D map[index + 1] & BITMAP_LAST_WORD_MASK(start + nbit=
s);
   594			return (value_low >> offset) | (value_high << space);
   595		}
   596	}
   597	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4833600744641290101==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Qq82aAAA
--===============4833600744641290101==--

