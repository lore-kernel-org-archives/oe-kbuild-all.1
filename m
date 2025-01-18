Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0AB2907
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jan 2025 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737179130; cv=none; b=k8eW+jQl43J/ybD0Cf2QhRks5uMwe1JX9CGIknv1HtQ2zZlP1UvI8beaaJCsu5jN45HRJ7euh7qCfaEGcSC/OH39CJPVKGGW5MhwSrvjJPwRxaZ9QUpC0EueGE5U5uIqtALJ1S1688UXRNpfFnsMjcWkJISsL7H+o8r7ChI+aMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737179130; c=relaxed/simple;
	bh=l+Tk1Up22OUB5bqcuOBID+obEcKgAz4/BEy/oO+Qztw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZPDTsT+Pr72L98ZI12ipYMBiyNyBCOgfQfmV04TWDpIC9mE3mYX7dZGG0sqO6a7EE3r/+f4vfnqPGwWb1xBLjETi7ZtvkoY7NQAT0pCm28xsbZpPTErNBXIRw3enUYKCD69KoJurslvPKM6CDlhZu848KDePE4YvLF+nhFxkkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0Bpqvpg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0Bpqvpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737179128; x=1768715128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+Tk1Up22OUB5bqcuOBID+obEcKgAz4/BEy/oO+Qztw=;
  b=K0BpqvpgjHsaMuDyqUcF+CS5EzoPrALh441hEe094nJKsqETMskIbAOE
   5rovS98z9nT/XpGRdYOaTfL9o0YpagJznRNE9oUjBZ3eWMr7jdHhp+FuR
   IfuhWG8NWskIpdT2Z4H3Oo0Sw3KGEzv77sZWlleSlVxGq8VSClx9YPDeI
   BESMofOS4PjiqShaZ+ch8fvFSxEegxuapiIMr7uyZQCi2yB5Jvlq/quok
   lyvmZnoAaF6g7wpeTBzIREtX9mEgwyZ770PcyeTfITNUc6Kzqrtb27sv5
   +MIFagUHB83zM0cUy+cva6jWT70lA3BTLozylKFf2Sr3O5e8V2z640HI4
   w==;
X-CSE-ConnectionGUID: iIycrIEXTx6gwbVeLOJVrg==
X-CSE-MsgGUID: ITi3q3UASX6JfDdT13Lb2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36898589"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="36898589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 21:45:27 -0800
X-CSE-ConnectionGUID: uW7m4miQTzebL4zhSMgbpw==
X-CSE-MsgGUID: 3miIaRCpTTur8+Mb7MpfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="105957680"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jan 2025 21:45:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ1e8-000U7n-05;
	Sat, 18 Jan 2025 05:45:24 +0000
Date: Sat, 18 Jan 2025 13:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/fortify-string.h:387:25: warning: call to
 '__read_overflow2_field' declared with attribute warning: detected read
 beyond size of field (2nd parameter); maybe use struct_group()?
