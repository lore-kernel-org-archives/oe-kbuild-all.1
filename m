Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E693C24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679651111; x=1711187111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrWaeGkbLuk83Xu+4e9KpP7tnegmfP1xmKYlknE6a8A=;
  b=j7FVDSUSSiiM6VJZlaUVD7TdHHq+/n4C66pQcc+JoA9r1d3MnTpndUQZ
   K//rdPzdLU0si+dDzONbNxxs6Os8YnFHJwEA4WjCnXOu0X/MdKz1Ybu1R
   lm1AfU+CuGdcODi1R3I3VOvf57l5LQuwnAtSCRIK0cTttAxiVloRXLQDT
   I/AKP63hxZKphBBLSeNbi55J4KyG8/emA8RNJ/qqH8BzIOulohDz7J4+p
   BxyrN4FWBBbI6BWRZTuA2BgI6j4N2/OmKILpuWJje7sQZ8OFrl7RY3e9V
   Ox+pWv8SjN3L6JeNDZg9E3qjP5Q7dwPKhdPF08kRaeTTI7kUrMI5d2E7d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="341308224"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="341308224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 02:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="660003707"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="660003707"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Mar 2023 02:45:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfdyu-000FBU-2W;
	Fri, 24 Mar 2023 09:45:08 +0000
Date: Fri, 24 Mar 2023 17:44:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:srcu-cf.2023.03.23a 14/20] kernel/rcu/tasks.h:140:20:
 warning: 'tasks_rcu_exit_srcu' defined but not used
Message-ID: <202303241725.0RIyOS2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git srcu-cf.2023.03.23a
head:   01abd52f1773d0ad92560b79bb55b48e26da06d5
commit: fd18a19e0cef4deac7fb327209443a851355653a [14/20] srcu: Move work-scheduling fields from srcu_struct to srcu_usage
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20230324/202303241725.0RIyOS2U-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=fd18a19e0cef4deac7fb327209443a851355653a
        git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
        git fetch --no-tags paulmck-rcu srcu-cf.2023.03.23a
        git checkout fd18a19e0cef4deac7fb327209443a851355653a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241725.0RIyOS2U-lkp@intel.com/

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
   include/linux/srcutree.h:171:38: note: in definition of macro '__DEFINE_SRCU'
     171 |         is_static struct srcu_struct name =                                                     \
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
