Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0C3C23
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9iTF3Gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702805510; x=1734341510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IHge59k4u4BGOp9hMmdiyxdx5T9LWZPu0M3qWCypfI=;
  b=f9iTF3GdO16M7lb6DtwR9NTlWCZnDHZQONkPQFUvI2UisE8T2WR8Aa2E
   UKUg9k0BDzWQJjl6OhzTjpvONlEKFur+i82uqvfYsW6fyBsei/mC9qrjB
   8fY3tQ7eR7dhVFtwmIsBhHP/fVOAeKyDcZBeYAIUg/No/0vLEBoA2ozI3
   0xPGtCYhdHLWznGG3tFKGZklh60Pq0mpevHw/9qjs9oFbZA3bDe/vU5ub
   4cXFXQaWRxgJGDP0TQsIEzfGBikubTKkZhlRp1yAw8ffAqUrEByH4CkqH
   JlxidH2WL10oryPSHDvRhLsmeUtEIVeCl4N9VkP+h6p9/Sg1NcdYvu5aW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395145063"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="395145063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 01:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="23375127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Dec 2023 01:31:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEnUv-0002tg-2Z;
	Sun, 17 Dec 2023 09:31:45 +0000
Date: Sun, 17 Dec 2023 17:31:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 23/50] kernel/async.c:124:31: error:
 implicit declaration of function 'task_pid_nr'
Message-ID: <202312171723.crLIX6NW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   7288b19e061b7aa3f46f685e9944af128f10ffd5
commit: 90ffe33a843d713946918328956c4b72f662e7ce [23/50] sched.h: move pid helpers to pid.h
config: i386-randconfig-012-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171723.crLIX6NW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171723.crLIX6NW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312171723.crLIX6NW-lkp@intel.com/

Note: the bcachefs/header_cleanup HEAD 7288b19e061b7aa3f46f685e9944af128f10ffd5 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/current.h:10,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/async.h:14,
                    from kernel/async.c:47:
   kernel/async.c: In function 'async_run_entry_fn':
