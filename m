Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C612F37C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 18:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253908; cv=none; b=dfnaG4YeLxW53eD2NIzdXzvoJVmqEpt2yL9FqNnUDtNyMPfkkDl5f+7PIFTpTFexV6YhD0fuTTHLiwOJa8MKZzkFFzBhKX8DvJtg8lX1MevDs7ndqekd2+3JYmU+iQudC9tMG2bfw4reh9U6xj1t/8nO4tsvV/XyD9QWXT1p0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253908; c=relaxed/simple;
	bh=bwNkXtnOzyNpHVckY+6VPgP8oUISPH2aCiB/SeI6SD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SiLPyEhFkHg4YwKF655I/uyZ3UQGg9gPW4aboyOaahhCMAiTOwR8vQDj/VoKy4gDWHqLELOxJCabmPlPrUIemTvRjMyfam5nF5EdAPqFKNf2x8EmxcpmCBj2fVGMEnnkE2dU14MvTSpGqLYauPFg0OZyo1vP9DfQwRKvbc8jd3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNw+6+D0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNw+6+D0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712253906; x=1743789906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwNkXtnOzyNpHVckY+6VPgP8oUISPH2aCiB/SeI6SD0=;
  b=VNw+6+D0Kv7JE6Zh/fbV3u8tDj6nAdsB13L3VgmcdolhRlFcbQ7mcOMB
   4CzwMsUYqHU7yBZPGqOlPfIyjhpblDHPYQkKhvgm0MXMZqeLKHfDbT+bj
   Su48VpgbDoaI2lMio4BPb/vIWGgB36tPTYSrn/9Lir+t3UGBDZtI3ez1Q
   dRp89NQY/9ncl+w+YLbL9ncj++ooyUKsxA0EHG03Bt2kdtiP7UwRWLCJm
   WneJVNFXhTbEVGWtQVcT1NQNS2OoJWdFKVSPQ3oyyqyWZ9B3lLT27VVuz
   S6c6ywIU7EWbOlyVwnuG0jFdrwpHd0r3r1hjXhj5sSvTgUpv1P2UCsg9Z
   A==;
X-CSE-ConnectionGUID: kPcL/RozTVu6Qq2yL8Dg3w==
X-CSE-MsgGUID: 0RaiWUdCQKOY7uj/9S1ZWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25002923"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="25002923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 11:05:05 -0700
X-CSE-ConnectionGUID: y/WHFc7KSPy53yIxbcxD3w==
X-CSE-MsgGUID: xaCr/L+RRsu080MmcVEFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19478034"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Apr 2024 11:05:04 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsRSP-0001LW-2J;
	Thu, 04 Apr 2024 18:05:01 +0000
Date: Fri, 5 Apr 2024 02:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 8/17] drivers/char/mem.c:209:17: error: 'buf'
 undeclared; did you mean 'btf'?
Message-ID: <202404050113.bs8MZ6oZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   abf039f568d1cb3559719a95366691c120449cd9
commit: a60eb2a07b5eb5064a5636204550c1df87d20751 [8/17] char: convert drivers to use ->read_iter() and ->write_iter()
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20240405/202404050113.bs8MZ6oZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404050113.bs8MZ6oZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404050113.bs8MZ6oZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/mem.c: In function 'write_mem':
>> drivers/char/mem.c:209:17: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
     209 |                 buf += sz;
         |                 ^~~
         |                 btf
   drivers/char/mem.c:209:17: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/char/nvram.c: In function 'nvram_misc_read':
>> drivers/char/nvram.c:230:24: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
     230 |         size_t count = iov_iter_count(to);
         |                        ^~~~~~~~~~~~~~
