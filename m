Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F51175A92
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481079; cv=none; b=ZOWG3RYlyeP3tn2K0ufnaUjEpgKZr9/QBRIGx3HxZpwKRucEWrXalSAjY0ZqAQGc1TIQ/v9MRbUrQyTwvDbv+g5U+DJvBkJGL3oXukr11hc7jKzpBl+DjKmGGzkYrwT40579kn86Q7foeju8w7XymKD1x+ArbGlX2UcVllJBMq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481079; c=relaxed/simple;
	bh=sAWLaZxbYohQyLriN+rzIpaggW3Ih4o4fxrdNx282fw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YZpNa5+sg3OVFPm764AgoXsVqo/NCj4F9weB6tG6sS1PBL6MMMwxKh0tcPCq4DM0hjwK9Jknvqyj9rAd/wo71mgfAkCU6ob5+jjCA7NsK8nBzShsNFPLIA7g6TrDIy43z3Taljfa+g+YRRzWS8aBM6ZMX/88UriTNVO5BB4Dcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IK7t/ZPx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IK7t/ZPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790481077; x=1822017077;
  h=date:from:to:cc:subject:message-id;
  bh=sAWLaZxbYohQyLriN+rzIpaggW3Ih4o4fxrdNx282fw=;
  b=IK7t/ZPxZQvMYLhVmChF0aJzxZG12hsGx+au7DnWnc++DChTB7SUlA66
   YA2jBmxCISBROcr04TOJZfAEk2LiltfwYGrIjkffWrGwBVpZgmUSxN5tl
   4zEw5z9b8iMC4G4cma6VJEp9naNiRzWGYoREyPu99j3vvIQELIoUPURQ+
   WBLgLBhV/p7wXsR70fj3sr2ABfvYcwro8goOBe6qn/wOaZqgq5tpF946X
   WeqrhT4S9lK36koYeQPqgSZ7CxL2ppsHhcR9H1cLRACPyOS2jlTk9EoK0
   UkXP9RF1zjxT+FQb3KP5ZzyBuMR6oUszO9MEJZJfM5jqIxrDGgdCf+Nx+
   g==;
X-CSE-ConnectionGUID: 0ARj6gFYTlusZxYJiwfjNw==
X-CSE-MsgGUID: 1zCYEx5EQA+zPZi8bPqXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="116744966"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="116744966"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 20:51:16 -0700
X-CSE-ConnectionGUID: 8LVuG20uRo++dUTqJh5jhA==
X-CSE-MsgGUID: KPyIdE5tRyO7W5AcgG3ZVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="272498046"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 26 Sep 2026 20:51:15 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAfuy-00000000MOL-277i;
	Sun, 27 Sep 2026 03:51:12 +0000
Date: Sun, 27 Sep 2026 11:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1130/1130]
 include/linux/fortify-string.h:597:25: error: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202609271144.094fS5jp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi liujie_answer,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   d92e9ec2dfe29ee8b6dac8107bf11b55711a5321
commit: fb6fc5e1c34166fc6092ff4a41fcc8f7783996c6 [1130/1130] anolis: net: update linkdata ethernet driver features.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260927/202609271144.094fS5jp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271144.094fS5jp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271144.094fS5jp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:296,
                    from include/linux/bitmap.h:12,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:23,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/percpu.h:6,
                    from include/linux/prandom.h:13,
                    from include/linux/random.h:153,
                    from drivers/net/ethernet/linkdata/sxe/sxepf/sxe_upgrade.c:12:
   In function 'fortify_memcpy_chk',
       inlined from 'sxe_upgrade_flash' at drivers/net/ethernet/linkdata/sxe/sxepf/sxe_upgrade.c:457:2:
