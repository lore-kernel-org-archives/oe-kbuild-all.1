Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79AF23A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 14:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679582912; x=1711118912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ev1LKa7lRlxjKii5EDILXCNXUC93wi4YwZClfV1pbZQ=;
  b=FXeUU7+/75krJ6/V8CgCHdiNpE3+oxzT8Us+cRG0w2ayDWLXTgCUWDkc
   K1KCp3QpfaA3TJlkV7ImyYSh6m6jpYl7HgF/IztR2f04Qsr/QwkZ9E5hP
   lIX4BjbEd+2FBOjy/XOwY+9bcsEjK0h7JdsJkKNY1Jx3PSaLKPbJnBQo0
   BpJ0P3WS2jnc/ahMDh1i23qSa/hidXqnthRD+BmEHnalZxcD2e9yEIL/o
   WgQKdbHpR8PpR8ASmfS194U0LXQ2jNFhDf1wjITPDgusOoeGHIxSnV4wo
   c67Mp5qhcssHwTJgTQgePmsDJSXc7cbBxOGMBnzpPbWR0PkFgIfq08kcP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404410947"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="404410947"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 07:48:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="714839255"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="714839255"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 07:48:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfMEw-000ESa-0J;
	Thu, 23 Mar 2023 14:48:30 +0000
Date: Thu, 23 Mar 2023 22:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Junxiao Chang <junxiao.chang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.15/preempt-rt 21/81]
 kernel/locking/ww_rt_mutex.c:29:43: error: passing 'struct lockdep_map' to
 parameter of incompatible type 'struct lockdep_map *'; take the address with
 &
Message-ID: <202303232251.hhYAjnbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ranjan,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/preempt-rt
head:   388cb4d3820698e16daaf7c2044f89e87c57b8c9
commit: 9af0faa82b97ee93a73213d01f8eda53dcbdf7c0 [21/81] Merge tag 'lts-v5.15.21-linux-220222T001242Z' into lts2021/preempt-rt
config: powerpc-randconfig-r024-20230323 (https://download.01.org/0day-ci/archive/20230323/202303232251.hhYAjnbx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/9af0faa82b97ee93a73213d01f8eda53dcbdf7c0
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/preempt-rt
        git checkout 9af0faa82b97ee93a73213d01f8eda53dcbdf7c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232251.hhYAjnbx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/ww_rt_mutex.c:29:43: error: passing 'struct lockdep_map' to parameter of incompatible type 'struct lockdep_map *'; take the address with &
                   mutex_acquire_nest(&rtm->dep_map, 0, 1, ww_ctx->dep_map, _RET_IP_);
                                                           ^~~~~~~~~~~~~~~
                                                           &
   include/linux/lockdep.h:559:75: note: expanded from macro 'mutex_acquire_nest'
   #define mutex_acquire_nest(l, s, t, n, i)       lock_acquire_exclusive(l, s, t, n, i)
                                                                                   ^
   include/linux/lockdep.h:535:76: note: expanded from macro 'lock_acquire_exclusive'
   #define lock_acquire_exclusive(l, s, t, n, i)           lock_acquire(l, s, t, 0, 1, n, i)
                                                                                       ^
   include/linux/lockdep.h:267:25: note: passing argument to parameter 'nest_lock' here
                            struct lockdep_map *nest_lock, unsigned long ip);
                                                ^
   1 error generated.


vim +29 kernel/locking/ww_rt_mutex.c

f8635d509d807c Peter Zijlstra    2021-08-15  11  
53956aadc1f375 Maarten Lankhorst 2021-09-09  12  int ww_mutex_trylock(struct ww_mutex *lock, struct ww_acquire_ctx *ww_ctx)
53956aadc1f375 Maarten Lankhorst 2021-09-09  13  {
53956aadc1f375 Maarten Lankhorst 2021-09-09  14  	struct rt_mutex *rtm = &lock->base;
53956aadc1f375 Maarten Lankhorst 2021-09-09  15  
53956aadc1f375 Maarten Lankhorst 2021-09-09  16  	if (!ww_ctx)
53956aadc1f375 Maarten Lankhorst 2021-09-09  17  		return rt_mutex_trylock(rtm);
53956aadc1f375 Maarten Lankhorst 2021-09-09  18  
53956aadc1f375 Maarten Lankhorst 2021-09-09  19  	/*
53956aadc1f375 Maarten Lankhorst 2021-09-09  20  	 * Reset the wounded flag after a kill. No other process can
53956aadc1f375 Maarten Lankhorst 2021-09-09  21  	 * race and wound us here, since they can't have a valid owner
53956aadc1f375 Maarten Lankhorst 2021-09-09  22  	 * pointer if we don't have any locks held.
53956aadc1f375 Maarten Lankhorst 2021-09-09  23  	 */
53956aadc1f375 Maarten Lankhorst 2021-09-09  24  	if (ww_ctx->acquired == 0)
53956aadc1f375 Maarten Lankhorst 2021-09-09  25  		ww_ctx->wounded = 0;
53956aadc1f375 Maarten Lankhorst 2021-09-09  26  
53956aadc1f375 Maarten Lankhorst 2021-09-09  27  	if (__rt_mutex_trylock(&rtm->rtmutex)) {
53956aadc1f375 Maarten Lankhorst 2021-09-09  28  		ww_mutex_set_context_fastpath(lock, ww_ctx);
53956aadc1f375 Maarten Lankhorst 2021-09-09 @29  		mutex_acquire_nest(&rtm->dep_map, 0, 1, ww_ctx->dep_map, _RET_IP_);
53956aadc1f375 Maarten Lankhorst 2021-09-09  30  		return 1;
53956aadc1f375 Maarten Lankhorst 2021-09-09  31  	}
53956aadc1f375 Maarten Lankhorst 2021-09-09  32  
53956aadc1f375 Maarten Lankhorst 2021-09-09  33  	return 0;
53956aadc1f375 Maarten Lankhorst 2021-09-09  34  }
53956aadc1f375 Maarten Lankhorst 2021-09-09  35  EXPORT_SYMBOL(ww_mutex_trylock);
53956aadc1f375 Maarten Lankhorst 2021-09-09  36  

:::::: The code at line 29 was first introduced by commit
:::::: 53956aadc1f3755f43e9a8d6741cb2b1d4c58ac6 kernel/locking: Add context to ww_mutex_trylock()

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Junxiao Chang <junxiao.chang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
