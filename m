Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F7E3B4EB7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594799; cv=none; b=BO2QjrOB8+RcczKH9y88wonRknVwwQYttEV/R3h5rrrQmImTNtYnXJ4YAxp568/oFog37rNT2WSTFHGnLACT9rYmc698wsXogdWCBqx1nFzSnVYWlgGObq4ks7sl2ioaP8HQQss65+TfoPI9jzhq8cif3RJ9hkstQuYlgjiW+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594799; c=relaxed/simple;
	bh=3DFjKy5c0D6zAR7MQzagCg6Uyoe/YjCXoJaqkyt7Fq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kSpmWkbI9BtG9zxYoeeD0hJ8eHy3tvIYmLhNqQs1TglnUhYuH6194r9uruRJLUR55BFNmDtgMls1W37UXqhlWdUtZ4wf17BOoGtIs8K78PjuucVqTuqT9XWEelID3nLPxOv9WjggKIlqoo0OrWacKk7biM3QJEj0QIRNVVAKi/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeMDuDKR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeMDuDKR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780594797; x=1812130797;
  h=date:from:to:cc:subject:message-id;
  bh=3DFjKy5c0D6zAR7MQzagCg6Uyoe/YjCXoJaqkyt7Fq0=;
  b=XeMDuDKREVvP+I0qcQiOYnXrevbIPHNfX77TnZTGy3aHaZvnd+fR8JZk
   igZlebDenacpWNT8xO8mzEijNIrxHJv1H58hRA7DCvWh5y5Nk9LgKusTH
   OIBAulOLL4NXCM4963naOLkfk9G8qP5QqCAeiUYUJBP5z/+K2l02z/85c
   9fHTMwTwjsrhPbF6fWcNy/7Y9FYwO8BcyF+BEWBGIvL2bx3RvvfH2nbNa
   MF30NNrfZ/u9NH7HPg4b7BbvihQs/mE6gN7EaeFqIMYXnaILZlS2EDhQm
   KJXiJfhG4xYI+toZeASz7+rv6lcCckCDiwX5SJeHPYV0vR40XDRlHyG9d
   w==;
X-CSE-ConnectionGUID: 27V5n08xS3OxG/FRjEnjpA==
X-CSE-MsgGUID: EZj9/5xbS4eKjsdU92OHMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="68964656"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="68964656"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:39:57 -0700
X-CSE-ConnectionGUID: Djy9yLnpQBC55QTS5t093Q==
X-CSE-MsgGUID: ZuZAKT5gTVqTIt0B3IqhCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="248540101"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Jun 2026 10:39:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVC2p-00000000F1O-41Iu;
	Thu, 04 Jun 2026 17:39:51 +0000
Date: Fri, 05 Jun 2026 01:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Subject: include/linux/fortify-string.h:571:4: warning: call to
 '__write_overflow_field' declared with 'warning' attribute: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202606050130.wEjjFcZX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: ace232eff50e8c898103c56b3b5303e776616274 drm/amdgpu: Add ras module files into amdgpu
date:   8 months ago
config: arm64-randconfig-r064-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050130.wEjjFcZX-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050130.wEjjFcZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ace232eff50e ("drm/amdgpu: Add ras module files into amdgpu")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050130.wEjjFcZX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras_umc.c:24:
   In file included from drivers/gpu/drm/amd/amdgpu/../ras/rascore/ras.h:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../ras/ras_mgr/ras_sys.h:29:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:13:
   In file included from arch/arm64/include/asm/processor.h:34:
   In file included from include/linux/string.h:382:
>> include/linux/fortify-string.h:571:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     571 |                         __write_overflow_field(p_size_field, size);
         |                         ^
   1 warning generated.


