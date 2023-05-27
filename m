Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79614AD31
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685190184; x=1716726184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7NN+ivQgusa4bSMJSuevdA3SlTkkswT+3QuDLLwCpq0=;
  b=V0CxB2QHGA6FgtQ0zDatX594HH67wbwAiDtNP/AcMb8DQ5XDwaAclIgc
   T0r8oHma3B91f0uTRwU+9tlaXHXpjOzTmZ6Dm6vD9+6ojpwv3T/mGadXJ
   TwTocAZfnl3Ijcwr8LUkdtepFkIGHAMQGKXxYBH66UTGT+wIkuLM96WAr
   smX+uN61XGIYKeZOE2o0MvePR71BrzLzkHHvWwU6jUzggYDUfXpVaDflg
   OJbR0SCHDT43cCaTZyaEUEbUzTw/LEUWLHrSv8oT6FI3kjKKrx+03qZbk
   l9MoKRWq0g3X8MPAvlald0dYZcuefcVZTplT0jZsqDsy1MfNbQC9yFAap
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="354402311"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="354402311"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 05:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699693276"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="699693276"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 May 2023 05:23:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2swn-000JxI-2K;
	Sat, 27 May 2023 12:23:01 +0000
Date: Sat, 27 May 2023 20:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 24/9879]
 arch/arm/mach-imx/busfreq-imx.c:94:19: error: a randomized struct can only
 be initialized with a designated initializer
Message-ID: <202305272005.mB60Dl5L-lkp@intel.com>
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
config: arm-randconfig-r003-20230524 (https://download.01.org/0day-ci/archive/20230527/202305272005.mB60Dl5L-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/Freescale/linux-fslc/commit/e30da6831ebcd0bcbe7c36485526255eb66b354a
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout e30da6831ebcd0bcbe7c36485526255eb66b354a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305272005.mB60Dl5L-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
>> arch/arm/mach-imx/busfreq-imx.c:94:19: error: a randomized struct can only be initialized with a designated initializer
   } busfreq_func = {NULL, NULL};
                     ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   arch/arm/mach-imx/busfreq-imx.c:134:5: error: redefinition of 'register_busfreq_notifier'
   int register_busfreq_notifier(struct notifier_block *nb)
       ^
   include/linux/busfreq-imx.h:64:19: note: previous definition is here
   static inline int register_busfreq_notifier(struct notifier_block *nb)
                     ^
   arch/arm/mach-imx/busfreq-imx.c:140:5: error: redefinition of 'unregister_busfreq_notifier'
   int unregister_busfreq_notifier(struct notifier_block *nb)
       ^
   include/linux/busfreq-imx.h:68:19: note: previous definition is here
   static inline int unregister_busfreq_notifier(struct notifier_block *nb)
                     ^
   arch/arm/mach-imx/busfreq-imx.c:321:6: error: redefinition of 'request_bus_freq'
   void request_bus_freq(enum bus_freq_mode mode)
        ^
   include/linux/busfreq-imx.h:58:20: note: previous definition is here
   static inline void request_bus_freq(enum bus_freq_mode mode)
                      ^
   arch/arm/mach-imx/busfreq-imx.c:370:6: error: redefinition of 'release_bus_freq'
   void release_bus_freq(enum bus_freq_mode mode)
        ^
   include/linux/busfreq-imx.h:61:20: note: previous definition is here
   static inline void release_bus_freq(enum bus_freq_mode mode)
                      ^
   arch/arm/mach-imx/busfreq-imx.c:446:5: error: redefinition of 'get_bus_freq_mode'
   int get_bus_freq_mode(void)
       ^
   include/linux/busfreq-imx.h:72:19: note: previous definition is here
   static inline int get_bus_freq_mode(void)
                     ^
   arch/arm/mach-imx/busfreq-imx.c:469:6: error: call to undeclared function 'of_flat_dt_match'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (of_flat_dt_match(node, ddr_freq_iram_match)) {
               ^
   7 errors generated.
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


vim +94 arch/arm/mach-imx/busfreq-imx.c

    85	
    86	
    87	/**
    88	 * @brief  Functions to init and update the busfreq function of
    89	 *         device and memory type
    90	 */
    91	static struct busfreq_func {
    92		int (*init)(struct platform_device *dev);
    93		int (*update)(int ddr_rate);
  > 94	} busfreq_func = {NULL, NULL};
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
