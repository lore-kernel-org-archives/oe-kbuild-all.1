Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D13321DC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 18:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774203943; cv=none; b=GcvCI+2Yc1/XSZo45MDitAjxQ6oaxYG2Yluf+EY5p3H7OOTaI1nBhVB3QbEsGjHPmR9NYdpVgv5FYfkltCFAhiArFg6d3zCY3J6sJ8pNnKC0t1QkC2nIcHDgmkpKgakUklLg0kyAtaTCDdYLPp/I0dnw/cRGBwxr/X5IjNpkwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774203943; c=relaxed/simple;
	bh=GK2sGAr23Hwxh07X/9wH/svtJ+t8M66zS0kecpZOC7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RX1gRlH1iVZQ3u7Aey7ypdQJyKLEKW82T99tdL2JhqMKkUZE99sm6ienvgBSMKSVSpaSYbxHvtd2JUd2dANlK3sipHXUYCCLhsTTn/FN1HmXtWM7eBMj4QnlNeNl4d+pxejwedhggGggrMprRqrPTvrW5UsTOxwvYYEG95BuFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOlNrpiR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOlNrpiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774203941; x=1805739941;
  h=date:from:to:cc:subject:message-id;
  bh=GK2sGAr23Hwxh07X/9wH/svtJ+t8M66zS0kecpZOC7o=;
  b=SOlNrpiRKKZe3VzQpTpaj2KHnTDMShnpp+XeH9ENrnagh3K8lT//Gmip
   OO5CGTB5+ql0HPBnpK26inmSLHTguuTQieoJLCyvCDQW1cYXPmaHMOowI
   tfdWPvsaCPPQM9H/jTqFclkrff+na9GeJK65zKXeTydhS3FW7KpgEvhoT
   CW3ptjsf9nti0Sb5PxVdVzcxgbHT/EEzeeN51Wod0ozhcn2aFSoAXW9dZ
   fsOQqrW52Q5lfYZdmMG5HwzmsZ0c5lupk2QHkLJUXCdM5i1SVTMq7Ki19
   E2+49ao0fQkc+th8+nMdtU76MGT+EMHPyzXhEOsfAcXmAuArl0ZKJlBwh
   A==;
X-CSE-ConnectionGUID: 4eqcmt7GSwG9g2U5kTa3Pg==
X-CSE-MsgGUID: P4JqNk3LQIu1F14WM/Fnbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="74394771"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="74394771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 11:25:41 -0700
X-CSE-ConnectionGUID: STjnpvP0QbW4JY3y4cOW0A==
X-CSE-MsgGUID: lermP6rAT9aDasCHYta5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="219500914"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 11:25:39 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4NUX-000000002Vd-0Gme;
	Sun, 22 Mar 2026 18:25:37 +0000
Date: Mon, 23 Mar 2026 02:24:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:lib-raid6 27/39]
 include/linux/fortify-string.h:478:4: warning: call to
 '__write_overflow_field' declared with 'warning' attribute: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202603230231.cKvZqGJh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   964995e5e2ee5c94df17f056c7f9b2f98af52474
commit: 21d2f19dc287f09ff629bca585ddd3eda2942299 [27/39] raid6: turn the userspace test harness into a kunit test
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260323/202603230231.cKvZqGJh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230231.cKvZqGJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230231.cKvZqGJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/raid6/test/test.c:8:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:386:
>> include/linux/fortify-string.h:478:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     478 |                         __write_overflow_field(p_size_field, size);
         |                         ^
   1 warning generated.


vim +478 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  459  
4ce615e798a752 Kees Cook      2023-04-07  460  __FORTIFY_INLINE bool fortify_memset_chk(__kernel_size_t size,
28e77cc1c06866 Kees Cook      2021-06-16  461  					 const size_t p_size,
28e77cc1c06866 Kees Cook      2021-06-16  462  					 const size_t p_size_field)
a28a6e860c6cf2 Francis Laniel 2021-02-25  463  {
28e77cc1c06866 Kees Cook      2021-06-16  464  	if (__builtin_constant_p(size)) {
28e77cc1c06866 Kees Cook      2021-06-16  465  		/*
28e77cc1c06866 Kees Cook      2021-06-16  466  		 * Length argument is a constant expression, so we
28e77cc1c06866 Kees Cook      2021-06-16  467  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  468  		 * buffer sizes are also known at compile time.
28e77cc1c06866 Kees Cook      2021-06-16  469  		 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  470  
28e77cc1c06866 Kees Cook      2021-06-16  471  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  472  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  473  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  474  			__write_overflow();
28e77cc1c06866 Kees Cook      2021-06-16  475  
28e77cc1c06866 Kees Cook      2021-06-16  476  		/* Warn when write size is larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  477  		if (__compiletime_lessthan(p_size_field, size))
28e77cc1c06866 Kees Cook      2021-06-16 @478  			__write_overflow_field(p_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  479  	}
28e77cc1c06866 Kees Cook      2021-06-16  480  	/*
28e77cc1c06866 Kees Cook      2021-06-16  481  	 * At this point, length argument may not be a constant expression,
28e77cc1c06866 Kees Cook      2021-06-16  482  	 * so run-time bounds checking can be done where buffer sizes are
28e77cc1c06866 Kees Cook      2021-06-16  483  	 * known. (This is not an "else" because the above checks may only
28e77cc1c06866 Kees Cook      2021-06-16  484  	 * be compile-time warnings, and we want to still warn for run-time
28e77cc1c06866 Kees Cook      2021-06-16  485  	 * overflows.)
28e77cc1c06866 Kees Cook      2021-06-16  486  	 */
28e77cc1c06866 Kees Cook      2021-06-16  487  
28e77cc1c06866 Kees Cook      2021-06-16  488  	/*
28e77cc1c06866 Kees Cook      2021-06-16  489  	 * Always stop accesses beyond the struct that contains the
28e77cc1c06866 Kees Cook      2021-06-16  490  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  491  	 * (The SIZE_MAX test is to optimize away checks where the buffer
28e77cc1c06866 Kees Cook      2021-06-16  492  	 * lengths are unknown.)
28e77cc1c06866 Kees Cook      2021-06-16  493  	 */
311fb40aa0569a Kees Cook      2022-09-02  494  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  495  		fortify_panic(FORTIFY_FUNC_memset, FORTIFY_WRITE, p_size, size, true);
4ce615e798a752 Kees Cook      2023-04-07  496  	return false;
28e77cc1c06866 Kees Cook      2021-06-16  497  }
28e77cc1c06866 Kees Cook      2021-06-16  498  

:::::: The code at line 478 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct member overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