vim +571 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel 2021-02-25  515  
f68f2ff91512c19 Kees Cook      2021-04-20  516  /*
f68f2ff91512c19 Kees Cook      2021-04-20  517   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c19 Kees Cook      2021-04-20  518   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c19 Kees Cook      2021-04-20  519   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c19 Kees Cook      2021-04-20  520   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c19 Kees Cook      2021-04-20  521   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c19 Kees Cook      2021-04-20  522   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c19 Kees Cook      2021-04-20  523   *
f68f2ff91512c19 Kees Cook      2021-04-20  524   * Mitigation coverage matrix
f68f2ff91512c19 Kees Cook      2021-04-20  525   *					Bounds checking at:
f68f2ff91512c19 Kees Cook      2021-04-20  526   *					+-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  527   *					| Compile time  |   Run time    |
f68f2ff91512c19 Kees Cook      2021-04-20  528   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c19 Kees Cook      2021-04-20  529   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  530   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c19 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  532   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c19 Kees Cook      2021-04-20  533   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c19 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  536   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c19 Kees Cook      2021-04-20  537   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  539   *
f68f2ff91512c19 Kees Cook      2021-04-20  540   * y = perform deterministic compile-time bounds checking
f68f2ff91512c19 Kees Cook      2021-04-20  541   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c19 Kees Cook      2021-04-20  542   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c19 Kees Cook      2021-04-20  543   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c19 Kees Cook      2021-04-20  544   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c19 Kees Cook      2021-04-20  545   *
f68f2ff91512c19 Kees Cook      2021-04-20  546   */
54d9469bc515dc5 Kees Cook      2021-06-24  547  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c19 Kees Cook      2021-04-20  548  					 const size_t p_size,
f68f2ff91512c19 Kees Cook      2021-04-20  549  					 const size_t q_size,
f68f2ff91512c19 Kees Cook      2021-04-20  550  					 const size_t p_size_field,
f68f2ff91512c19 Kees Cook      2021-04-20  551  					 const size_t q_size_field,
475ddf1fce1ec48 Kees Cook      2023-04-07  552  					 const u8 func)
a28a6e860c6cf23 Francis Laniel 2021-02-25  553  {
a28a6e860c6cf23 Francis Laniel 2021-02-25  554  	if (__builtin_constant_p(size)) {
f68f2ff91512c19 Kees Cook      2021-04-20  555  		/*
f68f2ff91512c19 Kees Cook      2021-04-20  556  		 * Length argument is a constant expression, so we
f68f2ff91512c19 Kees Cook      2021-04-20  557  		 * can perform compile-time bounds checking where
fa35198f39571bb Kees Cook      2022-09-19  558  		 * buffer sizes are also known at compile time.
f68f2ff91512c19 Kees Cook      2021-04-20  559  		 */
f68f2ff91512c19 Kees Cook      2021-04-20  560  
f68f2ff91512c19 Kees Cook      2021-04-20  561  		/* Error when size is larger than enclosing struct. */
fa35198f39571bb Kees Cook      2022-09-19  562  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571bb Kees Cook      2022-09-19  563  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25  564  			__write_overflow();
fa35198f39571bb Kees Cook      2022-09-19  565  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571bb Kees Cook      2022-09-19  566  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25  567  			__read_overflow2();
f68f2ff91512c19 Kees Cook      2021-04-20  568  
f68f2ff91512c19 Kees Cook      2021-04-20  569  		/* Warn when write size argument larger than dest field. */
fa35198f39571bb Kees Cook      2022-09-19  570  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c19 Kees Cook      2021-04-20 @571  			__write_overflow_field(p_size_field, size);
f68f2ff91512c19 Kees Cook      2021-04-20  572  		/*
f68f2ff91512c19 Kees Cook      2021-04-20  573  		 * Warn for source field over-read when building with W=1
f68f2ff91512c19 Kees Cook      2021-04-20  574  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c19 Kees Cook      2021-04-20  575  		 * the same time.
f68f2ff91512c19 Kees Cook      2021-04-20  576  		 */
fa35198f39571bb Kees Cook      2022-09-19  577  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571bb Kees Cook      2022-09-19  578  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571bb Kees Cook      2022-09-19  579  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c19 Kees Cook      2021-04-20  580  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf23 Francis Laniel 2021-02-25  581  	}
f68f2ff91512c19 Kees Cook      2021-04-20  582  	/*
f68f2ff91512c19 Kees Cook      2021-04-20  583  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c19 Kees Cook      2021-04-20  584  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c19 Kees Cook      2021-04-20  585  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c19 Kees Cook      2021-04-20  586  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c19 Kees Cook      2021-04-20  587  	 * overflows.)
f68f2ff91512c19 Kees Cook      2021-04-20  588  	 */
f68f2ff91512c19 Kees Cook      2021-04-20  589  
f68f2ff91512c19 Kees Cook      2021-04-20  590  	/*
f68f2ff91512c19 Kees Cook      2021-04-20  591  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c19 Kees Cook      2021-04-20  592  	 * field, when the buffer's remaining size is known.
311fb40aa0569ab Kees Cook      2022-09-02  593  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c19 Kees Cook      2021-04-20  594  	 * lengths are unknown.)
f68f2ff91512c19 Kees Cook      2021-04-20  595  	 */
475ddf1fce1ec48 Kees Cook      2023-04-07  596  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d973 Kees Cook      2023-04-07  597  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
475ddf1fce1ec48 Kees Cook      2023-04-07  598  	else if (q_size != SIZE_MAX && q_size < size)
94fd44648dae2a5 Kees Cook      2025-07-29  599  		fortify_panic(func, FORTIFY_READ, q_size, size, true);
54d9469bc515dc5 Kees Cook      2021-06-24  600  
54d9469bc515dc5 Kees Cook      2021-06-24  601  	/*
54d9469bc515dc5 Kees Cook      2021-06-24  602  	 * Warn when writing beyond destination field size.
54d9469bc515dc5 Kees Cook      2021-06-24  603  	 *
2003e483a81cc23 Kees Cook      2024-06-19  604  	 * Note the implementation of __builtin_*object_size() behaves
54d9469bc515dc5 Kees Cook      2021-06-24  605  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc5 Kees Cook      2021-06-24  606  	 * array member, which means there will be many bounds checks
54d9469bc515dc5 Kees Cook      2021-06-24  607  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc5 Kees Cook      2021-06-24  608  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc5 Kees Cook      2021-06-24  609  	 * is specifically the flexible array member).
54d9469bc515dc5 Kees Cook      2021-06-24  610  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc5 Kees Cook      2021-06-24  611  	 */
2003e483a81cc23 Kees Cook      2024-06-19  612  	if (p_size_field != SIZE_MAX &&
54d9469bc515dc5 Kees Cook      2021-06-24  613  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc5 Kees Cook      2021-06-24  614  		return true;
54d9469bc515dc5 Kees Cook      2021-06-24  615  
54d9469bc515dc5 Kees Cook      2021-06-24  616  	return false;
a28a6e860c6cf23 Francis Laniel 2021-02-25  617  }
a28a6e860c6cf23 Francis Laniel 2021-02-25  618  

:::::: The code at line 571 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
