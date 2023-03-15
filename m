Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7B33F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678878107; x=1710414107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlJwtLrL5OQ9rWggEeBT9gjOalfBt7aes8n1V4fH4eU=;
  b=SQYrIvgC8qOKwWc0GeMcuYXzl3mcrRQ21qv4NdCAabnd1cIgzBXfDxNT
   poAjo/mnDTu87tRoJM8tKZMnevwCS+aAYGjRPGzSe+BDBHAZx4XgInoFt
   sJ5a0+LQ7YhBf2pDaqw9ZiX6BvyJ+Ds05H2h/uO/u97IkFG86a/aFQbWe
   SDLm2yDUmW05URu5rwcXPM9OMLxqauLj91Ztg8iFuHMWsK22NM4g5r0U8
   UapOUPV/eh8KPf8nxLgQVmThE7mYDBCykkkkmjnGfSZmuVv+TdEnMdR2K
   +ux7vQ43O/3YUZ+Cja4kpl5/Ert+nrvLClyO0WsFqy90itM4ywJgN5E1E
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339213427"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="339213427"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629421508"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="629421508"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 04:01:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcOt5-0007cx-2t;
	Wed, 15 Mar 2023 11:01:43 +0000
Date: Wed, 15 Mar 2023 19:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Qais Yousef (Google)" <qyousef@layalina.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.10 96/108] kernel/sched/sched.h:2560:27:
 error: 'struct rq' has no member named 'cpu_capacity_inverted'
Message-ID: <202303151800.NP9tJsgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   e6a15a9d1bcf661f6bb79a1c2dce0c796234ac80
commit: db4f76185823d00afb688cbd63fdf7200de209ea [96/108] sched/fair: Detect capacity inversion
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230315/202303151800.NP9tJsgK-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=db4f76185823d00afb688cbd63fdf7200de209ea
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout db4f76185823d00afb688cbd63fdf7200de209ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151800.NP9tJsgK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:13:
   kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
>> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
    2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
         |                           ^~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2430:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2430 |         struct rq *rq;
         |                    ^~
--
   In file included from kernel/sched/loadavg.c:9:
   kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
>> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
    2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
         |                           ^~


vim +2560 kernel/sched/sched.h

  2544	
  2545	/*
  2546	 * Returns inverted capacity if the CPU is in capacity inversion state.
  2547	 * 0 otherwise.
  2548	 *
  2549	 * Capacity inversion detection only considers thermal impact where actual
  2550	 * performance points (OPPs) gets dropped.
  2551	 *
  2552	 * Capacity inversion state happens when another performance domain that has
  2553	 * equal or lower capacity_orig_of() becomes effectively larger than the perf
  2554	 * domain this CPU belongs to due to thermal pressure throttling it hard.
  2555	 *
  2556	 * See comment in update_cpu_capacity().
  2557	 */
  2558	static inline unsigned long cpu_in_capacity_inversion(int cpu)
  2559	{
> 2560		return cpu_rq(cpu)->cpu_capacity_inverted;
  2561	}
  2562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
