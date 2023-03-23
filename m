Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D62C959
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 20:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679602006; x=1711138006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4hb14gfdONh7Zsce1csru/7nyiSLnIGus5tdzM8+Drs=;
  b=WhD9GsAFi3Wb56S2xQcHTDhjR6gwxJAL5bia4uzwHjPfMJzEd3+RU/vE
   W51aEzoUy/7BMPrB4QFqBQhBj2kpEAbHgj6yFMeC99xUlKucTqtEnMsfs
   3md2vqiTrdzHwZjtV/EuqMB6RYFKMg7ZuweaZOT7WIxodaHTz9vmuzvL7
   5ujyQRsBLRytpHOfTYoYTtOvZYnIxn2yq2RDGep74xsX85ymtKAiZsC+Y
   hz9MAkB3HC8gttez+Fjd0sGFxAEX/R1WuAbmTtnQcmGKq8rFGccNKe+5N
   mOn+z3S1YeyrletgqZlRKOPQ7gDliotUsSfziBZ042fMk+dfSe5NeCL25
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323472280"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="323472280"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 13:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684885255"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="684885255"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 13:06:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfRCq-000EfQ-2X;
	Thu, 23 Mar 2023 20:06:40 +0000
Date: Fri, 24 Mar 2023 04:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.19 3/3] mm/page-writeback.c:2014:6: error:
 redefinition of 'laptop_sync_completion'
Message-ID: <202303240453.bWh9SpNP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.19
head:   1d6b56c1dc594e32afe4d3243532404a26e13b69
commit: 1d6b56c1dc594e32afe4d3243532404a26e13b69 [3/3] BACKPORT: mm: hide laptop_mode_wb_timer entirely behind the BDI API
config: arc-randconfig-r043-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240453.bWh9SpNP-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-4.19
        git checkout 1d6b56c1dc594e32afe4d3243532404a26e13b69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240453.bWh9SpNP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/page-writeback.c:1991:6: warning: no previous prototype for 'laptop_mode_timer_fn' [-Wmissing-prototypes]
    1991 | void laptop_mode_timer_fn(struct timer_list *t)
         |      ^~~~~~~~~~~~~~~~~~~~
>> mm/page-writeback.c:2004:6: warning: no previous prototype for 'laptop_io_completion' [-Wmissing-prototypes]
    2004 | void laptop_io_completion(struct backing_dev_info *info)
         |      ^~~~~~~~~~~~~~~~~~~~
