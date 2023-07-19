Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D60800
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689784359; x=1721320359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EI8ABPQE/gOO0/fca8L9QlJrzh8ME6mX0C+eqQYbMxM=;
  b=OB0NsGL7DS3JbTyf6/SgahjWYHkdatuz5uZ5vkk4+fsD8NmXBaWt6uGA
   ARzN1gAtMeM6kP99MmbIIAbGFZR4SbftGVETca2O/dPjlBwg7pUch9+n1
   XoyEUUWdloSb94a264/oL8FDHI3VTX+vcNwEuNJCEWNbRPQ7NoqP+WQtH
   I/JBPglfX4tJzUQslJAwH/GtwU2Aptx1o54hKwFbEc3zqqsaWR/gUmiOW
   u94+FIlNC7ATjBw5WFss97+Z9h4XtBrOWbxaoWQpsE1Js6E2n83simiPW
   dpAsyiY7ydXPWzn5whZ4i9sT3yELmixTWIUaquR7/7x0wwEq0rO02VSu8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356473406"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356473406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 09:32:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="701332387"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="701332387"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 Jul 2023 09:32:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMA6P-0005FY-1r;
	Wed, 19 Jul 2023 16:32:37 +0000
Date: Thu, 20 Jul 2023 00:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 8/13] kernel/futex/syscalls.c:429:30:
 warning: cast to pointer from integer of different size
Message-ID: <202307200039.LRFWjDqH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   b70d7a00de0dc4c0525ce8226eb903695114f8ab
commit: 7c350c2f4ddab8995bb0006cc834b652acbd1970 [8/13] futex: Add sys_futex_requeue()
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230720/202307200039.LRFWjDqH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200039.LRFWjDqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200039.LRFWjDqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/futex/syscalls.c: In function '__do_sys_futex_requeue':
>> kernel/futex/syscalls.c:429:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     429 |         return futex_requeue((void __user *)futexes[0].w.uaddr, futexes[0].w.flags,
         |                              ^
   kernel/futex/syscalls.c:430:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     430 |                              (void __user *)futexes[1].w.uaddr, futexes[1].w.flags,
         |                              ^


vim +429 kernel/futex/syscalls.c

   402	
   403	/*
   404	 * FUTEX_CMP_REQUEUE
   405	 */
   406	
   407	SYSCALL_DEFINE4(futex_requeue,
   408			struct futex_waitv __user *, waiters,
   409			unsigned int, flags,
   410			int, nr_wake,
   411			int, nr_requeue)
   412	{
   413		struct futex_vector futexes[2];
   414		u32 cmpval;
   415		int ret;
   416	
   417		if (flags)
   418			return -EINVAL;
   419	
   420		if (!waiters)
   421			return -EINVAL;
   422	
   423		ret = futex_parse_waitv(futexes, waiters, 2);
   424		if (ret)
   425			return ret;
   426	
   427		cmpval = futexes[0].w.val;
   428	
 > 429		return futex_requeue((void __user *)futexes[0].w.uaddr, futexes[0].w.flags,
   430				     (void __user *)futexes[1].w.uaddr, futexes[1].w.flags,
   431				     nr_wake, nr_requeue,
   432				     &cmpval, 0);
   433	}
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
