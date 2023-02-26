Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA63D61
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 19:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677438305; x=1708974305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tp4ps0XNp/Pve23eHQvnKdl/L5+E/UcPxMvtbv4ggEo=;
  b=KkMX6g5Nqpt8lA+aJzvV88Fw7QYJuAbEB+nQjob2dVFdLbl5dJH4RblX
   kVWgudZjbeQJMtyox2SCC+fFkI+UipBO0j215Ve1q/DcLFirUPfAVba27
   a7dIecd5pZOG/t6YqIEBxs8lyJ9eiAtfGr9MpjCRFmeIeS3rprMoPuAX8
   SLBOtSvwBuKMC2kWh/ea6S2z5KvmFH6pFxTJ8B23nyJTlVJMvt+MXpKdN
   jvFOqkp6W4wsj8ulBlY7D9+21a2Wyeche2WeixoTARp31Rv429kLSJAfb
   Pc6UfvH83lrAXXPsg0yLirwb/H62iUmuMUYS790Lo8S7uuz5iGbi7hKTK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="314160417"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="314160417"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 11:05:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="1002454464"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="1002454464"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2023 11:05:03 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWMKU-0003rF-2w;
	Sun, 26 Feb 2023 19:05:02 +0000
Date: Mon, 27 Feb 2023 03:04:53 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/core 6/7] kernel/locking/lock_events.h:44:51:
 error: 'LOCKEVENT_rwem_rlock_fail' undeclared; did you mean
 'LOCKEVENT_rwsem_rlock_fail'?
Message-ID: <202302270234.ltZaRNxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   18e0098a30e83352212c5840ae0bc2c144ad0e39
commit: 279f094d8e0d5d9ab6ed75466209ccf972801d73 [6/7] locking/rwsem: Unify wait loop
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230227/202302270234.ltZaRNxE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=279f094d8e0d5d9ab6ed75466209ccf972801d73
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/core
        git checkout 279f094d8e0d5d9ab6ed75466209ccf972801d73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270234.ltZaRNxE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/locking/rwsem.c:33:
   kernel/locking/rwsem.c: In function 'rwsem_waiter_wait':
>> kernel/locking/lock_events.h:44:51: error: 'LOCKEVENT_rwem_rlock_fail' undeclared (first use in this function); did you mean 'LOCKEVENT_rwsem_rlock_fail'?
      44 | #define lockevent_cond_inc(ev, c) __lockevent_inc(LOCKEVENT_ ##ev, c)
         |                                                   ^~~~~~~~~~
   kernel/locking/rwsem.c:999:9: note: in expansion of macro 'lockevent_cond_inc'
     999 |         lockevent_cond_inc(evr, (rd));          \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:1037:9: note: in expansion of macro 'lockevent_rw_inc'
    1037 |         lockevent_rw_inc(reader, rwem_rlock_fail, rwsem_wlock_fail);
         |         ^~~~~~~~~~~~~~~~
   kernel/locking/lock_events.h:44:51: note: each undeclared identifier is reported only once for each function it appears in
      44 | #define lockevent_cond_inc(ev, c) __lockevent_inc(LOCKEVENT_ ##ev, c)
         |                                                   ^~~~~~~~~~
   kernel/locking/rwsem.c:999:9: note: in expansion of macro 'lockevent_cond_inc'
     999 |         lockevent_cond_inc(evr, (rd));          \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:1037:9: note: in expansion of macro 'lockevent_rw_inc'
    1037 |         lockevent_rw_inc(reader, rwem_rlock_fail, rwsem_wlock_fail);
         |         ^~~~~~~~~~~~~~~~


vim +44 kernel/locking/lock_events.h

ad53fa10fa9e81 Waiman Long 2019-04-04  42  
ad53fa10fa9e81 Waiman Long 2019-04-04  43  #define lockevent_inc(ev)	  __lockevent_inc(LOCKEVENT_ ##ev, true)
ad53fa10fa9e81 Waiman Long 2019-04-04 @44  #define lockevent_cond_inc(ev, c) __lockevent_inc(LOCKEVENT_ ##ev, c)
ad53fa10fa9e81 Waiman Long 2019-04-04  45  

:::::: The code at line 44 was first introduced by commit
:::::: ad53fa10fa9e816067bbae7109845940f5e6df50 locking/qspinlock_stat: Introduce generic lockevent_*() counting APIs

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