>> drivers/char/nvram.c:249:13: error: implicit declaration of function 'copy_to_iter_full' [-Werror=implicit-function-declaration]
     249 |         if (copy_to_iter_full(tmp, ret, to)) {
         |             ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +209 drivers/char/mem.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  187  
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  188  static ssize_t write_mem(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds                2005-04-16  189  {
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  190  	size_t count = iov_iter_count(from);
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  191  	phys_addr_t p = iocb->ki_pos;
^1da177e4c3f41 Linus Torvalds                2005-04-16  192  	ssize_t written, sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  193  	unsigned long copied;
^1da177e4c3f41 Linus Torvalds                2005-04-16  194  	void *ptr;
^1da177e4c3f41 Linus Torvalds                2005-04-16  195  
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  196  	if (p != iocb->ki_pos)
08d2d00b291ed4 Petr Tesarik                  2014-01-30  197  		return -EFBIG;
08d2d00b291ed4 Petr Tesarik                  2014-01-30  198  
136939a2b5aa43 Bjorn Helgaas                 2006-03-26  199  	if (!valid_phys_addr_range(p, count))
^1da177e4c3f41 Linus Torvalds                2005-04-16  200  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds                2005-04-16  201  
^1da177e4c3f41 Linus Torvalds                2005-04-16  202  	written = 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  203  
^1da177e4c3f41 Linus Torvalds                2005-04-16  204  #ifdef __ARCH_HAS_NO_PAGE_ZERO_MAPPED
^1da177e4c3f41 Linus Torvalds                2005-04-16  205  	/* we don't have page 0 mapped on sparc and m68k.. */
^1da177e4c3f41 Linus Torvalds                2005-04-16  206  	if (p < PAGE_SIZE) {
7fabaddd09ab32 Wu Fengguang                  2009-12-14  207  		sz = size_inside_page(p, count);
^1da177e4c3f41 Linus Torvalds                2005-04-16  208  		/* Hmm. Do something? */
^1da177e4c3f41 Linus Torvalds                2005-04-16 @209  		buf += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  210  		p += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  211  		count -= sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  212  		written += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  213  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  214  #endif
^1da177e4c3f41 Linus Torvalds                2005-04-16  215  
^1da177e4c3f41 Linus Torvalds                2005-04-16  216  	while (count > 0) {
a4866aa812518e Kees Cook                     2017-04-05  217  		int allowed;
a4866aa812518e Kees Cook                     2017-04-05  218  
f222318e9c3a31 Wu Fengguang                  2009-12-14  219  		sz = size_inside_page(p, count);
^1da177e4c3f41 Linus Torvalds                2005-04-16  220  
a4866aa812518e Kees Cook                     2017-04-05  221  		allowed = page_is_allowed(p >> PAGE_SHIFT);
a4866aa812518e Kees Cook                     2017-04-05  222  		if (!allowed)
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  223  			return -EPERM;
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  224  
a4866aa812518e Kees Cook                     2017-04-05  225  		/* Skip actual writing when a page is marked as restricted. */
a4866aa812518e Kees Cook                     2017-04-05  226  		if (allowed == 1) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  227  			/*
a4866aa812518e Kees Cook                     2017-04-05  228  			 * On ia64 if a page has been mapped somewhere as
a4866aa812518e Kees Cook                     2017-04-05  229  			 * uncached, then it must also be accessed uncached
a4866aa812518e Kees Cook                     2017-04-05  230  			 * by the kernel or data corruption may occur.
^1da177e4c3f41 Linus Torvalds                2005-04-16  231  			 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  232  			ptr = xlate_dev_mem_ptr(p);
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  233  			if (!ptr) {
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  234  				if (written)
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  235  					break;
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  236  				return -EFAULT;
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  237  			}
^1da177e4c3f41 Linus Torvalds                2005-04-16  238  
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  239  			copied = copy_from_iter(ptr, sz, from);
fa29e97bb8c70f Wu Fengguang                  2009-12-14  240  			unxlate_dev_mem_ptr(p, ptr);
^1da177e4c3f41 Linus Torvalds                2005-04-16  241  			if (copied) {
c654d60e8f0ea1 Jan Beulich                   2006-03-25  242  				written += sz - copied;
c654d60e8f0ea1 Jan Beulich                   2006-03-25  243  				if (written)
c654d60e8f0ea1 Jan Beulich                   2006-03-25  244  					break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  245  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds                2005-04-16  246  			}
a4866aa812518e Kees Cook                     2017-04-05  247  		}
e045fb2a988a9a venkatesh.pallipadi@intel.com 2008-03-18  248  
^1da177e4c3f41 Linus Torvalds                2005-04-16  249  		p += sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  250  		count -= sz;
^1da177e4c3f41 Linus Torvalds                2005-04-16  251  		written += sz;
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  252  		if (should_stop_iteration())
8619e5bdeee8b2 Tetsuo Handa                  2019-08-26  253  			break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  254  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  255  
a60eb2a07b5eb5 Jens Axboe                    2024-04-03  256  	iocb->ki_pos += written;
^1da177e4c3f41 Linus Torvalds                2005-04-16  257  	return written;
^1da177e4c3f41 Linus Torvalds                2005-04-16  258  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  259  

:::::: The code at line 209 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
