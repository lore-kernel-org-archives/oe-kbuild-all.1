Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B9153BFE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 12:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711368356; cv=none; b=INttgCp5SHgAlIdGeHl+QLhoqasz0rRtA7Uj1jpiXzOjUi4WXMATYw4pLwMyHFnfsGvVELnnpMwKV3O3EeqG/H3bOUyK9O/Y6WkO5eaTg0Mc77J5qp3QUoW3FgUayWS8gJYslQZ+5WCnQxtlBc2MtfVd89SNDpQf26bTkH/TL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711368356; c=relaxed/simple;
	bh=QPTWiqVBZJxWOQ0kGElZgD5VHjopA0aHgXMFM5Ke5oE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4wHUhohpQL2vD9qQtjtfG5hRXI89zUCVK+plA6W5NO14cBG2c5aB9cdc5B5G+Nqsqg7YKjNhvnzdedwd9McfPWlUvhI1Fy7Q/2pVYHs6jj+11vz0xHyRAcVu8JEMrozU4/jn85h5DNnMTbJ2BVd6gAkXZTgTLQlYwfc/ncAvvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhCKBPLb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhCKBPLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711368354; x=1742904354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QPTWiqVBZJxWOQ0kGElZgD5VHjopA0aHgXMFM5Ke5oE=;
  b=FhCKBPLbjX7+WTrOEEYev/Cf6auUYN+RUyspp7ApSRHX0C08nO1DbUNN
   JPKY75I8fLJXHXMcBQjjAGNFnTymE45jiC+zPZ1LFMohfhDQhED/1JggU
   hmto4knHl8HOMVzcI7+6VyEMD9OIQf7vv3+oMsknMOOVD9nA9HeMTJkVL
   FLsI9TicP++mPZA2R58YtxI4diy00t/QgOkwCwpdQuhbFSxS9IPzgCZzT
   P4o1EveK1xF8+TU36lA4sPKEq4k5Nv03b1plLEN3Gw8vvPC7haO9/gnmW
   +jacy//hESe9RjsCGwC7aBfV6wbH+3dHjB8h6gRnB1ydD8T+jjeEswC1K
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6259728"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6259728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 05:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="20263086"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2024 05:05:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roj5J-000MWS-0r;
	Mon, 25 Mar 2024 12:05:49 +0000
Date: Mon, 25 Mar 2024 20:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie-new 57/67] include/linux/build_bug.h:78:41:
 error: static assertion failed: "offsetof(struct idpf_tx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue,
 __cacheline_group_begin__read_write) <= ALIGN(96, __IDPF_LARGEST_ALIGN)"
Message-ID: <202403251915.4cE9OHZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   ff866d5301aaf762ba90121e4e0a6a0bb65aeeda
commit: 98332c2ffce8b6aac8462b91b765bf4c0eab242c [57/67] idpf: prepare structures to support xdp
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240325/202403251915.4cE9OHZX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403251915.4cE9OHZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403251915.4cE9OHZX-lkp@intel.com/

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
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue, __cacheline_group_begin__read_write) <= ALIGN(96, __IDPF_LARGEST_ALIGN)"
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
6bab69c65013be Rasmus Villemoes 2019-03-07  77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
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
