Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CE15A6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Sep 2023 02:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694313861; x=1725849861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Z6lm2slQpNm897LN1rD0tbDfyKhleppMPoh+bFnXHo=;
  b=EgsYSABrQnR8zopRrwXrIb7DP7Z/PLGJRBQtCUXKssBHZy0Owf4sReRS
   ZSvCUBA9Oh+3xe3iMC5NKnLLkuG6h6BBrZ/AT+CnNpwU7WqecuMYVnbl2
   IycuWKIWLqc6x62nb7AbJUO/EL+vPuwCJDbvyrKdVvqJeiUCOQLBmK8xf
   B/25PUORrgv6ZBAG7HfiyZs0mT+jQ5SWNRDQdS0r7cX0oJE9xiYvG9+X9
   OixKTbb2fDKc4BWjjd+uNXfJPrU0jcslSpjvJHshe40oUKsnImmTJeKpv
   voh2ICGjjQk5LVDBZAkHcyZzGeuIs4iw2ejIAhOl659CXi8GXnk3B2P1r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377776544"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="377776544"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 19:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="916601182"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; 
   d="scan'208";a="916601182"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Sep 2023 19:44:19 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfAQo-0004Fu-3D;
	Sun, 10 Sep 2023 02:44:14 +0000
Date: Sun, 10 Sep 2023 10:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 31/25020] arch/arm/mach-imx/common.c:22:15:
 warning: no previous prototype for function 'save_ttbr1'
