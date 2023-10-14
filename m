Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F711845
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 20:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdZUnC6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697315956; x=1728851956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blfwkpyoEvDDBSWrJeRYxn4vi/85zuvmOxGQHE/3K5U=;
  b=JdZUnC6siM7djEXOmaLMrZvG7l3q0hEr58qgDdWA7Igfg5LPoRc4Soxv
   LZ0AfWPlH7xoC3rWFjswCtKV0I2ljZ8ap8T279eaNQBHrKlRBr0IuRorm
   Il/785RXO1G+5DCzTJdGSDTK9DtyuRoO48IOxv9nRU1VKR43ra/Qw8Z/k
   /9x3ZTen0x9HAhl/A+AQlXBNK+QudVH260X9e4512vxWx4BEDzAFrmIPr
   CHkzhnOfh/ASBM6W5p07sV244dy/b7M8vTqjTamEvAl5LmvbMVwgdi3NS
   Bw7MpWw2NVUP60RqDXcV4pmChg3yqkxTEeEUKLsBc/2MdprKBwohVpsBS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389207175"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="389207175"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784562640"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784562640"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 13:39:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrlPk-0006cr-07;
	Sat, 14 Oct 2023 20:39:12 +0000
Date: Sun, 15 Oct 2023 04:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 24/15767] arch/arm/mach-imx/common.c:126:5:
 warning: no previous prototype for 'imx_gpc_mf_request_on'
Message-ID: <202310150436.IRXNl3RP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: e30da6831ebcd0bcbe7c36485526255eb66b354a [24/15767] ARM: imx: add i.MX7D bus-freq support
config: arm-randconfig-004-20231014 (https://download.01.org/0day-ci/archive/20231015/202310150436.IRXNl3RP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150436.IRXNl3RP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150436.IRXNl3RP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for 'save_ttbr1' [-Wmissing-prototypes]
      22 | unsigned long save_ttbr1(void)
         |               ^~~~~~~~~~
   arch/arm/mach-imx/common.c:33:6: warning: no previous prototype for 'restore_ttbr1' [-Wmissing-prototypes]
      33 | void restore_ttbr1(unsigned long ttbr1)
         |      ^~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:44:13: warning: no previous prototype for 'imx6_enet_mac_init' [-Wmissing-prototypes]
      44 | void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
         |             ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: In function 'imx6_enet_mac_init':
   arch/arm/mach-imx/common.c:62:21: error: too few arguments to function 'of_get_mac_address'
      62 |                 if (of_get_mac_address(enet_np))
         |                     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/common.c:14:
   include/linux/of_net.h:26:19: note: declared here
      26 | static inline int of_get_mac_address(struct device_node *np, u8 *mac)
         |                   ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: At top level:
>> arch/arm/mach-imx/common.c:126:5: warning: no previous prototype for 'imx_gpc_mf_request_on' [-Wmissing-prototypes]
     126 | int imx_gpc_mf_request_on(unsigned int irq, unsigned int on) { return 0; }
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:132:6: warning: no previous prototype for 'mx6_lpddr2_freq_change' [-Wmissing-prototypes]
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


vim +/imx_gpc_mf_request_on +126 arch/arm/mach-imx/common.c

    41	
    42	#define OCOTP_MAC_OFF	(cpu_is_imx7d() ? 0x640 : 0x620)
    43	#define OCOTP_MACn(n)	(OCOTP_MAC_OFF + (n) * 0x10)
    44	void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
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
  > 62			if (of_get_mac_address(enet_np))
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
 > 149	void imx6ull_low_power_idle(void) {}
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
https://github.com/intel/lkp-tests/wiki
