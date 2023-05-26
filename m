Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB318B1C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 13:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685108795; x=1716644795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kfz0IayCXXV6hjwiKvuURv/DgYRWmSnQhzQwTod3pmA=;
  b=Fg4wuizD37rM3WPKdNLMK7kLhwKzQSDxK3IFMIyjyhiOBsGBQ6W0wXo8
   B4g1CAt4Jxq7PoZcJs4j65KztN7vPu5at9n6sbAf1DRvxg46EILmnMDpl
   qU8CEA3q0RXmJc6KSDK0axmaRBakwSugge7eDhyQ5Y2insrqUJ+PShs/e
   gPcE8q5oDCdAQZEp5qp2aGnhVClO9RHnOeG4Vr4inItqRdRIz9kkRiGaB
   PvSUzX3L1JB2kBWSvMgrK5zyb1lvG7qOuKAq0O2l8ATePCDTUCDP0nLwi
   Yc90m+HlAjPjV2nK5GS+LqNRV22s6CuPo1JF7r/Avpn5kyKoSXclnAJCM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="382448847"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="382448847"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 06:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="705223196"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; 
   d="scan'208";a="705223196"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2023 06:46:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2Xm4-000JNK-1q;
	Fri, 26 May 2023 13:46:32 +0000
Date: Fri, 26 May 2023 21:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 24/9879]
 arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for
 'save_ttbr1'
Message-ID: <202305262129.GTCtRpcO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: e30da6831ebcd0bcbe7c36485526255eb66b354a [24/9879] ARM: imx: add i.MX7D bus-freq support
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230526/202305262129.GTCtRpcO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/e30da6831ebcd0bcbe7c36485526255eb66b354a
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout e30da6831ebcd0bcbe7c36485526255eb66b354a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305262129.GTCtRpcO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   include/linux/of_net.h:16:12: note: declared here
      16 | extern int of_get_mac_address(struct device_node *np, u8 *mac);
         |            ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: At top level:
   arch/arm/mach-imx/common.c:149:6: warning: no previous prototype for 'imx6ull_low_power_idle' [-Wmissing-prototypes]
     149 | void imx6ull_low_power_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/ddrc.c:63:5: warning: no previous prototype for 'imx_ddrc_get_ddr_type' [-Wmissing-prototypes]
      63 | int imx_ddrc_get_ddr_type(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/arm/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/arm/include/asm/cacheflush.h:10,
                    from arch/arm/mach-imx/busfreq-imx.c:17:
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
   arch/arm/mach-imx/busfreq-imx.c:458:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     458 | const static char *ddr_freq_iram_match[] __initconst = {
         | ^~~~~
   arch/arm/mach-imx/busfreq-imx.c: In function 'imx_dt_find_ddr_sram':
   arch/arm/mach-imx/busfreq-imx.c:469:13: error: implicit declaration of function 'of_flat_dt_match'; did you mean 'of_flat_dt_match_machine'? [-Werror=implicit-function-declaration]
     469 |         if (of_flat_dt_match(node, ddr_freq_iram_match)) {
         |             ^~~~~~~~~~~~~~~~
         |             of_flat_dt_match_machine
   cc1: some warnings being treated as errors
--
>> arch/arm/mach-imx/busfreq_ddr3.c:111:5: warning: no previous prototype for 'can_change_ddr_freq' [-Wmissing-prototypes]
     111 | int can_change_ddr_freq(void)
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:148:5: warning: no previous prototype for 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
     148 | int update_ddr_freq_imx_smp(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:241:5: warning: no previous prototype for 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
     241 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
