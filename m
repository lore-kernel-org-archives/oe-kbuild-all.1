Content-Type: multipart/mixed; boundary="===============8851139791017083629=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH 1/2] Add a layer of abstraction to use the memory reserved by device tree for ima buffer pass.
Date: Tue, 05 May 2020 22:44:17 +0800
Message-ID: <202005052224.sdlTIk7L%lkp@intel.com>
In-Reply-To: <20200504203829.6330-2-prsriva@linux.microsoft.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8851139791017083629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Prakhar,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on arm64/for-next/core]
[also build test ERROR on robh/for-next powerpc/next v5.7-rc4 next-20200505]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Prakhar-Srivastava/Add-sup=
port-for-using-reserved-memory-for-ima-buffer-pass/20200505-184302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
config: h8300-h8s-sim_defconfig (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cross A=
RCH=3Dh8300 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
   drivers/of/of_ima.c: In function 'of_ima_write_buffer':
>> drivers/of/of_ima.c:47:2: warning: cast from pointer to integer of diffe=
rent size [-Wpointer-to-int-cast]
      47 |  (u64)vaddr, mem_res.start, resource_size(&mem_res));
         |  ^
   include/linux/printk.h:305:34: note: in definition of macro 'pr_info'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ^~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llX' expects argumen=
t of type 'long long unsigned int', but argument 3 has type 'resource_size_=
t' {aka 'unsigned int'} [-Wformat=3D]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/linux/printk.h:305:9: note: in expansion of macro 'KERN_INFO'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
>> drivers/of/of_ima.c:46:2: note: in expansion of macro 'pr_info'
      46 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
\n , size : %lld",
         |  ^~~~~~~
   drivers/of/of_ima.c:46:64: note: format string is defined here
      46 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
\n , size : %lld",
         |                                                            ~~~~^
         |                                                                |
         |                                                                l=
ong long unsigned int
         |                                                            %0X
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%lld' expects argumen=
t of type 'long long int', but argument 4 has type 'resource_size_t' {aka '=
unsigned int'} [-Wformat=3D]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/linux/printk.h:305:9: note: in expansion of macro 'KERN_INFO'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
>> drivers/of/of_ima.c:46:2: note: in expansion of macro 'pr_info'
      46 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
\n , size : %lld",
         |  ^~~~~~~
   drivers/of/of_ima.c:46:80: note: format string is defined here
      46 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
\n , size : %lld",
         |                                                                 =
            ~~~^
         |                                                                 =
               |
         |                                                                 =
               long long int
         |                                                                 =
            %d
   In file included from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
   drivers/of/of_ima.c: In function 'of_get_ima_buffer':
   drivers/of/of_ima.c:114:2: warning: cast from pointer to integer of diff=
erent size [-Wpointer-to-int-cast]
     114 |  (u64)vaddr, mem_res.start, resource_size(&mem_res), *(size_t *)=
vaddr);
         |  ^
   include/linux/printk.h:305:34: note: in definition of macro 'pr_info'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ^~~~~~~~~~~
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llX' expects argumen=
t of type 'long long unsigned int', but argument 3 has type 'resource_size_=
t' {aka 'unsigned int'} [-Wformat=3D]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/linux/printk.h:305:9: note: in expansion of macro 'KERN_INFO'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   drivers/of/of_ima.c:113:2: note: in expansion of macro 'pr_info'
     113 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
,\n allocated size : %lld, ima_buffer_size: %ld ",
         |  ^~~~~~~
   drivers/of/of_ima.c:113:64: note: format string is defined here
     113 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
,\n allocated size : %lld, ima_buffer_size: %ld ",
         |                                                            ~~~~^
         |                                                                |
         |                                                                l=
ong long unsigned int
         |                                                            %0X
   In file included from include/linux/printk.h:7,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/h8300/include/asm/bug.h:8,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from drivers/of/of_ima.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%lld' expects argumen=
