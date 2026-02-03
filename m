Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05A02EE608
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 22:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158039; cv=none; b=SFlQamG2zi8zDHJDWJKQn2YcaknJhYta+euNqQto7TxOcM5JRaeXwwpR/GmT10tzyh7hDxuSoK1enA55tbM43tdz8OEJrccWfyCo0bfGfsoH0CxUZMqweu4+ZXYUbP90VagW7sj3ZlBELADhNXJgl9US8qYPi4XJmkh+m7CkyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158039; c=relaxed/simple;
	bh=pOb01tl6N5Dk7GqYWplR8xcrWTH+QkSorCr4P7OvB0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kr/T1s+Xx8Z4YUNKV8oJo7YhkZD45sGGFaqSL1SfDnN1pAzx8FuMle3PRqaZqXfha1YD/slKFlGCirGbu9eUim4ZjuAFu02Ke8/k07vu3rFE43l0YsaPCw/+jsudtFqFs8GiqgD5JsZxA2ViRBISrEJizgwXBPtraT4BHYvIPTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CUF//cLS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CUF//cLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770158036; x=1801694036;
  h=date:from:to:cc:subject:message-id;
  bh=pOb01tl6N5Dk7GqYWplR8xcrWTH+QkSorCr4P7OvB0c=;
  b=CUF//cLS42CdfFGnJwnVQSxq+Ie8lKCCjBJLIta9t7KuekfhWBW/N2ko
   vTtwjWW4fAZv5G9F+WI6X1LKy5AoYcjAvZQImkUgsMEdvsOunTNFUet2B
   H8cVCQhGDaUbogrK7T1F4aU1+oLQxbzJYgHAeOTYQItEC0QhsXYZTOvz6
   S9LxvXzpF24A2kkN+66lni2B3zLzOUfMPI8b4IydnlyH+RUcKheUoyM8J
   nIqP9ayUPfg0JHFtiYmMEbXagbc4C/6sfp7CkyGduAkS5tNp+75uPGQNq
   j6Q+a6PiVmU3xlspUnLWGKwbdl3tYMMUvk5ZaNKlpvCJ83OZ5FCslOspV
   Q==;
X-CSE-ConnectionGUID: MDo1pR0/TgC8ukbT4jvr+A==
X-CSE-MsgGUID: SmGe4/J4TR+iuNN/qOlMbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="73941270"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="73941270"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 14:33:56 -0800
X-CSE-ConnectionGUID: xzJQqwkvRKWtrl3k07887w==
X-CSE-MsgGUID: 9kelOVc9Sg6dwiISanFBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="209264748"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 14:33:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnOy0-00000000hEC-0NT0;
	Tue, 03 Feb 2026 22:33:52 +0000
Date: Wed, 04 Feb 2026 06:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 3/3]
 include/linux/fortify-string.h:597:25: error: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202602040646.Nm2GqQQx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   9cd415eb32d36a021203c959f71ff1d505df997f
commit: 236157fc6d49320c9b1a91b501ccf01fe70f2853 [3/3] anolis: net: update linkdata ethernet driver features.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260204/202602040646.Nm2GqQQx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040646.Nm2GqQQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040646.Nm2GqQQx-lkp@intel.com/

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

a28a6e860c6cf2 Francis Laniel 2021-02-25  541  
f68f2ff91512c1 Kees Cook      2021-04-20  542  /*
f68f2ff91512c1 Kees Cook      2021-04-20  543   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  544   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  545   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  546   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  547   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  548   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  549   *
f68f2ff91512c1 Kees Cook      2021-04-20  550   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  551   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  552   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  553   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  554   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  555   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  556   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  557   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  558   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  559   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  560   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  561   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  562   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  563   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  564   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  565   *
f68f2ff91512c1 Kees Cook      2021-04-20  566   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  567   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  568   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  569   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  570   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  571   *
f68f2ff91512c1 Kees Cook      2021-04-20  572   */
54d9469bc515dc Kees Cook      2021-06-24  573  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  574  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  575  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  576  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  577  					 const size_t q_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  578  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  579  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  580  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  581  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  582  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  583  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  584  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  585  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  586  
f68f2ff91512c1 Kees Cook      2021-04-20  587  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  588  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  589  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  590  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  591  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  592  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  593  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  594  
f68f2ff91512c1 Kees Cook      2021-04-20  595  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  596  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @597  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  598  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  599  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  600  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  601  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  602  		 */
fa35198f39571b Kees Cook      2022-09-19  603  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  604  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  605  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  606  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  607  	}
f68f2ff91512c1 Kees Cook      2021-04-20  608  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  609  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  610  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  611  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  612  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  613  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  614  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  615  
f68f2ff91512c1 Kees Cook      2021-04-20  616  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  617  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  618  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  619  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  620  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  621  	 */
311fb40aa0569a Kees Cook      2022-09-02  622  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569a Kees Cook      2022-09-02  623  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c1 Kees Cook      2021-04-20  624  		fortify_panic(func);
54d9469bc515dc Kees Cook      2021-06-24  625  
54d9469bc515dc Kees Cook      2021-06-24  626  	/*
54d9469bc515dc Kees Cook      2021-06-24  627  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  628  	 *
54d9469bc515dc Kees Cook      2021-06-24  629  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc Kees Cook      2021-06-24  630  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc Kees Cook      2021-06-24  631  	 * proper flexible arrays.
54d9469bc515dc Kees Cook      2021-06-24  632  	 *
9f7d69c5cd2390 Kees Cook      2022-09-19  633  	 * The implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  634  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  635  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  636  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  637  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  638  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  639  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  640  	 */
54d9469bc515dc Kees Cook      2021-06-24  641  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  642  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  643  		return true;
54d9469bc515dc Kees Cook      2021-06-24  644  
54d9469bc515dc Kees Cook      2021-06-24  645  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  646  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  647  

:::::: The code at line 597 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
