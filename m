Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7112F21
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675626096; x=1707162096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=58X0p4vGaSlNVZlTn+96wnsYamzpbiJ3eLsFbShMMUs=;
  b=Wd/qwtf9CuiILAKoDw6ibOEBKqpRgz0GER0rx0Edp4NVBueZH0oFt+Ed
   5yXG9oXkl0w4mxrdiIjwCQSFE+hP1HFUFN6gYqNuLzrUpxorpleGs7nbe
   lu6WMiEia61bqKmt/rw7+xraJg0wIuxOC+uBPC4AqKtFvgK0uwa2ezxxI
   xC1/iHOqkuZ3ZjIzkwMLngPAElCa0IDwf4sVgcZLa7OlmKSJSfHArAjUR
   F/tnPbI60A8i/HczZoCJkjLDrVNl4AEnhjxEtP3hJgoWwIBb6bJdsrSfx
   +hRg2qofb0ep+8h2COqTo4NbafcmE6eRvUItGrbO1L1DMlm7oG5SOiUpl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="329095160"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="329095160"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 11:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="668215499"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="668215499"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Feb 2023 11:41:34 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOktF-0002BM-0y;
	Sun, 05 Feb 2023 19:41:29 +0000
Date: Mon, 6 Feb 2023 03:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 31/20209]
 arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for
 'save_ttbr1'
Message-ID: <202302060357.HiuYpRMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anson,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: c45147fa43a3c82106dc3d47d4ae1b1c353b9282 [31/20209] ARM: imx: add i.MX7D bus-freq support
config: arm-buildonly-randconfig-r003-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060357.HiuYpRMk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/c45147fa43a3c82106dc3d47d4ae1b1c353b9282
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout c45147fa43a3c82106dc3d47d4ae1b1c353b9282
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from arch/arm/mach-imx/common.c:12:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/arm/mach-imx/common.c: At top level:
>> arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for 'save_ttbr1' [-Wmissing-prototypes]
      22 | unsigned long save_ttbr1(void)
         |               ^~~~~~~~~~
>> arch/arm/mach-imx/common.c:33:6: warning: no previous prototype for 'restore_ttbr1' [-Wmissing-prototypes]
      33 | void restore_ttbr1(unsigned long ttbr1)
         |      ^~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:44:13: warning: no previous prototype for 'imx6_enet_mac_init' [-Wmissing-prototypes]
      44 | void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
         |             ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: In function 'imx6_enet_mac_init':
   arch/arm/mach-imx/common.c:62:21: error: too few arguments to function 'of_get_mac_address'
      62 |                 if (of_get_mac_address(enet_np))
         |                     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/common.c:14:
   include/linux/of_net.h:25:19: note: declared here
      25 | static inline int of_get_mac_address(struct device_node *np, u8 *mac)
         |                   ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: At top level:
