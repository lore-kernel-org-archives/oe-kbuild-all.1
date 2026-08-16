Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409B636F8EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786867332; cv=none; b=Yb351LRfnNGfLl/SNKEVUZ395+dHFzzuJZ7XW2KHSMtTu7fdvVN6pSIs4DNG4RFaX9RUXywrJqVqa0LytQIW2JeI2kPy4CVZCGQYRr3ojXy24TDuoTaCD/ahDiHmxL+iQl0Jg4aYYs1qLDjnrkTSwcC0w8lcXl/y0SR8S3ulgqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786867332; c=relaxed/simple;
	bh=yKOZhF0ozKjlSEy5EQw1VGDCV5O3JGm6wMbgaZjrlDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RaI2hTELjq4C/UAPSSBgEJfVyuPBH8sEvAaVbsSfI2Auf8OrK9kREDsiXN9BzKrJxFxYhQUg/C1NwwgIRca62KWRAqkWA9jtZ1miESe34kcOpvO++/rDSNZ/7t7FxvCIOELnvtqo3fOZKV+uKrlovnios+BzvQVGfeEIl4R23Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNXlA5w6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNXlA5w6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786867330; x=1818403330;
  h=date:from:to:cc:subject:message-id;
  bh=yKOZhF0ozKjlSEy5EQw1VGDCV5O3JGm6wMbgaZjrlDI=;
  b=kNXlA5w6WBWGt2wGQKjrhi/LfOGyYp+WpxHLm56LjjgJ+RA9Vcvk3rW4
   W0BUeE537/0n/FIEHRObMzHE992fEXw5ngds/s8KxAwsTIECgAUGNNCeN
   aDyHMVPwPYhaOKXTiuMir88y0YGmTVI24sROKC7/WMLnEUt4qc3BhL8ok
   QalGonbHThOnydpx5gEGnYiZXFuk/DV7R/ZnKRm53TPPNSG/YQPPx0Csu
   MVFqlKEjRc7UjPUyTe22GBJMqhpfXbEcqPSyt7Uo5y2k+o5RxWOf/Z31S
   qQe1YsrCiwwkHbvB7O/71WvNw0u1ZMNZ4sIRIpzu3Ns7B9GV+m64iXXAT
   g==;
X-CSE-ConnectionGUID: MDR+mopuQY+E/Fvotxbe3Q==
X-CSE-MsgGUID: S8CG/fQHS46P9GCDiOVN5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87503320"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87503320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 01:02:08 -0700
X-CSE-ConnectionGUID: UU8scZwhSXi4dvEAI398ww==
X-CSE-MsgGUID: 5HjeCm2XRZeWMR3IY3hfDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="261980387"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Aug 2026 01:02:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvVoh-00000000coc-3Kdu;
	Sun, 16 Aug 2026 08:02:03 +0000
Date: Sun, 16 Aug 2026 16:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Subject: [linux-next:master 11959/15435]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:3073
 smu_v13_0_0_set_ppt_limit() warn: inconsistent indenting
Message-ID: <202608161557.IjVTb9fD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 6c9e0328d1dee58cd2ebbcc34b43eefc342d6d62 [11959/15435] drm/amd/pm: refactor PPT limits by controller and power source
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260816/202608161557.IjVTb9fD-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161557.IjVTb9fD-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:3073 smu_v13_0_0_set_ppt_limit() warn: inconsistent indenting

vim +3073 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c

  3041	
  3042	static int smu_v13_0_0_set_ppt_limit(struct smu_context *smu,
  3043					     enum smu_ppt_limit_type limit_type,
  3044					     uint32_t limit)
  3045	{
  3046		PPTable_t *pptable = smu->smu_table.driver_pptable;
  3047		SkuTable_t *skutable = &pptable->SkuTable;
  3048		uint32_t msg_limit = skutable->MsgLimits.Power[PPT_THROTTLER_PPT0][POWER_SOURCE_AC];
  3049		struct smu_table_context *table_context = &smu->smu_table;
  3050		OverDriveTableExternal_t *od_table =
  3051			(OverDriveTableExternal_t *)table_context->overdrive_table;
  3052		uint32_t current_limit;
  3053		int ret = 0;
  3054	
  3055		if (limit_type != SMU_PPT_LIMIT_PPT0)
  3056			return -EINVAL;
  3057	
  3058		ret = smu_v13_0_0_get_ppt_limit(smu, limit_type, &current_limit);
  3059		if (ret)
  3060			return ret;
  3061	
  3062		if (limit <= msg_limit) {
  3063			if (current_limit > msg_limit) {
  3064				od_table->OverDriveTable.Ppt = 0;
  3065				od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_PPT_BIT;
  3066	
  3067				ret = smu_v13_0_0_upload_overdrive_table(smu, od_table);
  3068				if (ret) {
  3069					dev_err(smu->adev->dev, "Failed to upload overdrive table!\n");
  3070					return ret;
  3071				}
  3072			}
> 3073				return smu_v13_0_set_ppt_limit(smu, limit_type, limit);
  3074		} else if (smu->od_enabled) {
  3075			ret = smu_v13_0_set_ppt_limit(smu, limit_type, msg_limit);
  3076			if (ret)
  3077				return ret;
  3078	
  3079			od_table->OverDriveTable.Ppt = (limit * 100) / msg_limit - 100;
  3080			od_table->OverDriveTable.FeatureCtrlMask |= 1U << PP_OD_FEATURE_PPT_BIT;
  3081	
  3082			ret = smu_v13_0_0_upload_overdrive_table(smu, od_table);
  3083			if (ret) {
  3084			  dev_err(smu->adev->dev, "Failed to upload overdrive table!\n");
  3085			  return ret;
  3086			}
  3087	
  3088		} else {
  3089			return -EINVAL;
  3090		}
  3091	
  3092		return 0;
  3093	}
  3094	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
