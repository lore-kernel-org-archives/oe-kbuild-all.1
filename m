Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C87FBAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 21:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711142022; cv=none; b=gdYyuZKtWQJzNo7MUUnRpbyJmv2Kk/Eg5SLEgrYzaEFH3+ypXdfEU1mnZmfybmBCg8LY+yyI4+hxgCQhDZamWBEjH0Bf07CElVHh8CLXPMwfn1GMOIPTUex2kGo3tJGVebrvyGHxe10UfGNg8PZyh+75lZGgljsk1NUDkiyxIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711142022; c=relaxed/simple;
	bh=d4wXg0zdFGWl3dt8AEYgyDp0m3LiJatCemAfJcraw4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EL80RIkayQNkYaVWf65i7r6xa+1hsc2fFv1pgR1wClE4geCnq4R1IVC+4Vof/yRhkqHq1xYqsyZkbSxuWRz8J8UmD4XiYAfjQCrq3dizJHVMY5VNbORoCmtvMefuCFSetmh0B7e+R0e3PDQCFK8Wqsw7EF4kSq6g73OaBijct4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kbb3zjUi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kbb3zjUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711142021; x=1742678021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d4wXg0zdFGWl3dt8AEYgyDp0m3LiJatCemAfJcraw4E=;
  b=Kbb3zjUiMTfm2oWi5KJz0UY0N0CDjwOsW5lgWePhH5AZv0TLwDKlVSI6
   CvwKLVvcep3HtHwH1/MJW3tjzai457vpQSZpmYKR58udOb1gOyAejv3rL
   o/SnnkV+PmNxbhyi/8MZ1QA/hiac3qHUMACleWAKv/KkxyVJPCrYGQ9pB
   ude4yj+rUoY3Pd3bJ1phu7NO6qojICeFT+RrW2ArwHL99xh+O20jI9SUa
   UU5w3lYM41h4tYyUKP497k8L3BaGkddkZvRwdgMSK6iLoGjn9SrVkE+Ym
   CJUueMJ6/T/wxaD7YzeyAKxeWQTIENyUZfkW0YNSBxUBMHLl0xSUSEOrE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6039776"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6039776"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 14:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="14945512"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2024 14:13:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnmCk-000KcX-27;
	Fri, 22 Mar 2024 21:13:34 +0000
Date: Sat, 23 Mar 2024 05:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 57/67] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_rx_queue,
 __cacheline_group_end__read_mostly) - offsetofend(struct idpf_rx_queue,
 __cacheline_group_begin__read_mostly) <= ALIGN(((((64)) +
 ((__typeof__((64)))((32)) - ...
Message-ID: <202403230555.nUuys8Kg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   b336f2db592517d25e745924c92e8604eeea0502
commit: 98332c2ffce8b6aac8462b91b765bf4c0eab242c [57/67] idpf: prepare structures to support xdp
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240323/202403230555.nUuys8Kg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230555.nUuys8Kg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230555.nUuys8Kg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/timer.h:5,
                    from include/linux/netdevice.h:24,
                    from include/trace/events/xdp.h:8,
                    from include/linux/bpf_trace.h:5,
                    from include/net/libeth/xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/idpf_xdp.c:4:
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_q_vector, __cacheline_group_end__read_write) - offsetofend(struct idpf_q_vector, __cacheline_group_begin__read_write) <= ALIGN(672, __IDPF_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:356:9: note: in expansion of macro 'static_assert'
     356 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:477:1: note: in expansion of macro '__idpf_cacheline_group_assert'
     477 | __idpf_cacheline_group_assert(struct idpf_q_vector, read_write, 672);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_rx_queue, __cacheline_group_end__read_mostly) - offsetofend(struct idpf_rx_queue, __cacheline_group_begin__read_mostly) <= ALIGN(((((64)) + ((__typeof__((64)))((32)) - 1)) & ~((__typeof__((64)))((32)) - 1)) + 32, __IDPF_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:356:9: note: in expansion of macro 'static_assert'
     356 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:363:9: note: in expansion of macro '__idpf_cacheline_group_assert'
     363 |         __idpf_cacheline_group_assert(type, read_mostly, ro);               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:622:1: note: in expansion of macro '__idpf_cacheline_queue_assert'
     622 | __idpf_cacheline_queue_assert(struct idpf_rx_queue,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= ALIGN(96, __IDPF_LARGEST_ALIGN)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:356:9: note: in expansion of macro 'static_assert'
     356 |         static_assert(offsetof(type, __cacheline_group_end__##grp) -        \
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:364:9: note: in expansion of macro '__idpf_cacheline_group_assert'
     364 |         __idpf_cacheline_group_assert(type, read_write, rw);                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:766:1: note: in expansion of macro '__idpf_cacheline_queue_assert'
     766 | __idpf_cacheline_queue_assert(struct idpf_tx_queue, 64, 96, 32);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07 @77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  
07a368b3f55a79 Maxim Levitsky   2022-10-25  80  

:::::: The code at line 78 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
