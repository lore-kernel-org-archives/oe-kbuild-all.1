Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6297181311
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719161827; cv=none; b=XNSPzch1vpkc6rZfT0LTB1c2ohCh8qEJDwUxi+TFJ00LSKMGA4pHoP7VHHYUIXM5falFeENfnE3TunZRP3zn+wvl1NwVFA8u05wqjFscLV+5y4zF4pS3D3XMdAHRCNDI4JC8sYs+oaHjdWr+lop0buc+4VdG2wx8srfwVeU4BEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719161827; c=relaxed/simple;
	bh=G4zB/IY/ehw6AuP1QGTIToSWz1w4/YKVh+YOkPF/iBc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eOqHPZUjGG/WeROQCsy+EyYjIlQVfMJbBsb6Sj/5fKpBTR5KHUlR09GHxmSWKrUE2csPVDzDfjJRfTvJ5UelGv5LAU+6h9jBYnmSbEXHA2TZUnQrilyGlx1AH3jECvwm2COubLDB8m6XZtsQ4eWC9bqE5cozn6nvOYhnXR0o6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=byYDxSyt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byYDxSyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719161826; x=1750697826;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G4zB/IY/ehw6AuP1QGTIToSWz1w4/YKVh+YOkPF/iBc=;
  b=byYDxSytq/zLatOwRsj6ZZTKKRtTuIx/iWSSCdcwGUh/1pbdkyXgUPbo
   AXM6XTq0dSyeqpQ4wVCIKwK6yxP9kPwaFaElSjztFhPa7HRc8fN3oMo0X
   8MjyrDaG01QtdkV9lWkh47QW1KP2UekpNlbW43D/DErr7rZ9XyPwlvPFr
   RPuwR3/ATe9X4+pBS6TDaj2Nx7RSePiOiuEniGLGE4vKJUbUtWgizNZUS
   1nUE446gOYfs/Y223c1KkITGoiE9DBi8opvUIdWEzPHaTYrikIXKgr62X
   GbJDp4ZMg5WkuJbjCzRI2/chQlVcpnPAH/TueE1R+IVDsu+nW7Qh/xjVL
   Q==;
X-CSE-ConnectionGUID: 1fRbcQZfQTKV64xN49LG+w==
X-CSE-MsgGUID: MVxbdFZgT5m9MXb/rRePYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="33592202"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="33592202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 09:57:05 -0700
X-CSE-ConnectionGUID: k/9VG57zSVCh9s7JAj5pEQ==
X-CSE-MsgGUID: lgX10K1vSXerQmM+ptXEOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="43189005"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2024 09:57:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLQWT-000AiQ-1R
	for oe-kbuild-all@lists.linux.dev;
	Sun, 23 Jun 2024 16:57:01 +0000
Date: Mon, 24 Jun 2024 00:56:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 4037/6555]
 drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3145:14: error: 'struct
 kbase_device' has no member named 'regulator_num'
