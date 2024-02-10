Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3F5F84E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707603283; cv=none; b=ffeHXd4ohawcmlKqFpNgZCAAL5mzqRz9P+vWyT9H4hBTtFvV0/T6F8XTWolmqlLyV0sKiLbrImb6SqXtc7/AYdDwY0bmXbiNRQqyN5RJXajVFBf0UClBXrXjobdDpWAPnf400YAVSfUR422fx5sOgDBJyUWBiFiNlHJ5jN26guQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707603283; c=relaxed/simple;
	bh=pIedGye6vs6KwsbmTN5nzBqXqHqRDmX3bas0UKsM68E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XAr5wN+S/X2tss6dE+XM9YHe2A+RLt9AaL/WxFhQ7lLg3RuSkwYcA7PyoO07WTkIvAN4YHxeBGwK+3z0vF1bec9CpMSRIcvOcqDZK66ZfsYhOvSmTrwMXjwSfLQ4GyXOoGln4xadqECzNy2tUwHyNg5f2RYA1mtYGyHCTJmMNyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2tx2tgL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2tx2tgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707603282; x=1739139282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIedGye6vs6KwsbmTN5nzBqXqHqRDmX3bas0UKsM68E=;
  b=Q2tx2tgLCksvfxn7ejhrJGf6nkKSlVnPI6J2vyImv2Auhw/+wn5LrO9h
   T3aZ9w5nLVhiYkS+u95X1QaAswfRJf+2BjV5ljR749unuc7oW/4/n+YWd
   DTYwjqs0WOKvu9WTI/CgvE5Ob6H5vqUdg0+zwhYxegCeQrQ+WY4K2AcTJ
   N/beZo1O1iPXuQJ5Iw/kYM8rPy6ADkuIl9PLjiX1ZeIvn9NpIDTr6FvKY
   eBOyIvujYMVbJqAGUMVozpfneMok2IWcxOgQiY4cQDy83OCMcpXKgGtE6
   2334DaxyP9h50q+0tgEJbeM8QD0PYzsqEHzV5rk/fK+bF8zx+BzvZECGR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="27043457"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="27043457"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 14:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="825461105"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="825461105"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Feb 2024 14:14:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYvcL-00068o-2u;
	Sat, 10 Feb 2024 22:14:37 +0000
Date: Sun, 11 Feb 2024 06:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered-iomap 42/93] include/linux/build_bug.h:78:41:
 error: static assertion failed: "min(pos + write_bytes, isize) signedness
 error, fix types or consider umin() before min_t()"
Message-ID: <202402110641.Wo5oJSul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered-iomap
head:   7cb60beb922ba5589e5aea0181ced3e235df7435
commit: 91d068db5f009b134b22693519136ac8ffa8bb72 [42/93] btrfs: lock until inode size while performing writes
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240211/202402110641.Wo5oJSul-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110641.Wo5oJSul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110641.Wo5oJSul-lkp@intel.com/

Note: the goldwynr/buffered-iomap HEAD 7cb60beb922ba5589e5aea0181ced3e235df7435 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/btrfs/file.c:6:
   fs/btrfs/file.c: In function 'lock_and_cleanup_extent_if_need':
>> include/linux/build_bug.h:78:41: error: static assertion failed: "min(pos + write_bytes, isize) signedness error, fix types or consider umin() before min_t()"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
      85 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/btrfs/file.c:1004:20: note: in expansion of macro 'min'
    1004 |         last_pos = min(pos + write_bytes, isize);
         |                    ^~~


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
