Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20CC17E46E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 22:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729376947; cv=none; b=cn0zrVxxUHZNdjuiLJpC1lWomi3Z18/gyhieJvcuMaXS4E/hQQpL24KxXkKgcGjxvEG7OewgzxSt3MJb5cDBsCaQ+KY8rwLe2tSuVCfetmhJNCZ7FYI6n9TmViJxtL4K8ickHqlySRUlgpI9MaY1Gb7pc8n/dgcDAFg6L6ubEjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729376947; c=relaxed/simple;
	bh=E7++Qu5qce6OcgP6vsLp72Nsyv2wrPmKPkfUgM9e9+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bh4w5MScgpwTYPU4J3763EckC6A6Pfi6uMNoPKTkVqBLDWW8Tkx1aa5MwD9xn/11g9cG0bo6uXg9vKOKo3FcVm/h4Qa7NNCi2YddxFHnQvx8FvHR8ehOSi86OuWLQQrzkBepOlYFBBGRgBZC2/lW5HZazCDJjRl9t1eUUiWdjI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gw3BMRZk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gw3BMRZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729376945; x=1760912945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7++Qu5qce6OcgP6vsLp72Nsyv2wrPmKPkfUgM9e9+o=;
  b=gw3BMRZki+ofgF84HBI8ipdbMihNcJdFclFcl5+YON5ZfvGEEoGpR4f1
   UUZ/P5qobzpJyUejeTflWpaCI4T3N6tCWH1qi3Uj8AnVRobI6/U06xNiF
   XpvBET8IR44x+wSoMcRjS3d/+Ti32BjL5aHQfhomFlLAqBON50iLuHmtM
   vCMVizz7qya46wwnWqRWJTIEql5r50jxHtPlS4HPz9KYH5NpSYXPDDLD1
   m7fRk2pb7Qu+4623vtoNBDWf072T/GCEi2BkURJIeE/aJv4TLUHm39PUX
   50CdZJOvIIIcBtr9+LnBLLY1qdOjcSMtKmrAoHgkQqT9meSzYzCXJkGZ4
   w==;
X-CSE-ConnectionGUID: JmZvQPhVSAOyLy81nNT6BQ==
X-CSE-MsgGUID: 4anQqpG5Qk2cv0f82RuLlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29003711"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29003711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 15:29:04 -0700
X-CSE-ConnectionGUID: QmazLZHKTimNHV3kUhwfaA==
X-CSE-MsgGUID: CUUgLbWMQTud3klFS5FG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="83963290"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Oct 2024 15:29:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2HwT-000Pc9-0d;
	Sat, 19 Oct 2024 22:29:01 +0000
Date: Sun, 20 Oct 2024 06:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-10 18273/18276]
 mm/page_size_compat.c:326:2: error: use of undeclared identifier
 'sysctl_perf_event_mlock'
Message-ID: <202410200601.d67Jo5ct-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-10
head:   8adecb593e9b745427da9d61c3cc8bc4857de209
commit: 90ffbf64df06674ed84c7b8a7016c02cd8ca0016 [18273/18276] ANDROID: 16K: Fixup perf_mmap check for metadata page
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241020/202410200601.d67Jo5ct-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410200601.d67Jo5ct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410200601.d67Jo5ct-lkp@intel.com/

Note: the android-common/android15-6.6-2024-10 HEAD 8adecb593e9b745427da9d61c3cc8bc4857de209 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from mm/page_size_compat.c:12:
   In file included from include/linux/mm.h:2234:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/page_size_compat.c:326:2: error: use of undeclared identifier 'sysctl_perf_event_mlock'
     326 |         sysctl_perf_event_mlock = 512 + (__PAGE_SIZE / 1024); /* 'free' kiB per user */
         |         ^
   1 warning and 1 error generated.


vim +/sysctl_perf_event_mlock +326 mm/page_size_compat.c

   319	
   320	static int __init init_sysctl_perf_event_mlock(void)
   321	{
   322		if (!static_branch_unlikely(&page_shift_compat_enabled))
   323			return 0;
   324	
   325		/* Minimum for 512 kiB + 1 user control page */
 > 326		sysctl_perf_event_mlock = 512 + (__PAGE_SIZE / 1024); /* 'free' kiB per user */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
