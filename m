Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC0539D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677247975; x=1708783975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRrdbg90JvMh/sWg4i4ypAsOM8fNcSKwYbYz8AMKag0=;
  b=iERO2ksFsYjl5NPVz6EMcYu5585KyMxSHJBIn81LH6xiguMzUBd+DEte
   VKXy7qzoxb4IBA/GrSfDxFuLLdT0ztInF/PcE3lvzrenPL+dyq/bdj/2S
   fQiPz71yuhhlb5V2hS7ZseTj7GbvLRzn2baMw8831Kdefo8gpQCJ4kMq2
   9GCvjrKP3s6SfISKkW6ZcSmGouYgiF3rzmoPT+vv3yY++NmA/GlIGVRdc
   +G52z6N3pDl7L0jpo0A7Rw1Bey7brZUGUqe9PUlVISQLLLB1LvboqxQeJ
   DpIG1V+il02IQZ8/ZRwfrP6ZJ91Qp113nIdcW6nXnNsD8mwqrHlMdOUNY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331218416"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="331218416"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 06:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="736810633"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="736810633"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Feb 2023 06:12:53 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVYoe-0002Sh-1b;
	Fri, 24 Feb 2023 14:12:52 +0000
Date: Fri, 24 Feb 2023 22:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/rcu/refscale.c:614:24: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202302242216.C9zAq2tw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2980d8d826554fa6981d621e569a453787472f8
commit: a6889becb05394255c80b62103677e3b095726a9 refscale: Add tests using SLAB_TYPESAFE_BY_RCU
date:   7 weeks ago
config: parisc-randconfig-s052-20230222 (https://download.01.org/0day-ci/archive/20230224/202302242216.C9zAq2tw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a6889becb05394255c80b62103677e3b095726a9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a6889becb05394255c80b62103677e3b095726a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302242216.C9zAq2tw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/refscale.c:614:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> kernel/rcu/refscale.c:614:24: sparse:    struct refscale_typesafe [noderef] __rcu *
>> kernel/rcu/refscale.c:614:24: sparse:    struct refscale_typesafe *
   kernel/rcu/refscale.c:569:13: sparse: sparse: context imbalance in 'typesafe_lock_acquire' - wrong count at exit
   kernel/rcu/refscale.c:576:13: sparse: sparse: context imbalance in 'typesafe_lock_release' - unexpected unlock

vim +614 kernel/rcu/refscale.c

   595	
   596	// Do a read-side critical section with the specified delay in
   597	// microseconds and nanoseconds inserted so as to increase probability
   598	// of failure.
   599	static void typesafe_delay_section(const int nloops, const int udl, const int ndl)
   600	{
   601		unsigned int a;
   602		unsigned int b;
   603		int i;
   604		long idx;
   605		struct refscale_typesafe *rtsp;
   606		unsigned int start;
   607	
   608		for (i = nloops; i >= 0; i--) {
   609			preempt_disable();
   610			idx = torture_random(this_cpu_ptr(&refscale_rand)) % rtsarray_size;
   611			preempt_enable();
   612	retry:
   613			rcu_read_lock();
 > 614			rtsp = rcu_dereference(rtsarray[idx]);
   615			a = READ_ONCE(rtsp->a);
   616			if (!rts_acquire(rtsp, &start)) {
   617				rcu_read_unlock();
   618				goto retry;
   619			}
   620			if (a != READ_ONCE(rtsp->a)) {
   621				(void)rts_release(rtsp, start);
   622				rcu_read_unlock();
   623				goto retry;
   624			}
   625			un_delay(udl, ndl);
   626			// Remember, seqlock read-side release can fail.
   627			if (!rts_release(rtsp, start)) {
   628				rcu_read_unlock();
   629				goto retry;
   630			}
   631			b = READ_ONCE(rtsp->a);
   632			WARN_ONCE(a != b, "Re-read of ->a changed from %u to %u.\n", a, b);
   633			b = rtsp->b;
   634			rcu_read_unlock();
   635			WARN_ON_ONCE(a * a != b);
   636		}
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
