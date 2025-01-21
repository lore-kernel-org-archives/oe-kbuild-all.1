Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE571A8F7A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 05:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737437447; cv=none; b=cFfufMDMMDeA3GaoXJg++eIHoico+Kds1Sosz7mtzHCeZT1x82uYGHgsM9pf9FPFy8k9bMktnuH+Xx6WRtT04sVxwMNkjHyphqwV682afruDuu7a0+cz8uJLeUrcSBUzKLpuAAS3KONMDycwb4+E64bvFCoyy+ePUWleW8oszZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737437447; c=relaxed/simple;
	bh=JLdQtrJouSNVa276BiJkfFpGW9Q7A7wR9szYEP6fK/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I0j6/AZsl0Hkuizr1GL0ZqO1R68BW79XFxbCMasihR/4tsr0ZG/lXF9k8RWRG4MKNAsC/qAxg8OPtnYMVKjU0JeREIGO0lcSzejjWcOr3tBKoceVlVORtbVmZq0LtlcQcqNFA7Nki2/65cRz09jr/JvIydNhpAbErZjf90pxa5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQB1V+M8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQB1V+M8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737437445; x=1768973445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JLdQtrJouSNVa276BiJkfFpGW9Q7A7wR9szYEP6fK/w=;
  b=XQB1V+M8pifOi7bLsVSgpKGG5cNwl+O9J8J1FhR2R2vP9sbADiTBwiAy
   /d0ahW0jJS3rmXugyJ0p0oI9nQNr43xZkYGuYg7ujMzCd39bFy1FtDLF6
   nJ38F+xOg7iVbLhuPY256bqu2TDHYauGnQgF3VO0ibESZN26Cu/wfZ5Bu
   xc4MN+upFUOo7TqbZEKU4mCZAnNZCkoAooPqd0yj0IBJvGcFuNJRpsEpM
   JxMURut1fC1bh5b7UQEL6EhzKQLL39CVaUoS9+VUgUwaVskEyAKc3sEbY
   YLCVsR/O37/oqDA2KSzHnlacXd6CgZMWF8V54B881Rt0r2RS2KR4ilDiY
   A==;
X-CSE-ConnectionGUID: +Brzh7rbTG2KI2jWv3PU/g==
X-CSE-MsgGUID: Sk5yVLlWT/yrdQMlpe6E2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38080064"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; 
   d="scan'208";a="38080064"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 21:30:44 -0800
X-CSE-ConnectionGUID: NNqPVOiLTjqkvtmNtdbYRw==
X-CSE-MsgGUID: fo/DZ1koTWSC7EAOlocpug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111672837"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2025 21:30:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta6qX-000Xf3-09;
	Tue, 21 Jan 2025 05:30:41 +0000
Date: Tue, 21 Jan 2025 13:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/fortify-string.h:293:25: warning: call to
 '__write_overflow_field' declared with attribute warning: detected write
 beyond size of field (1st parameter); maybe use struct_group()?
Message-ID: <202501211321.ZolvnwaP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d3a9c8b89d4f8a3785e06ffd15405c670696f02
commit: ba38961a069b0d8d03b53218a6c29d737577d448 um: Enable FORTIFY_SOURCE
date:   2 years, 4 months ago
config: um-randconfig-r133-20240603 (https://download.01.org/0day-ci/archive/20250121/202501211321.ZolvnwaP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211321.ZolvnwaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211321.ZolvnwaP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:253,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:62,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from fs/ocfs2/dlmglue.c:11:
   In function 'fortify_memset_chk',
       inlined from 'ocfs2_lock_res_free' at fs/ocfs2/dlmglue.c:790:2:
>> include/linux/fortify-string.h:293:25: warning: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     293 |                         __write_overflow_field(p_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__write_overflow_field +293 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  275  
28e77cc1c06866 Kees Cook      2021-06-16  276  __FORTIFY_INLINE void fortify_memset_chk(__kernel_size_t size,
28e77cc1c06866 Kees Cook      2021-06-16  277  					 const size_t p_size,
28e77cc1c06866 Kees Cook      2021-06-16  278  					 const size_t p_size_field)
a28a6e860c6cf2 Francis Laniel 2021-02-25  279  {
28e77cc1c06866 Kees Cook      2021-06-16  280  	if (__builtin_constant_p(size)) {
28e77cc1c06866 Kees Cook      2021-06-16  281  		/*
28e77cc1c06866 Kees Cook      2021-06-16  282  		 * Length argument is a constant expression, so we
28e77cc1c06866 Kees Cook      2021-06-16  283  		 * can perform compile-time bounds checking where
28e77cc1c06866 Kees Cook      2021-06-16  284  		 * buffer sizes are known.
28e77cc1c06866 Kees Cook      2021-06-16  285  		 */
a28a6e860c6cf2 Francis Laniel 2021-02-25  286  
28e77cc1c06866 Kees Cook      2021-06-16  287  		/* Error when size is larger than enclosing struct. */
28e77cc1c06866 Kees Cook      2021-06-16  288  		if (p_size > p_size_field && p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  289  			__write_overflow();
28e77cc1c06866 Kees Cook      2021-06-16  290  
28e77cc1c06866 Kees Cook      2021-06-16  291  		/* Warn when write size is larger than dest field. */
28e77cc1c06866 Kees Cook      2021-06-16  292  		if (p_size_field < size)
28e77cc1c06866 Kees Cook      2021-06-16 @293  			__write_overflow_field(p_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  294  	}
28e77cc1c06866 Kees Cook      2021-06-16  295  	/*
28e77cc1c06866 Kees Cook      2021-06-16  296  	 * At this point, length argument may not be a constant expression,
28e77cc1c06866 Kees Cook      2021-06-16  297  	 * so run-time bounds checking can be done where buffer sizes are
28e77cc1c06866 Kees Cook      2021-06-16  298  	 * known. (This is not an "else" because the above checks may only
28e77cc1c06866 Kees Cook      2021-06-16  299  	 * be compile-time warnings, and we want to still warn for run-time
28e77cc1c06866 Kees Cook      2021-06-16  300  	 * overflows.)
28e77cc1c06866 Kees Cook      2021-06-16  301  	 */
28e77cc1c06866 Kees Cook      2021-06-16  302  
28e77cc1c06866 Kees Cook      2021-06-16  303  	/*
28e77cc1c06866 Kees Cook      2021-06-16  304  	 * Always stop accesses beyond the struct that contains the
28e77cc1c06866 Kees Cook      2021-06-16  305  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  306  	 * (The SIZE_MAX test is to optimize away checks where the buffer
28e77cc1c06866 Kees Cook      2021-06-16  307  	 * lengths are unknown.)
28e77cc1c06866 Kees Cook      2021-06-16  308  	 */
311fb40aa0569a Kees Cook      2022-09-02  309  	if (p_size != SIZE_MAX && p_size < size)
28e77cc1c06866 Kees Cook      2021-06-16  310  		fortify_panic("memset");
28e77cc1c06866 Kees Cook      2021-06-16  311  }
28e77cc1c06866 Kees Cook      2021-06-16  312  

:::::: The code at line 293 was first introduced by commit
:::::: 28e77cc1c0686621a4d416f599cee5ab369daa0a fortify: Detect struct member overflows in memset() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
