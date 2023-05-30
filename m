Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A57223C6F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685463471; x=1716999471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1voWWUVIucDQbWFX6EXqG7B5zrfXPUku4b213MyNJc=;
  b=Jnaw7X3SpV1BKvFWC7AlQ/vW8h97lucP0K72vOHDkwyTacr+60EMVmh1
   lqSYogbAdUQ9y9mUdVZRlOhyx06ceV2U/6XR2TtgCYXfja4MemTS9e/hA
   Tj+vM1a+W3SLsKC++48jJ2KWVlhhulCrVjLGKDMWWEs91Ny4fN+6F33BP
   0CebkBQjIpjm/AfNk024Rqh0Kd5C/NWZWrUhCSDBaqgVSTyauLVeiXuqb
   8wRWMrsJTItex2L8Nq7ol1ruMeM3WwcqPUVVnhO8RxszTD1Y2jh1Ap19W
   NSNJHFSXZf2rZJz4M8q1kRpqiSp7PLDEUXopLL14hCdGJY+fRK0D9TiMA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353809589"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="353809589"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 09:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953222684"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="953222684"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 09:16:30 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q421O-0000fr-07;
	Tue, 30 May 2023 16:16:30 +0000
Date: Wed, 31 May 2023 00:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1] kernel/sched/fair.c:4803:
 undefined reference to `clock_task_mult'
Message-ID: <202305310053.30IJJNNf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Todd,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   40259b07af18a32a176706341075482aa23d3515
commit: 4e709a85e578d28a2626832c4f2cf5e9031d435c [1/1] ANDROID: fix kernelci issue for allnoconfig builds
config: x86_64-randconfig-a015-20230530 (https://download.01.org/0day-ci/archive/20230531/202305310053.30IJJNNf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout 4e709a85e578d28a2626832c4f2cf5e9031d435c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310053.30IJJNNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: kernel/sched/fair.o: in function `tg_unthrottle_up':
>> kernel/sched/fair.c:4803: undefined reference to `clock_task_mult'
   ld: kernel/sched/fair.o: in function `tg_throttle_down':
   kernel/sched/fair.c:4821: undefined reference to `clock_task_mult'
   ld: kernel/sched/fair.o: in function `sync_throttle':
   kernel/sched/fair.c:5239: undefined reference to `clock_task_mult'


vim +4803 kernel/sched/fair.c

64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4795  
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4796  static int tg_unthrottle_up(struct task_group *tg, void *data)
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4797  {
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4798  	struct rq *rq = data;
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4799  	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4800  
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4801  	cfs_rq->throttle_count--;
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4802  	if (!cfs_rq->throttle_count) {
909d582d3a0bd7 kernel/sched/fair.c JianMin Liu     2022-06-29 @4803  		cfs_rq->throttled_clock_task_time += rq_clock_task_mult(rq) -
f1b17280efbd21 kernel/sched/fair.c Paul Turner     2012-10-04  4804  					     cfs_rq->throttled_clock_task;
31bc6aeaab1d1d kernel/sched/fair.c Vincent Guittot 2019-02-06  4805  
31bc6aeaab1d1d kernel/sched/fair.c Vincent Guittot 2019-02-06  4806  		/* Add cfs_rq with already running entity in the list */
31bc6aeaab1d1d kernel/sched/fair.c Vincent Guittot 2019-02-06  4807  		if (cfs_rq->nr_running >= 1)
31bc6aeaab1d1d kernel/sched/fair.c Vincent Guittot 2019-02-06  4808  			list_add_leaf_cfs_rq(cfs_rq);
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4809  	}
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4810  
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4811  	return 0;
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4812  }
64660c864f4620 kernel/sched_fair.c Paul Turner     2011-07-21  4813  

:::::: The code at line 4803 was first introduced by commit
:::::: 909d582d3a0bd779d4260c41f276b138014cde99 ANDROID: sched: Introducing PELT multiplier

:::::: TO: JianMin Liu <jian-min.liu@mediatek.com>
:::::: CC: Wei Wang <wvw@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
