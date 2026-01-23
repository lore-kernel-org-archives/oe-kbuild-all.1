Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68151C84A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769172408; cv=none; b=M2JOWzTOAjr8ummaTxbCGMlN6/xhIBkKXbIeXi63ptNQorFfKKf342hefQwWgAmXahfDeQd3CNxeZmjBp7UEfAKad+MIT7DKRA1yCvQ7Eayr7ZAe0VjtmJY1o16eh4SAiwXDuv3pchaO8d1eTaXor0LfEAcPalLfjAF6Sm+kDBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769172408; c=relaxed/simple;
	bh=vVUF9oKY3xmdZRNHSiXuX+4ivAXX5qPn7ryRoRtMOlI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oJxSgHtN8s7mXE5pVUysYsDPOo4+0rnfmVwvEqfrUNPfbkRqVeKoB3R9onmvZciy3iObfGWCJrOOaXOLuRtJlpMUkSKkehzMrgGHRZlMPie7vOcGPC5Qb+JAgX3vhzq3L+xEOVYh78aSLJ5v+UZqtP/SP1u82odkD6b3eQRqPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFC9hq+a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFC9hq+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769172406; x=1800708406;
  h=date:from:to:cc:subject:message-id;
  bh=vVUF9oKY3xmdZRNHSiXuX+4ivAXX5qPn7ryRoRtMOlI=;
  b=aFC9hq+arGEANrTR9N/v0dRGDvlsak5foDVEQ0FplAf+7t5TYB70Ldiy
   MNPwQGOXFZ5EoSBAwSuV0IDxstvRBTknwu/gugQM1xU6YOpH5DzqsIHUO
   UPrpGJykJy6B0REXTXUTyVRuyLSMWtWVUZPsbSakMNsRmVGCMbx/vCDoX
   M+xm9KTJUx+hkWZWmVFkYTqWugA9GqBvinhBy3IzjK823OuKe/U+rGS6H
   3BqvJ06sRci2ppucko7ZXRTjTZLAZzvrQa11AT/N7W9WQpsEAmc5J0087
   4ppOZ2JFl+K0LCojBSXDjcd6N2HJDRBtU+7z9CiZtZTinJZuBcqx6w2JB
   g==;
X-CSE-ConnectionGUID: N1EBaDVlTnmoK/CrSMfPyg==
X-CSE-MsgGUID: 4j05x855Rd+sMMz5fWEU1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81794255"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81794255"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:46:45 -0800
X-CSE-ConnectionGUID: Zu0WPy0pRhKMpFx9/TpKLQ==
X-CSE-MsgGUID: dwuQnlQ8Qbe56dJU59QTgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="229975620"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 04:46:44 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGYj-000000000hx-3Erp;
	Fri, 23 Jan 2026 12:46:41 +0000
Date: Fri, 23 Jan 2026 13:46:01 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-restrictions.4 20/26]
 ./include/linux/fortify-string.h:480:25: warning: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202601231328.g4Bnfh9o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-restrictions.4
head:   706995767a6b6ab3a7ca7e75d2d3efeace56a0c6
commit: f1e3672e49e2c276ba26fe245c137586812f037c [20/26] io_uring: add support for BPF filtering for opcode restrictions
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601231328.g4Bnfh9o-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231328.g4Bnfh9o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231328.g4Bnfh9o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./include/linux/string.h:386,
                    from ./include/linux/bitmap.h:13,
                    from ./include/linux/cpumask.h:11,
                    from ./include/linux/smp.h:13,
                    from ./include/linux/lockdep.h:14,
                    from ./include/linux/spinlock.h:63,
                    from ./include/linux/sched.h:37,
                    from ./include/linux/io_uring.h:5,
                    from io_uring/bpf_filter.c:7:
   In function 'fortify_memset_chk',
       inlined from 'io_uring_populate_bpf_ctx' at io_uring/bpf_filter.c:31:2,
       inlined from '__io_uring_run_bpf_filters' at io_uring/bpf_filter.c:67:2:
>> ./include/linux/fortify-string.h:480:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     480 |                         __write_overflow_field(p_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__write_overflow_field +480 ./include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  461  
4ce615e798a752 Kees Cook      2023-04-07  462  __FORTIFY_INLINE bool fortify_memset_chk(__kernel_size_t size,
28e77cc1c06866 Kees Cook      2021-06-16  463  					 const size_t p_size,
28e77cc1c06866 Kees Cook      2021-06-16  464  					 const size_t p_size_field)
a28a6e860c6cf2 Francis Laniel 2021-02-25  465  {
28e77cc1c06866 Kees Cook      2021-06-16  466  	if (__builtin_constant_p(size)) {
28e77cc1c06866 Kees Cook      2021-06-16  467  		/*
28e77cc1c06866 Kees Cook      2021-06-16  468  		 * Length argument is a constant expression, so we
28e77cc1c06866 Kees Cook      2021-06-16  469  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  470  		 * buffer sizes are also known at compile time.
28e77cc1c06866 Kees Cook      2021-06-16  471  		 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  472  
28e77cc1c06866 Kees Cook      2021-06-16  473  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  474  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  475  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  476  			__write_overflow();
28e77cc1c06866 Kees Cook      2021-06-16  477  
28e77cc1c06866 Kees Cook      2021-06-16  478  		/* Warn when write size is larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  479  		if (__compiletime_lessthan(p_size_field, size))
28e77cc1c06866 Kees Cook      2021-06-16 @480  			__write_overflow_field(p_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  481  	}
28e77cc1c06866 Kees Cook      2021-06-16  482  	/*
28e77cc1c06866 Kees Cook      2021-06-16  483  	 * At this point, length argument may not be a constant expression,
28e77cc1c06866 Kees Cook      2021-06-16  484  	 * so run-time bounds checking can be done where buffer sizes are
28e77cc1c06866 Kees Cook      2021-06-16  485  	 * known. (This is not an "else" because the above checks may only
28e77cc1c06866 Kees Cook      2021-06-16  486  	 * be compile-time warnings, and we want to still warn for run-time
28e77cc1c06866 Kees Cook      2021-06-16  487  	 * overflows.)
28e77cc1c06866 Kees Cook      2021-06-16  488  	 */
28e77cc1c06866 Kees Cook      2021-06-16  489  
28e77cc1c06866 Kees Cook      2021-06-16  490  	/*
28e77cc1c06866 Kees Cook      2021-06-16  491  	 * Always stop accesses beyond the struct that contains the
28e77cc1c06866 Kees Cook      2021-06-16  492  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  493  	 * (The SIZE_MAX test is to optimize away checks where the buffer
28e77cc1c06866 Kees Cook      2021-06-16  494  	 * lengths are unknown.)
28e77cc1c06866 Kees Cook      2021-06-16  495  	 */
311fb40aa0569a Kees Cook      2022-09-02  496  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  497  		fortify_panic(FORTIFY_FUNC_memset, FORTIFY_WRITE, p_size, size, true);
4ce615e798a752 Kees Cook      2023-04-07  498  	return false;
28e77cc1c06866 Kees Cook      2021-06-16  499  }
28e77cc1c06866 Kees Cook      2021-06-16  500  

:::::: The code at line 480 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct member overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
