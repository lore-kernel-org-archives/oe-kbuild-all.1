Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77D442C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 02:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719196735; cv=none; b=FlaIkvyhUbpObx7EBwsNLmxYcK7tjpz0tlaDANoICMUB/F6/KCtNvLOCJadD4CCcOhk9v6xH5ggqadh7io9F4tER6Zhky0QXSnZLDYr+M9KN7/IN30PncBEj8sCCYwfbOsvez7Cl639i18/+ovcnFyWa1vCpGb2Fd2tMVtRwHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719196735; c=relaxed/simple;
	bh=R1Aj2i1RNe7ZjKpm9WWFSq/dbFa8Yyp2OWfVFFP8xq4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rbearx5WnMkbIfnB5+oCElerlMY88tixTN66Os4zxRTKhUvIoL2N/GPRjvPuFT5N9/kB732dtplcpm5lHX5go3qg154ZWzFsjm3spah0Kzk+BHbxbx1fpKFptx0toHtBXHAC/FxOlIcfA1fJyNhWybqlxUsgbn9GzRrl6LbOPMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9wL/Tg0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9wL/Tg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719196733; x=1750732733;
  h=date:from:cc:subject:message-id:mime-version;
  bh=R1Aj2i1RNe7ZjKpm9WWFSq/dbFa8Yyp2OWfVFFP8xq4=;
  b=f9wL/Tg0pNPy5Q8/a8KWBNLHZVhNUpuPOyErQYOJ3cQQGjkrxYo4PRXs
   oTWJCR8aWypmGRVoZtqKOD5vSnDBipqDMXblbb0kw30QzjhyihA+yIIcR
   8YIZLOQgSfqqhwCjRPktoFj+UUqbrSVP+UN6fqtsy5huoN750dHQfyBls
   J2LRu2ectpAaDXvqeo6UFHG2e1soASaKIqB1bFddmi92H7LRf1kc7ZEin
   9s5HVbCt/M4ol5KieVwsgKbyx+UYsFDFzdZOc+r3uZmw0yIGjFSUg3cDj
   rv6DteZPeI/YY2F79OaBa4/5DnNuDnM752v3Q7agUGP558CMnPlbZynY9
   g==;
X-CSE-ConnectionGUID: b0R9qCiERmONVio8kxZ8Nw==
X-CSE-MsgGUID: DS3CzNYxTJKaskqZ9lMtlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16030111"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="16030111"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 19:38:52 -0700
X-CSE-ConnectionGUID: aAm5ODOFQmy9bymk5mh2lg==
X-CSE-MsgGUID: HutTRNm2TWSuQwWJBKDEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43130933"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2024 19:38:51 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLZbV-000Bza-0k
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Jun 2024 02:38:49 +0000
Date: Mon, 24 Jun 2024 10:38:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 3299/9999]
 drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3143:21: warning: unused
 variable 'reg_names'
Message-ID: <202406241045.bFYlWjGC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: a67c1a87a5e5f95b241491fdbdbe04de8d1411c8 [3299/9999] CHROMIUM: MALI: Clean up supply-names and make them optional
config: arm-randconfig-r064-20240623 (https://download.01.org/0day-ci/archive/20240624/202406241045.bFYlWjGC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240624/202406241045.bFYlWjGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406241045.bFYlWjGC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: -Idrivers/gpu/arm/midgard/../../../base: No such file or directory [-Wmissing-include-dirs]
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c: In function 'power_control_init':
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3143:31: error: 'KBASE_MAX_REGULATORS' undeclared (first use in this function)
    3143 |         const char *reg_names[KBASE_MAX_REGULATORS];
         |                               ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3143:31: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3151:14: error: 'struct kbase_device' has no member named 'regulator_num'
    3151 |         kbdev->regulator_num = of_property_count_strings(kbdev->dev->of_node,
         |              ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3154:18: error: 'struct kbase_device' has no member named 'regulator_num'
    3154 |         if (kbdev->regulator_num > KBASE_MAX_REGULATORS) {
         |                  ^~
   In file included from include/linux/platform_device.h:14,
                    from drivers/gpu/arm/midgard/mali_kbase_linux.h:34,
                    from drivers/gpu/arm/midgard/mali_kbase.h:51,
                    from drivers/gpu/arm/midgard/mali_kbase_core_linux.c:23:
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3156:30: error: 'struct kbase_device' has no member named 'regulator_num'
    3156 |                         kbdev->regulator_num, KBASE_MAX_REGULATORS);
         |                              ^~
   include/linux/device.h:1418:39: note: in definition of macro 'dev_err'
    1418 |         _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3158:25: error: 'struct kbase_device' has no member named 'regulator_num'
    3158 |         } else if (kbdev->regulator_num == -EINVAL) {
         |                         ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3160:22: error: 'struct kbase_device' has no member named 'regulator_num'
    3160 |                 kbdev->regulator_num = 1;
         |                      ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3162:25: error: 'struct kbase_device' has no member named 'regulator_num'
    3162 |         } else if (kbdev->regulator_num < 0) {
         |                         ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3163:28: error: 'struct kbase_device' has no member named 'regulator_num'
    3163 |                 err = kbdev->regulator_num;
         |                            ^~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3167:58: error: 'struct kbase_device' has no member named 'regulator_num'
    3167 |                                                     kbdev->regulator_num);
         |                                                          ^~
>> drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3143:21: warning: unused variable 'reg_names' [-Wunused-variable]
    3143 |         const char *reg_names[KBASE_MAX_REGULATORS];
         |                     ^~~~~~~~~
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c: In function 'power_control_term':
   drivers/gpu/arm/midgard/mali_kbase_core_linux.c:3252:13: warning: unused variable 'i' [-Wunused-variable]
    3252 |         int i;
         |             ^
   In file included from drivers/gpu/arm/midgard/mali_kbase_defs.h:37,
                    from drivers/gpu/arm/midgard/mali_kbase.h:57:
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


vim +/reg_names +3143 drivers/gpu/arm/midgard/mali_kbase_core_linux.c

  3138	
  3139	static int power_control_init(struct platform_device *pdev)
  3140	{
  3141		struct kbase_device *kbdev = to_kbase_device(&pdev->dev);
  3142		int err = 0;
> 3143		const char *reg_names[KBASE_MAX_REGULATORS];
  3144	#if defined(CONFIG_REGULATOR)
  3145		int i;
  3146	#endif
  3147	
  3148		if (!kbdev)
  3149			return -ENODEV;
  3150	
  3151		kbdev->regulator_num = of_property_count_strings(kbdev->dev->of_node,
  3152			"supply-names");
  3153	
  3154		if (kbdev->regulator_num > KBASE_MAX_REGULATORS) {
  3155			dev_err(&pdev->dev, "Too many regulators: %d > %d\n",
  3156				kbdev->regulator_num, KBASE_MAX_REGULATORS);
  3157			return -EINVAL;
  3158		} else if (kbdev->regulator_num == -EINVAL) {
  3159			/* The 'supply-names' is optional; if not there assume "mali" */
  3160			kbdev->regulator_num = 1;
  3161			reg_names[0] = "mali";
  3162		} else if (kbdev->regulator_num < 0) {
  3163			err = kbdev->regulator_num;
  3164		} else {
  3165			err = of_property_read_string_array(kbdev->dev->of_node,
  3166							    "supply-names", reg_names,
  3167							    kbdev->regulator_num);
  3168		}
  3169	
  3170		if (err < 0) {
  3171			dev_err(&pdev->dev, "Error reading supply-names: %d\n", err);
  3172			return err;
  3173		}
  3174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
