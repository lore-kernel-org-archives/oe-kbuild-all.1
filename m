Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9D13A6F0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 04:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779357; cv=none; b=T0yHVQAKbfeFrf9FXTXVyXaYsmGt0ao9W+UXUOgNlIexFhYiH5hQb++evM5H+6Qct93H3D4mQ7mJYcd87JhH+1rh+cZFbq9PzmYT1UO3UcoG+YgJ+01o73WoBycwNIAPRMKuDJTHMbxuy5oBLwrPZ0rUZ6vukoGKvDBblGqp3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779357; c=relaxed/simple;
	bh=rp0vshVWs0GKUhuWhoRgxo9LGyBfZErGQpkzzt01j44=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sokVt0xIqJmh16yFuAqlnojzv9ZDXmvY0P/XMdO9/btt9sl/icpRK9JKPO2VAGrx3OsQfhhOMCHFhMQFwkODsSJiJ4o/U44VjOH/Wj1qrJReKLaKo7Agbxcp1r4UxROeMl2qcqcsN7aYIKwDav5zjl+edNpf43iwQw5METKEulI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5fjlKIu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5fjlKIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791779354; x=1823315354;
  h=date:from:to:cc:subject:message-id;
  bh=rp0vshVWs0GKUhuWhoRgxo9LGyBfZErGQpkzzt01j44=;
  b=j5fjlKIuWoEyVNK2m0fS1vVek3wTrFIe74rewfOX+BvzaJgTll+zzeRv
   EXHg1MB/OB6ZT3YW53Hvk3ncoIMB8844ZpwVg5j6igp2oTj40Pf85CASs
   XQPemYtM85PyxDNtHWEePiloQjpe6wXPzDejNf5r4ritJq4X3V958RMVT
   YHB7pOfyO99N+4PymM1vDi+rE5A2Z/qt0LUXSFTm4r+IKeFo+OQC2NT0N
   vUD4O2oSj1qabAZ4xrmzdvqDPsNVZ9Go6T9/D10t2QloIuV5VVAgOFzVx
   kz8POV2gzy7dIhF2WfEHGuTuMDVdUpuElMb592XMNTjAQTVl0dLfumRm4
   A==;
X-CSE-ConnectionGUID: w+jzNJUlQn+UNd7uckm+pg==
X-CSE-MsgGUID: 2d6DhOFyTtatnj/83Ws+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="486733"
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="486733"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 21:29:13 -0700
X-CSE-ConnectionGUID: n5Vln6V+Q6eutEAEyyMTVg==
X-CSE-MsgGUID: OQ26SI4ZQfWfr4xqU0nnCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,152,1787036400"; 
   d="scan'208";a="713278"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Oct 2026 21:29:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG7ev-000000009ut-2HYi;
	Mon, 12 Oct 2026 04:29:09 +0000
Date: Mon, 12 Oct 2026 06:28:40 +0200
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/main 128/167]
 include/linux/build_bug.h:80:41: error: static assertion failed:
 "!IS_ENABLED(CONFIG_SMP) || offsetof(struct nfs4_ff_layout_segment,
 mirror_array) + sizeof(struct nfs4_ff_layout_mirror *) <= offsetof(struct
 nfs4_ff_layout_segment, stripe_unit) + SMP_CACHE...
Message-ID: <202610120604.UNUmifmq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main
head:   790d686a2be11b8bd1a028272f63bd49da1f7666
commit: c94805d7f30429349e1b461328c356b6daeaf944 [128/167] pNFS/flexfiles: give the read-mostly layout segment fields their own cacheline
config: parisc-randconfig-2000-20261012 (https://download.01.org/0day-ci/archive/20261012/202610120604.UNUmifmq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610120604.UNUmifmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610120604.UNUmifmq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "!IS_ENABLED(CONFIG_SMP) || offsetof(struct nfs4_ff_layout_segment, mirror_array) + sizeof(struct nfs4_ff_layout_mirror *) <= offsetof(struct nfs4_ff_layout_segment, stripe_unit) + SMP_CACHE_BYTES"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:1092:1: note: in expansion of macro 'static_assert'
    1092 | static_assert(!IS_ENABLED(CONFIG_SMP) ||
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61  
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79 Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
