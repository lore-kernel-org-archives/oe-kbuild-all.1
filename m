Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDEA395
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 03:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686022072; x=1717558072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GaysWPqqiOEwZV79frigRNpxFsA8Yq8DNrQWHPODc9A=;
  b=oHidE7Na0mg8mOQ+DXUF6KQpt3ZoArc+mzAwunzgMVhffMlKm/cmU4PX
   J0JT1/BsUyJ1/Xr1U0PrBzr66mpCyY79s1ghJ1JobAnsHEM4XuNXVf1Xc
   pd4azD2JxkaKcwwpaiMByVREASvjnUotwOZq7yswx5CY7OYO/zJ5HYNkg
   99hgeJqJnEXBYetmMvhXwxWr0jvXPUHnAlVN8SwiL7Tq+MQaC5/s5lHpF
   itdsJh9bEcl+QDzS9TKmE0Eu7HibF+uZSKJ+h9KPw4rx6xnlEwlr+AOx3
   0Hi0048k26O8RziwfXHrxNR7+3xP+qAD8PtSQrx3X/g4AKrr6/0rgIfo0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="420099728"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="420099728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 20:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="703002535"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="703002535"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Jun 2023 20:27:50 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6NML-0004mH-1W;
	Tue, 06 Jun 2023 03:27:49 +0000
Date: Tue, 6 Jun 2023 11:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/posix 58/61] kernel/signal.c:2097:61: error:
 'kernel_siginfo_t' {aka 'struct kernel_siginfo'} has no member named 'list'
Message-ID: <202306061112.tUSPDz2k-lkp@intel.com>
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
commit: 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d [58/61] signal: Add list to track ignored posix timers
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230606/202306061112.tUSPDz2k-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel timers/posix
        git checkout 3ef2ce19cb1200cb49c61f9b3cef58c4b8a3a10d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306061112.tUSPDz2k-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:7,
                    from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/csky/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from kernel/signal.c:14:
   kernel/signal.c: In function 'posixtimer_sig_unignore':
>> kernel/signal.c:2097:61: error: 'kernel_siginfo_t' {aka 'struct kernel_siginfo'} has no member named 'list'
    2097 |                 if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
         |                                                             ^
   include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   kernel/signal.c:2097:21: note: in expansion of macro 'WARN_ON_ONCE'
    2097 |                 if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
         |                     ^~~~~~~~~~~~


vim +2097 kernel/signal.c

  2067	
  2068	static void posixtimer_sig_unignore(struct task_struct *tsk, int sig)
  2069	{
  2070		struct hlist_head *head = &tsk->signal->ignored_posix_timers;
  2071		struct hlist_node *tmp;
  2072		struct k_itimer *tmr;
  2073	
  2074		if (likely(hlist_empty(head)))
  2075			return;
  2076	
  2077		/*
  2078		 * Rearming a timer with sighand lock held is not possible due to
  2079		 * lock ordering vs. tmr::it_lock. Just stick the sigqueue back and
  2080		 * let the signal delivery path deal with it whether it needs to be
  2081		 * rearmed or not. This cannot be decided here w/o dropping sighand
  2082		 * lock and creating a loop retry horror show.
  2083		 */
  2084		hlist_for_each_entry_safe(tmr, tmp , head, ignored_list) {
  2085			struct task_struct *target;
  2086	
  2087			/*
  2088			 * tmr::sigq.info.si_signo is immutable, so accessing it
  2089			 * without holding tmr::it_lock is safe.
  2090			 */
  2091			if (tmr->sigq.info.si_signo != sig)
  2092				continue;
  2093	
  2094			hlist_del_init(&tmr->ignored_list);
  2095	
  2096			/* This should never happen and leaks a reference count */
> 2097			if (WARN_ON_ONCE(!list_empty(&tmr->sigq.info.list)))
  2098				continue;
  2099	
  2100			/*
  2101			 * Get the target for the signal. If target is a thread and
  2102			 * has exited by now, drop the reference count.
  2103			 */
  2104			target = posixtimer_get_target(tmr);
  2105			if (target)
  2106				posixtimer_queue_sigqueue(&tmr->sigq, target, tmr->it_pid_type);
  2107			else
  2108				posixtimer_putref(tmr);
  2109		}
  2110	}
  2111	#else /* CONFIG_POSIX_TIMERS */
  2112	static inline void posixtimer_sig_ignore(struct task_struct *tsk, struct sigqueue *q) { }
  2113	static inline void posixtimer_sig_unignore(struct task_struct *tsk, int sig) { }
  2114	#endif /* !CONFIG_POSIX_TIMERS */
  2115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
