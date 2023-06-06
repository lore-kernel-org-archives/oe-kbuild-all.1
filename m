Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84972361
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 02:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686019783; x=1717555783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iw9iaUMTeH4BYwlF9dznV5vJFipTu3LeuW92mZHhcWk=;
  b=iAm8mEwt3KQgDsv1bZXJnoCGFiMfzJY46T0mFftFFc2BNKZnzlYti827
   ZKI81qp+5n10fIViCnkZuAtdtRY5Y05jVl9TeB+Jwfx4x8Bz3mFhcfjPT
   dQnOV3GdhDSSPh9MCbay7oM9ysg8lkEqi//VG0dBFVFYBr79UVYKR7fmy
   D1zGlFXkBwuTL+HZlDmDbSR0jWKY+sA5n9YS3QWG9pIqQmx1asDwW9gXE
   qTF/iV2tbsbtsKEMIup2cXNZ2cMfbrNEwT3IhAgxAeeIeWbDB36qHnJUc
   oFLQOHDeJzz15AbP4WlU1P9+37VEvZh+8wpbSBUO0IqolZbOCtGRLGqXb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341185023"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="341185023"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 19:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="833041077"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="833041077"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jun 2023 19:49:41 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6MlQ-0004jx-39;
	Tue, 06 Jun 2023 02:49:40 +0000
Date: Tue, 6 Jun 2023 10:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 22/61] fs/proc/base.c:2464:31: error:
 passing argument 1 of 'seq_list_start' from incompatible pointer type
Message-ID: <202306061027.qNb1LcWD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/posix
head:   16a20adb1e0ae19ad42041a7d1b5583e4705ca0c
commit: 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1 [22/61] posix-timers: Convert timer list to hlist
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230606/202306061027.qNb1LcWD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 2e9a3527e7a51ba24410e43a2d0d1d10d62ae1b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061027.qNb1LcWD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/base.c: In function 'timers_start':
>> fs/proc/base.c:2464:31: error: passing argument 1 of 'seq_list_start' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2464 |         return seq_list_start(&tp->task->signal->posix_timers, *pos);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                               |
         |                               struct hlist_head *
   In file included from fs/proc/base.c:64:
   include/linux/seq_file.h:273:59: note: expected 'struct list_head *' but argument is of type 'struct hlist_head *'
     273 | extern struct list_head *seq_list_start(struct list_head *head,
         |                                         ~~~~~~~~~~~~~~~~~~^~~~
   fs/proc/base.c: In function 'timers_next':
>> fs/proc/base.c:2470:33: error: passing argument 2 of 'seq_list_next' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2470 |         return seq_list_next(v, &tp->task->signal->posix_timers, pos);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 struct hlist_head *
   include/linux/seq_file.h:277:67: note: expected 'struct list_head *' but argument is of type 'struct hlist_head *'
     277 | extern struct list_head *seq_list_next(void *v, struct list_head *head,
         |                                                 ~~~~~~~~~~~~~~~~~~^~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/uaccess.h:8,
                    from fs/proc/base.c:51:
   fs/proc/base.c: In function 'show_timer':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "pointer type mismatch in container_of()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/list.h:520:9: note: in expansion of macro 'container_of'
     520 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   fs/proc/base.c:2499:17: note: in expansion of macro 'list_entry'
    2499 |         timer = list_entry((struct list_head *)v, struct k_itimer, list);
         |                 ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/seq_list_start +2464 fs/proc/base.c

48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2451  
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2452  static void *timers_start(struct seq_file *m, loff_t *pos)
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2453  {
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2454  	struct timers_private *tp = m->private;
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2455  
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2456  	tp->task = get_pid_task(tp->pid, PIDTYPE_PID);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2457  	if (!tp->task)
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2458  		return ERR_PTR(-ESRCH);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2459  
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2460  	tp->sighand = lock_task_sighand(tp->task, &tp->flags);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2461  	if (!tp->sighand)
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2462  		return ERR_PTR(-ESRCH);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2463  
48f6a7a511ef88 Pavel Emelyanov 2013-03-11 @2464  	return seq_list_start(&tp->task->signal->posix_timers, *pos);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2465  }
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2466  
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2467  static void *timers_next(struct seq_file *m, void *v, loff_t *pos)
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2468  {
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2469  	struct timers_private *tp = m->private;
48f6a7a511ef88 Pavel Emelyanov 2013-03-11 @2470  	return seq_list_next(v, &tp->task->signal->posix_timers, pos);
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2471  }
48f6a7a511ef88 Pavel Emelyanov 2013-03-11  2472  

:::::: The code at line 2464 was first introduced by commit
:::::: 48f6a7a511ef8823fdff39afee0320092d43a8a0 posix-timers: Introduce /proc/PID/timers file

:::::: TO: Pavel Emelyanov <xemul@parallels.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