>> kernel/async.c:124:31: error: implicit declaration of function 'task_pid_nr' [-Werror=implicit-function-declaration]
     124 |                  entry->func, task_pid_nr(current));
         |                               ^~~~~~~~~~~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:585:9: note: in expansion of macro 'no_printk'
     585 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   kernel/async.c:123:9: note: in expansion of macro 'pr_debug'
     123 |         pr_debug("calling  %lli_%pS @ %i\n", (long long)entry->cookie,
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/task_pid_nr +124 kernel/async.c

22a9d645677feef Arjan van de Ven 2009-01-07   46  
22a9d645677feef Arjan van de Ven 2009-01-07  @47  #include <linux/async.h>
84c15027a7f2fbd Paul McQuade     2011-05-31   48  #include <linux/atomic.h>
84c15027a7f2fbd Paul McQuade     2011-05-31   49  #include <linux/ktime.h>
9984de1a5a8a962 Paul Gortmaker   2011-05-23   50  #include <linux/export.h>
22a9d645677feef Arjan van de Ven 2009-01-07   51  #include <linux/wait.h>
22a9d645677feef Arjan van de Ven 2009-01-07   52  #include <linux/sched.h>
5a0e3ad6af8660b Tejun Heo        2010-03-24   53  #include <linux/slab.h>
083b804c4d3e1e3 Tejun Heo        2010-07-02   54  #include <linux/workqueue.h>
22a9d645677feef Arjan van de Ven 2009-01-07   55  
84b233adcca3cac Tejun Heo        2013-01-18   56  #include "workqueue_internal.h"
84b233adcca3cac Tejun Heo        2013-01-18   57  
22a9d645677feef Arjan van de Ven 2009-01-07   58  static async_cookie_t next_cookie = 1;
22a9d645677feef Arjan van de Ven 2009-01-07   59  
22a9d645677feef Arjan van de Ven 2009-01-07   60  #define MAX_WORK		32768
c68eee14ec2da34 Tejun Heo        2013-01-23   61  #define ASYNC_COOKIE_MAX	ULLONG_MAX	/* infinity cookie */
22a9d645677feef Arjan van de Ven 2009-01-07   62  
9fdb04cdc5566d6 Tejun Heo        2013-01-23   63  static LIST_HEAD(async_global_pending);	/* pending from all registered doms */
8723d5037cafea0 Tejun Heo        2013-01-23   64  static ASYNC_DOMAIN(async_dfl_domain);
22a9d645677feef Arjan van de Ven 2009-01-07   65  static DEFINE_SPINLOCK(async_lock);
22a9d645677feef Arjan van de Ven 2009-01-07   66  
22a9d645677feef Arjan van de Ven 2009-01-07   67  struct async_entry {
9fdb04cdc5566d6 Tejun Heo        2013-01-23   68  	struct list_head	domain_list;
9fdb04cdc5566d6 Tejun Heo        2013-01-23   69  	struct list_head	global_list;
083b804c4d3e1e3 Tejun Heo        2010-07-02   70  	struct work_struct	work;
22a9d645677feef Arjan van de Ven 2009-01-07   71  	async_cookie_t		cookie;
362f2b098b188ed Lai Jiangshan    2013-03-12   72  	async_func_t		func;
22a9d645677feef Arjan van de Ven 2009-01-07   73  	void			*data;
8723d5037cafea0 Tejun Heo        2013-01-23   74  	struct async_domain	*domain;
22a9d645677feef Arjan van de Ven 2009-01-07   75  };
22a9d645677feef Arjan van de Ven 2009-01-07   76  
22a9d645677feef Arjan van de Ven 2009-01-07   77  static DECLARE_WAIT_QUEUE_HEAD(async_done);
22a9d645677feef Arjan van de Ven 2009-01-07   78  
22a9d645677feef Arjan van de Ven 2009-01-07   79  static atomic_t entry_count;
22a9d645677feef Arjan van de Ven 2009-01-07   80  
07416af11dd85ca Rasmus Villemoes 2021-05-06   81  static long long microseconds_since(ktime_t start)
07416af11dd85ca Rasmus Villemoes 2021-05-06   82  {
07416af11dd85ca Rasmus Villemoes 2021-05-06   83  	ktime_t now = ktime_get();
07416af11dd85ca Rasmus Villemoes 2021-05-06   84  	return ktime_to_ns(ktime_sub(now, start)) >> 10;
07416af11dd85ca Rasmus Villemoes 2021-05-06   85  }
07416af11dd85ca Rasmus Villemoes 2021-05-06   86  
8723d5037cafea0 Tejun Heo        2013-01-23   87  static async_cookie_t lowest_in_progress(struct async_domain *domain)
37a76bd4f1b7169 Arjan van de Ven 2009-01-11   88  {
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   89  	struct async_entry *first = NULL;
52722794d6a4816 Tejun Heo        2013-01-23   90  	async_cookie_t ret = ASYNC_COOKIE_MAX;
37a76bd4f1b7169 Arjan van de Ven 2009-01-11   91  	unsigned long flags;
37a76bd4f1b7169 Arjan van de Ven 2009-01-11   92  
37a76bd4f1b7169 Arjan van de Ven 2009-01-11   93  	spin_lock_irqsave(&async_lock, flags);
9fdb04cdc5566d6 Tejun Heo        2013-01-23   94  
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   95  	if (domain) {
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   96  		if (!list_empty(&domain->pending))
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   97  			first = list_first_entry(&domain->pending,
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   98  					struct async_entry, domain_list);
4f7e988e63e3368 Rasmus Villemoes 2018-02-06   99  	} else {
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  100  		if (!list_empty(&async_global_pending))
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  101  			first = list_first_entry(&async_global_pending,
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  102  					struct async_entry, global_list);
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  103  	}
9fdb04cdc5566d6 Tejun Heo        2013-01-23  104  
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  105  	if (first)
4f7e988e63e3368 Rasmus Villemoes 2018-02-06  106  		ret = first->cookie;
9fdb04cdc5566d6 Tejun Heo        2013-01-23  107  
37a76bd4f1b7169 Arjan van de Ven 2009-01-11  108  	spin_unlock_irqrestore(&async_lock, flags);
37a76bd4f1b7169 Arjan van de Ven 2009-01-11  109  	return ret;
37a76bd4f1b7169 Arjan van de Ven 2009-01-11  110  }
083b804c4d3e1e3 Tejun Heo        2010-07-02  111  
22a9d645677feef Arjan van de Ven 2009-01-07  112  /*
22a9d645677feef Arjan van de Ven 2009-01-07  113   * pick the first pending entry and run it
22a9d645677feef Arjan van de Ven 2009-01-07  114   */
083b804c4d3e1e3 Tejun Heo        2010-07-02  115  static void async_run_entry_fn(struct work_struct *work)
22a9d645677feef Arjan van de Ven 2009-01-07  116  {
083b804c4d3e1e3 Tejun Heo        2010-07-02  117  	struct async_entry *entry =
083b804c4d3e1e3 Tejun Heo        2010-07-02  118  		container_of(work, struct async_entry, work);
22a9d645677feef Arjan van de Ven 2009-01-07  119  	unsigned long flags;
07416af11dd85ca Rasmus Villemoes 2021-05-06  120  	ktime_t calltime;
22a9d645677feef Arjan van de Ven 2009-01-07  121  
52722794d6a4816 Tejun Heo        2013-01-23  122  	/* 1) run (and print duration) */
07416af11dd85ca Rasmus Villemoes 2021-05-06  123  	pr_debug("calling  %lli_%pS @ %i\n", (long long)entry->cookie,
58763a297405024 Andrew Morton    2009-02-04 @124  		 entry->func, task_pid_nr(current));
22a9d645677feef Arjan van de Ven 2009-01-07  125  	calltime = ktime_get();
07416af11dd85ca Rasmus Villemoes 2021-05-06  126  
22a9d645677feef Arjan van de Ven 2009-01-07  127  	entry->func(entry->data, entry->cookie);
07416af11dd85ca Rasmus Villemoes 2021-05-06  128  
8ba9d40b6b2bf62 Rasmus Villemoes 2021-05-06  129  	pr_debug("initcall %lli_%pS returned after %lld usecs\n",
07416af11dd85ca Rasmus Villemoes 2021-05-06  130  		 (long long)entry->cookie, entry->func,
07416af11dd85ca Rasmus Villemoes 2021-05-06  131  		 microseconds_since(calltime));
22a9d645677feef Arjan van de Ven 2009-01-07  132  
52722794d6a4816 Tejun Heo        2013-01-23  133  	/* 2) remove self from the pending queues */
22a9d645677feef Arjan van de Ven 2009-01-07  134  	spin_lock_irqsave(&async_lock, flags);
9fdb04cdc5566d6 Tejun Heo        2013-01-23  135  	list_del_init(&entry->domain_list);
9fdb04cdc5566d6 Tejun Heo        2013-01-23  136  	list_del_init(&entry->global_list);
22a9d645677feef Arjan van de Ven 2009-01-07  137  
52722794d6a4816 Tejun Heo        2013-01-23  138  	/* 3) free the entry */
22a9d645677feef Arjan van de Ven 2009-01-07  139  	kfree(entry);
22a9d645677feef Arjan van de Ven 2009-01-07  140  	atomic_dec(&entry_count);
22a9d645677feef Arjan van de Ven 2009-01-07  141  
22a9d645677feef Arjan van de Ven 2009-01-07  142  	spin_unlock_irqrestore(&async_lock, flags);
22a9d645677feef Arjan van de Ven 2009-01-07  143  
52722794d6a4816 Tejun Heo        2013-01-23  144  	/* 4) wake up any waiters */
22a9d645677feef Arjan van de Ven 2009-01-07  145  	wake_up(&async_done);
22a9d645677feef Arjan van de Ven 2009-01-07  146  }
22a9d645677feef Arjan van de Ven 2009-01-07  147  

:::::: The code at line 124 was first introduced by commit
:::::: 58763a297405024d23d8f1d0bba3e6603660c4b6 kernel/async.c: fix printk warnings

:::::: TO: Andrew Morton <akpm@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
