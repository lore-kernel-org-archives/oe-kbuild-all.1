Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558C185F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Mar 2023 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678604717; x=1710140717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FS/NYM1s2rrK2ga+0ILqb6dJZEmdh42e+UYSs66hBxE=;
  b=T1wu7UwvqRSdRXDr+v0NNG35x4AMeYKHCYZnbWFbJhIwEA4LHrA1n9k+
   vbbilW4trjL2q9wLIrzULblrEdqCZ5OgSM+r2o1CZgsEUluTjaKgMPjKt
   apT+yuWoxl9PYBrfIjz9PM/M5Bs7JAIDp8C6Y9w7KI38nTyNlODtccSff
   2CCExQjkY5Bcht3gbLWVVXUcW14XetL7BQDZ9SMYRb9TTazCAVTDspyoE
   stKzaJ32fVpNxeHXXrtCOBAalbXwPtbJN8TqFcc5M+HPuf+bxIVgmzskU
   V1DNdKgn6PQk+uc79M4RVl81VfKSrZIwFBafKl//6xSx5tzYCLKFRamCe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="339335364"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="339335364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2023 23:05:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10646"; a="710748377"
X-IronPort-AV: E=Sophos;i="5.98,254,1673942400"; 
   d="scan'208";a="710748377"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Mar 2023 23:05:15 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbFla-00055B-23;
	Sun, 12 Mar 2023 07:05:14 +0000
Date: Sun, 12 Mar 2023 15:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v6 4/6] ice: add admin commands to access cgu
 configuration
Message-ID: <202303121450.oxVbU44L-lkp@intel.com>
References: <20230312022807.278528-5-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-5-vadfed@meta.com>

Hi Vadim,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc1 next-20230310]
[cannot apply to tnguy-next-queue/dev-queue]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
patch link:    https://lore.kernel.org/r/20230312022807.278528-5-vadfed%40meta.com
patch subject: [PATCH RFC v6 4/6] ice: add admin commands to access cgu configuration
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230312/202303121450.oxVbU44L-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0b8a02c116e829e4a4f8dd4a3d584b47688fed76
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230312-103056
        git checkout 0b8a02c116e829e4a4f8dd4a3d584b47688fed76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303121450.oxVbU44L-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/intel/ice/ice_lib.c: In function 'ice_init_feature_support':
>> drivers/net/ethernet/intel/ice/ice_lib.c:4334:53: error: 'ICE_F_PHY_RCLK' undeclared (first use in this function)
    4334 |                         ice_set_feature_support(pf, ICE_F_PHY_RCLK);
         |                                                     ^~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lib.c:4334:53: note: each undeclared identifier is reported only once for each function it appears in
   In file included from drivers/net/ethernet/intel/ice/ice_ptp.h:10,
                    from drivers/net/ethernet/intel/ice/ice.h:69,
                    from drivers/net/ethernet/intel/ice/ice_lib.c:4:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h: At top level:
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:325:38: warning: 'ice_e823_zl_cgu_outputs' defined but not used [-Wunused-const-variable=]
     325 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:306:38: warning: 'ice_e823_zl_cgu_inputs' defined but not used [-Wunused-const-variable=]
     306 | static const struct ice_cgu_pin_desc ice_e823_zl_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:295:38: warning: 'ice_e823_si_cgu_outputs' defined but not used [-Wunused-const-variable=]
     295 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:279:38: warning: 'ice_e823_si_cgu_inputs' defined but not used [-Wunused-const-variable=]
     279 | static const struct ice_cgu_pin_desc ice_e823_si_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:262:38: warning: 'ice_e810t_qsfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     262 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:247:38: warning: 'ice_e810t_sfp_cgu_outputs' defined but not used [-Wunused-const-variable=]
     247 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_outputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:224:38: warning: 'ice_e810t_qsfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     224 | static const struct ice_cgu_pin_desc ice_e810t_qsfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_ptp_hw.h:205:38: warning: 'ice_e810t_sfp_cgu_inputs' defined but not used [-Wunused-const-variable=]
     205 | static const struct ice_cgu_pin_desc ice_e810t_sfp_cgu_inputs[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/ICE_F_PHY_RCLK +4334 drivers/net/ethernet/intel/ice/ice_lib.c

  4315	
  4316	/**
  4317	 * ice_init_feature_support
  4318	 * @pf: pointer to the struct ice_pf instance
  4319	 *
  4320	 * called during init to setup supported feature
  4321	 */
  4322	void ice_init_feature_support(struct ice_pf *pf)
  4323	{
  4324		switch (pf->hw.device_id) {
  4325		case ICE_DEV_ID_E810C_BACKPLANE:
  4326		case ICE_DEV_ID_E810C_QSFP:
  4327		case ICE_DEV_ID_E810C_SFP:
  4328		case ICE_DEV_ID_E810_XXV_BACKPLANE:
  4329		case ICE_DEV_ID_E810_XXV_QSFP:
  4330		case ICE_DEV_ID_E810_XXV_SFP:
  4331			ice_set_feature_support(pf, ICE_F_DSCP);
  4332			ice_set_feature_support(pf, ICE_F_PTP_EXTTS);
  4333			if (ice_is_phy_rclk_present(&pf->hw))
> 4334				ice_set_feature_support(pf, ICE_F_PHY_RCLK);
  4335			/* If we don't own the timer - don't enable other caps */
  4336			if (!pf->hw.func_caps.ts_func_info.src_tmr_owned)
  4337				break;
  4338			if (ice_is_cgu_present(&pf->hw))
  4339				ice_set_feature_support(pf, ICE_F_CGU);
  4340			if (ice_is_clock_mux_present_e810t(&pf->hw))
  4341				ice_set_feature_support(pf, ICE_F_SMA_CTRL);
  4342			if (ice_gnss_is_gps_present(&pf->hw))
  4343				ice_set_feature_support(pf, ICE_F_GNSS);
  4344			break;
  4345		default:
  4346			break;
  4347		}
  4348	}
  4349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