Message-ID: <202406240037.3lIxIlr2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: d12dc1a835648e06925c9d8f4b4e14017104fe76 [4037/6555] CHROMIUM: MALI: Add Mali platform specific source
config: arm-randconfig-r064-20240623 (https://download.01.org/0day-ci/archive/20240624/202406240037.3lIxIlr2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406240037.3lIxIlr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406240037.3lIxIlr2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   cc1: warning: -Idrivers/gpu/arm/midgard/../../../base: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c: In function 'power_control_init':
>> drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3145:14: error: 'struct kbase_device' has no member named 'regulator_num'
    3145 |         kbdev->regulator_num = of_property_count_strings(kbdev->dev->of_node,
         |              ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3148:34: error: 'struct kbase_device' has no member named 'regulator_num'
    3148 |         reg_names = kcalloc(kbdev->regulator_num, sizeof(char *), GFP_KERNEL);
         |                                  ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3151:33: error: 'struct kbase_device' has no member named 'regulator_num'
    3151 |                 reg_names, kbdev->regulator_num) < 0) {
         |                                 ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c: In function 'power_control_term':
>> drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3245:13: warning: unused variable 'i' [-Wunused-variable]
    3245 |         int i;
         |             ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:37,
                    from drivers/gpu/arm/midgard/mali_kbase.h:57,
                    from drivers/gpu/arm/midgard/mali_kbase_core_linux.c:23:
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h: At top level:
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1234:33: warning: 'base_hw_issues_model_tEGx' defined but not used [-Wunused-const-variable=]
    1234 | static const enum base_hw_issue base_hw_issues_model_tEGx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1227:33: warning: 'base_hw_issues_tEGx_r0p0' defined but not used [-Wunused-const-variable=]
    1227 | static const enum base_hw_issue base_hw_issues_tEGx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1219:33: warning: 'base_hw_issues_model_tBOx' defined but not used [-Wunused-const-variable=]
    1219 | static const enum base_hw_issue base_hw_issues_model_tBOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1212:33: warning: 'base_hw_issues_tBOx_r0p0' defined but not used [-Wunused-const-variable=]
    1212 | static const enum base_hw_issue base_hw_issues_tBOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1204:33: warning: 'base_hw_issues_model_tTRx' defined but not used [-Wunused-const-variable=]
    1204 | static const enum base_hw_issue base_hw_issues_model_tTRx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1197:33: warning: 'base_hw_issues_tTRx_r0p0' defined but not used [-Wunused-const-variable=]
    1197 | static const enum base_hw_issue base_hw_issues_tTRx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1189:33: warning: 'base_hw_issues_model_tKAx' defined but not used [-Wunused-const-variable=]
    1189 | static const enum base_hw_issue base_hw_issues_model_tKAx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1182:33: warning: 'base_hw_issues_tKAx_r0p0' defined but not used [-Wunused-const-variable=]
    1182 | static const enum base_hw_issue base_hw_issues_tKAx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1174:33: warning: 'base_hw_issues_model_tGOx' defined but not used [-Wunused-const-variable=]
    1174 | static const enum base_hw_issue base_hw_issues_model_tGOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1166:33: warning: 'base_hw_issues_tGOx_r1p0' defined but not used [-Wunused-const-variable=]
    1166 | static const enum base_hw_issue base_hw_issues_tGOx_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1158:33: warning: 'base_hw_issues_tGOx_r0p0' defined but not used [-Wunused-const-variable=]
    1158 | static const enum base_hw_issue base_hw_issues_tGOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1150:33: warning: 'base_hw_issues_model_tNOx' defined but not used [-Wunused-const-variable=]
    1150 | static const enum base_hw_issue base_hw_issues_model_tNOx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1142:33: warning: 'base_hw_issues_tNOx_r0p0' defined but not used [-Wunused-const-variable=]
    1142 | static const enum base_hw_issue base_hw_issues_tNOx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1134:33: warning: 'base_hw_issues_model_tDVx' defined but not used [-Wunused-const-variable=]
    1134 | static const enum base_hw_issue base_hw_issues_model_tDVx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1127:33: warning: 'base_hw_issues_tDVx_r0p0' defined but not used [-Wunused-const-variable=]
    1127 | static const enum base_hw_issue base_hw_issues_tDVx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1119:33: warning: 'base_hw_issues_model_tSIx' defined but not used [-Wunused-const-variable=]
    1119 | static const enum base_hw_issue base_hw_issues_model_tSIx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1112:33: warning: 'base_hw_issues_tSIx_r1p1' defined but not used [-Wunused-const-variable=]
    1112 | static const enum base_hw_issue base_hw_issues_tSIx_r1p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1104:33: warning: 'base_hw_issues_tSIx_r1p0' defined but not used [-Wunused-const-variable=]
    1104 | static const enum base_hw_issue base_hw_issues_tSIx_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1096:33: warning: 'base_hw_issues_tSIx_r0p1' defined but not used [-Wunused-const-variable=]
    1096 | static const enum base_hw_issue base_hw_issues_tSIx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1088:33: warning: 'base_hw_issues_tSIx_r0p0' defined but not used [-Wunused-const-variable=]
    1088 | static const enum base_hw_issue base_hw_issues_tSIx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1079:33: warning: 'base_hw_issues_model_tHEx' defined but not used [-Wunused-const-variable=]
    1079 | static const enum base_hw_issue base_hw_issues_model_tHEx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1070:33: warning: 'base_hw_issues_tHEx_r0p3' defined but not used [-Wunused-const-variable=]
    1070 | static const enum base_hw_issue base_hw_issues_tHEx_r0p3[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1060:33: warning: 'base_hw_issues_tHEx_r0p2' defined but not used [-Wunused-const-variable=]
    1060 | static const enum base_hw_issue base_hw_issues_tHEx_r0p2[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1050:33: warning: 'base_hw_issues_tHEx_r0p1' defined but not used [-Wunused-const-variable=]
    1050 | static const enum base_hw_issue base_hw_issues_tHEx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1040:33: warning: 'base_hw_issues_tHEx_r0p0' defined but not used [-Wunused-const-variable=]
    1040 | static const enum base_hw_issue base_hw_issues_tHEx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1026:33: warning: 'base_hw_issues_model_tMIx' defined but not used [-Wunused-const-variable=]
    1026 | static const enum base_hw_issue base_hw_issues_model_tMIx[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:1009:33: warning: 'base_hw_issues_tMIx_r0p1' defined but not used [-Wunused-const-variable=]
    1009 | static const enum base_hw_issue base_hw_issues_tMIx_r0p1[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:992:33: warning: 'base_hw_issues_tMIx_r0p0' defined but not used [-Wunused-const-variable=]
     992 | static const enum base_hw_issue base_hw_issues_tMIx_r0p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:975:33: warning: 'base_hw_issues_tMIx_r0p0_05dev0' defined but not used [-Wunused-const-variable=]
     975 | static const enum base_hw_issue base_hw_issues_tMIx_r0p0_05dev0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:960:33: warning: 'base_hw_issues_model_t82x' defined but not used [-Wunused-const-variable=]
     960 | static const enum base_hw_issue base_hw_issues_model_t82x[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:939:33: warning: 'base_hw_issues_t82x_r1p0' defined but not used [-Wunused-const-variable=]
     939 | static const enum base_hw_issue base_hw_issues_t82x_r1p0[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_base_hwconfig_issues.h:917:33: warning: 'base_hw_issues_t82x_r0p1' defined but not used [-Wunused-const-variable=]


vim +3145 drivers/gpu/arm/midgard/mali_kbase_core_linux.c

  3141	
  3142		if (!kbdev)
  3143			return -ENODEV;
  3144	
> 3145		kbdev->regulator_num = of_property_count_strings(kbdev->dev->of_node,
  3146			"supply-names");
  3147	
> 3148		reg_names = kcalloc(kbdev->regulator_num, sizeof(char *), GFP_KERNEL);
  3149	
  3150		if (of_property_read_string_array(kbdev->dev->of_node, "supply-names",
  3151			reg_names, kbdev->regulator_num) < 0) {
  3152			dev_err(&pdev->dev, "Failed to get supply names\n");
  3153			err = -EINVAL;
  3154			goto fail;
  3155		}
  3156	
  3157	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 12, 0)) && defined(CONFIG_OF) \
  3158				&& defined(CONFIG_REGULATOR)
  3159		for (i = 0; i < kbdev->regulator_num; i++) {
  3160			kbdev->regulator[i] = regulator_get_optional(kbdev->dev, reg_names[i]);
  3161			if (IS_ERR_OR_NULL(kbdev->regulator[i])) {
  3162				err = PTR_ERR(kbdev->regulator[i]);
  3163				kbdev->regulator[i] = NULL;
  3164				if (err == -EPROBE_DEFER) {
  3165					dev_err(&pdev->dev, "Failed to get regulator\n");
  3166					goto fail;
  3167				}
  3168				dev_info(kbdev->dev,
  3169					"Continuing without %s regulator control\n", reg_names[i]);
  3170				/* Allow probe to continue without regulator */
  3171			}
  3172		}
  3173	#endif /* LINUX_VERSION_CODE >= 3, 12, 0 */
  3174	
  3175		kbdev->clock = of_clk_get(kbdev->dev->of_node, 0);
  3176		if (IS_ERR_OR_NULL(kbdev->clock)) {
  3177			err = PTR_ERR(kbdev->clock);
  3178			kbdev->clock = NULL;
  3179			if (err == -EPROBE_DEFER) {
  3180				dev_err(&pdev->dev, "Failed to get clock\n");
  3181				goto fail;
  3182			}
  3183			dev_info(kbdev->dev, "Continuing without Mali clock control\n");
  3184			/* Allow probe to continue without clock. */
  3185		} else {
  3186			err = clk_prepare_enable(kbdev->clock);
  3187			if (err) {
  3188				dev_err(kbdev->dev,
  3189					"Failed to prepare and enable clock (%d)\n",
  3190					err);
  3191				goto fail;
  3192			}
  3193		}
  3194	
  3195	#if defined(CONFIG_OF) && defined(CONFIG_PM_OPP)
  3196		/* Register the OPPs if they are available in device tree */
  3197	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)) \
  3198		|| defined(LSK_OPPV2_BACKPORT)
  3199	#if defined(CONFIG_REGULATOR)
  3200		kbdev->dev_opp_table = dev_pm_opp_set_regulators(kbdev->dev, reg_names, 2);
  3201		if (IS_ERR(kbdev->dev_opp_table)) {
  3202			err = PTR_ERR(kbdev->dev_opp_table);
  3203			kbdev->dev_opp_table = NULL;
  3204			dev_err(kbdev->dev, "Failed to set regulators for GPU err: %d\n",
  3205				err);
  3206		}
  3207	#endif /* CONFIG_REGULATOR */
  3208		err = dev_pm_opp_of_add_table(kbdev->dev);
  3209	#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 7, 0))
  3210		err = of_init_opp_table(kbdev->dev);
  3211	#else
  3212		err = 0;
  3213	#endif /* LINUX_VERSION_CODE */
  3214		if (err)
  3215			dev_dbg(kbdev->dev, "OPP table not found\n");
  3216	#endif /* CONFIG_OF && CONFIG_PM_OPP */
  3217	
  3218		kfree(reg_names);
  3219	
  3220		return 0;
  3221	
  3222	fail:
  3223	
  3224	if (kbdev->clock != NULL) {
  3225		clk_put(kbdev->clock);
  3226		kbdev->clock = NULL;
  3227	}
  3228	
  3229	#ifdef CONFIG_REGULATOR
  3230		for (i = 0; i < kbdev->regulator_num; i++) {
  3231			if (NULL != kbdev->regulator[i]) {
  3232				regulator_put(kbdev->regulator[i]);
  3233				kbdev->regulator[i] = NULL;
  3234			}
  3235		}
  3236	#endif
  3237	
  3238		kfree(reg_names);
  3239	
  3240		return err;
  3241	}
  3242	
  3243	static void power_control_term(struct kbase_device *kbdev)
  3244	{
> 3245		int i;
  3246	#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 4, 0)) || \
  3247			defined(LSK_OPPV2_BACKPORT)
  3248		dev_pm_opp_of_remove_table(kbdev->dev);
  3249	#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 19, 0))
  3250		of_free_opp_table(kbdev->dev);
  3251	#endif
  3252	
  3253		if (kbdev->clock) {
  3254			clk_disable_unprepare(kbdev->clock);
  3255			clk_put(kbdev->clock);
  3256			kbdev->clock = NULL;
  3257		}
  3258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
