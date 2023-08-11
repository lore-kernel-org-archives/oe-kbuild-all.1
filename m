Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6898CA2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691720978; x=1723256978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10OCXvODrWOKM23FmdroVFcSOi/dlB1jJupfTvF/uVM=;
  b=aAbxvfQWKanWi+IxjYsphHsU+giBB4slZ0zodOUStw3dni0mFyXoeCRT
   kUUJqU8qgAMnb7cE2x0GNcp4G7RWxDPjLXdDUjd9RbluDBhP7bd1pMCHj
   Id+ly1T6HXWKKVsNnL+8tV0ZKcjZsSXj4p26bukCED+KbdTGNVdwE/u0+
   T27Abwt7AhVwU5zuDfrrJvhnZUwiCTlXOdjwW4bUCR6NxSdp8IYEnQW3S
   1+GCYUqdpdUjgDa93kCUxisROb/xT0O4s/eavTXevWmVLlUwjeh0B4Qjv
   FJmYz8zG5a7uNLnRSo2H2ZgjTe3Uo+6mX0No0ENHk62+NWV6GO5gfoxII
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714429"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="361714429"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 19:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856126621"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="856126621"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 19:29:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUHu2-0007Qa-0o;
	Fri, 11 Aug 2023 02:29:26 +0000
Date: Fri, 11 Aug 2023 10:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qing Zhang <zhangqing@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1
 (different address spaces)
Message-ID: <202308111025.QvCwtqk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qing,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25aa0bebba72b318e71fe205bfd1236550cc9534
commit: 93a4fa622eb061f75f87f0cf9609ab4e69c67d01 LoongArch: Add STACKTRACE support
date:   12 months ago
config: loongarch-randconfig-r072-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111025.QvCwtqk7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111025.QvCwtqk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111025.QvCwtqk7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got unsigned int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got unsigned int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got unsigned int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got unsigned int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got int [noderef] __percpu *
>> fs/eventpoll.c:620:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:620:9: sparse:     expected void *ptr
   fs/eventpoll.c:620:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:692:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:692:9: sparse:     expected void *ptr
   fs/eventpoll.c:692:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1456:9: sparse:     expected void *ptr
   fs/eventpoll.c:1456:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1571:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1571:9: sparse:     expected void *ptr
   fs/eventpoll.c:1571:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got unsigned int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got int [noderef] __percpu *
   fs/eventpoll.c:1775:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   fs/eventpoll.c:1775:9: sparse:     expected void *ptr
   fs/eventpoll.c:1775:9: sparse:     got int [noderef] __percpu *

vim +620 fs/eventpoll.c

eea1d585917c53 Eric Wong       2013-04-30  604  
92e64178405599 Davidlohr Bueso 2018-08-21  605  
5071f97ec6d74f Davide Libenzi  2009-03-31  606  /*
57804b1cc46167 Al Viro         2020-08-31  607   * ep->mutex needs to be held because we could be hit by
e057e15ff66a62 Tony Battersby  2009-03-31  608   * eventpoll_release_file() and epoll_ctl().
5071f97ec6d74f Davide Libenzi  2009-03-31  609   */
57804b1cc46167 Al Viro         2020-08-31  610  static void ep_start_scan(struct eventpoll *ep, struct list_head *txlist)
57804b1cc46167 Al Viro         2020-08-31  611  {
5071f97ec6d74f Davide Libenzi  2009-03-31  612  	/*
5071f97ec6d74f Davide Libenzi  2009-03-31  613  	 * Steal the ready list, and re-init the original one to the
5071f97ec6d74f Davide Libenzi  2009-03-31  614  	 * empty list. Also, set ep->ovflist to NULL so that events
5071f97ec6d74f Davide Libenzi  2009-03-31  615  	 * happening while looping w/out locks, are not lost. We cannot
5071f97ec6d74f Davide Libenzi  2009-03-31  616  	 * have the poll callback to queue directly on ep->rdllist,
5071f97ec6d74f Davide Libenzi  2009-03-31  617  	 * because we want the "sproc" callback to be able to do it
5071f97ec6d74f Davide Libenzi  2009-03-31  618  	 * in a lockless way.
5071f97ec6d74f Davide Libenzi  2009-03-31  619  	 */
57804b1cc46167 Al Viro         2020-08-31 @620  	lockdep_assert_irqs_enabled();
a218cc4914209a Roman Penyaev   2019-03-07  621  	write_lock_irq(&ep->lock);
db502f8a3b0bb5 Al Viro         2020-08-31  622  	list_splice_init(&ep->rdllist, txlist);
c5a282e9635e9c Davidlohr Bueso 2019-01-03  623  	WRITE_ONCE(ep->ovflist, NULL);
a218cc4914209a Roman Penyaev   2019-03-07  624  	write_unlock_irq(&ep->lock);
db502f8a3b0bb5 Al Viro         2020-08-31  625  }
5071f97ec6d74f Davide Libenzi  2009-03-31  626  

:::::: The code at line 620 was first introduced by commit
:::::: 57804b1cc4616780c72a2d0930d1bd0d5bd3ed4c lift locking/unlocking ep->mtx out of ep_{start,done}_scan()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
