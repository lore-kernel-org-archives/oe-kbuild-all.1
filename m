Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD3E2566
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Mar 2023 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678709957; x=1710245957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Vi9Z7S9F4navt7rYkU4ue3ykJxIqOiZYkNsPc6uPEk=;
  b=EFLpBKlukzG3/4agIXvB2ykxkrIN3C21AuEwWgTbW4mc0kXRIlHiOSrR
   fMx1uVNaZVY1rOliGmM08ywEhyczz+/f9VSfnAYriEO4lIPCarTrTrMGn
   sowc3yIgVU4yVLOd6Ua4GEEW9rUtyIDGBY21XCXKNfBMWdWCb26OJog6j
   vRI3cPy8yz1ucY/SDAD0dl0FHxnCx1/jzgzryrDk3JPGLvRfmvEcXUmvb
   tq2GRz9PDF/VzstgG/LwfIXeIxz9XuVqjGOSPc9gaXz37wIGRXyw6GFm3
   TrxYcqeuSNagoO5GA79R4mz0azPdvR4BPtzUvVHHHDcYmNDhbYy4q+EpR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320982067"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="320982067"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 05:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821942385"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="821942385"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 05:19:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbh90-0005ec-2Z;
	Mon, 13 Mar 2023 12:19:14 +0000
Date: Mon, 13 Mar 2023 20:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf2 9/13] kernel/sched/sched.h:2036:24:
 error: implicit declaration of function 'static_branch_PRESERVE_LAG'; did
 you mean 'static_branch_EEVDF'?
Message-ID: <202303132020.4wMf3VYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf2
head:   5734abcb1bd3cbd294000aeac90aeebaa85bcd13
commit: f8a629a6be085929177393b769505b277e9c9171 [9/13] sched: Commit to lag based placement
config: x86_64-randconfig-r006-20230313 (https://download.01.org/0day-ci/archive/20230313/202303132020.4wMf3VYD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=f8a629a6be085929177393b769505b277e9c9171
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf2
        git checkout f8a629a6be085929177393b769505b277e9c9171
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132020.4wMf3VYD-lkp@intel.com/

Note: the peterz-queue/sched/eevdf2 HEAD 5734abcb1bd3cbd294000aeac90aeebaa85bcd13 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:937:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     937 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:56:
   kernel/sched/fair.c: In function 'dequeue_entity':
>> kernel/sched/sched.h:2036:24: error: implicit declaration of function 'static_branch_PRESERVE_LAG'; did you mean 'static_branch_EEVDF'? [-Werror=implicit-function-declaration]
    2036 | #define sched_feat(x) (static_branch_##x(&sched_feat_keys[__SCHED_FEAT_##x]))
         |                        ^~~~~~~~~~~~~~
   kernel/sched/fair.c:5138:13: note: in expansion of macro 'sched_feat'
    5138 |         if (sched_feat(PRESERVE_LAG) && (flags & DEQUEUE_SLEEP))
         |             ^~~~~~~~~~
>> kernel/sched/sched.h:2036:59: error: '__SCHED_FEAT_PRESERVE_LAG' undeclared (first use in this function); did you mean '__SCHED_FEAT_EEVDF'?
    2036 | #define sched_feat(x) (static_branch_##x(&sched_feat_keys[__SCHED_FEAT_##x]))
         |                                                           ^~~~~~~~~~~~~
   kernel/sched/fair.c:5138:13: note: in expansion of macro 'sched_feat'
    5138 |         if (sched_feat(PRESERVE_LAG) && (flags & DEQUEUE_SLEEP))
         |             ^~~~~~~~~~
   kernel/sched/sched.h:2036:59: note: each undeclared identifier is reported only once for each function it appears in
    2036 | #define sched_feat(x) (static_branch_##x(&sched_feat_keys[__SCHED_FEAT_##x]))
         |                                                           ^~~~~~~~~~~~~
   kernel/sched/fair.c:5138:13: note: in expansion of macro 'sched_feat'
    5138 |         if (sched_feat(PRESERVE_LAG) && (flags & DEQUEUE_SLEEP))
         |             ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +2036 kernel/sched/sched.h

f8b6d1cc7dc15c Peter Zijlstra  2011-07-06  2034  
c5905afb0ee655 Ingo Molnar     2012-02-24  2035  extern struct static_key sched_feat_keys[__SCHED_FEAT_NR];
f8b6d1cc7dc15c Peter Zijlstra  2011-07-06 @2036  #define sched_feat(x) (static_branch_##x(&sched_feat_keys[__SCHED_FEAT_##x]))
765cc3a4b224e2 Patrick Bellasi 2017-11-08  2037  

:::::: The code at line 2036 was first introduced by commit
:::::: f8b6d1cc7dc15cf3de538b864eefaedad7a84d85 sched: Use jump_labels for sched_feat

:::::: TO: Peter Zijlstra <a.p.zijlstra@chello.nl>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
