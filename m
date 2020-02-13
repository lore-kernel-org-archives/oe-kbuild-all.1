Content-Type: multipart/mixed; boundary="===============1704463133872383189=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [nvdimm:libnvdimm-pending 5/29] drivers/nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_div'
Date: Fri, 14 Feb 2020 06:58:19 +0800
Message-ID: <202002140603.WKyQuiGP%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1704463133872383189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djbw/nvdimm.git lib=
nvdimm-pending
head:   7bd03e293d7f5a46742f26b625ece4d5adb21c66
commit: 162072c175d46796370c6d22017dd1ccba46240a [5/29] libnvdimm/region: I=
ntroduce an 'align' attribute
config: arc-randconfig-a001-20200214 (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 162072c175d46796370c6d22017dd1ccba46240a
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers/nvdimm/region_devs.c:5:
   drivers/nvdimm/region_devs.c: In function 'align_store':
   include/asm-generic/div64.h:226:28: warning: comparison of distinct poin=
ter types lacks a cast
     226 |  (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
         |                            ^~
>> drivers/nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_div'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/scatterlist.h:5,
                    from drivers/nvdimm/region_devs.c:5:
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
      33 |    ______r =3D __builtin_expect(!!(x), expect); \
         |                                  ^
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
>> drivers/nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_div'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:35:19: note: in definition of macro '__branch_c=
heck__'
      35 |           expect, is_constant); \
         |                   ^~~~~~~~~~~
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
>> drivers/nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_div'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers/nvdimm/region_devs.c:5:
>> include/asm-generic/div64.h:243:22: error: passing argument 1 of '__div6=
4_32' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
     243 |   __rem =3D __div64_32(&(n), __base); \
         |                      ^~~~
         |                      |
         |                      long unsigned int *
>> drivers/nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_div'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:217:38: note: expected 'uint64_t *' {aka 'lo=
ng long unsigned int *'} but argument is of type 'long unsigned int *'
     217 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers/nvdimm/region_devs.c: In function 'default_align':
   include/asm-generic/div64.h:226:28: warning: comparison of distinct poin=
ter types lacks a cast
     226 |  (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
         |                            ^~
   drivers/nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_di=
v'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/scatterlist.h:5,
                    from drivers/nvdimm/region_devs.c:5:
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
      33 |    ______r =3D __builtin_expect(!!(x), expect); \
         |                                  ^
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers/nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_di=
v'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:35:19: note: in definition of macro '__branch_c=
heck__'
      35 |           expect, is_constant); \
         |                   ^~~~~~~~~~~
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers/nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_di=
v'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers/nvdimm/region_devs.c:5:
>> include/asm-generic/div64.h:243:22: error: passing argument 1 of '__div6=
4_32' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
     243 |   __rem =3D __div64_32(&(n), __base); \
         |                      ^~~~
         |                      |
         |                      long unsigned int *
   drivers/nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_di=
v'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:217:38: note: expected 'uint64_t *' {aka 'lo=
ng long unsigned int *'} but argument is of type 'long unsigned int *'
     217 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers//nvdimm/region_devs.c:5:
   drivers//nvdimm/region_devs.c: In function 'align_store':
   include/asm-generic/div64.h:226:28: warning: comparison of distinct poin=
ter types lacks a cast
     226 |  (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
         |                            ^~
   drivers//nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_di=
v'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/scatterlist.h:5,
                    from drivers//nvdimm/region_devs.c:5:
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
      33 |    ______r =3D __builtin_expect(!!(x), expect); \
         |                                  ^
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers//nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_di=
v'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:35:19: note: in definition of macro '__branch_c=
heck__'
      35 |           expect, is_constant); \
         |                   ^~~~~~~~~~~
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers//nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_di=
v'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers//nvdimm/region_devs.c:5:
>> include/asm-generic/div64.h:243:22: error: passing argument 1 of '__div6=
4_32' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
     243 |   __rem =3D __div64_32(&(n), __base); \
         |                      ^~~~
         |                      |
         |                      long unsigned int *
   drivers//nvdimm/region_devs.c:567:14: note: in expansion of macro 'do_di=
v'
     567 |  remainder =3D do_div(dpa, nd_region->ndr_mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:217:38: note: expected 'uint64_t *' {aka 'lo=
ng long unsigned int *'} but argument is of type 'long unsigned int *'
     217 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   drivers//nvdimm/region_devs.c: In function 'default_align':
   include/asm-generic/div64.h:226:28: warning: comparison of distinct poin=
ter types lacks a cast
     226 |  (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); \
         |                            ^~
   drivers//nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_d=
iv'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   In file included from include/linux/string.h:6,
                    from include/linux/scatterlist.h:5,
                    from drivers//nvdimm/region_devs.c:5:
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:33:34: note: in definition of macro '__branch_c=
heck__'
      33 |    ______r =3D __builtin_expect(!!(x), expect); \
         |                                  ^
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers//nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_d=
iv'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:239:25: warning: right shift count >=3D widt=
h of type [-Wshift-count-overflow]
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |                         ^~
   include/linux/compiler.h:35:19: note: in definition of macro '__branch_c=
heck__'
      35 |           expect, is_constant); \
         |                   ^~~~~~~~~~~
   include/asm-generic/div64.h:239:13: note: in expansion of macro 'likely'
     239 |  } else if (likely(((n) >> 32) =3D=3D 0)) {  \
         |             ^~~~~~
   drivers//nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_d=
iv'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   In file included from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/kernel.h:18,
                    from include/asm-generic/bug.h:19,
                    from arch/arc/include/asm/bug.h:29,
                    from include/linux/bug.h:5,
                    from include/linux/scatterlist.h:7,
                    from drivers//nvdimm/region_devs.c:5:
>> include/asm-generic/div64.h:243:22: error: passing argument 1 of '__div6=
4_32' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
     243 |   __rem =3D __div64_32(&(n), __base); \
         |                      ^~~~
         |                      |
         |                      long unsigned int *
   drivers//nvdimm/region_devs.c:1034:14: note: in expansion of macro 'do_d=
iv'
    1034 |  remainder =3D do_div(per_mapping, mappings);
         |              ^~~~~~
   include/asm-generic/div64.h:217:38: note: expected 'uint64_t *' {aka 'lo=
ng long unsigned int *'} but argument is of type 'long unsigned int *'
     217 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors

vim +/do_div +567 drivers/nvdimm/region_devs.c

   543	=

   544	static ssize_t align_store(struct device *dev,
   545			struct device_attribute *attr, const char *buf, size_t len)
   546	{
   547		struct nd_region *nd_region =3D to_nd_region(dev);
   548		unsigned long val, dpa;
   549		u32 remainder;
   550		int rc;
   551	=

   552		rc =3D kstrtoul(buf, 0, &val);
   553		if (rc)
   554			return rc;
   555	=

   556		if (!nd_region->ndr_mappings)
   557			return -ENXIO;
   558	=

   559		/*
   560		 * Ensure space-align is evenly divisible by the region
   561		 * interleave-width because the kernel typically has no facility
   562		 * to determine which DIMM(s), dimm-physical-addresses, would
   563		 * contribute to the tail capacity in system-physical-address
   564		 * space for the namespace.
   565		 */
   566		dpa =3D val;
 > 567		remainder =3D do_div(dpa, nd_region->ndr_mappings);
   568		if (!is_power_of_2(dpa) || dpa < PAGE_SIZE
   569				|| val > region_size(nd_region) || remainder)
   570			return -EINVAL;
   571	=

   572		/*
   573		 * Given that space allocation consults this value multiple
   574		 * times ensure it does not change for the duration of the
   575		 * allocation.
   576		 */
   577		nvdimm_bus_lock(dev);
   578		nd_region->align =3D val;
   579		nvdimm_bus_unlock(dev);
   580	=

   581		return len;
   582	}
   583	static DEVICE_ATTR_RW(align);
   584	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1704463133872383189==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
LARaYXwBAA==
--===============1704463133872383189==--

