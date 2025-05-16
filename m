Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CB278766
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747424484; cv=none; b=AhoAxDCpwEm48aAvGR9C74oDv8cAZfCvoTAv8L6HjUr119+jImFIzJEor53CXTs0J/xR4oCIjcvRj5yJIp6ry74o9fkWAtNmqQ2eXp8fSDvc7wzpWc6MpiE0kBmPqi6W4YsdPBu4N5b2XHHBUEQ3d18RDGSQEpXE99cPhslGEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747424484; c=relaxed/simple;
	bh=l7B+tKictOsAxjx957UHYk7byBm+8ycRPwp4hkU7nAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FB1zc11z7Gh9Azn4IfjoXetxJbMKheLUbHGtGzprOZHR0hZJtvLodDU4b/RZ9BEftJ2QH++3fO9NeKLipsaobtdJZCN7xpLS4IwpyQ5ys1E8BltSfSVNx1uzdMrgce72f+dez6fhK15lBOeSUsxJoZmFr/Tvk3X2Flmka9ZPCJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPcnEk5p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPcnEk5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747424483; x=1778960483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7B+tKictOsAxjx957UHYk7byBm+8ycRPwp4hkU7nAQ=;
  b=GPcnEk5pc77mo+36NV19y4cS5+oiyLoldr7j+0VHz//CGDvquWaHJiyr
   vmzQXy9vEcuCMuVVJOlQBLHmxDcsF/qciuPBz/zD1PYcTM9s+3usxRXK1
   NcD9lC7+H04re+Jnh6N7bHkk1MzVuT/EN15+d2S75Xu7GQYW7UhMahOrE
   xwDJOMMebqvu26oDJoIpr+j0q1IgaI6/hWI1h/zqZzJ0494eWgqYcagQ4
   PdQEF4irA4U8BawyNNkA2gnwY9k5+Gl1JXjXV2tBeMWr29RM2h8gqU0TK
   E8V3VDLoBop0JurCreoWz6gK2pSVcotYn9YaVXKwsDlNJi8OIKgD3Qx2b
   g==;
X-CSE-ConnectionGUID: WzLBnZdJTrKhbQZXrjPn4A==
X-CSE-MsgGUID: L7u7rE05TdCBMa6/R9ayoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49562942"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49562942"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 12:41:21 -0700
X-CSE-ConnectionGUID: 5ERlB0b5RLatGVWSGrnI3Q==
X-CSE-MsgGUID: 6ACFNGNOQYSyJji2Y1//PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="138692870"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 May 2025 12:41:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG0vl-000Jer-0Y;
	Fri, 16 May 2025 19:41:17 +0000
Date: Sat, 17 May 2025 03:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:rcu/dev 19/21] kernel/rcu/rcutorture.c:2170:37: error:
 'RCUTORTURE_RDR_UPDOWN' undeclared; did you mean 'RCUTORTURE_RDR_SCHED'?
Message-ID: <202505170301.yR3BHcuO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/dev
head:   ac05b397cb2b8e931f828cae460cd308845abe2e
commit: af97b7685824bfd505deafae81e88327cfea4951 [19/21] rcutorture: Check for no up/down readers at task level
config: arc-randconfig-002-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170301.yR3BHcuO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170301.yR3BHcuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170301.yR3BHcuO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:10,
                    from include/linux/kernel.h:31,
                    from kernel/rcu/rcutorture.c:16:
   kernel/rcu/rcutorture.c: In function 'rcutorture_loop_extend':
>> kernel/rcu/rcutorture.c:2170:37: error: 'RCUTORTURE_RDR_UPDOWN' undeclared (first use in this function); did you mean 'RCUTORTURE_RDR_SCHED'?
    2170 |                 WARN_ON_ONCE(mask & RCUTORTURE_RDR_UPDOWN);
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/rcutorture.c:2170:17: note: in expansion of macro 'WARN_ON_ONCE'
    2170 |                 WARN_ON_ONCE(mask & RCUTORTURE_RDR_UPDOWN);
         |                 ^~~~~~~~~~~~
   kernel/rcu/rcutorture.c:2170:37: note: each undeclared identifier is reported only once for each function it appears in
    2170 |                 WARN_ON_ONCE(mask & RCUTORTURE_RDR_UPDOWN);
         |                                     ^~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/rcutorture.c:2170:17: note: in expansion of macro 'WARN_ON_ONCE'
    2170 |                 WARN_ON_ONCE(mask & RCUTORTURE_RDR_UPDOWN);
         |                 ^~~~~~~~~~~~
   kernel/rcu/rcutorture.c: In function 'rcu_torture_one_read':
   kernel/rcu/rcutorture.c:2306:33: error: 'RCUTORTURE_RDR_UPDOWN' undeclared (first use in this function); did you mean 'RCUTORTURE_RDR_SCHED'?
    2306 |         WARN_ON_ONCE(newstate & RCUTORTURE_RDR_UPDOWN);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/rcu/rcutorture.c:2306:9: note: in expansion of macro 'WARN_ON_ONCE'
    2306 |         WARN_ON_ONCE(newstate & RCUTORTURE_RDR_UPDOWN);
         |         ^~~~~~~~~~~~


vim +2170 kernel/rcu/rcutorture.c

  2149	
  2150	/*
  2151	 * Do a randomly selected number of extensions of an existing RCU read-side
  2152	 * critical section.
  2153	 */
  2154	static struct rt_read_seg *
  2155	rcutorture_loop_extend(int *readstate, bool insoftirq, struct torture_random_state *trsp,
  2156			       struct rt_read_seg *rtrsp)
  2157	{
  2158		int i;
  2159		int j;
  2160		int mask = rcutorture_extend_mask_max();
  2161	
  2162		WARN_ON_ONCE(!*readstate); /* -Existing- RCU read-side critsect! */
  2163		if (!((mask - 1) & mask))
  2164			return rtrsp;  /* Current RCU reader not extendable. */
  2165		/* Bias towards larger numbers of loops. */
  2166		i = torture_random(trsp);
  2167		i = ((i | (i >> 3)) & RCUTORTURE_RDR_MAX_LOOPS) + 1;
  2168		for (j = 0; j < i; j++) {
  2169			mask = rcutorture_extend_mask(*readstate, trsp);
> 2170			WARN_ON_ONCE(mask & RCUTORTURE_RDR_UPDOWN);
  2171			rcutorture_one_extend(readstate, mask, insoftirq, trsp, &rtrsp[j]);
  2172		}
  2173		return &rtrsp[j];
  2174	}
  2175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
