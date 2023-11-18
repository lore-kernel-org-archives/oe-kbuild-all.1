Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1F29B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXdLOHWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700296193; x=1731832193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+8GS8oJdfTBwH9Njn5eu4cnUAyw4QtmzgdfRsBeHqe0=;
  b=OXdLOHWQ+puIPQ1XteMKTxpyiBZRAPbbrsAOaofAtCtZvSDyuR1HgdxQ
   V0pVExXi4tE2jXZYXDd1uuaJVdYwep4oYDQQ2ds8QLFT62j1nPftS5hN9
   6C29eAw2eRlw4gzKxUlOUXYIKbs3QQOf/uRJrPty8bw/NGl+z3arZN36D
   vcHn4Qi12+I0v1vcdZ2IfG68a9sor93MX05gPo4HX+pT7u15krsPuCVlN
   uv73ykJ+vWlRl4RafJs1w6LT71k3Qneo/BKzZ5RfmEsy0qFg5c/y+Glxt
   D2ejuU+Nvo+kEUwQ0loN2ygTeBglOJZL27I/2UAaMk5MFFgBYLnXZVKZd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371593092"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="371593092"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 00:29:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="14124640"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Nov 2023 00:29:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Ghf-0003h9-0M;
	Sat, 18 Nov 2023 08:29:41 +0000
Date: Sat, 18 Nov 2023 16:29:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>
Subject: kernel/locking/locktorture.c:127:23: sparse: sparse: symbol
 'call_rcu_chain' was not declared. Should it be static?
Message-ID: <202311181621.k1LVEHqR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 7f993623e9ebcd633c0f760991e5078b95a37db3 locktorture: Add call_rcu_chains module parameter
date:   8 weeks ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231118/202311181621.k1LVEHqR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181621.k1LVEHqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181621.k1LVEHqR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/locktorture.c:127:23: sparse: sparse: symbol 'call_rcu_chain' was not declared. Should it be static?
   kernel/locking/locktorture.c:496:12: sparse: sparse: context imbalance in 'torture_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:512:13: sparse: sparse: context imbalance in 'torture_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:570:12: sparse: sparse: context imbalance in 'torture_ww_mutex_lock' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/ww_mutex.h:191:9: sparse: sparse: context imbalance in 'torture_ww_mutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:665:12: sparse: sparse: context imbalance in 'torture_rtmutex_lock' - wrong count at exit
   kernel/locking/locktorture.c:689:13: sparse: sparse: context imbalance in 'torture_rtmutex_unlock' - wrong count at exit
   kernel/locking/locktorture.c:729:12: sparse: sparse: context imbalance in 'torture_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:745:13: sparse: sparse: context imbalance in 'torture_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c:751:12: sparse: sparse: context imbalance in 'torture_rwsem_down_read' - wrong count at exit
   kernel/locking/locktorture.c:769:13: sparse: sparse: context imbalance in 'torture_rwsem_up_read' - wrong count at exit
   kernel/locking/locktorture.c:799:12: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_write' - wrong count at exit
   kernel/locking/locktorture.c:806:13: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_write' - wrong count at exit
   kernel/locking/locktorture.c: note: in included file:
   include/linux/percpu-rwsem.h:70:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_down_read' - wrong count at exit
   include/linux/percpu-rwsem.h:121:9: sparse: sparse: context imbalance in 'torture_percpu_rwsem_up_read' - wrong count at exit

vim +/call_rcu_chain +127 kernel/locking/locktorture.c

   122	
   123	struct call_rcu_chain {
   124		struct rcu_head crc_rh;
   125		bool crc_stop;
   126	};
 > 127	struct call_rcu_chain *call_rcu_chain;
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
