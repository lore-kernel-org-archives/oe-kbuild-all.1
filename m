Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C30EC6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 07:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679209632; x=1710745632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AplSUTnrHkMziVAt34I92HYbNz8T2xSeGrhmgorAR1Y=;
  b=I3mkOgMZCEeWv6S0hOSHEL6vlIJeJ7xhFlOW1atd6yw50I2B7jFJ7HEK
   8BD6k618KJFN4uW2ZdDEqvhYAeA/Szk7sM/m0pxKQinWKTI7ry2Qzh/Fq
   PAVY/BZHHYS+q2wqOysy7oN5i7hAEJcPFJU7TWmidMoLK6iHw0L5jMbMc
   bm9qfm4t/iwf9iLVLgfb+Y1PxH7eanoSoasvqEF0v1oRCpjOigP2HuRKN
   UnIgatB9lhIBRPGJBHfiluVqib8Kjvw51kU93YVwIWdDz1VYWcFZIy0yB
   wJmqeJ8oJxJDMZHlf7gJMkaONSox6TeQqJNzpoRoqgGndOlrsVDjROjSD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338508593"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="338508593"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 00:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="713198539"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="713198539"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Mar 2023 00:06:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdn7C-000ARW-1e;
	Sun, 19 Mar 2023 07:06:02 +0000
Date: Sun, 19 Mar 2023 15:05:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.03.17a 33/38] kernel/rcu/tasks.h:140:20:
 warning: 'tasks_rcu_exit_srcu' defined but not used
Message-ID: <202303191536.XzMSyzTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.17a
head:   19d218a4b125a4dce12eb88097a9c55f7126ce8c
commit: 61eea4556e8cf92d4c9b483110a679d2652aa451 [33/38] srcu: Move work-scheduling fields from srcu_struct to srcu_usage
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230319/202303191536.XzMSyzTl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=61eea4556e8cf92d4c9b483110a679d2652aa451
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu dev.2023.03.17a
        git checkout 61eea4556e8cf92d4c9b483110a679d2652aa451
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191536.XzMSyzTl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/srcu.h:49,
                    from include/linux/notifier.h:16,
                    from arch/x86/include/asm/uprobes.h:13,
                    from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/sched/signal.h:13,
                    from kernel/rcu/update.c:26:
>> kernel/rcu/tasks.h:140:20: warning: 'tasks_rcu_exit_srcu' defined but not used [-Wunused-variable]
     140 | DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
         |                    ^~~~~~~~~~~~~~~~~~~
   include/linux/srcutree.h:184:38: note: in definition of macro '__DEFINE_SRCU'
     184 |         is_static struct srcu_struct name =                                                     \
         |                                      ^~~~
   kernel/rcu/tasks.h:140:1: note: in expansion of macro 'DEFINE_STATIC_SRCU'
     140 | DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
         | ^~~~~~~~~~~~~~~~~~


vim +/tasks_rcu_exit_srcu +140 kernel/rcu/tasks.h

07e105158d97b4 Paul E. McKenney 2020-03-02  138  
eacd6f04a13331 Paul E. McKenney 2020-03-02  139  /* Track exiting tasks in order to allow them to be waited for. */
eacd6f04a13331 Paul E. McKenney 2020-03-02 @140  DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
eacd6f04a13331 Paul E. McKenney 2020-03-02  141  

:::::: The code at line 140 was first introduced by commit
:::::: eacd6f04a1333187dd3e96e5635c0edce0a2e354 rcu-tasks: Move Tasks RCU to its own file

:::::: TO: Paul E. McKenney <paulmck@kernel.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
