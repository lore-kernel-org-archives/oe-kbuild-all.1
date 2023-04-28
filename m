Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5548C2CE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 03:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682652078; x=1714188078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T4Q3fw5HI32jt6yPiARPRn7Hm0hffqsrHaRs5nG9hr4=;
  b=Wggi12JL6VRbcNb2W9DaAo4+BFzaAXkEsDYiYl6RuNQaXhF9kZCDhvc9
   qZbqD4m/myav1hFWFrInhXS8KfUgKGKWVsaBonxqE6F4M4rRc952cbR1m
   E05Zex/LcV5j4CzQ8n4eWmMewN44EKJhgrgb9uOQOiHN/ccqsEYJgjK0Q
   8yJHmo0lj/9em1ujnzPiT/6jTNOy5lMrf/7IgUV/cXQKv6yy4/RT/XNLu
   6Kc1geu608lhnPy2evP6/mB+Qzc/O1aUOhPGjVPhh96sszw5awcvdc6mj
   9Jjw2yEIeqWV9fO7VhvOAKwzJi6J6px0Mpexdp9O4AiPczcHfXu9npZsY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="331941792"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="331941792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 20:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694658191"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="694658191"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Apr 2023 20:21:16 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psEfc-000049-0L;
	Fri, 28 Apr 2023 03:21:16 +0000
Date: Fri, 28 Apr 2023 11:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 4/8] ice: add admin commands to access cgu
 configuration
