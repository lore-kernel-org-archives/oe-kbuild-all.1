Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8271A08BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 16:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730390794; cv=none; b=QahT9NjWFqp67VkGGKCgpc/h6wFpm4kUe/+Lcqe20aEY6tSm/nUKEE3h09JMXCD/HXPfpuHYvUE7zK0hceR1yJyeondx7I6z4aRz9SmISFOJjiyIX7uILmvgPJHOmmK829T57VZGfw0Sy5GPK4e2HxjeZ1GiQs5MwbfYqHVrrCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730390794; c=relaxed/simple;
	bh=eBhWFw/I3KhN+ccNA0htgarW0BX1uQEn5iyQbZc4uTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YSGZ5Xe2hLLAKMa7WWMdRa60yrE30jUFPT40s9JJPgWnuAl48j/a5EfxSBXj1XZkc1rWijADboo+yw5xXNlcZZzWO3PyEE8Z49XuZQFWEzmorNlV3m7kj6/pljloC0ZNqlucO6G2G/QnmDbRC4hDl+EzKzpDYV2WR5vnOcMwQCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/cXKGzz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/cXKGzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730390792; x=1761926792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eBhWFw/I3KhN+ccNA0htgarW0BX1uQEn5iyQbZc4uTg=;
  b=c/cXKGzzZj/LASAFylp9LVGCAmPlG2oKAGF3kCdnfbTuRAd4nYMaqXy3
   F2u+o4RNdKXt+vwFy94Q0MiCm/QjzxeRuyE/phZN+wYUszgyZCev42aWt
   J0sM8oWwPCypcTTo2LO18SS6tQ/7qFIbIweChttBw6Q1vdcqjxLI4O7Jd
   B8/T3iOYGhnBeK3K385LQ8QtyrPq39TrfJjgFTrFEvQWHogeB8ACHJKN6
   Qt0dP4dfCHYFzt0RU0rAlxGE3Z81ROJT/wldusaIro8VHh2x8YbNqVjd3
   GMRH1661cS8YnVJlr48hR37SCvl+L77mdawROx+9aF+SBVSOZY7s2jLXV
   w==;
X-CSE-ConnectionGUID: fSO6cwspTI+Kfw4y6MX8tA==
X-CSE-MsgGUID: LFaY0IL9Te+jsiZdlpo3KA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30256804"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="30256804"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 09:05:39 -0700
X-CSE-ConnectionGUID: EwWmlgesRHy5PMcq8boFQQ==
X-CSE-MsgGUID: eQOvPl0XQLCUfqmzBxolog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="86601549"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Oct 2024 09:05:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Xfx-000gVK-1j;
	Thu, 31 Oct 2024 16:05:33 +0000
Date: Fri, 1 Nov 2024 00:05:17 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/cleanup 20/22] kernel/sched/rt.c:2643:35: error:
 'switched_from_rt' undeclared here (not in a function); did you mean
 'switched_to_rt'?
Message-ID: <202410312300.JsM54cxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/cleanup
head:   4e3feca600aeb6b6cee07822faf7d1a8aa0564b2
commit: 879c968b9feafb703c9b352fae0091b1c5b71bcc [20/22] sched: Fold sched_class::switch{ing,ed}_{to,from}() into the change pattern
config: sh-kfr2r09-romimage_defconfig (https://download.01.org/0day-ci/archive/20241031/202410312300.JsM54cxS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312300.JsM54cxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312300.JsM54cxS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/rt.c:2643:35: error: 'switched_from_rt' undeclared here (not in a function); did you mean 'switched_to_rt'?
    2643 |         .switched_from          = switched_from_rt,
         |                                   ^~~~~~~~~~~~~~~~
         |                                   switched_to_rt


vim +2643 kernel/sched/rt.c

  2638	
  2639		.task_tick		= task_tick_rt,
  2640	
  2641		.get_rr_interval	= get_rr_interval_rt,
  2642	
> 2643		.switched_from		= switched_from_rt,
  2644		.switched_to		= switched_to_rt,
  2645		.prio_changed		= prio_changed_rt,
  2646	
  2647		.update_curr		= update_curr_rt,
  2648	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