Message-ID: <202501181300.b3wcBpIt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: ba38961a069b0d8d03b53218a6c29d737577d448 um: Enable FORTIFY_SOURCE
date:   2 years, 4 months ago
config: um-randconfig-r052-20240430 (https://download.01.org/0day-ci/archive/20250118/202501181300.b3wcBpIt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501181300.b3wcBpIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501181300.b3wcBpIt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/net/ethernet/intel/igb/igb_main.c:6:
   In function 'fortify_memcpy_chk',
       inlined from 'igb_get_stats64' at drivers/net/ethernet/intel/igb/igb_main.c:6539:2:
>> include/linux/fortify-string.h:387:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     387 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__read_overflow2_field +387 include/linux/fortify-string.h

28e77cc1c06866 Kees Cook      2021-06-16  318  
28e77cc1c06866 Kees Cook      2021-06-16  319  /*
28e77cc1c06866 Kees Cook      2021-06-16  320   * __builtin_object_size() must be captured here to avoid evaluating argument
28e77cc1c06866 Kees Cook      2021-06-16  321   * side-effects further into the macro layers.
28e77cc1c06866 Kees Cook      2021-06-16  322   */
28e77cc1c06866 Kees Cook      2021-06-16  323  #define memset(p, c, s) __fortify_memset_chk(p, c, s,			\
28e77cc1c06866 Kees Cook      2021-06-16  324  		__builtin_object_size(p, 0), __builtin_object_size(p, 1))
a28a6e860c6cf2 Francis Laniel 2021-02-25  325  
f68f2ff91512c1 Kees Cook      2021-04-20  326  /*
f68f2ff91512c1 Kees Cook      2021-04-20  327   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  328   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  329   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  330   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  331   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  332   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  333   *
f68f2ff91512c1 Kees Cook      2021-04-20  334   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  335   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  336   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  337   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  338   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  339   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  340   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  341   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  342   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  343   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  344   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  345   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  346   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  347   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  348   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  349   *
f68f2ff91512c1 Kees Cook      2021-04-20  350   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  351   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  352   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  353   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  354   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  355   *
f68f2ff91512c1 Kees Cook      2021-04-20  356   */
54d9469bc515dc Kees Cook      2021-06-24  357  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  358  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  359  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  360  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  361  					 const size_t q_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  362  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  363  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  364  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  365  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  366  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  367  		 * can perform compile-time bounds checking where
f68f2ff91512c1 Kees Cook      2021-04-20  368  		 * buffer sizes are known.
f68f2ff91512c1 Kees Cook      2021-04-20  369  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  370  
f68f2ff91512c1 Kees Cook      2021-04-20  371  		/* Error when size is larger than enclosing struct. */
f68f2ff91512c1 Kees Cook      2021-04-20  372  		if (p_size > p_size_field && p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  373  			__write_overflow();
f68f2ff91512c1 Kees Cook      2021-04-20  374  		if (q_size > q_size_field && q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  375  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  376  
f68f2ff91512c1 Kees Cook      2021-04-20  377  		/* Warn when write size argument larger than dest field. */
f68f2ff91512c1 Kees Cook      2021-04-20  378  		if (p_size_field < size)
f68f2ff91512c1 Kees Cook      2021-04-20  379  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  380  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  381  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  382  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  383  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  384  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  385  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) || p_size_field < size) &&
f68f2ff91512c1 Kees Cook      2021-04-20  386  		    q_size_field < size)
f68f2ff91512c1 Kees Cook      2021-04-20 @387  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  388  	}
f68f2ff91512c1 Kees Cook      2021-04-20  389  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  390  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  391  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  392  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  393  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  394  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  395  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  396  
f68f2ff91512c1 Kees Cook      2021-04-20  397  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  398  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  399  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  400  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  401  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  402  	 */
311fb40aa0569a Kees Cook      2022-09-02  403  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569a Kees Cook      2022-09-02  404  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c1 Kees Cook      2021-04-20  405  		fortify_panic(func);
54d9469bc515dc Kees Cook      2021-06-24  406  
54d9469bc515dc Kees Cook      2021-06-24  407  	/*
54d9469bc515dc Kees Cook      2021-06-24  408  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  409  	 *
54d9469bc515dc Kees Cook      2021-06-24  410  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc Kees Cook      2021-06-24  411  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc Kees Cook      2021-06-24  412  	 * proper flexible arrays.
54d9469bc515dc Kees Cook      2021-06-24  413  	 *
54d9469bc515dc Kees Cook      2021-06-24  414  	 * The implementation of __builtin_object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  415  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  416  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  417  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  418  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  419  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  420  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  421  	 */
54d9469bc515dc Kees Cook      2021-06-24  422  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  423  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  424  		return true;
54d9469bc515dc Kees Cook      2021-06-24  425  
54d9469bc515dc Kees Cook      2021-06-24  426  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  427  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  428  

:::::: The code at line 387 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
