Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD7C4597B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710828568; cv=none; b=ffMJeIIWYPv276YSUd+CVg8Mdf1PzLTxNGZdf8TIzN7Ndoqe7EAtClB3eZoVo+fP0rLrAwKXEIhVeoMXjXJ2FAyc0nsFaCpemaotiQXjWwug8JTiKMMezNSlKZlw/YVdTdGHtc1yp0VueXw9qMQPWkyjruy79BE0WPgn8YWh3eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710828568; c=relaxed/simple;
	bh=PNwrFkeC8yv8ZNBgkh3DkbPjZZvUftA2J+NLtDM1DXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNNlE7O6Eu0KJCSUpHQcyUuawz0v6MDrX66QAOyfnctQxsxaxgcBMU/F1k5c6MDFMPqnnKI7ickBfiHXQfFlN1zzLPT0YRFEhpMMaugc9mcbMPfZG5ob4n0dAlhbeTfYp00gxGsBoHG3Q/wMIirJ9zkqYrOLLEFFBTcgd4z3XIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzST4pOc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzST4pOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710828567; x=1742364567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNwrFkeC8yv8ZNBgkh3DkbPjZZvUftA2J+NLtDM1DXs=;
  b=MzST4pOcXKWC9RUiHR9Lq+wCdqf0w8acePjv1Y1uK1tAVmmpyuE13hWA
   YJ57a2RS0eTiWgicxZ8zXVG87ED26xFCR0kyqi4r1JPM9qM4ABvEV0fdk
   r7exk/YYhK39kb7JuE3ZhdX7DxRLcUPPZ/5kcIPOG9bkq4poehyzXdu+V
   NS6QJWFuhHz8Juwj0AIsIRDkIaKgpE+1pT5E/P/6y6IpmfkGM/o1coma4
   0Vu9wILcNxK52xfsrOIpoBCBS78OGiqKu0R5gQlfhtvtTWlxQ6BqOSFJY
   aNMgiL1nGYWyT1Ucw2U0zYU7w6l0HbEc+Wl5u2+skTWGUA4LQMHwtYyY5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17080183"
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="17080183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 23:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,136,1708416000"; 
   d="scan'208";a="51115470"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Mar 2024 23:09:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmSf3-000HWZ-1O;
	Tue, 19 Mar 2024 06:09:21 +0000
Date: Tue, 19 Mar 2024 14:08:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.4.y-st-rt 1008/22725]
 arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible
 pointer type
Message-ID: <202403191433.fX3nKbft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   0a25e06c1d858ae27efabaa88494a6dc998a0138
commit: ad64c64a8f7ac0cb8357c598d152076cd3a7216d [1008/22725] Add upstream swait
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20240319/202403191433.fX3nKbft-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403191433.fX3nKbft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403191433.fX3nKbft-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/proc/vmcore.c: In function '__read_vmcore':
   fs/proc/vmcore.c:192:27: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (buflen == 0 || *fpos >= vmcore_size)
                              ^~
   fs/proc/vmcore.c:233:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (*fpos < m->offset + m->size) {
                ^
   In file included from include/linux/elf.h:4:0,
                    from fs/proc/vmcore.c:13:
   fs/proc/vmcore.c: In function 'parse_crash_elf64_headers':
>> arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     struct elfhdr *__h = (hdr);     \
                          ^
   include/linux/crash_dump.h:41:37: note: in expansion of macro 'elf_check_arch'
    #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
                                        ^~~~~~~~~~~~~~
   fs/proc/vmcore.c:1015:4: note: in expansion of macro 'vmcore_elf64_check_arch'
      !vmcore_elf64_check_arch(&ehdr) ||
       ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +228 arch/mips/include/asm/elf.h

597ce1723e0fa0 arch/mips/include/asm/elf.h Paul Burton    2013-11-22  221  
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  222  /*
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  223   * This is used to ensure we don't load something for the wrong architecture.
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  224   */
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  225  #define elf_check_arch(hdr)						\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  226  ({									\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  227  	int __res = 1;							\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16 @228  	struct elfhdr *__h = (hdr);					\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  229  									\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  230  	if (__h->e_machine != EM_MIPS)					\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  231  		__res = 0;						\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  232  	if (__h->e_ident[EI_CLASS] != ELFCLASS32)			\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  233  		__res = 0;						\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  234  	if ((__h->e_flags & EF_MIPS_ABI2) != 0)				\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  235  		__res = 0;						\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  236  	if (((__h->e_flags & EF_MIPS_ABI) != 0) &&			\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  237  	    ((__h->e_flags & EF_MIPS_ABI) != EF_MIPS_ABI_O32))		\
597ce1723e0fa0 arch/mips/include/asm/elf.h Paul Burton    2013-11-22  238  		__res = 0;						\
597ce1723e0fa0 arch/mips/include/asm/elf.h Paul Burton    2013-11-22  239  	if (__h->e_flags & __MIPS_O32_FP64_MUST_BE_ZERO)		\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  240  		__res = 0;						\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  241  									\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  242  	__res;								\
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  243  })
^1da177e4c3f41 include/asm-mips/elf.h      Linus Torvalds 2005-04-16  244  

:::::: The code at line 228 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