Message-ID: <202309101021.PdUyFNe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: c45147fa43a3c82106dc3d47d4ae1b1c353b9282 [31/25020] ARM: imx: add i.MX7D bus-freq support
config: arm-randconfig-001-20230910 (https://download.01.org/0day-ci/archive/20230910/202309101021.PdUyFNe9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230910/202309101021.PdUyFNe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309101021.PdUyFNe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for function 'save_ttbr1' [-Wmissing-prototypes]
   unsigned long save_ttbr1(void)
                 ^
   arch/arm/mach-imx/common.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long save_ttbr1(void)
   ^
   static 
>> arch/arm/mach-imx/common.c:33:6: warning: no previous prototype for function 'restore_ttbr1' [-Wmissing-prototypes]
   void restore_ttbr1(unsigned long ttbr1)
        ^
   arch/arm/mach-imx/common.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void restore_ttbr1(unsigned long ttbr1)
   ^
   static 
   arch/arm/mach-imx/common.c:62:33: error: too few arguments to function call, expected 2, have 1
                   if (of_get_mac_address(enet_np))
                       ~~~~~~~~~~~~~~~~~~        ^
   include/linux/of_net.h:16:12: note: 'of_get_mac_address' declared here
   extern int of_get_mac_address(struct device_node *np, u8 *mac);
              ^
>> arch/arm/mach-imx/common.c:44:13: warning: no previous prototype for function 'imx6_enet_mac_init' [-Wmissing-prototypes]
   void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
               ^
   arch/arm/mach-imx/common.c:44:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
   ^
   static 
>> arch/arm/mach-imx/common.c:126:5: warning: no previous prototype for function 'imx_gpc_mf_request_on' [-Wmissing-prototypes]
   int imx_gpc_mf_request_on(unsigned int irq, unsigned int on) { return 0; }
       ^
   arch/arm/mach-imx/common.c:126:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int imx_gpc_mf_request_on(unsigned int irq, unsigned int on) { return 0; }
   ^
   static 
>> arch/arm/mach-imx/common.c:132:6: warning: no previous prototype for function 'mx6_lpddr2_freq_change' [-Wmissing-prototypes]
   void mx6_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
        ^
   arch/arm/mach-imx/common.c:132:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mx6_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:136:6: warning: no previous prototype for function 'imx6sll_lpddr2_freq_change' [-Wmissing-prototypes]
   void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
        ^
   arch/arm/mach-imx/common.c:136:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:143:6: warning: no previous prototype for function 'imx6_up_ddr3_freq_change' [-Wmissing-prototypes]
   void imx6_up_ddr3_freq_change(struct imx6_busfreq_info *busfreq_info) {}
        ^
   arch/arm/mach-imx/common.c:143:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx6_up_ddr3_freq_change(struct imx6_busfreq_info *busfreq_info) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:144:6: warning: no previous prototype for function 'imx6_up_lpddr2_freq_change' [-Wmissing-prototypes]
   void imx6_up_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
        ^
   arch/arm/mach-imx/common.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx6_up_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   ^
   static 
   arch/arm/mach-imx/common.c:149:6: warning: no previous prototype for function 'imx6ull_low_power_idle' [-Wmissing-prototypes]
   void imx6ull_low_power_idle(void) {}
        ^
   arch/arm/mach-imx/common.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx6ull_low_power_idle(void) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:156:6: warning: no previous prototype for function 'mx6_ddr3_freq_change' [-Wmissing-prototypes]
   void mx6_ddr3_freq_change(u32 freq, void *ddr_settings,
        ^
   arch/arm/mach-imx/common.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mx6_ddr3_freq_change(u32 freq, void *ddr_settings,
   ^
   static 
>> arch/arm/mach-imx/common.c:158:6: warning: no previous prototype for function 'mx6q_lpddr2_freq_change' [-Wmissing-prototypes]
   void mx6q_lpddr2_freq_change(u32 freq, void *ddr_settings) {}
        ^
   arch/arm/mach-imx/common.c:158:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mx6q_lpddr2_freq_change(u32 freq, void *ddr_settings) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:159:6: warning: no previous prototype for function 'wfe_smp_freq_change' [-Wmissing-prototypes]
   void wfe_smp_freq_change(u32 cpuid, u32 *ddr_freq_change_done) {}
        ^
   arch/arm/mach-imx/common.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void wfe_smp_freq_change(u32 cpuid, u32 *ddr_freq_change_done) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:163:6: warning: no previous prototype for function 'imx7_smp_wfe' [-Wmissing-prototypes]
   void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
        ^
   arch/arm/mach-imx/common.c:163:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
   ^
   static 
>> arch/arm/mach-imx/common.c:164:6: warning: no previous prototype for function 'imx7d_ddr3_freq_change' [-Wmissing-prototypes]
   void imx7d_ddr3_freq_change(u32 freq) {}
        ^
   arch/arm/mach-imx/common.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void imx7d_ddr3_freq_change(u32 freq) {}
   ^
   static 
   14 warnings and 1 error generated.
--
>> arch/arm/mach-imx/busfreq_ddr3.c:111:5: warning: no previous prototype for function 'can_change_ddr_freq' [-Wmissing-prototypes]
   int can_change_ddr_freq(void)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int can_change_ddr_freq(void)
   ^
   static 
>> arch/arm/mach-imx/busfreq_ddr3.c:148:5: warning: no previous prototype for function 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
   int update_ddr_freq_imx_smp(int ddr_rate)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:148:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int update_ddr_freq_imx_smp(int ddr_rate)
   ^
   static 
>> arch/arm/mach-imx/busfreq_ddr3.c:241:5: warning: no previous prototype for function 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
   int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
       ^
   arch/arm/mach-imx/busfreq_ddr3.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
   ^
   static 
   arch/arm/mach-imx/busfreq_ddr3.c:76:24: warning: unused variable 'iram_iomux_settings' [-Wunused-variable]
   static unsigned long (*iram_iomux_settings)[2];
                          ^
   arch/arm/mach-imx/busfreq_ddr3.c:78:22: warning: unused variable 'gic_dist_base' [-Wunused-variable]
   static void __iomem *gic_dist_base;
                        ^
   5 warnings generated.


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
https://github.com/intel/lkp-tests/wiki