t of type 'long long int', but argument 4 has type 'resource_size_t' {aka '=
unsigned int'} [-Wformat=3D]
       5 | #define KERN_SOH "\001"  /* ASCII Start Of Header */
         |                  ^~~~~~
   include/linux/kern_levels.h:14:19: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO KERN_SOH "6" /* informational */
         |                   ^~~~~~~~
   include/linux/printk.h:305:9: note: in expansion of macro 'KERN_INFO'
     305 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   drivers/of/of_ima.c:113:2: note: in expansion of macro 'pr_info'
     113 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
,\n allocated size : %lld, ima_buffer_size: %ld ",
         |  ^~~~~~~
   drivers/of/of_ima.c:113:89: note: format string is defined here
     113 |  pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX=
,\n allocated size : %lld, ima_buffer_size: %ld ",
         |                                                                 =
                     ~~~^
         |                                                                 =
                        |
         |                                                                 =
                        long long int
         |                                                                 =
                     %d
   drivers/of/of_ima.c: At top level:
>> drivers/of/of_ima.c:133:1: warning: data definition has no type or stora=
ge class
     133 | MODULE_DEVICE_TABLE(of, ima_buffer_pass_match);
         | ^~~~~~~~~~~~~~~~~~~
>> drivers/of/of_ima.c:133:1: error: type defaults to 'int' in declaration =
of 'MODULE_DEVICE_TABLE' [-Werror=3Dimplicit-int]
>> drivers/of/of_ima.c:133:1: warning: parameter names (without types) in f=
unction declaration
   drivers/of/of_ima.c:164:1: warning: data definition has no type or stora=
ge class
     164 | module_init(ima_buffer_pass_init);
         | ^~~~~~~~~~~
>> drivers/of/of_ima.c:164:1: error: type defaults to 'int' in declaration =
of 'module_init' [-Werror=3Dimplicit-int]
   drivers/of/of_ima.c:164:1: warning: parameter names (without types) in f=
unction declaration
   drivers/of/of_ima.c:165:1: warning: data definition has no type or stora=
ge class
     165 | module_exit(ima_buffer_pass_exit);
         | ^~~~~~~~~~~
>> drivers/of/of_ima.c:165:1: error: type defaults to 'int' in declaration =
of 'module_exit' [-Werror=3Dimplicit-int]
   drivers/of/of_ima.c:165:1: warning: parameter names (without types) in f=
unction declaration
   drivers/of/of_ima.c:135:19: warning: 'ima_buffer_pass_init' defined but =
not used [-Wunused-function]
     135 | static int __init ima_buffer_pass_init(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +133 drivers/of/of_ima.c

    29	=

    30	/**
    31	 * of_ima_write_buffer - Write the ima buffer into the reserved memo=
ry.
    32	 *
    33	 * ima_buffer - buffer starting address.
    34	 * ima_buffer_size - size of segment.
    35	 *
    36	 * Return: 0 on success, negative errno on error.
    37	 */
    38	int of_ima_write_buffer(void *ima_buffer, size_t ima_buffer_size)
    39	{
    40		void *addr;
    41	=

    42		if (!dtb_status_enabled)
    43			return -EOPNOTSUPP;
    44	=

    45		vaddr =3D memremap(mem_res.start, resource_size(&mem_res), MEMREMAP=
_WB);
  > 46		pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX\n ,=
 size : %lld",
  > 47		(u64)vaddr, mem_res.start, resource_size(&mem_res));
    48	=

    49		if (vaddr) {
    50			memcpy(vaddr, &ima_buffer_size, sizeof(size_t));
    51			addr =3D  vaddr + sizeof(size_t);
    52			memcpy(addr, ima_buffer, ima_buffer_size);
    53			memunmap(vaddr);
    54			vaddr =3D NULL;
    55		}
    56	=

    57		return 0;
    58	}
    59	=

    60	/**
    61	 * of_remove_ima_buffer - Write 0(Zero length buffer to read)to the
    62	 *                        size location of the buffer.
    63	 *
    64	 * Return: 0 on success, negative errno on error.
    65	 */
    66	int of_remove_ima_buffer(void)
    67	{
    68		size_t empty_buffer_size =3D 0;
    69	=

    70		if (!dtb_status_enabled)
    71			return -ENOTSUPP;
    72	=

    73		if (vaddr) {
    74			memcpy(vaddr, &empty_buffer_size, sizeof(size_t));
    75			memunmap(vaddr);
    76			vaddr =3D NULL;
    77		}
    78	=

    79		return 0;
    80	}
    81	=

    82	/**
    83	 * of_ima_get_size_allocated - Get the usable buffer size thats allo=
cated in
    84	 *                             the device-tree.
    85	 *
    86	 * Return: 0 on unavailable node, size of the memory block - (size_t)
    87	 */
    88	size_t of_ima_get_size_allocated(void)
    89	{
    90		size_t size =3D 0;
    91	=

    92		if (!dtb_status_enabled)
    93			return size;
    94	=

    95		size =3D resource_size(&mem_res) - sizeof(size_t);
    96		return size;
    97	}
    98	=

    99	/**
   100	 * of_get_ima_buffer - Get IMA buffer address.
   101	 *
   102	 * @addr:       On successful return, set to point to the buffer con=
tents.
   103	 * @size:       On successful return, set to the buffer size.
   104	 *
   105	 * Return: 0 on success, negative errno on error.
   106	 */
   107	int of_get_ima_buffer(void **addr, size_t *size)
   108	{
   109		if (!dtb_status_enabled)
   110			return -ENOTSUPP;
   111	=

   112		vaddr =3D memremap(mem_res.start, resource_size(&mem_res), MEMREMAP=
_WB);
   113		pr_info("Mapped reserved memory, vaddr: 0x%0llX, paddr: 0x%0llX,\n =
allocated size : %lld, ima_buffer_size: %ld ",
   114		(u64)vaddr, mem_res.start, resource_size(&mem_res), *(size_t *)vadd=
r);
   115	=

   116		*size =3D *(size_t *)vaddr;
   117		*addr =3D vaddr + sizeof(size_t);
   118		return 0;
   119	}
   120	=

   121	static const struct of_device_id ima_buffer_pass_ids[] =3D {
   122		{
   123			.compatible =3D "linux,ima_buffer_pass",
   124		},
   125		{}
   126	};
   127	=

   128	static const struct of_device_id ima_buffer_pass_match[] =3D {
   129		{
   130			.name =3D "ima_buffer_pass",
   131		},
   132	};
 > 133	MODULE_DEVICE_TABLE(of, ima_buffer_pass_match);
   134	=

   135	static int __init ima_buffer_pass_init(void)
   136	{
   137		int ret =3D 0;
   138		struct device_node *memnp;
   139		struct device_node *ima_buffer_pass_node;
   140	=

   141		ima_buffer_pass_node =3D of_find_matching_node(NULL, ima_buffer_pas=
s_ids);
   142		if (!ima_buffer_pass_node)
   143			return -ENOENT;
   144	=

   145		memnp =3D of_parse_phandle(ima_buffer_pass_node, "memory-region", 0=
);
   146		if (!memnp)
   147			return -ENXIO;
   148	=

   149		ret =3D of_address_to_resource(memnp, 0, &mem_res);
   150		if (ret < 0)
   151			return -ENOENT;
   152	=

   153		of_node_put(memnp);
   154		dtb_status_enabled =3D true;
   155	=

   156		return ret;
   157	}
   158	=

   159	static void __exit ima_buffer_pass_exit(void)
   160	{
   161		pr_info("trying to exit the ima driver\n");
   162	}
   163	=

 > 164	module_init(ima_buffer_pass_init);
 > 165	module_exit(ima_buffer_pass_exit);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8851139791017083629==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
IE4GoDkd4lkTM0jA6YD+fwEONH8B50oAAA==
--===============8851139791017083629==--

