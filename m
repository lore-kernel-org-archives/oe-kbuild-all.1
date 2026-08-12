Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16FB42CB14
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533253; cv=none; b=c1CnkwjSGui9ip2GCmGzKafEdj5wLoEPfqXbT+BY2BuBGdAVAhJW9YpOnua8JWSKZw/a6KJeurPFIr7CW2CijkuSFen6dVcQEn/e/+bMprkLyplCDLJ7xPU2FMmymFbYFsZhnQl04bACsI0KTdRYaSPRGWCick3r+4YNOBtsXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533253; c=relaxed/simple;
	bh=/CbOr7QTUF+PKeQtRsxeDr0/xkRd/aqvOz1tBrEaVXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=acX3WH5NnPJAVA0ZUpxH88t3OapxZuzSP6SEfSOjwGoBo6qD2YGflPoypaGU2Xydne3FglFR39gMRGP/Vo/QpvW6SIe2cUulidsXxcbCUKpSs5XoQSIG2c0geptECocTxSnbqxA29fMmwyViFuc2gdJsjhGjYewytVKRjWj9ALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0t3xLhB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0t3xLhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786533252; x=1818069252;
  h=date:from:to:cc:subject:message-id;
  bh=/CbOr7QTUF+PKeQtRsxeDr0/xkRd/aqvOz1tBrEaVXQ=;
  b=D0t3xLhBoOyXcZcXEQ32Nha8qDIBPDQ/r52kpu6qjjppBWhkb28TH6Ik
   A+S0KLcfnMpCpUL3k8Cj/CJWrce2+OUmF/zxoKMJsUF5sXNWJWQbZIdRp
   G2SCLslXkaKFOlIT3Cmhq0oCkKLhqJb6QucOpLW2X+5/CkuT4F8qFbpQa
   OAUuEmtpukpFnGcJxpmeyfssFpvS1SyyLnGTwIh9mZ1wOFbMH1z9LtADF
   rfN1UWeSUW4Tge2SJlO7+/RIBUE2QLcsnesI0ppAODf/AX9X1ChxAzV5a
   qOuu412oea2oPyRPW4tLa9H5XNi8csKYQmvt7ofoLITgfkGsODjlsYfEq
   w==;
X-CSE-ConnectionGUID: xUpmOnKeR1+4quWEmU5+PQ==
X-CSE-MsgGUID: t0hq465DT0GvDSI8HUaQWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98597150"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="98597150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 04:14:10 -0700
X-CSE-ConnectionGUID: x7k8BVK7TU62ORqrzhLVKg==
X-CSE-MsgGUID: uI/+CbsGSCatYyoHgwoZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="262309504"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Aug 2026 04:14:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu6uL-00000000QSI-3U7N;
	Wed, 12 Aug 2026 11:14:05 +0000
Date: Wed, 12 Aug 2026 19:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Subject: [agd5f:drm-next-7.3 222/308]
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:3073
 smu_v13_0_0_set_ppt_limit() warn: inconsistent indenting
Message-ID: <202608121942.wUjTbLtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.3
head:   daaeec235e46b45a0dbd4facfb275cc43022028d
commit: 6c9e0328d1dee58cd2ebbcc34b43eefc342d6d62 [222/308] drm/amd/pm: refactor PPT limits by controller and power source
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260812/202608121942.wUjTbLtn-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121942.wUjTbLtn-lkp@intel.com/

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
