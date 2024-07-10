Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070D23BBD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720583947; cv=none; b=gDv2OvOcFYFB7S46NG4NluoyacjjOZzRjNhPB8mcCvZ2N3XiaLSTihev02m26XrCELZENsStyFyVOuuFtREq13g5Yb3jNhTJKCBBhh47rPIOJ124eqjbhGwfnRs87HHI6PMQKOFUI3NdKSspW8MkR1iQF2iwtR9yvVXflcuOWDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720583947; c=relaxed/simple;
	bh=3kLjoZ8sSQ0/8h+BBG+jv7IwapBuzTW8LAxaDJ0zndM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FB2hPy3gN+J7gsMTTmjaO1seJXNujM5D+0f3OygrmRDye2prA5pxSBL6wEgeTi4wJw5Uo7cuBr09giYlxkKWOjCuyncDywOfihgvKivW5+4XiXGCHYuDqfzi2Uuvh+kRkou2A67LGN5XTI6dFv7hJmBAsHjm8VFQeu4psvVKk1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIv0K/7+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIv0K/7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720583945; x=1752119945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kLjoZ8sSQ0/8h+BBG+jv7IwapBuzTW8LAxaDJ0zndM=;
  b=OIv0K/7+546SdWPFR7i9XAZQeBvmIqDay/hhTean1iZA+3nQvVcjLci9
   UB7m8olBj5kx/G0zKMh0zMseIRsT08T8AJNiDGxJJC/ntNFslpvW34PbX
   GJ+QaSojrXPARzx4LdITiDaSEfJ6YUyy6tYTh7cYLUxCs6OyNBiCWqd7n
   pgfaKX+M+MwXJtjnVTBytyShIFWxAPkJMQuQEaf3mH+H/zOtmKpXIJrbT
   NAsySi0oAUWEWKEbNwOpS/s6D41l5EEhtZv37+3iMkHCAY2h0MbSNnDOX
   81v1H8B2n+dk000uFpSizRw5PWZhhEWHWVc7YlQKPFzYl6q+ZHqz1pOHS
   A==;
X-CSE-ConnectionGUID: 2wIVfOHfT0K9R84i06uaXw==
X-CSE-MsgGUID: NalXhrXDQaKfNLzUyB6vTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="43300448"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="43300448"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 20:59:04 -0700
X-CSE-ConnectionGUID: Bauc+iQYRC2mlpiZEuSf7g==
X-CSE-MsgGUID: PQkpcupKSESedVvLGloCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; 
   d="scan'208";a="48067090"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2024 20:59:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sROTt-000XQk-16;
	Wed, 10 Jul 2024 03:59:01 +0000
Date: Wed, 10 Jul 2024 11:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 7/12] kernel/events/uprobes.c:2153:26:
 error: 'struct uprobe' has no member named 'register_rwsem'; did you mean
 'register_mutex'?
Message-ID: <202407101158.fhXDe0E8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   73ff94f5e22f2853e1595f9781995b5c3990065c
commit: 672488bd391cab9b2bb22d3ba6b05cc80566f0c8 [7/12] perf/uprobe: SRCU-ify uprobe->consumer list
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240710/202407101158.fhXDe0E8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101158.fhXDe0E8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407101158.fhXDe0E8-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/events/uprobes.c: In function 'handler_chain':
>> kernel/events/uprobes.c:2153:26: error: 'struct uprobe' has no member named 'register_rwsem'; did you mean 'register_mutex'?
    2153 |         up_read(&uprobe->register_rwsem);
         |                          ^~~~~~~~~~~~~~
         |                          register_mutex


vim +2153 kernel/events/uprobes.c

3a9ea0520f38def Oleg Nesterov  2012-05-29  2107  
672488bd391cab9 Peter Zijlstra 2024-07-05  2108  #define for_each_consumer_rcu(pos, head) \
672488bd391cab9 Peter Zijlstra 2024-07-05  2109  	for (pos = rcu_dereference_raw(head); pos; \
672488bd391cab9 Peter Zijlstra 2024-07-05  2110  	     pos = rcu_dereference_raw(pos->next))
672488bd391cab9 Peter Zijlstra 2024-07-05  2111  
da1816b1caeccdf Oleg Nesterov  2012-12-29  2112  static void handler_chain(struct uprobe *uprobe, struct pt_regs *regs)
da1816b1caeccdf Oleg Nesterov  2012-12-29  2113  {
da1816b1caeccdf Oleg Nesterov  2012-12-29  2114  	struct uprobe_consumer *uc;
da1816b1caeccdf Oleg Nesterov  2012-12-29  2115  	int remove = UPROBE_HANDLER_REMOVE;
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2116  	bool need_prep = false; /* prepare return uprobe, when needed */
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2117  	bool had_handler = false;
da1816b1caeccdf Oleg Nesterov  2012-12-29  2118  
672488bd391cab9 Peter Zijlstra 2024-07-05  2119  	guard(srcu)(&uprobes_srcu);
672488bd391cab9 Peter Zijlstra 2024-07-05  2120  
672488bd391cab9 Peter Zijlstra 2024-07-05  2121  	for_each_consumer_rcu(uc, uprobe->consumers) {
ea024870cf10687 Anton Arapov   2013-04-03  2122  		int rc = 0;
da1816b1caeccdf Oleg Nesterov  2012-12-29  2123  
ea024870cf10687 Anton Arapov   2013-04-03  2124  		if (uc->handler) {
ea024870cf10687 Anton Arapov   2013-04-03  2125  			rc = uc->handler(uc, regs);
da1816b1caeccdf Oleg Nesterov  2012-12-29  2126  			WARN(rc & ~UPROBE_HANDLER_MASK,
d75f773c86a2b8b Sakari Ailus   2019-03-25  2127  				"bad rc=0x%x from %ps()\n", rc, uc->handler);
ea024870cf10687 Anton Arapov   2013-04-03  2128  		}
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2129  
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2130  		if (uc->ret_handler)
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2131  			need_prep = true;
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2132  
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2133  		/*
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2134  		 * A single handler that does not mask out REMOVE, means the
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2135  		 * probe stays.
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2136  		 */
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2137  		had_handler = true;
da1816b1caeccdf Oleg Nesterov  2012-12-29  2138  		remove &= rc;
da1816b1caeccdf Oleg Nesterov  2012-12-29  2139  	}
da1816b1caeccdf Oleg Nesterov  2012-12-29  2140  
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2141  	/*
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2142  	 * If there were no handlers called, nobody asked for it to be removed
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2143  	 * but also nobody got to mask the value. Fix it up.
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2144  	 */
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2145  	if (!had_handler)
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2146  		remove = 0;
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2147  
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2148  	if (need_prep && !remove)
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2149  		prepare_uretprobe(uprobe, regs); /* put bp at return */
0dfd0eb8e4d72de Anton Arapov   2013-04-03  2150  
ec74f3d52897ffb Peter Zijlstra 2024-07-09  2151  	if (remove)
da1816b1caeccdf Oleg Nesterov  2012-12-29  2152  		unapply_uprobe(uprobe, current->mm);
da1816b1caeccdf Oleg Nesterov  2012-12-29 @2153  	up_read(&uprobe->register_rwsem);
da1816b1caeccdf Oleg Nesterov  2012-12-29  2154  }
da1816b1caeccdf Oleg Nesterov  2012-12-29  2155  

:::::: The code at line 2153 was first introduced by commit
:::::: da1816b1caeccdff04531e763bb35d7caa3ed19f uprobes: Teach handler_chain() to filter out the probed task

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Oleg Nesterov <oleg@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
