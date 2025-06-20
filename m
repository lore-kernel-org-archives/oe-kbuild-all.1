Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99E30E830
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750442571; cv=none; b=uJ/zQPMYyER5G49bLQZ8oBEO8CkW1jXL0xt6Q1CjaodiOv++4Hlxbwz/5kQKEi4un8ZzKGWxlVJtJtxMHutgMGPCvW3DxU+S74QtcDvBnzTXPlh+Kq3FLGxo2DEdiESdR6prNOD2mcnj9CHAxJYny5s6e1VsTb0Nkh+Lh9hsl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750442571; c=relaxed/simple;
	bh=6s8h4vDW+zSf/3YP1upoqeyXxDO3uz1GLgk7Qf2/5vw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cm0eM6xfBtb3zKeF26Uwk7kpgsrM/VtlGgxoEu+OhcFA1hrzh0G/BgXFkAK/tR1DpGKL9ZiH+2PPbXkY/9JjRJ+iO24AsF4BhgT2SrJAXXpV++HMQbKsVOSvbuAV9Kmht86MmhxuqkuWkyzdggpNmhzR5bvfFd3J3gC42hXghtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0F6FNfL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0F6FNfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750442570; x=1781978570;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6s8h4vDW+zSf/3YP1upoqeyXxDO3uz1GLgk7Qf2/5vw=;
  b=O0F6FNfLiCKWjTzidACe7DAqfs8aNsJ1IkOaNQrhWi/4f8jgSTgYW67V
   toCLT7mM39HOeeTfxI0g77RMqGo/Cn0x+a3GqKP9bqgXDtKDEPvxLy66P
   qHpwgSykLxa8/buphM+bPA0OO+95/IbEo37eQPlnB8jLGdBwFmMLIK583
   4518zBvrtMldeswJx8Q8A0FVZ8rDDxtuwnEO5P0PgADiTJnlZbwPhgJeI
   QaVpTkwsTMfw8qzn7uXDCfJj9HZF27JOy7sE+QCRE+N0lrWzdtxnzIRBY
   QEpcCFukoO5jrlj0LvOUWbkd7wPZUQNZ1+mYcU8ZTi6zyEvC5Qz53iz5h
   A==;
X-CSE-ConnectionGUID: 9oQmfvGXTT+8eCYdbtuiNw==
X-CSE-MsgGUID: dZB8o40uRwaPG237mS6ATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="56392085"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="56392085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 11:02:49 -0700
X-CSE-ConnectionGUID: yjm12czVTPOMfwqOjr141g==
X-CSE-MsgGUID: Ge5QO8OvQFe6gG4rbUcmZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151658981"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Jun 2025 11:02:48 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSg4c-000M2c-09;
	Fri, 20 Jun 2025 18:02:46 +0000
Date: Sat, 21 Jun 2025 02:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 9/10] include/linux/stddef.h:16:32:
 error: 'struct ftrace_ops' has no member named 'direct_call'
Message-ID: <202506210103.YQAlm8Tu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: d114e5a0a91dffac5b78182db09911de242dcd55 [9/10] Revert "ftrace: Store direct called addresses in their ops"
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250621/202506210103.YQAlm8Tu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210103.YQAlm8Tu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210103.YQAlm8Tu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:23:
   arch/arm64/kernel/asm-offsets.c: In function 'main':
>> include/linux/stddef.h:16:32: error: 'struct ftrace_ops' has no member named 'direct_call'
      16 | #define offsetof(TYPE, MEMBER) __builtin_offsetof(TYPE, MEMBER)
         |                                ^~~~~~~~~~~~~~~~~~
   include/linux/kbuild.h:6:62: note: in definition of macro 'DEFINE'
       6 |  asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
         |                                                              ^~~
   arch/arm64/kernel/asm-offsets.c:183:34: note: in expansion of macro 'offsetof'
     183 |   DEFINE(FTRACE_OPS_DIRECT_CALL, offsetof(struct ftrace_ops, direct_call));
         |                                  ^~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/arm64/kernel/asm-offsets.s] Error 1 shuffle=560432283
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2 shuffle=560432283
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=560432283
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=560432283
   make: Target 'prepare' not remade because of errors.


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

:::::: The code at line 16 was first introduced by commit
:::::: 14e83077d55ff4b88fe39f5e98fb8230c2ccb4fb include: drop pointless __compiler_offsetof indirection

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