>> include/linux/fortify-string.h:597:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
     597 |                         __write_overflow_field(p_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/__write_overflow_field +597 include/linux/fortify-string.h

a28a6e860c6cf23 Francis Laniel 2021-02-25  541  
f68f2ff91512c19 Kees Cook      2021-04-20  542  /*
f68f2ff91512c19 Kees Cook      2021-04-20  543   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c19 Kees Cook      2021-04-20  544   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c19 Kees Cook      2021-04-20  545   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c19 Kees Cook      2021-04-20  546   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c19 Kees Cook      2021-04-20  547   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c19 Kees Cook      2021-04-20  548   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c19 Kees Cook      2021-04-20  549   *
f68f2ff91512c19 Kees Cook      2021-04-20  550   * Mitigation coverage matrix
f68f2ff91512c19 Kees Cook      2021-04-20  551   *					Bounds checking at:
f68f2ff91512c19 Kees Cook      2021-04-20  552   *					+-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  553   *					| Compile time  |   Run time    |
f68f2ff91512c19 Kees Cook      2021-04-20  554   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c19 Kees Cook      2021-04-20  555   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  556   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c19 Kees Cook      2021-04-20  557   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  558   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c19 Kees Cook      2021-04-20  559   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  560   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c19 Kees Cook      2021-04-20  561   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  562   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c19 Kees Cook      2021-04-20  563   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c19 Kees Cook      2021-04-20  564   *					+-------+-------+-------+-------+
f68f2ff91512c19 Kees Cook      2021-04-20  565   *
f68f2ff91512c19 Kees Cook      2021-04-20  566   * y = perform deterministic compile-time bounds checking
f68f2ff91512c19 Kees Cook      2021-04-20  567   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c19 Kees Cook      2021-04-20  568   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c19 Kees Cook      2021-04-20  569   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c19 Kees Cook      2021-04-20  570   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c19 Kees Cook      2021-04-20  571   *
f68f2ff91512c19 Kees Cook      2021-04-20  572   */
54d9469bc515dc5 Kees Cook      2021-06-24  573  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c19 Kees Cook      2021-04-20  574  					 const size_t p_size,
f68f2ff91512c19 Kees Cook      2021-04-20  575  					 const size_t q_size,
f68f2ff91512c19 Kees Cook      2021-04-20  576  					 const size_t p_size_field,
f68f2ff91512c19 Kees Cook      2021-04-20  577  					 const size_t q_size_field,
f68f2ff91512c19 Kees Cook      2021-04-20  578  					 const char *func)
a28a6e860c6cf23 Francis Laniel 2021-02-25  579  {
a28a6e860c6cf23 Francis Laniel 2021-02-25  580  	if (__builtin_constant_p(size)) {
f68f2ff91512c19 Kees Cook      2021-04-20  581  		/*
f68f2ff91512c19 Kees Cook      2021-04-20  582  		 * Length argument is a constant expression, so we
f68f2ff91512c19 Kees Cook      2021-04-20  583  		 * can perform compile-time bounds checking where
fa35198f39571bb Kees Cook      2022-09-19  584  		 * buffer sizes are also known at compile time.
f68f2ff91512c19 Kees Cook      2021-04-20  585  		 */
f68f2ff91512c19 Kees Cook      2021-04-20  586  
f68f2ff91512c19 Kees Cook      2021-04-20  587  		/* Error when size is larger than enclosing struct. */
fa35198f39571bb Kees Cook      2022-09-19  588  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571bb Kees Cook      2022-09-19  589  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25  590  			__write_overflow();
fa35198f39571bb Kees Cook      2022-09-19  591  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571bb Kees Cook      2022-09-19  592  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf23 Francis Laniel 2021-02-25  593  			__read_overflow2();
f68f2ff91512c19 Kees Cook      2021-04-20  594  
f68f2ff91512c19 Kees Cook      2021-04-20  595  		/* Warn when write size argument larger than dest field. */
fa35198f39571bb Kees Cook      2022-09-19  596  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c19 Kees Cook      2021-04-20 @597  			__write_overflow_field(p_size_field, size);
f68f2ff91512c19 Kees Cook      2021-04-20  598  		/*
f68f2ff91512c19 Kees Cook      2021-04-20  599  		 * Warn for source field over-read when building with W=1
f68f2ff91512c19 Kees Cook      2021-04-20  600  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c19 Kees Cook      2021-04-20  601  		 * the same time.
f68f2ff91512c19 Kees Cook      2021-04-20  602  		 */
fa35198f39571bb Kees Cook      2022-09-19  603  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571bb Kees Cook      2022-09-19  604  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571bb Kees Cook      2022-09-19  605  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c19 Kees Cook      2021-04-20  606  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf23 Francis Laniel 2021-02-25  607  	}
f68f2ff91512c19 Kees Cook      2021-04-20  608  	/*
f68f2ff91512c19 Kees Cook      2021-04-20  609  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c19 Kees Cook      2021-04-20  610  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c19 Kees Cook      2021-04-20  611  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c19 Kees Cook      2021-04-20  612  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c19 Kees Cook      2021-04-20  613  	 * overflows.)
f68f2ff91512c19 Kees Cook      2021-04-20  614  	 */
f68f2ff91512c19 Kees Cook      2021-04-20  615  
f68f2ff91512c19 Kees Cook      2021-04-20  616  	/*
f68f2ff91512c19 Kees Cook      2021-04-20  617  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c19 Kees Cook      2021-04-20  618  	 * field, when the buffer's remaining size is known.
311fb40aa0569ab Kees Cook      2022-09-02  619  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c19 Kees Cook      2021-04-20  620  	 * lengths are unknown.)
f68f2ff91512c19 Kees Cook      2021-04-20  621  	 */
311fb40aa0569ab Kees Cook      2022-09-02  622  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569ab Kees Cook      2022-09-02  623  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c19 Kees Cook      2021-04-20  624  		fortify_panic(func);
54d9469bc515dc5 Kees Cook      2021-06-24  625  
54d9469bc515dc5 Kees Cook      2021-06-24  626  	/*
54d9469bc515dc5 Kees Cook      2021-06-24  627  	 * Warn when writing beyond destination field size.
54d9469bc515dc5 Kees Cook      2021-06-24  628  	 *
54d9469bc515dc5 Kees Cook      2021-06-24  629  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc5 Kees Cook      2021-06-24  630  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc5 Kees Cook      2021-06-24  631  	 * proper flexible arrays.
54d9469bc515dc5 Kees Cook      2021-06-24  632  	 *
9f7d69c5cd23904 Kees Cook      2022-09-19  633  	 * The implementation of __builtin_*object_size() behaves
54d9469bc515dc5 Kees Cook      2021-06-24  634  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc5 Kees Cook      2021-06-24  635  	 * array member, which means there will be many bounds checks
54d9469bc515dc5 Kees Cook      2021-06-24  636  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc5 Kees Cook      2021-06-24  637  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc5 Kees Cook      2021-06-24  638  	 * is specifically the flexible array member).
54d9469bc515dc5 Kees Cook      2021-06-24  639  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc5 Kees Cook      2021-06-24  640  	 */
54d9469bc515dc5 Kees Cook      2021-06-24  641  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc5 Kees Cook      2021-06-24  642  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc5 Kees Cook      2021-06-24  643  		return true;
54d9469bc515dc5 Kees Cook      2021-06-24  644  
54d9469bc515dc5 Kees Cook      2021-06-24  645  	return false;
a28a6e860c6cf23 Francis Laniel 2021-02-25  646  }
a28a6e860c6cf23 Francis Laniel 2021-02-25  647  

:::::: The code at line 597 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
