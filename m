Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C774A17BB03
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729146546; cv=none; b=Nh9xF1F5YpNluSzP8OU/qjUIatV8DxG8qUBQdNXZ++/FmfOxwIjPpdJ0maZVyd1a7VpHmMOPHeKzQV2rVMl9p5m4jF8kvoxZyTVHOdP1UA7f6o1IVF8VqfseHTlNyKEhNHrX1QK8R1VRm4eIqx3MCsVT+Z6pCkmfBtQbRfdNXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729146546; c=relaxed/simple;
	bh=C/7QGFPj2lCQwOtIkEL21evU1r6xm/ML1F+RP0xunW4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mc9js950q9AUnwtBdHDwNVoKlbq/a0fSjmw7xrJVFHDrltpsMp8aPTEOYuB+I1AvU6kIzKLatmZp2HivoSP27NV7AlsAaZQjdMLuMF3Bt6U2P8qiFXKPwNezGdvew9QCacLPOKPvoHUFMt6X8RKI8I/ykWxdc35NQo3dg2AjC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bIjxvK6G; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bIjxvK6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729146543; x=1760682543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C/7QGFPj2lCQwOtIkEL21evU1r6xm/ML1F+RP0xunW4=;
  b=bIjxvK6GiieCxNeIkf4V/jgZNb6OMRu1mqlXBWvYaWaClzzUrCUv+ui0
   nWZefuQpsLDl4TBlNAvC8XRNJqe/J54zcIvI1LflBYnDrcVx14wDY0Lky
   WtBIGWOKpMTt85ICYR2Y+cMiTRQV4zu+6dwPYzdTpfiMCZSf2AKvIEBUH
   4P4K/cUey9wg+FzZaL0mqiCbcHeFXZ7+l6w0lcbN5cMko2hAjcsS4aNAk
   MVsWhVOub1r1oFzr/g0QkBYcsm16KBz7jI6NhOMrz7hsTuebOnUeZafis
   BMe6mSpU3nlFemt4qx70vAvLN0lqTLbyz811pJ72Z7KWD/ofvZPjXmaec
   A==;
X-CSE-ConnectionGUID: M4OOei8lRnenFtLc/h6JPQ==
X-CSE-MsgGUID: DtKs91U5QtuLi1us/qZcGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28504927"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28504927"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 23:29:02 -0700
X-CSE-ConnectionGUID: Vxf0nMNMR+qwjNYagIuPNA==
X-CSE-MsgGUID: tLAZ9t5kQgaIHldZ0IpyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78483779"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Oct 2024 23:29:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1K0I-000Lof-2k;
	Thu, 17 Oct 2024 06:28:58 +0000
Date: Thu, 17 Oct 2024 14:28:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Moore <paul@paul-moore.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4380/4439] include/linux/fortify-string.h:293:17:
 error: call to '__write_overflow' declared with attribute error: detected
 write beyond size of object (1st parameter)
