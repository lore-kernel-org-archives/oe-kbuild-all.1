Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C60347BD9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 20:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784923381; cv=none; b=gJWam/LSmpyKSz1cXt7lxjbB3IcMFn2wheUXmnA3m/XinLq+w39UUaZ812DKW9NNIDrzp7iY1W4jfua1aslPZF9D2wfhK5TpLmtVGeeje8UvYno6lMpzm9RIb4PUwkkIXoh3sbbPEfXK8ira0tiqTCA+4MXPMwYOWbeW/Nw7qog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784923381; c=relaxed/simple;
	bh=oMI8wxaBt0bxu0zAQmd+EEDC1gVNQVVJP4w4VIbIF7E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IQapBwxatR+uFnW6lhvxgnwEF/2TPk8PWKPu4HuKvK4HMy7as1tNTnbWbBLqfgJDJXr6W0fbcSNSDW01c6l4xpjC6IZGcLm/zAWatrtepp4g2uRkykMxQjilmDk58e1S/AytWwzNmIbO/InRWVJPS3bfUCzWUc+oQ268O2s1jvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJPEw0fm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJPEw0fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784923380; x=1816459380;
  h=date:from:to:cc:subject:message-id;
  bh=oMI8wxaBt0bxu0zAQmd+EEDC1gVNQVVJP4w4VIbIF7E=;
  b=PJPEw0fmfRzJeLEt+UOZKcF/GeTtkSttcmlfedKnMvRD76tULX3ZgV0r
   qb8f5ob+czyW/PUxn4nKfqVL7EZg3W44EI/z7bYwQcsieAq6P5iAU7FQq
   zFs8g9wdqUCZ8849EK6KG9y4krAyOz8hj80jZkoHcR41G8c3UvtcjrDJ6
   SwIWDdiAkyfb9EgoGNRiFFAtEJECvb4rbkGSq7rlEbVBba7KAUhZzxUv/
   lTmdhK0yWntHfg3G04lzRn+7FdkSd49nnoS1nQDNLo5wHOV9OtXPt5uch
   MbrvctanPq5bhNFPYz+jjzn10wjynYU2WXiUC8o+Rs+k/m8tnz5SgqWQ5
   g==;
X-CSE-ConnectionGUID: RXI/o3m5QYu0ShCW9/Ooyg==
X-CSE-MsgGUID: kx2k4boUQHW8PoHtpc28UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85682743"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85682743"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 13:02:59 -0700
X-CSE-ConnectionGUID: UDzxJt7JTAKP10PSi73DpQ==
X-CSE-MsgGUID: RUL7DfYLSOyO3MN8J6h/UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="262310904"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Jul 2026 13:02:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnM6f-00000000bBT-0TtR;
	Fri, 24 Jul 2026 20:02:54 +0000
Date: Sat, 25 Jul 2026 04:02:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>
Subject: 
 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c:649
 smu_v15_0_common_get_dpm_freq_by_index() warn: inconsistent indenting
Message-ID: <202607250345.Zy05fZdR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: c7fc0f372374cf463be2ba4b5b21c20c3c051bb6 drm/amd: Enable SMU 15_0_0 support
date:   7 months ago
config: x86_64-randconfig-161-20260723 (https://download.01.org/0day-ci/archive/20260725/202607250345.Zy05fZdR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c7fc0f372374 ("drm/amd: Enable SMU 15_0_0 support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250345.Zy05fZdR-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c:649 smu_v15_0_common_get_dpm_freq_by_index() warn: inconsistent indenting

vim +649 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu15/smu_v15_0_0_ppt.c

   641	
   642	static int smu_v15_0_common_get_dpm_freq_by_index(struct smu_context *smu,
   643							enum smu_clk_type clk_type,
   644							uint32_t dpm_level,
   645							uint32_t *freq)
   646	{
   647			smu_v15_0_0_get_dpm_freq_by_index(smu, clk_type, dpm_level, freq);
   648	
 > 649		return 0;
   650	}
   651	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
