Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99E91C747
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 15:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686411467; x=1717947467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yosIQlCcxH3/vpJG/AHJ1YZseIEWxqzmlV8W5tSXunE=;
  b=IL0yVn5Z0aK33/r2cZxiaC9Rrw5XjyjTAhtQq8xV6TVO4lKhY8yZILSV
   Aq5N6dCipHjVnqpi79uphXsuQmqcKAi+Zov+LaQG4T6B1yOpKfacEIw0k
   WIzQK4wb4ujjWHPbe5NlLNhSP49K34fggc8EaKY75mvM5f3xLX7x/OfsD
   OoWQcp3PbC26AFClC114xC0PpR4FW07GRHFrgiugNEUYSAys1ujSei7St
   ENE8VBqeIjAs9P0nK7WZvjIBUb1uqE2osnb2S9w6vc6odV/Y9oaQQlUAW
   RYkHFNcwcKtNDO/k9Cgdmhesm7XMz0ZHQESWGIkC6DF9gSQqbe+ZWepkO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="356666114"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="356666114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 08:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="740475987"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="740475987"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 Jun 2023 08:37:45 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q80eu-000ABI-2p;
	Sat, 10 Jun 2023 15:37:44 +0000
Date: Sat, 10 Jun 2023 23:36:42 +0800
From: kernel test robot <lkp@intel.com>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [RFC PATCH v8 07/10] ice: add admin commands
 to access cgu configuration
Message-ID: <202306102310.pOqzFRs1-lkp@intel.com>
References: <20230609121853.3607724-8-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609121853.3607724-8-arkadiusz.kubalewski@intel.com>