>> mm/page-writeback.c:2014:6: error: redefinition of 'laptop_sync_completion'
    2014 | void laptop_sync_completion(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/memcontrol.h:31,
                    from include/linux/swap.h:9,
                    from mm/page-writeback.c:19:
   include/linux/writeback.h:313:20: note: previous definition of 'laptop_sync_completion' with type 'void(void)'
     313 | static inline void laptop_sync_completion(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:85,
                    from mm/page-writeback.c:33:
   arch/arc/include/asm/perf_event.h:130:23: warning: 'arc_pmu_cache_map' defined but not used [-Wunused-const-variable=]
     130 | static const unsigned arc_pmu_cache_map[C(MAX)][C(OP_MAX)][C(RESULT_MAX)] = {
         |                       ^~~~~~~~~~~~~~~~~
   arch/arc/include/asm/perf_event.h:95:27: warning: 'arc_pmu_ev_hw_map' defined but not used [-Wunused-const-variable=]
      95 | static const char * const arc_pmu_ev_hw_map[] = {
         |                           ^~~~~~~~~~~~~~~~~
--
   In file included from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:16,
                    from include/linux/fs.h:23,
                    from include/linux/backing-dev.h:13,
                    from mm/backing-dev.c:3:
   mm/backing-dev.c: In function 'bdi_alloc_node':
>> mm/backing-dev.c:872:49: error: 'laptop_mode_timer_fn' undeclared (first use in this function)
     872 |         timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/timer.h:103:43: note: in definition of macro '__init_timer'
     103 |                 init_timer_key((_timer), (_fn), (_flags), #_timer, &__key);\
         |                                           ^~~
   mm/backing-dev.c:872:9: note: in expansion of macro 'timer_setup'
     872 |         timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
         |         ^~~~~~~~~~~
   mm/backing-dev.c:872:49: note: each undeclared identifier is reported only once for each function it appears in
     872 |         timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/timer.h:103:43: note: in definition of macro '__init_timer'
     103 |                 init_timer_key((_timer), (_fn), (_flags), #_timer, &__key);\
         |                                           ^~~
   mm/backing-dev.c:872:9: note: in expansion of macro 'timer_setup'
     872 |         timer_setup(&bdi->laptop_mode_wb_timer, laptop_mode_timer_fn, 0);
         |         ^~~~~~~~~~~


vim +/laptop_sync_completion +2014 mm/page-writeback.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1990  
bca237a52ca003 Kees Cook       2017-08-28 @1991  void laptop_mode_timer_fn(struct timer_list *t)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1992  {
bca237a52ca003 Kees Cook       2017-08-28  1993  	struct backing_dev_info *backing_dev_info =
bca237a52ca003 Kees Cook       2017-08-28  1994  		from_timer(backing_dev_info, t, laptop_mode_wb_timer);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1995  
bca237a52ca003 Kees Cook       2017-08-28  1996  	wakeup_flusher_threads_bdi(backing_dev_info, WB_REASON_LAPTOP_TIMER);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1997  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1998  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1999  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  2000   * We've spun up the disk and we're in laptop mode: schedule writeback
^1da177e4c3f41 Linus Torvalds  2005-04-16  2001   * of all dirty data a few seconds from now.  If the flush is already scheduled
^1da177e4c3f41 Linus Torvalds  2005-04-16  2002   * then push it back - the user is still using the disk.
^1da177e4c3f41 Linus Torvalds  2005-04-16  2003   */
31373d09da5b7f Matthew Garrett 2010-04-06 @2004  void laptop_io_completion(struct backing_dev_info *info)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2005  {
31373d09da5b7f Matthew Garrett 2010-04-06  2006  	mod_timer(&info->laptop_mode_wb_timer, jiffies + laptop_mode);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2007  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2008  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2009  /*
^1da177e4c3f41 Linus Torvalds  2005-04-16  2010   * We're in laptop mode and we've just synced. The sync's writes will have
^1da177e4c3f41 Linus Torvalds  2005-04-16  2011   * caused another writeback to be scheduled by laptop_io_completion.
^1da177e4c3f41 Linus Torvalds  2005-04-16  2012   * Nothing needs to be written back anymore, so we unschedule the writeback.
^1da177e4c3f41 Linus Torvalds  2005-04-16  2013   */
^1da177e4c3f41 Linus Torvalds  2005-04-16 @2014  void laptop_sync_completion(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2015  {
31373d09da5b7f Matthew Garrett 2010-04-06  2016  	struct backing_dev_info *bdi;
31373d09da5b7f Matthew Garrett 2010-04-06  2017  
31373d09da5b7f Matthew Garrett 2010-04-06  2018  	rcu_read_lock();
31373d09da5b7f Matthew Garrett 2010-04-06  2019  
31373d09da5b7f Matthew Garrett 2010-04-06  2020  	list_for_each_entry_rcu(bdi, &bdi_list, bdi_list)
31373d09da5b7f Matthew Garrett 2010-04-06  2021  		del_timer(&bdi->laptop_mode_wb_timer);
31373d09da5b7f Matthew Garrett 2010-04-06  2022  
31373d09da5b7f Matthew Garrett 2010-04-06  2023  	rcu_read_unlock();
^1da177e4c3f41 Linus Torvalds  2005-04-16  2024  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2025  

:::::: The code at line 2014 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