>> arch/arm/mach-imx/common.c:126:5: warning: no previous prototype for 'imx_gpc_mf_request_on' [-Wmissing-prototypes]
     126 | int imx_gpc_mf_request_on(unsigned int irq, unsigned int on) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:132:6: warning: no previous prototype for 'mx6_lpddr2_freq_change' [-Wmissing-prototypes]
     132 | void mx6_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:136:6: warning: no previous prototype for 'imx6sll_lpddr2_freq_change' [-Wmissing-prototypes]
     136 | void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:143:6: warning: no previous prototype for 'imx6_up_ddr3_freq_change' [-Wmissing-prototypes]
     143 | void imx6_up_ddr3_freq_change(struct imx6_busfreq_info *busfreq_info) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:144:6: warning: no previous prototype for 'imx6_up_lpddr2_freq_change' [-Wmissing-prototypes]
     144 | void imx6_up_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:149:6: warning: no previous prototype for 'imx6ull_low_power_idle' [-Wmissing-prototypes]
     149 | void imx6ull_low_power_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:156:6: warning: no previous prototype for 'mx6_ddr3_freq_change' [-Wmissing-prototypes]
     156 | void mx6_ddr3_freq_change(u32 freq, void *ddr_settings,
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:158:6: warning: no previous prototype for 'mx6q_lpddr2_freq_change' [-Wmissing-prototypes]
     158 | void mx6q_lpddr2_freq_change(u32 freq, void *ddr_settings) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:159:6: warning: no previous prototype for 'wfe_smp_freq_change' [-Wmissing-prototypes]
     159 | void wfe_smp_freq_change(u32 cpuid, u32 *ddr_freq_change_done) {}
         |      ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:163:6: warning: no previous prototype for 'imx7_smp_wfe' [-Wmissing-prototypes]
     163 | void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
         |      ^~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:164:6: warning: no previous prototype for 'imx7d_ddr3_freq_change' [-Wmissing-prototypes]
     164 | void imx7d_ddr3_freq_change(u32 freq) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/arm/include/asm/cacheflush.h:10,
                    from arch/arm/mach-imx/busfreq-imx.c:17:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/arm/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:9:
   arch/arm/mach-imx/busfreq-imx.c: At top level:
>> include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:19: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:19: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
>> include/linux/stddef.h:8:14: error: invalid initializer
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:19: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func.<anonymous>')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:19: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                   ^~~~
>> include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:25: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                         ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'busfreq_func')
       8 | #define NULL ((void *)0)
         |              ^
   arch/arm/mach-imx/busfreq-imx.c:94:25: note: in expansion of macro 'NULL'
      94 | } busfreq_func = {NULL, NULL};
         |                         ^~~~
   arch/arm/mach-imx/busfreq-imx.c:134:5: error: redefinition of 'register_busfreq_notifier'
     134 | int register_busfreq_notifier(struct notifier_block *nb)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/busfreq-imx.c:23:
   include/linux/busfreq-imx.h:64:19: note: previous definition of 'register_busfreq_notifier' with type 'int(struct notifier_block *)'
      64 | static inline int register_busfreq_notifier(struct notifier_block *nb)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq-imx.c:140:5: error: redefinition of 'unregister_busfreq_notifier'
     140 | int unregister_busfreq_notifier(struct notifier_block *nb)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:68:19: note: previous definition of 'unregister_busfreq_notifier' with type 'int(struct notifier_block *)'
      68 | static inline int unregister_busfreq_notifier(struct notifier_block *nb)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq-imx.c:321:6: error: redefinition of 'request_bus_freq'
     321 | void request_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:58:20: note: previous definition of 'request_bus_freq' with type 'void(enum bus_freq_mode)'
      58 | static inline void request_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq-imx.c:370:6: error: redefinition of 'release_bus_freq'
     370 | void release_bus_freq(enum bus_freq_mode mode)
         |      ^~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:61:20: note: previous definition of 'release_bus_freq' with type 'void(enum bus_freq_mode)'
      61 | static inline void release_bus_freq(enum bus_freq_mode mode)
         |                    ^~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq-imx.c:446:5: error: redefinition of 'get_bus_freq_mode'
     446 | int get_bus_freq_mode(void)
         |     ^~~~~~~~~~~~~~~~~
   include/linux/busfreq-imx.h:72:19: note: previous definition of 'get_bus_freq_mode' with type 'int(void)'
      72 | static inline int get_bus_freq_mode(void)
         |                   ^~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq-imx.c:458:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     458 | const static char *ddr_freq_iram_match[] __initconst = {
         | ^~~~~
   arch/arm/mach-imx/busfreq-imx.c: In function 'imx_dt_find_ddr_sram':
   arch/arm/mach-imx/busfreq-imx.c:469:13: error: implicit declaration of function 'of_flat_dt_match'; did you mean 'of_flat_dt_match_machine'? [-Werror=implicit-function-declaration]
     469 |         if (of_flat_dt_match(node, ddr_freq_iram_match)) {
         |             ^~~~~~~~~~~~~~~~
         |             of_flat_dt_match_machine
   In file included from arch/arm/mach-imx/busfreq-imx.c:38:
   arch/arm/mach-imx/common.h: At top level:
   arch/arm/mach-imx/common.h:102:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     102 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/arm/include/asm/cacheflush.h:10,
                    from arch/arm/mach-imx/busfreq_ddr3.c:21:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1349:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1349 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1335:27: note: 'mem_section' declared here
    1335 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   arch/arm/mach-imx/busfreq_ddr3.c: At top level:
>> arch/arm/mach-imx/busfreq_ddr3.c:111:5: warning: no previous prototype for 'can_change_ddr_freq' [-Wmissing-prototypes]
     111 | int can_change_ddr_freq(void)
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:148:5: warning: no previous prototype for 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
     148 | int update_ddr_freq_imx_smp(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:241:5: warning: no previous prototype for 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
     241 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq_ddr3.c:78:22: warning: 'gic_dist_base' defined but not used [-Wunused-variable]
      78 | static void __iomem *gic_dist_base;
         |                      ^~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq_ddr3.c:76:24: warning: 'iram_iomux_settings' defined but not used [-Wunused-variable]
      76 | static unsigned long (*iram_iomux_settings)[2];
         |                        ^~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/busfreq_ddr3.c:48:
   arch/arm/mach-imx/common.h:102:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     102 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~


vim +/save_ttbr1 +22 arch/arm/mach-imx/common.c

    21	
  > 22	unsigned long save_ttbr1(void)
    23	{
    24		unsigned long lttbr1;
    25		asm volatile(
    26			".align 4\n"
    27			"mrc p15, 0, %0, c2, c0, 1\n"
    28			: "=r" (lttbr1)
    29		);
    30		return lttbr1;
    31	}
    32	
  > 33	void restore_ttbr1(unsigned long ttbr1)
    34	{
    35		asm volatile(
    36			".align 4\n"
    37			"mcr p15, 0, %0, c2, c0, 1\n"
    38			: : "r" (ttbr1)
    39		);
    40	}
    41	
    42	#define OCOTP_MAC_OFF	(cpu_is_imx7d() ? 0x640 : 0x620)
    43	#define OCOTP_MACn(n)	(OCOTP_MAC_OFF + (n) * 0x10)
  > 44	void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
    45	{
    46		struct device_node *ocotp_np, *enet_np, *from = NULL;
    47		void __iomem *base;
    48		struct property *newmac;
    49		u32 macaddr_low;
    50		u32 macaddr_high = 0;
    51		u32 macaddr1_high = 0;
    52		u8 *macaddr;
    53		int i, id;
    54	
    55		for (i = 0; i < 2; i++) {
    56			enet_np = of_find_compatible_node(from, NULL, enet_compat);
    57			if (!enet_np)
    58				return;
    59	
    60			from = enet_np;
    61	
    62			if (of_get_mac_address(enet_np))
    63				goto put_enet_node;
    64	
    65			id = of_alias_get_id(enet_np, "ethernet");
    66			if (id < 0)
    67				id = i;
    68	
    69			ocotp_np = of_find_compatible_node(NULL, NULL, ocotp_compat);
    70			if (!ocotp_np) {
    71				pr_warn("failed to find ocotp node\n");
    72				goto put_enet_node;
    73			}
    74	
    75			base = of_iomap(ocotp_np, 0);
    76			if (!base) {
    77				pr_warn("failed to map ocotp\n");
    78				goto put_ocotp_node;
    79			}
    80	
    81			macaddr_low = readl_relaxed(base + OCOTP_MACn(1));
    82			if (id)
    83				macaddr1_high = readl_relaxed(base + OCOTP_MACn(2));
    84			else
    85				macaddr_high = readl_relaxed(base + OCOTP_MACn(0));
    86	
    87			newmac = kzalloc(sizeof(*newmac) + 6, GFP_KERNEL);
    88			if (!newmac)
    89				goto put_ocotp_node;
    90	
    91			newmac->value = newmac + 1;
    92			newmac->length = 6;
    93			newmac->name = kstrdup("local-mac-address", GFP_KERNEL);
    94			if (!newmac->name) {
    95				kfree(newmac);
    96				goto put_ocotp_node;
    97			}
    98	
    99			macaddr = newmac->value;
   100			if (id) {
   101				macaddr[5] = (macaddr_low >> 16) & 0xff;
   102				macaddr[4] = (macaddr_low >> 24) & 0xff;
   103				macaddr[3] = macaddr1_high & 0xff;
   104				macaddr[2] = (macaddr1_high >> 8) & 0xff;
   105				macaddr[1] = (macaddr1_high >> 16) & 0xff;
   106				macaddr[0] = (macaddr1_high >> 24) & 0xff;
   107			} else {
   108				macaddr[5] = macaddr_high & 0xff;
   109				macaddr[4] = (macaddr_high >> 8) & 0xff;
   110				macaddr[3] = (macaddr_high >> 16) & 0xff;
   111				macaddr[2] = (macaddr_high >> 24) & 0xff;
   112				macaddr[1] = macaddr_low & 0xff;
   113				macaddr[0] = (macaddr_low >> 8) & 0xff;
   114			}
   115	
   116			of_update_property(enet_np, newmac);
   117	
   118	put_ocotp_node:
   119		of_node_put(ocotp_np);
   120	put_enet_node:
   121		of_node_put(enet_np);
   122		}
   123	}
   124	
   125	#ifndef CONFIG_HAVE_IMX_GPC
 > 126	int imx_gpc_mf_request_on(unsigned int irq, unsigned int on) { return 0; }
   127	EXPORT_SYMBOL_GPL(imx_gpc_mf_request_on);
   128	#endif
   129	
   130	#if !defined(CONFIG_SOC_IMX6SL)
   131	u32 imx6_lpddr2_freq_change_start, imx6_lpddr2_freq_change_end;
 > 132	void mx6_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   133	#endif
   134	
   135	#if !defined(CONFIG_SOC_IMX6SLL)
 > 136	void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   137	#endif
   138	
   139	#if !defined(CONFIG_SOC_IMX6SX) && !defined(CONFIG_SOC_IMX6UL)
   140	u32 imx6_up_ddr3_freq_change_start, imx6_up_ddr3_freq_change_end;
   141	struct imx6_busfreq_info {
   142	} __aligned(8);
 > 143	void imx6_up_ddr3_freq_change(struct imx6_busfreq_info *busfreq_info) {}
 > 144	void imx6_up_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   145	#endif
   146	
   147	#if !defined(CONFIG_SOC_IMX6ULL)
   148	u32 mx6ull_lpm_wfi_start, mx6ull_lpm_wfi_end;
   149	void imx6ull_low_power_idle(void) {}
   150	#endif
   151	
   152	#if !defined(CONFIG_SOC_IMX6Q)
   153	u32 mx6_ddr3_freq_change_start, mx6_ddr3_freq_change_end;
   154	u32 mx6q_lpddr2_freq_change_start, mx6q_lpddr2_freq_change_end;
   155	u32 wfe_smp_freq_change_start, wfe_smp_freq_change_end;
 > 156	void mx6_ddr3_freq_change(u32 freq, void *ddr_settings,
   157		bool dll_mode, void *iomux_offsets) {}
 > 158	void mx6q_lpddr2_freq_change(u32 freq, void *ddr_settings) {}
 > 159	void wfe_smp_freq_change(u32 cpuid, u32 *ddr_freq_change_done) {}
   160	#endif
   161	
   162	#if !defined(CONFIG_SOC_IMX7D)
 > 163	void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
 > 164	void imx7d_ddr3_freq_change(u32 freq) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