Hi Arkadiusz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue net-next/main net/main linus/master v6.4-rc5]
[cannot apply to next-20230609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arkadiusz-Kubalewski/dpll-documentation-on-DPLL-subsystem-interface/20230609-202453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230609121853.3607724-8-arkadiusz.kubalewski%40intel.com
patch subject: [Intel-wired-lan] [RFC PATCH v8 07/10] ice: add admin commands to access cgu configuration
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230610/202306102310.pOqzFRs1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch tnguy-next-queue dev-queue
        git checkout tnguy-next-queue/dev-queue
        b4 shazam https://lore.kernel.org/r/20230609121853.3607724-8-arkadiusz.kubalewski@intel.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dpll/ drivers/net/ethernet/intel/ice/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306102310.pOqzFRs1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_main.c:9:
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:317:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     317 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:301:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     301 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:291:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     291 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:277:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     277 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:263:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     263 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:250:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     250 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:232:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     232 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:216:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     216 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/net/ethernet/intel/ice/ice_lib.c: In function 'ice_init_feature_support':
   drivers/net/ethernet/intel/ice/ice_lib.c:4039:53: error: 'ICE_F_PHY_RCLK' undeclared (first use in this function)
    4039 |                         ice_set_feature_support(pf, ICE_F_PHY_RCLK);
         |                                                     ^~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lib.c:4039:53: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_lib.c:4:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h: At top level:
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:317:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     317 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:301:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     301 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:291:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     291 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:277:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     277 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:263:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     263 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:250:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     250 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:232:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     232 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_ptp_hw.h:216:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     216 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ice_e823_zl_cgu_outputs +317 drivers/net/ethernet/intel/ice/ice_ptp_hw.h

   215	
 > 216	static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
   217		{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
   218			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   219		{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   220			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   221		{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX, 0, },
   222		{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX, 0, },
   223		{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
   224			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   225		{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
   226			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   227		{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
   228			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   229		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, 0, },
   230	};
   231	
 > 232	static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
   233		{ "CVL-SDP22",	  ZL_REF0P, DPLL_PIN_TYPE_INT_OSCILLATOR,
   234			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   235		{ "CVL-SDP20",	  ZL_REF0N, DPLL_PIN_TYPE_INT_OSCILLATOR,
   236			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   237		{ "C827_0-RCLKA", ZL_REF1P, DPLL_PIN_TYPE_MUX, },
   238		{ "C827_0-RCLKB", ZL_REF1N, DPLL_PIN_TYPE_MUX, },
   239		{ "C827_1-RCLKA", ZL_REF2P, DPLL_PIN_TYPE_MUX, },
   240		{ "C827_1-RCLKB", ZL_REF2N, DPLL_PIN_TYPE_MUX, },
   241		{ "SMA1",	  ZL_REF3P, DPLL_PIN_TYPE_EXT,
   242			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   243		{ "SMA2/U.FL2",	  ZL_REF3N, DPLL_PIN_TYPE_EXT,
   244			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   245		{ "GNSS-1PPS",	  ZL_REF4P, DPLL_PIN_TYPE_GNSS,
   246			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   247		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, },
   248	};
   249	
 > 250	static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
   251		{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
   252			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   253		{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
   254			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   255		{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, },
   256		{ "MAC-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, },
   257		{ "CVL-SDP21",	    ZL_OUT4, DPLL_PIN_TYPE_EXT,
   258			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   259		{ "CVL-SDP23",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
   260			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   261	};
   262	
 > 263	static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
   264		{ "REF-SMA1",	    ZL_OUT0, DPLL_PIN_TYPE_EXT,
   265			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   266		{ "REF-SMA2/U.FL2", ZL_OUT1, DPLL_PIN_TYPE_EXT,
   267			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   268		{ "PHY-CLK",	    ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   269		{ "PHY2-CLK",	    ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   270		{ "MAC-CLK",	    ZL_OUT4, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   271		{ "CVL-SDP21",	    ZL_OUT5, DPLL_PIN_TYPE_EXT,
   272			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   273		{ "CVL-SDP23",	    ZL_OUT6, DPLL_PIN_TYPE_EXT,
   274			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   275	};
   276	
 > 277	static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
   278		{ "NONE",	  SI_REF0P, 0, 0 },
   279		{ "NONE",	  SI_REF0N, 0, 0 },
   280		{ "SYNCE0_DP",	  SI_REF1P, DPLL_PIN_TYPE_MUX, 0 },
   281		{ "SYNCE0_DN",	  SI_REF1N, DPLL_PIN_TYPE_MUX, 0 },
   282		{ "EXT_CLK_SYNC", SI_REF2P, DPLL_PIN_TYPE_EXT,
   283			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   284		{ "NONE",	  SI_REF2N, 0, 0 },
   285		{ "EXT_PPS_OUT",  SI_REF3,  DPLL_PIN_TYPE_EXT,
   286			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   287		{ "INT_PPS_OUT",  SI_REF4,  DPLL_PIN_TYPE_EXT,
   288			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   289	};
   290	
 > 291	static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
   292		{ "1588-TIME_SYNC", SI_OUT0, DPLL_PIN_TYPE_EXT,
   293			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   294		{ "PHY-CLK",	    SI_OUT1, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   295		{ "10MHZ-SMA2",	    SI_OUT2, DPLL_PIN_TYPE_EXT,
   296			ARRAY_SIZE(ice_cgu_pin_freq_10_mhz), ice_cgu_pin_freq_10_mhz },
   297		{ "PPS-SMA1",	    SI_OUT3, DPLL_PIN_TYPE_EXT,
   298			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   299	};
   300	
 > 301	static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
   302		{ "NONE",	  ZL_REF0P, 0, 0 },
   303		{ "INT_PPS_OUT",  ZL_REF0N, DPLL_PIN_TYPE_EXT,
   304			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   305		{ "SYNCE0_DP",	  ZL_REF1P, DPLL_PIN_TYPE_MUX, 0 },
   306		{ "SYNCE0_DN",	  ZL_REF1N, DPLL_PIN_TYPE_MUX, 0 },
   307		{ "NONE",	  ZL_REF2P, 0, 0 },
   308		{ "NONE",	  ZL_REF2N, 0, 0 },
   309		{ "EXT_CLK_SYNC", ZL_REF3P, DPLL_PIN_TYPE_EXT,
   310			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   311		{ "NONE",	  ZL_REF3N, 0, 0 },
   312		{ "EXT_PPS_OUT",  ZL_REF4P, DPLL_PIN_TYPE_EXT,
   313			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   314		{ "OCXO",	  ZL_REF4N, DPLL_PIN_TYPE_INT_OSCILLATOR, 0 },
   315	};
   316	
 > 317	static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
   318		{ "PPS-SMA1",	   ZL_OUT0, DPLL_PIN_TYPE_EXT,
   319			ARRAY_SIZE(ice_cgu_pin_freq_1_hz), ice_cgu_pin_freq_1_hz },
   320		{ "10MHZ-SMA2",	   ZL_OUT1, DPLL_PIN_TYPE_EXT,
   321			ARRAY_SIZE(ice_cgu_pin_freq_10_mhz), ice_cgu_pin_freq_10_mhz },
   322		{ "PHY-CLK",	   ZL_OUT2, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   323		{ "1588-TIME_REF", ZL_OUT3, DPLL_PIN_TYPE_SYNCE_ETH_PORT, 0 },
   324		{ "CPK-TIME_SYNC", ZL_OUT4, DPLL_PIN_TYPE_EXT,
   325			ARRAY_SIZE(ice_cgu_pin_freq_common), ice_cgu_pin_freq_common },
   326		{ "NONE",	   ZL_OUT5, 0, 0 },
   327	};
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
