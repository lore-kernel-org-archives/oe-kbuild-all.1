Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C793B27DC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 12:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007101; cv=none; b=H+rr3jML+4F6r4W0oNsgRKBVIORd/nqemO9rgLKDNy2u4b1857KuoQpRFyZfuAon37WbDLE2QYEPBoMpHDGD3f2+VFsRsUwIzlpW2/zZ6ZFCOIJG1CuqC0p3uG+zRx8JI8gxfXjEnglxQa2bH+69vFkTiHHnOAjYLq8fVZLa264=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007101; c=relaxed/simple;
	bh=svRuFvqxtiY2R2ACPcXoHyqvyY6k6dkOC8LlL0cSeN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R1sU4z7pKVhQoW2ezrbrE7c7x6SoNPVVhQdf/PZmCsBh0x3MwHkUt9GFTQtBGGFd/7cQKva2KSkets3cMzM+oc9xCc52UhCuAJXnqoh3KtqlO1LI/ljWocZ545pM5noZ5bzX2PRd4+2xD+qwDWeE+YdJQkAfZ1C8tutZAhrsW6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrmlQnYA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrmlQnYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781007100; x=1812543100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=svRuFvqxtiY2R2ACPcXoHyqvyY6k6dkOC8LlL0cSeN8=;
  b=LrmlQnYAX9LBcu6rCaIKwYdZl4P1uTVKaQ9zzYyuseRaaqm+4MjUy65p
   kygEWCTxwGV3z3+e21wr8h1xvtjF3Vr10mMhWNccaVpOtIyYUTmq5aR1z
   x84gTqW0+gd/jyvmLLfcCPLiPc656IEbRTNYilo+97T4+fS4dlK+S6MDe
   JCI6uq+j93912yWo54pVdIWyvulq0bjbgd9J0Sj4PybVYKvnUCkz8vyD8
   YHTjZkVLDKTcH0d7LbFF6joqulo6QQO21o0P5cqf82xZ7LWRneczSKQzL
   WzFTeKM/hS9umzte/Rt2Vd3bYl36IkzfNTC2wc3n+o/wMYsW6O1o8zRzw
   w==;
X-CSE-ConnectionGUID: UrIuswtqTcGmVCIBWPTWmA==
X-CSE-MsgGUID: U8wh7tTBQG+u0iRxyvO/Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99181906"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="99181906"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 05:11:40 -0700
X-CSE-ConnectionGUID: AZp+hCzwRwOBYXqsPBa3yw==
X-CSE-MsgGUID: 9q/WlPReTROIUzfl+axgNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245941724"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jun 2026 05:11:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWvIt-00000000Jzp-1KJV;
	Tue, 09 Jun 2026 12:11:35 +0000
Date: Tue, 09 Jun 2026 20:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 32/52]
 kernel/time/hrtimer.c:599:27: error: implicit declaration of function
 'hrtimer_time_to_monotonic'
Message-ID: <202606092006.deELhSAv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   bca5a81b57571c48bb81e7225cb1e4248f98b346
commit: 7a200ad6980105f50270ca602d25d2960bfd63f6 [32/52] helper
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260609/202606092006.deELhSAv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606092006.deELhSAv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606092006.deELhSAv-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function 'hrtimer_bases_first':
>> kernel/time/hrtimer.c:599:27: error: implicit declaration of function 'hrtimer_time_to_monotonic' [-Wimplicit-function-declaration]
     599 |                 expires = hrtimer_time_to_monotonic(base, base->expires_next);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hrtimer_time_to_monotonic +599 kernel/time/hrtimer.c

   590	
   591	/* Find the base with the earliest expiry */
   592	static void hrtimer_bases_first(struct hrtimer_cpu_base *cpu_base,unsigned int active,
   593					ktime_t *expires_next, struct hrtimer **next_timer)
   594	{
   595		struct hrtimer_clock_base *base;
   596		ktime_t expires;
   597	
   598		for_each_active_base(base, cpu_base, active) {
 > 599			expires = hrtimer_time_to_monotonic(base, base->expires_next);
   600			if (expires < *expires_next) {
   601				*expires_next = expires;
   602				*next_timer = clock_base_next_timer(base);
   603			}
   604		}
   605	}
   606	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
