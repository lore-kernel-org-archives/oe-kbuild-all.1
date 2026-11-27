Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793321;
	b=XnvBX5z+ZjOFaBXOt6j0bxejdmsFqfPXH38vpoDhvm/ik7IOhYL2dsDFLZ2r41x7ljpq
	 YkvMJulQVxSiHl6h7ffaiAHli/JFRFgZvT8ZQZDbtbtmHtKOJRF7agosw1TY5sG2mOWAl
	 nnDsRIY7OaxhyudMrIGU9Z8/EDCsYTl1STV5TfF+8FaeX2MpvysYHlxSc3Tqx8iUkFvnc
	 LasL4MuP0UAA+BrZ9hWGqcJ5uWdJQyLi2KAAyUEQOzmp/q61ysC2p7Ja7wOzaxzV4bt9Q
	 cMrzO3vWOcVpAyBsyNEA7DSJXBl95gY6L//ICMiNpj3DkSR+1MfMYw+3YOYfnInb1bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793321;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lOsmkCIVmwz2EccSAOFc5Uwevo8zOu4Bf0Bl9StvPkk=;
	b=HfiBlHkhWr1ePENv/16SPAbSsactp+BnuAt3+ZBG1jJ6kp0ilIdoUhBrrzBL0c+uS3jv
	 HOQaqD9gjEbUqxRBW1qhRZqkXaQjpBeSGhKGD6BeTn75PKR4RnSqf8mW+V409oGR+mHGu
	 J456ArFP6gHJ9SzBifAmCpFN04UahNF5O26DJzF6bh5UDOtJj4IO9RUTfdgqz9vX3aaqv
	 wyONONurjJKmvf21kF6DqacVxofbxNIW/QWUNh5zAOP6XOoRpU3c62qX2pG5QdytM2KL0
	 b6soUV/MCCWLaXEnZCOWSs0Jpm8FQdVLwz1o/P/0KPvlZ2BvPWHCpCB6k3WF1ezkGKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="DFE/lEDQ";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32207606A685
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 15:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32207606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DFE/lEDQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795793321; x=1827329321;
  h=date:from:to:cc:subject:message-id;
  bh=M7kGxynaUC3OOPtYXMoqGXhA1ym+5Zs/tyCqYyqfC/Y=;
  b=DFE/lEDQQYadXEN9kDZ2tBEYjsXL9UVPlPLXudF0Db66dG2c3vxoAerA
   eryRnLK4GM+TbFth5Dg2JxItF6gRY+A9SBH3/lu59ltCn8LFlLBpuzO29
   oQSAuiyEPim0LhxJoeX/OonZ1ll2ErcOFbavDVbu97NbunpzjEYmYQ/v2
   aYI4aDA9/d4wPo6DuQHBARIJKXxsw2tYbMx48AwFlckuCpAoS3ADJVjdi
   nBrFM3FN8NNUL3yIGx0gg9IQR9r0gb4kEz+mPwkho7UjvP6vaD6gTm/wv
   P1cONXl5qEtqrdEMr/PlRmMKn+B79URTnQ0hlYWFkzFJ00YAZklSc3dOr
   A==;
X-CSE-ConnectionGUID: IlrufSXjQqmFOgO2UErmTg==
X-CSE-MsgGUID: kwmIVgqWRT+/5fjvJDv6Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4714126"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4714126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 07:28:40 -0800
X-CSE-ConnectionGUID: 7Dxmf1M/SkeTTWzoQJB1fw==
X-CSE-MsgGUID: ySOgsZF8QoWcNJ2boPgaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12306296"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2026 07:28:39 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWxsL-000000000DP-12j8;
	Fri, 27 Nov 2026 15:28:37 +0000
Date: Fri, 27 Nov 2026 16:27:57 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 260/348] include/linux/build_bug.h:80:41:
 error: static assertion failed: "sizeof(struct bpf_coro_frame_hdr) ==
 BPF_CORO_FRAME_HDR"
Message-ID: <20261127162306.8GQMJUFB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux fermata
head:   1d98f92a7b37670e804415b13c1d5d039706d4ce
commit: d2483ddc31994982d3337aa5d7edcabe4e6bc61f [260/348] bpf: Register the kfuncs that give out a coroutine frame in a host
config: sparc-randconfig-2200-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127162306.8GQMJUFB-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127162306.8GQMJUFB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127162306.8GQMJUFB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/getorder.h:8,
                    from arch/sparc/include/asm/page_32.h:136,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/string_32.h:13,
                    from arch/sparc/include/asm/string.h:7,
                    from include/linux/string.h:65,
                    from include/crypto/sha2.h:10,
                    from include/linux/bpf.h:11,
                    from kernel/bpf/coro.c:5:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   kernel/bpf/coro.c:46:1: note: in expansion of macro 'static_assert'
      46 | static_assert(sizeof(struct bpf_coro_frame_hdr) == BPF_CORO_FRAME_HDR);
         | ^~~~~~~~~~~~~
   kernel/bpf/coro.c: In function '__bpf_coro_run':
   kernel/bpf/coro.c:1003:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    1003 |         u64 ret, kind;
         |             ^~~


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
