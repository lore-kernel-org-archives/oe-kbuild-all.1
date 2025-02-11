Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127F27291F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 23:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739316863; cv=none; b=tngC8NwBzkB1RYNmLEoG13mIrW4OqFwiMqMPw3E1ddACZAopNLkl6DE5WG5S+GclIGb+TwgElttIeIW9oY73pnrs91FXv0rwLkmbiGZIN8iOlaDsdfKkQ3+WO5CKRFCUFOoAFi1VAFCespmVKiB23WlbT30n8NSDhS/cqDJsxnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739316863; c=relaxed/simple;
	bh=K8/odiG2Gw4uZ3VGvaaLKD+pHvtesDsNb/eVKeEB2fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ax83vanTBBkv8ofD5H48qnnyEX7Y4w9vu5XM9eJsD/qMbJ2BZx8/me6+DB+FscDpw5ChI15qWTUrCWOmitTsDauvHMHU16ZKwQBKUtg3rgT/JsSnG1rj+weq51+Q45tUeTplasoC2B1dwHcqmFbnxyiuRKpYzFZljnjY+Rc9g0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXxiKk7L; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXxiKk7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739316862; x=1770852862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8/odiG2Gw4uZ3VGvaaLKD+pHvtesDsNb/eVKeEB2fo=;
  b=TXxiKk7LYn4lSeV+t0kAaByQy6mWjKkrPpS7RNmrzuI2ew2ts+8HQafy
   Ima2YsUKdIZSrMVMtP8V+y/UYmdAU7+qb6ZFS69+nYN6nZTF1t8ZgdwgI
   IiAvPSy3xPYFEXDmjvOD23FVMnB+amkOXPAvwwXqaULtWkvJPC5JB5R7k
   5ZbxQHTnIjRadv7oXyHx4aPPZe9/MQ7MCQd98rQYgNjf5D4quGgulpTub
   z3MV9ZoIgUpAQkiqux9MaCs0E1G/yaA23XYoOYhkVv3LBe0IDqLNcv/aa
   9KW2DwVleMzzMP8yn/ShIrY2Hy8+R/jD8SDRTwAWkK7nt48gT8BEbbM9H
   g==;
X-CSE-ConnectionGUID: Zo4XrVHcQrKy4HqXTAa6Nw==
X-CSE-MsgGUID: 4PVAnYeMQBS3GenAtf3JBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57492405"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57492405"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 15:34:21 -0800
X-CSE-ConnectionGUID: JhRyrZtNRp6IpxAgW2aAfA==
X-CSE-MsgGUID: ftQj3r6dTEq15MLp7kAApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="143499677"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 15:34:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thzlh-0014pr-2W;
	Tue, 11 Feb 2025 23:34:17 +0000
Date: Wed, 12 Feb 2025 07:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 229/229]
 drivers/gpu/drm/mediatek/mtk_dp_v2.c:5324:3: error: call to undeclared
 function 'mtk_dp_suspend_v2'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502120715.k0xHkKTw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   69fc64873274f4b1c5a6c4617cc39b8d59fafbdf
commit: 8fd26707ff2ec98f3a31cafc54c74a1399171b24 [229/229] CHROMIUM: drm/mediatek: Add dp and dp_intf base
config: arm64-randconfig-003-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120715.k0xHkKTw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120715.k0xHkKTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120715.k0xHkKTw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dp_v2.c:3370:5: warning: variable 'data' set but not used [-Wunused-but-set-variable]
           u8 data;
              ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:4285:36: warning: variable 'state' set but not used [-Wunused-but-set-variable]
           struct drm_dp_mst_topology_state *state;
                                             ^
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:5324:3: error: call to undeclared function 'mtk_dp_suspend_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_suspend_v2(dev);
                   ^
>> drivers/gpu/drm/mediatek/mtk_dp_v2.c:5327:3: error: call to undeclared function 'mtk_dp_resume_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   mtk_dp_resume_v2(dev);
                   ^
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:5327:3: note: did you mean 'mtk_dp_read_v2'?
   drivers/gpu/drm/mediatek/mtk_dp_v2.c:315:5: note: 'mtk_dp_read_v2' declared here
   u32 mtk_dp_read_v2(struct mtk_dp *mtk_dp, u32 offset)
       ^
   2 warnings and 2 errors generated.


vim +/mtk_dp_suspend_v2 +5324 drivers/gpu/drm/mediatek/mtk_dp_v2.c

  5311	
  5312	static int mtk_drm_dp_notifier_v2(struct notifier_block *notifier,
  5313				       unsigned long pm_event, void *unused)
  5314	{
  5315		struct mtk_dp *mtk_dp = container_of(notifier, struct mtk_dp, notifier);
  5316		struct device *dev = mtk_dp->dev;
  5317	
  5318		dev_dbg(mtk_dp->dev, "%s pm_event %lu dev %s usage_count %d nb priority %d\n",
  5319			__func__, pm_event, dev_name(dev), atomic_read(&dev->power.usage_count),
  5320			notifier->priority);
  5321	
  5322		switch (pm_event) {
  5323		case PM_SUSPEND_PREPARE:
> 5324			mtk_dp_suspend_v2(dev);
  5325			return NOTIFY_OK;
  5326		case PM_POST_SUSPEND:
> 5327			mtk_dp_resume_v2(dev);
  5328			return NOTIFY_OK;
  5329		}
  5330		return NOTIFY_DONE;
  5331	}
  5332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
