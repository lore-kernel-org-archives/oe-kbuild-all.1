Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0AF375
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Aug 2023 01:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692320596; x=1723856596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t++tpmMuAIkOauTGE1vde2ij/1bAp1pjX5+7zj/xqdA=;
  b=R10b7VRJ/xlrkXvt33kfbWBU9lIkfdF4JkO6X6wY0nau72t9raUbvFBs
   WAjIxHeMP79tiStLFLAFWDzDmG2mVWhT7xVIQ75087ZVwJBn6s8uiNlhL
   lMpj4yahXfSl8yMz6dvEKAdkXvKuim3VAc+AwH/2oXNL8sGkmEF+M1lyj
   /F2aHA0BJvo64xgq28vS8VulCwxcEmr6E3Mf2NUvX6c5AuVLNeeXg5pmh
   XE29hgIHIMtUMhdiqCH/ciaDQYwSik0C4goLXvKXUEbdM3rus1+duO2VX
   PcG15PRmMMEDorTeR3H0WGVEK6qAFt+9IeGSwKc3GA4QkSPyloV8HAwH8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376736496"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="376736496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 18:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="981430211"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="981430211"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Aug 2023 18:03:02 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWntF-0001Zx-2K;
	Fri, 18 Aug 2023 01:03:01 +0000
Date: Fri, 18 Aug 2023 09:02:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:locktorture.2023.08.17a 14/20]
 kernel/rcu/tree.c:4100:6: warning: no previous declaration for
 'rcu_barrier_throttled'
Message-ID: <202308180853.brWVZKoo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git locktorture.2023.08.17a
head:   ccd7c62460a1ca6a8fb800de0d50d973ba62dcb8
commit: 365332de5f7bd1ab448ad4a6bd73a4fc8f1cc8ec [14/20] rcu: Add sysfs to provide throttled access to rcu_barrier()
config: x86_64-randconfig-x071-20230818 (https://download.01.org/0day-ci/archive/20230818/202308180853.brWVZKoo-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180853.brWVZKoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180853.brWVZKoo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/rcu/tree.c:4100:6: warning: no previous declaration for 'rcu_barrier_throttled' [-Wmissing-declarations]
    void rcu_barrier_throttled(void)
         ^~~~~~~~~~~~~~~~~~~~~


vim +/rcu_barrier_throttled +4100 kernel/rcu/tree.c

  4083	
  4084	/**
  4085	 * rcu_barrier_throttled - Do rcu_barrier(), but limit to one per second
  4086	 *
  4087	 * This can be thought of as guard rails around rcu_barrier() that
  4088	 * permits unrestricted userspace use, at least assuming the hardware's
  4089	 * try_cmpxchg() is robust.  There will be at most one call per second to
  4090	 * rcu_barrier() system-wide from use of this function, which means that
  4091	 * callers might needlessly wait a second or three.
  4092	 *
  4093	 * This is intended for use by test suites to avoid OOM by flushing RCU
  4094	 * callbacks from the previous test before starting the next.  See the
  4095	 * rcutree.do_rcu_barrier module parameter for more information.
  4096	 *
  4097	 * Why not simply make rcu_barrier() more scalable?  That might be the
  4098	 * eventual endpoint, but let's keep it simple for the time being.
  4099	 */
> 4100	void rcu_barrier_throttled(void)
  4101	{
  4102		unsigned long j = jiffies;
  4103		unsigned long old = READ_ONCE(rcu_barrier_last_throttle);
  4104		unsigned long s = rcu_seq_snap(&rcu_state.barrier_sequence);
  4105	
  4106		while (time_after(old + HZ, j) || !try_cmpxchg(&rcu_barrier_last_throttle, &old, j + HZ)) {
  4107			schedule_timeout_idle(HZ);
  4108			if (rcu_seq_done(&rcu_state.barrier_sequence, s))
  4109				return;
  4110			old = READ_ONCE(rcu_barrier_last_throttle);
  4111		}
  4112		rcu_barrier();
  4113	}
  4114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
