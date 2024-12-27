Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544AD1F5435
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735330179; cv=none; b=Btzq3M7e6NkBhP4FTezWRXBwvA5g0VUJPwrfWK/vfumzf7AeHwHaY24yA8Lq3ZNKjU/o2rH1La+JzWedM29fOpE+OFOo3sl+hBPbskEdmEke3Ofx15VISj8H5HYClkqlkVjqrMzjkiE7rO6avGifVAW2lkqSV5lP7quXuWGUvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735330179; c=relaxed/simple;
	bh=2eKttIT78WFboB9PsdQ4eucYx+gRQZaBkqyE+ZHstCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0g2aAF99lXMbhbZe7SRNrPXT8K70mBpqJpQmgryFKd+wKsb0XIerWLH0GEzeqcXIpZc0hSdGH/3cjxMlEg2qnV93gJnxQlj/1CPi/mFxqaYWJzlVpFST0VoBW95olKiDtqAgNbh4NuhRQWXUI0Go1mOkvxQoQuR243IHUBdJJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UywJ8+cP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UywJ8+cP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735330178; x=1766866178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2eKttIT78WFboB9PsdQ4eucYx+gRQZaBkqyE+ZHstCs=;
  b=UywJ8+cP79sOj51Digg6EXMl/itBOtJSnC/cKivgFmr6NA0/Ms8bFDZf
   7Hx99AhtYdOwUVaPX4+goJQecylMTsulH3jHKIqp6qLyUfTTLw68LirUT
   qKrB/O/9NwYEeApsIbq1zo4c344XsNjl/9u8TTAAqSd3AiXPOQD2JSa8s
   5emioDz6wPS7JJqXkMpgMrJ8oSZ1OlkyBIWp8BtD3T9CSiKfwpCFLkv5n
   H/naaK78LWcO4B5h6lfZKm6UG484uepFSE5fIu+qoucwKiiVBCocnP/Tw
   46UsjUCHUOfDAWmOeqZ7Ll6XvPxNPfbwsoiUUOYj3lzlACMJmTtgvoKai
   w==;
X-CSE-ConnectionGUID: ju7Mx2nNTzCANUmmcveHjQ==
X-CSE-MsgGUID: 3kY/boXiS/WPXeL1xifGcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35606976"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35606976"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 12:09:37 -0800
X-CSE-ConnectionGUID: O9JCCp0fSDSXXwsBDlml/A==
X-CSE-MsgGUID: g18OgrThSU64iNzPQ5zNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100068850"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Dec 2024 12:09:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRGeL-0003Ys-1q;
	Fri, 27 Dec 2024 20:09:33 +0000
Date: Sat, 28 Dec 2024 04:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2597/2597] kernel/watchdog_hld.c:502:12: sparse:
 sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it
 be static?
Message-ID: <202412280324.woXn0RU1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 364de98eacea8dbfe4f926f62085aebf8534f403 [2597/2597] watchdog: Fix sleeping function called from atomic context
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241228/202412280324.woXn0RU1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280324.woXn0RU1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280324.woXn0RU1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/watchdog_hld.c:502:12: sparse: sparse: symbol '__hardlockup_detector_perf_init' was not declared. Should it be static?

vim +/__hardlockup_detector_perf_init +502 kernel/watchdog_hld.c

   501	
 > 502	int __init __hardlockup_detector_perf_init(void *not_used)
   503	{
   504		int ret = hardlockup_detector_event_create();
   505	
   506		if (ret) {
   507			pr_info("Perf NMI watchdog permanently disabled\n");
   508		} else {
   509			perf_event_release_kernel(this_cpu_read(watchdog_ev));
   510			this_cpu_write(watchdog_ev, NULL);
   511		}
   512		return ret;
   513	}
   514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
