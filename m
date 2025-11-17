Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BD0320CB5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373407; cv=none; b=JOxJtHZfSi3F17VZapZP//5YPKNlN2BKYi5TQvyZZ1kVrxD07kHKikkbbF/T9s2a97id3NyZlsuv2DeDqlayzRB0o7JaIpNAo5syoH5e2EJMupTnnCANz3mZ7l+HxBgPsl2Mb1zyp1u76H1luNfQmcx+JDf0jdPt33IyUyqd+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373407; c=relaxed/simple;
	bh=IGiuZupCvm82iVBipP/VDuR4T6S3p8Put4k2rwYX+OE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E0LBDk0zfVD/2hkUiiA0HQiCAVxWBzuGZ57MDqH1m9TpbNZVLvvQfHD+hJvSBEzmM+ZGWdtcNYn7Jr7EfDijWqQVWibTfoHAYFLZWDPIe1DGOHq5BNDQC0PyfjgnKvucog+X50D6noROVHfC8sq976Zi5wMb5zRS/bZuRM87igM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRo67ot8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRo67ot8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763373403; x=1794909403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGiuZupCvm82iVBipP/VDuR4T6S3p8Put4k2rwYX+OE=;
  b=YRo67ot8/XjK07dARzY6BzocgHq77jzmcs288B8dTG/xZCiNbiLy4qjw
   H1cCYYifKu/NdsfWADFQCzxPZ2XZUwRpJBjKWf5PepmEUA9mFVRc4kXVG
   mpqKTc4059mAyfatE2hFKZk37xtwY7TlLmh4mwwHpClb1pVAoasaqQ6X+
   5sxIBuj6MMsgFlvtT/Cs+DbgW52jK7tK32c5kYC9TRxNlhC0cEdFnHWaT
   TmGWuvca5MUXBqQD3bM/ZnjLWCiqyj8F7K4a2UqERYSb7ydZHUD6YhgxG
   4Vh6MuDJMz7RXSFcS3/JSm47+K1MdBa/1iHPA5oI1bUqdTMc1Sbproaby
   w==;
X-CSE-ConnectionGUID: W9MfZ59HQYKnLh2ztnxIWg==
X-CSE-MsgGUID: qK+jbgB8TvC+WvyWDVmQ3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="90844720"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="90844720"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 01:56:41 -0800
X-CSE-ConnectionGUID: 3+VzaEkARi6+clYGutFK4Q==
X-CSE-MsgGUID: xgVXrb4+QF6MAUfi1MIVHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="213808357"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Nov 2025 01:56:38 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKvyP-0000P7-2i;
	Mon, 17 Nov 2025 09:56:37 +0000
Date: Mon, 17 Nov 2025 17:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: include/linux/fortify-string.h:571:4: warning: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202511171758.8thF02dJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6a23ae0a96a600d1d12557add110e0bb6e32730c
commit: 1d57628ff95b32d5cfa8d8f50e07690c161e9cf0 dm-pcache: add persistent cache target in device-mapper
date:   3 months ago
config: riscv-randconfig-r113-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171758.8thF02dJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171758.8thF02dJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:382,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/sched.h:37,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/dm-pcache/segment.h:5,
                    from drivers/md/dm-pcache/cache.h:5,
                    from drivers/md/dm-pcache/cache_key.c:2:
   In function 'fortify_memcpy_chk',
       inlined from 'cache_pos_copy' at drivers/md/dm-pcache/cache.h:403:2,
       inlined from 'cache_replay' at drivers/md/dm-pcache/cache_key.c:816:2:
>> include/linux/fortify-string.h:571:4: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     571 |    __write_overflow_field(p_size_field, size);
         |    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__write_overflow_field +571 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  515  
f68f2ff91512c1 Kees Cook      2021-04-20  516  /*
f68f2ff91512c1 Kees Cook      2021-04-20  517   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  518   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  519   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  520   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  521   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  522   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  523   *
f68f2ff91512c1 Kees Cook      2021-04-20  524   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  525   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  526   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  527   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  528   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  529   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  532   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  533   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  536   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  537   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  539   *
f68f2ff91512c1 Kees Cook      2021-04-20  540   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  541   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  542   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  543   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  544   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  545   *
f68f2ff91512c1 Kees Cook      2021-04-20  546   */
54d9469bc515dc Kees Cook      2021-06-24  547  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  548  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  549  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  550  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  551  					 const size_t q_size_field,
475ddf1fce1ec4 Kees Cook      2023-04-07  552  					 const u8 func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  553  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  554  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  555  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  556  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  557  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  558  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  559  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  560  
f68f2ff91512c1 Kees Cook      2021-04-20  561  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  562  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  563  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  564  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  565  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  566  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  567  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  568  
f68f2ff91512c1 Kees Cook      2021-04-20  569  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  570  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @571  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  572  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  573  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  574  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  575  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  576  		 */
fa35198f39571b Kees Cook      2022-09-19  577  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  578  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  579  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  580  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  581  	}
f68f2ff91512c1 Kees Cook      2021-04-20  582  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  583  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  584  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  585  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  586  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  587  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  588  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  589  
f68f2ff91512c1 Kees Cook      2021-04-20  590  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  591  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  592  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  593  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  594  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  595  	 */
475ddf1fce1ec4 Kees Cook      2023-04-07  596  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  597  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
475ddf1fce1ec4 Kees Cook      2023-04-07  598  	else if (q_size != SIZE_MAX && q_size < size)
94fd44648dae2a Kees Cook      2025-07-29  599  		fortify_panic(func, FORTIFY_READ, q_size, size, true);
54d9469bc515dc Kees Cook      2021-06-24  600  
54d9469bc515dc Kees Cook      2021-06-24  601  	/*
54d9469bc515dc Kees Cook      2021-06-24  602  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  603  	 *
2003e483a81cc2 Kees Cook      2024-06-19  604  	 * Note the implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  605  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  606  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  607  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  608  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  609  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  610  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  611  	 */
2003e483a81cc2 Kees Cook      2024-06-19  612  	if (p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  613  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  614  		return true;
54d9469bc515dc Kees Cook      2021-06-24  615  
54d9469bc515dc Kees Cook      2021-06-24  616  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  617  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  618  

:::::: The code at line 571 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
