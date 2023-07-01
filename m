Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847C83D86
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jul 2023 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688200507; x=1719736507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jy6ozkX38zkn9Q4Amyi+oJniHqPGb7wTP7Ld6lf6YaI=;
  b=g9JULyI34fbBuGixhc3fMOkX528VPZ9C/jFVHeT7T/6vZXcaZGXFxvx+
   QGL33fK1Qc/xaeR8F+Ata17nopg46AsmmbRmODlPoHLhJ6rAIkpjaN9po
   Agux3Dw/xxForsxfo6Ebk65GMFsBqN8+6Xs4DGXKmLxsZ/ss3xoA+VwjP
   lZZaSMv+z8FhXND5noY/JnylfuzJD8V2KmqPiRXKs3OpQcCDztpD6K2kk
   84RhhQaSXh6b4Ly/m+tVK5tgk0dfzFNQgjDprt5bI7Ac1td9I162HG2/z
   oFcv59ySOjDeBEsX9uX4GxvEAlWY3NvTjKH7L+6p7e4UkUiKrBQsFFw9f
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="428611190"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="428611190"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 01:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="783330452"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="783330452"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Jul 2023 01:35:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFW4O-000Ftv-23;
	Sat, 01 Jul 2023 08:35:04 +0000
Date: Sat, 1 Jul 2023 16:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 33/35] arch/s390/include/asm/lowcore.h:215:23: error:
 expected declaration specifiers or '...' before '*' token
Message-ID: <202307011634.tjAaT8nJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0
commit: 0389f4cef6f76094d3b2aed5bece0a4036dd859c [33/35] mm/damon/core: Implement moving_nr_accesses update function
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20230701/202307011634.tjAaT8nJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011634.tjAaT8nJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307011634.tjAaT8nJ-lkp@intel.com/

Note: the sj/damon/next HEAD b5a2d90d9d7d15714ca1dfb7bb74043ebd2a28d0 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from mm/damon/core.c:10:
>> arch/s390/include/asm/lowcore.h:215:23: error: expected declaration specifiers or '...' before '*' token
     215 | #define S390_lowcore (*((struct lowcore *) 0))
         |                       ^
   arch/s390/include/asm/current.h:17:45: note: in expansion of macro 'S390_lowcore'
      17 | #define current ((struct task_struct *const)S390_lowcore.current_task)
         |                                             ^~~~~~~~~~~~
   mm/damon/core.c:290:66: note: in expansion of macro 'current'
     290 | static unsigned int damon_pseudo_moving_average_add(unsigned int current,
         |                                                                  ^~~~~~~
>> arch/s390/include/asm/current.h:17:57: error: expected ')' before '.' token
      17 | #define current ((struct task_struct *const)S390_lowcore.current_task)
         |                                                         ^
   mm/damon/core.c:290:66: note: in expansion of macro 'current'
     290 | static unsigned int damon_pseudo_moving_average_add(unsigned int current,
         |                                                                  ^~~~~~~
   mm/damon/core.c:291:17: error: expected ';', ',' or ')' before 'unsigned'
     291 |                 unsigned int delta, unsigned int len_window)
         |                 ^~~~~~~~
   mm/damon/core.c: In function 'damon_record_access_to_region':
   mm/damon/core.c:317:38: error: implicit declaration of function 'damon_pseudo_moving_average_add' [-Werror=implicit-function-declaration]
     317 |         region->moving_accesses_bp = damon_pseudo_moving_average_add(
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:320:25: error: 'max_nr_accesses' undeclared (first use in this function)
     320 |                         max_nr_accesses);
         |                         ^~~~~~~~~~~~~~~
   mm/damon/core.c:320:25: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +215 arch/s390/include/asm/lowcore.h

cbb870c8221147 Heiko Carstens 2010-02-26  214  
c667aeacc16e0d Heiko Carstens 2015-12-31 @215  #define S390_lowcore (*((struct lowcore *) 0))
cbb870c8221147 Heiko Carstens 2010-02-26  216  

:::::: The code at line 215 was first introduced by commit
:::::: c667aeacc16e0de9e205faa93f57121d6f691973 s390: rename struct _lowcore to struct lowcore

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