Message-ID: <202304281105.W8gg6UIk-lkp@intel.com>
References: <20230428002009.2948020-5-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-5-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-5-vadfed%40meta.com
patch subject: [RFC PATCH v7 4/8] ice: add admin commands to access cgu configuration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230428/202304281105.W8gg6UIk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/13ef3b4ad86b654d71f1e13448b0968c83403d02
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 13ef3b4ad86b654d71f1e13448b0968c83403d02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281105.W8gg6UIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:22,
                    from drivers/net/ethernet/intel/ice/ice.h:9,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:196:46: error: 'DPLL_PIN_FREQ_SUPP_1_HZ' undeclared here (not in a function); did you mean 'DPLL_PIN_FREQUENCY_1_HZ'?
     196 | #define ICE_SIG_TYPE_MASK_1PPS_10MHZ    (BIT(DPLL_PIN_FREQ_SUPP_1_HZ) | \
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:207:17: note: in expansion of macro 'ICE_SIG_TYPE_MASK_1PPS_10MHZ'
     207 |                 ICE_SIG_TYPE_MASK_1PPS_10MHZ },
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:197:46: error: 'DPLL_PIN_FREQ_SUPP_10_MHZ' undeclared here (not in a function); did you mean 'DPLL_PIN_FREQUENCY_10_MHZ'?
     197 |                                          BIT(DPLL_PIN_FREQ_SUPP_10_MHZ))
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:207:17: note: in expansion of macro 'ICE_SIG_TYPE_MASK_1PPS_10MHZ'
     207 |                 ICE_SIG_TYPE_MASK_1PPS_10MHZ },
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:211:21: error: 'DPLL_PIN_FREQ_SUPP_UNSPEC' undeclared here (not in a function); did you mean 'DPLL_PIN_DIRECTION_UNSPEC'?
     211 |                 BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:325:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     325 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:306:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     306 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:295:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     295 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:279:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     279 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:262:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     262 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:247:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     247 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:224:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     224 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:205:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     205 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from include/linux/kernel.h:22,
                    from drivers/net/ethernet/intel/ice/ice.h:9,
                    from drivers/net/ethernet/intel/ice/ice_lib.c:4:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:196:46: error: 'DPLL_PIN_FREQ_SUPP_1_HZ' undeclared here (not in a function); did you mean 'DPLL_PIN_FREQUENCY_1_HZ'?
     196 | #define ICE_SIG_TYPE_MASK_1PPS_10MHZ    (BIT(DPLL_PIN_FREQ_SUPP_1_HZ) | \
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:207:17: note: in expansion of macro 'ICE_SIG_TYPE_MASK_1PPS_10MHZ'
     207 |                 ICE_SIG_TYPE_MASK_1PPS_10MHZ },
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:197:46: error: 'DPLL_PIN_FREQ_SUPP_10_MHZ' undeclared here (not in a function); did you mean 'DPLL_PIN_FREQUENCY_10_MHZ'?
     197 |                                          BIT(DPLL_PIN_FREQ_SUPP_10_MHZ))
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:207:17: note: in expansion of macro 'ICE_SIG_TYPE_MASK_1PPS_10MHZ'
     207 |                 ICE_SIG_TYPE_MASK_1PPS_10MHZ },
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:211:21: error: 'DPLL_PIN_FREQ_SUPP_UNSPEC' undeclared here (not in a function); did you mean 'DPLL_PIN_DIRECTION_UNSPEC'?
     211 |                 BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:44: note: in definition of macro 'BIT'
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                            ^~
   drivers/net/ethernet/intel/ice/ice_lib.c: In function 'ice_init_feature_support':
   drivers/net/ethernet/intel/ice/ice_lib.c:4334:53: error: 'ICE_F_PHY_RCLK' undeclared (first use in this function)
    4334 |                         ice_set_feature_support(pf, ICE_F_PHY_RCLK);
         |                                                     ^~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lib.c:4334:53: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_lib.c:4:
   At top level:
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:325:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     325 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:306:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     306 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:295:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     295 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:279:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     279 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:262:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     262 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:247:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     247 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:224:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     224 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:205:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     205 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ice_e823_zl_cgu_outputs +325 drivers/net/ethernet/intel/ice/ice_ptp_hw.h

   204	
 > 205	static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
   206		{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
   207			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   208		{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   209			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   210		{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX,
   211			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   212		{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX,
   213			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   214		{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
   215			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   216		{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
   217			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   218		{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
   219			BIT(DPLL_PIN_FREQ_SUPP_1_HZ) },
   220		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   221			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   222	};
   223	
 > 224	static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
   225		{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
   226			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   227		{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   228			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   229		{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX,
   230			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   231		{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX,
   232			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   233		{ "C827_1-RCLKA", ZL_REF2P, DPLL_PIN_TYPE_MUX,
   234			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   235		{ "C827_1-RCLKB", ZL_REF2N, DPLL_PIN_TYPE_MUX,
   236			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   237		{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
   238			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   239		{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
   240			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   241		{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
   242			BIT(DPLL_PIN_FREQ_SUPP_1_HZ) },
   243		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   244				BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   245	};
   246	
 > 247	static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
   248		{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
   249			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   250		{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
   251			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   252		{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   253			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   254		{ "MAC-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   255			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   256		{ "CVL-SDP21",	    ZL_OUT4, DPLL_PIN_TYPE_EXT,
   257			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   258		{ "CVL-SDP23",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
   259			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   260	};
   261	
 > 262	static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
   263		{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
   264			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   265		{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
   266			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   267		{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   268			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   269		{ "PHY2-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   270			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   271		{ "MAC-CLK",	    ZL_OUT4, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   272			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   273		{ "CVL-SDP21",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
   274			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   275		{ "CVL-SDP23",	    ZL_OUT6, DPLL_PIN_TYPE_EXT,
   276			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   277	};
   278	
 > 279	static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
   280		{ "NONE",	  SI_REF0P, DPLL_PIN_TYPE_UNSPEC, 0 },
   281		{ "NONE",	  SI_REF0N, DPLL_PIN_TYPE_UNSPEC, 0 },
   282		{ "SYNCE0_DP",	  SI_REF1P, DPLL_PIN_TYPE_MUX,
   283			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   284		{ "SYNCE0_DN",	  SI_REF1N, DPLL_PIN_TYPE_MUX,
   285			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   286		{ "EXT_CLK_SYNC", SI_REF2P, DPLL_PIN_TYPE_EXT,
   287			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   288		{ "NONE",	  SI_REF2N, DPLL_PIN_TYPE_UNSPEC, 0 },
   289		{ "EXT_PPS_OUT",  SI_REF3,  DPLL_PIN_TYPE_EXT,
   290			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   291		{ "INT_PPS_OUT",  SI_REF4,  DPLL_PIN_TYPE_EXT,
   292			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   293	};
   294	
 > 295	static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
   296		{ "1588-TIME_SYNC", SI_OUT0, DPLL_PIN_TYPE_EXT,
   297			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   298		{ "PHY-CLK",	    SI_OUT1, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   299			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   300		{ "10MHZ-SMA2",	    SI_OUT2, DPLL_PIN_TYPE_EXT,
   301			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   302		{ "PPS-SMA1",	    SI_OUT3, DPLL_PIN_TYPE_EXT,
   303			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   304	};
   305	
 > 306	static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
   307		{ "NONE",	  ZL_REF0P, DPLL_PIN_TYPE_UNSPEC, 0 },
   308		{ "INT_PPS_OUT",  ZL_REF0N, DPLL_PIN_TYPE_EXT,
   309			BIT(DPLL_PIN_FREQ_SUPP_1_HZ) },
   310		{ "SYNCE0_DP",	  ZL_REF1P, DPLL_PIN_TYPE_MUX,
   311			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   312		{ "SYNCE0_DN",	  ZL_REF1N, DPLL_PIN_TYPE_MUX,
   313			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   314		{ "NONE",	  ZL_REF2P, DPLL_PIN_TYPE_UNSPEC, 0 },
   315		{ "NONE",	  ZL_REF2N, DPLL_PIN_TYPE_UNSPEC, 0 },
   316		{ "EXT_CLK_SYNC", ZL_REF3P, DPLL_PIN_TYPE_EXT,
   317			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   318		{ "NONE",	  ZL_REF3N, DPLL_PIN_TYPE_UNSPEC, 0 },
   319		{ "EXT_PPS_OUT",  ZL_REF4P, DPLL_PIN_TYPE_EXT,
   320			BIT(DPLL_PIN_FREQ_SUPP_1_HZ) },
   321		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   322				BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   323	};
   324	
 > 325	static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
   326		{ "PPS-SMA1",	   ZL_OUT0, DPLL_PIN_TYPE_EXT,
   327			BIT(DPLL_PIN_FREQ_SUPP_1_HZ) },
   328		{ "10MHZ-SMA2",	   ZL_OUT1, DPLL_PIN_TYPE_EXT,
   329			BIT(DPLL_PIN_FREQ_SUPP_10_MHZ) },
   330		{ "PHY-CLK",	   ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   331			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   332		{ "1588-TIME_REF", ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT,
   333			BIT(DPLL_PIN_FREQ_SUPP_UNSPEC) },
   334		{ "CPK-TIME_SYNC", ZL_OUT4, DPLL_PIN_TYPE_EXT,
   335			ICE_SIG_TYPE_MASK_1PPS_10MHZ },
   336		{ "NONE",	   ZL_OUT5, DPLL_PIN_TYPE_UNSPEC, 0 },
   337	};
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