Message-ID: <202410171420.1V00ICVG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   15e7d45e786a62a211dd0098fee7c57f84f8c681
commit: dfdb07df2ab66ff4fd2f82039e871e7ab922dc81 [4380/4439] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git
config: x86_64-randconfig-005-20241017 (https://download.01.org/0day-ci/archive/20241017/202410171420.1V00ICVG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171420.1V00ICVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171420.1V00ICVG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/string.h:390,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from kernel/auditsc.c:37:
   In function 'sized_strscpy',
       inlined from '__audit_ptrace' at kernel/auditsc.c:2732:2:
>> include/linux/fortify-string.h:293:17: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object (1st parameter)
     293 |                 __write_overflow();
         |                 ^~~~~~~~~~~~~~~~~~
   In function 'sized_strscpy',
       inlined from 'audit_signal_info_syscall' at kernel/auditsc.c:2759:3:
>> include/linux/fortify-string.h:293:17: error: call to '__write_overflow' declared with attribute error: detected write beyond size of object (1st parameter)
     293 |                 __write_overflow();
         |                 ^~~~~~~~~~~~~~~~~~


vim +/__write_overflow +293 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  274  
03699f271de1f4 Kees Cook      2022-09-02  275  /* Defined after fortified strnlen() to reuse it. */
e6584c3964f2ff Kees Cook      2023-09-20  276  extern ssize_t __real_strscpy(char *, const char *, size_t) __RENAME(sized_strscpy);
e6584c3964f2ff Kees Cook      2023-09-20  277  __FORTIFY_INLINE ssize_t sized_strscpy(char * const POS p, const char * const POS q, size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  278  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  279  	/* Use string size rather than possible enclosing struct size. */
21a2c74b0a2a78 Kees Cook      2023-04-07  280  	const size_t p_size = __member_size(p);
21a2c74b0a2a78 Kees Cook      2023-04-07  281  	const size_t q_size = __member_size(q);
21a2c74b0a2a78 Kees Cook      2023-04-07  282  	size_t len;
a28a6e860c6cf2 Francis Laniel 2021-02-25  283  
a28a6e860c6cf2 Francis Laniel 2021-02-25  284  	/* If we cannot get size of p and q default to call strscpy. */
311fb40aa0569a Kees Cook      2022-09-02  285  	if (p_size == SIZE_MAX && q_size == SIZE_MAX)
a28a6e860c6cf2 Francis Laniel 2021-02-25  286  		return __real_strscpy(p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  287  
a28a6e860c6cf2 Francis Laniel 2021-02-25  288  	/*
a28a6e860c6cf2 Francis Laniel 2021-02-25  289  	 * If size can be known at compile time and is greater than
a28a6e860c6cf2 Francis Laniel 2021-02-25  290  	 * p_size, generate a compile time write overflow error.
a28a6e860c6cf2 Francis Laniel 2021-02-25  291  	 */
fa35198f39571b Kees Cook      2022-09-19  292  	if (__compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25 @293  		__write_overflow();
a28a6e860c6cf2 Francis Laniel 2021-02-25  294  
62e1cbfc5d7953 Kees Cook      2022-10-02  295  	/* Short-circuit for compile-time known-safe lengths. */
62e1cbfc5d7953 Kees Cook      2022-10-02  296  	if (__compiletime_lessthan(p_size, SIZE_MAX)) {
62e1cbfc5d7953 Kees Cook      2022-10-02  297  		len = __compiletime_strlen(q);
62e1cbfc5d7953 Kees Cook      2022-10-02  298  
62e1cbfc5d7953 Kees Cook      2022-10-02  299  		if (len < SIZE_MAX && __compiletime_lessthan(len, size)) {
62e1cbfc5d7953 Kees Cook      2022-10-02  300  			__underlying_memcpy(p, q, len + 1);
62e1cbfc5d7953 Kees Cook      2022-10-02  301  			return len;
62e1cbfc5d7953 Kees Cook      2022-10-02  302  		}
62e1cbfc5d7953 Kees Cook      2022-10-02  303  	}
62e1cbfc5d7953 Kees Cook      2022-10-02  304  
a28a6e860c6cf2 Francis Laniel 2021-02-25  305  	/*
a28a6e860c6cf2 Francis Laniel 2021-02-25  306  	 * This call protects from read overflow, because len will default to q
a28a6e860c6cf2 Francis Laniel 2021-02-25  307  	 * length if it smaller than size.
a28a6e860c6cf2 Francis Laniel 2021-02-25  308  	 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  309  	len = strnlen(q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  310  	/*
a28a6e860c6cf2 Francis Laniel 2021-02-25  311  	 * If len equals size, we will copy only size bytes which leads to
a28a6e860c6cf2 Francis Laniel 2021-02-25  312  	 * -E2BIG being returned.
a28a6e860c6cf2 Francis Laniel 2021-02-25  313  	 * Otherwise we will copy len + 1 because of the final '\O'.
a28a6e860c6cf2 Francis Laniel 2021-02-25  314  	 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  315  	len = len == size ? size : len + 1;
a28a6e860c6cf2 Francis Laniel 2021-02-25  316  
a28a6e860c6cf2 Francis Laniel 2021-02-25  317  	/*
a28a6e860c6cf2 Francis Laniel 2021-02-25  318  	 * Generate a runtime write overflow error if len is greater than
a28a6e860c6cf2 Francis Laniel 2021-02-25  319  	 * p_size.
a28a6e860c6cf2 Francis Laniel 2021-02-25  320  	 */
3d965b33e40d97 Kees Cook      2023-04-07  321  	if (p_size < len)
3d965b33e40d97 Kees Cook      2023-04-07  322  		fortify_panic(FORTIFY_FUNC_strscpy, FORTIFY_WRITE, p_size, len, -E2BIG);
a28a6e860c6cf2 Francis Laniel 2021-02-25  323  
a28a6e860c6cf2 Francis Laniel 2021-02-25  324  	/*
a28a6e860c6cf2 Francis Laniel 2021-02-25  325  	 * We can now safely call vanilla strscpy because we are protected from:
a28a6e860c6cf2 Francis Laniel 2021-02-25  326  	 * 1. Read overflow thanks to call to strnlen().
a28a6e860c6cf2 Francis Laniel 2021-02-25  327  	 * 2. Write overflow thanks to above ifs.
a28a6e860c6cf2 Francis Laniel 2021-02-25  328  	 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  329  	return __real_strscpy(p, q, len);
a28a6e860c6cf2 Francis Laniel 2021-02-25  330  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  331  

:::::: The code at line 293 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified functions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
