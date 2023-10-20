Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259B5624
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 00:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTg9Qm5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697762260; x=1729298260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5Og3gFNFr48uYUyi8zgfbrV3Xvg5s1tnliY0dXezHM=;
  b=dTg9Qm5e2IYhcpIwMEhy0v6k1QeKh89GANGDqWmHvl77EBTfq9kY4IM7
   /vCTU5xNn42KbZ9/QxXWMg0yK8SsYpbDhIpSwJbg5wsUtj55/x5jQYeY3
   v3/Jw9OtMLkjED/f/dQScvFxai8yc7dxPOPWt/V2nIql/fI2Ri4FT0SAR
   isfZv/cBjhxlTjcRm0x58DyuptG3bgjaNZYAQ/PWLzlMqHRP3psmXKOKD
   LjmJKP0CflhuYiaZ5PxV1cgJZzmvkW5xD6IsDAnMIZyhNZ06ITr7kg2Xh
   /NSbwMFji3wOHVqvXjcp/xOV6x1XnT+bB6JJWL85ONboi0M+vY56iuI4D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385279690"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385279690"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 17:37:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733784111"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="733784111"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Oct 2023 17:37:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtdWB-0002mU-0J;
	Fri, 20 Oct 2023 00:37:35 +0000
Date: Fri, 20 Oct 2023 08:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:mmap_sem.2023.10.18a 18/31]
 kernel/locking/qspinlock.c:741:23: warning: no previous declaration for
 '__pv_spinlock_dump'
Message-ID: <202310200814.xePmkBus-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git mmap_sem.2023.10.18a
head:   4015256f2bc734d4175381762282784597f41cfa
commit: 851f9c70733ed644c8a03d8f93f9876942181bee [18/31] EXP qspinlock: Add spinlock_dump() to dump lock state
config: x86_64-randconfig-016-20231020 (https://download.01.org/0day-ci/archive/20231020/202310200814.xePmkBus-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200814.xePmkBus-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200814.xePmkBus-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/qspinlock.c:741:23: warning: no previous declaration for '__pv_spinlock_dump' [-Wmissing-declarations]
    #define spinlock_dump __pv_spinlock_dump
                          ^
   kernel/locking/qspinlock.c:691:6: note: in expansion of macro 'spinlock_dump'
    void spinlock_dump(spinlock_t *sp, bool full)
         ^~~~~~~~~~~~~


vim +/__pv_spinlock_dump +741 kernel/locking/qspinlock.c

   737	
   738	#undef  queued_spin_lock_slowpath
   739	#define queued_spin_lock_slowpath	__pv_queued_spin_lock_slowpath
   740	#define queued_spin_lock_slowpath_diags	__pv_queued_spin_lock_slowpath_diags
 > 741	#define spinlock_dump	__pv_spinlock_dump
   742	#define tail_to_cpu	__pv_tail_to_cpu
   743	#define tail_to_idx	__pv_tail_to_idx
   744	#define next_to_prev	__pv_next_to_prev
   745	#define next_to_cpu_idx	__pv_next_to_cpu_idx
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
