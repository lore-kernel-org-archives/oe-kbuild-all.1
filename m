Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A641C7013
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 23:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758928349; cv=none; b=LhCTKl0xi37FXSNg4cYd1xep3jrK0jEfl5wNr2Gka6Vg9tMAeIKd+mCmKv5ty4lqEikcOIOCZvVVRbdu1/pmY1egiOo8lU9fXEhs1gtbhWu+YHno5Q56I8kS+YJ5/qjBheyG1W5983u0iNkgVzuvzvR551ig8IPMB4P1E8HKiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758928349; c=relaxed/simple;
	bh=4tcJm8c5r631dSIc6Cv08blkgrGZGZelSKluZ+n9l/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ctryqyGrkdJ8X7M+iRk/Y3stB8MhWG9XQOhHCdT8eWM9OQNj1gZ/gKB1DF2JRk9tUkax0XqvD77d4xgGJt55w0DnduXGts3LOz+R9e7IipiwcDvafnG5DysFDaBMn/W4dzXrgJt02aIV03Mvw60bocivUQ9LbHZnVlKHNOQ9cIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iR0yZBMq; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iR0yZBMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758928348; x=1790464348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4tcJm8c5r631dSIc6Cv08blkgrGZGZelSKluZ+n9l/k=;
  b=iR0yZBMq5AjDJbbyh9ambPxWBrGicXb/0+Bi+I29FW9biCUIWLlF+0Dn
   /1yc7Z6pKZNJ72JEg9RN442l7JyV7grtzT19SkC8IlJUtSEsts/8aj+/s
   E+Ix5NA4OaOtygKU0RX7BFxeYK6p5jnseWAxc0sQYkluxYEFmJ/q0iCKm
   mMpytXG7L4gy/N5MQn4UIOS4TyVsS8+HhUzaxlGouIWt/TJ96pdJjcJ0L
   is3NS+j9/+biMHEVEsSVvAiDmnTeLyaQX+QwgVXrFvHnmkPk4/bBGHX1m
   Ut3mxzI6RHELk6PwEukrtsuz61o+X1ycDgo3ckFl713jvOPY69G5fChAa
   Q==;
X-CSE-ConnectionGUID: jPUAvYHwQ52D4Rr24M1IJg==
X-CSE-MsgGUID: E9IeC1nCQ6GgoXeP1gpgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60476295"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="60476295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 16:12:27 -0700
X-CSE-ConnectionGUID: aCXPSXhaRt2wuFgesT1wwA==
X-CSE-MsgGUID: eLQYUaEtQw6/mFhdVCQXdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="177005697"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 26 Sep 2025 16:12:26 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2Hbz-0006el-1b;
	Fri, 26 Sep 2025 23:12:23 +0000
Date: Sat, 27 Sep 2025 07:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2947/2947]
 drivers/platform/mpam/mpam_devices.c:1276:2: warning: unannotated
 fall-through between switch labels
Message-ID: <202509270718.sknQhwd3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a069154a5b505dae14e18b3d12771757eef2e07f
commit: a26ee3d2d87a76c319663c2c3f05f02cbd06738b [2947/2947] arm64/mpam: Update MB hardlimit and priority default value forcely
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250927/202509270718.sknQhwd3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270718.sknQhwd3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270718.sknQhwd3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/mpam/mpam_devices.c:1276:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1276 |         default:
         |         ^
   drivers/platform/mpam/mpam_devices.c:1276:2: note: insert 'break;' to avoid fall-through
    1276 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +1276 drivers/platform/mpam/mpam_devices.c

  1260	
  1261	static u16 mpam_intpri_default_val(struct mpam_msc_ris *ris)
  1262	{
  1263		struct mpam_class *class = ris->comp->class;
  1264	
  1265		switch (class->type) {
  1266		case MPAM_CLASS_MEMORY:
  1267			return resctrl_arch_get_resource(RDT_RESOURCE_MB_PRI)->default_ctrl;
  1268	
  1269		case MPAM_CLASS_CACHE:
  1270			if (class->level == 3)
  1271				return resctrl_arch_get_resource(RDT_RESOURCE_L3_PRI)->default_ctrl;
  1272	
  1273			if (class->level == 2)
  1274				return resctrl_arch_get_resource(RDT_RESOURCE_L2_PRI)->default_ctrl;
  1275	
> 1276		default:
  1277			break;
  1278		}
  1279	
  1280		if (mpam_has_feature(mpam_feat_intpri_part_0_low, &ris->props))
  1281			return GENMASK(ris->props.intpri_wd - 1, 0);
  1282	
  1283		return 0;
  1284	}
  1285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
