Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F021315B96F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 16:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722876846; cv=none; b=oVi5PxfhXn9c1gXlUSHUjEjPo97lWdjZpwX9uKf/KlnxQKdgy/PnFlLyh7QX4OeI/xLwpkCe9Sd4kjFfCXOzMeLrQw5Q9bX6mVZeZFM8QVaTBwctkO6PIisI0j+txkJLwU6XHg6pFffkqaEXj8Se1zQv0xEn1DFMosAg7B1Gr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722876846; c=relaxed/simple;
	bh=C53LDstcOe4uYOCd6nxXWgnXiJr8qusDqOZjliOLGNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LW0EW871nfsWmdsoUTHQiWMtvTXOEtvCRAl5PPmnH/x6ZE67/rL09vqmtlXQy6/ZJnodBitw3J6tf3DHMlDdXtPWKOZ5+QUUlJH8iIhznfrYOvRyosXFWdO2aNTZb4f5p/EerUN3LnMcitHlYihFoeTfaEdXyq9iOdfMbSWaQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGCDlXR2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGCDlXR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722876844; x=1754412844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C53LDstcOe4uYOCd6nxXWgnXiJr8qusDqOZjliOLGNI=;
  b=hGCDlXR26pIRla1mTxvb5z6AkrNdmmmrHqzMzB2PQgLtGLglS2cXrxas
   7E55Ftfv0TxjRESO7WNJdbdxMCsBezhi26MLCRW59ELqssss0HXSW4p1u
   UAM5Yq5+7x3uUQQrmP5JRH+ZaxZnx+zI5evVdgvWJkQzqQv9mCLbuCbdL
   nYTSg+yETzjnvj03oLfmAnFBTaqwXE8gY6CNTdAt8G/fu0612wAh6+AUv
   kzjKeY/fwnzsFoCuYixvhFy14djRNT889SgZzI1nReXVDPaL4fxzUymsY
   UrCIak0b2AzPl24HZjnWm4wc803S/qNpcWN/ZOV956HNJLoJcagm94WSy
   Q==;
X-CSE-ConnectionGUID: LvYBfEVvQpC+lG1FohoefQ==
X-CSE-MsgGUID: B8RCvDaGSo6nTB541ZJdSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20706734"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20706734"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 09:54:03 -0700
X-CSE-ConnectionGUID: 7PBAsaEUT1SSyPXGdxaXuA==
X-CSE-MsgGUID: vvuPr8CkRBmLSE3fxAkd7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="93759438"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Aug 2024 09:54:03 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb0y8-0003FF-0p;
	Mon, 05 Aug 2024 16:54:00 +0000
Date: Tue, 6 Aug 2024 00:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 24/442] drivers/char/mem.c:209:17: error: 'buf'
 undeclared; did you mean 'btf'?
Message-ID: <202408060034.gmQ1Mobn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449894f5917ad62cb4083d1df948f4f5c92a01da
commit: 0df0f0698ee57ecb346482b78672fbe3274b54bf [24/442] char/mem: convert to read/write iterators
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240806/202408060034.gmQ1Mobn-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060034.gmQ1Mobn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060034.gmQ1Mobn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/mem.c: In function 'write_mem':
>> drivers/char/mem.c:209:17: error: 'buf' undeclared (first use in this function); did you mean 'btf'?
     209 |                 buf += sz;
         |                 ^~~
         |                 btf
   drivers/char/mem.c:209:17: note: each undeclared identifier is reported only once for each function it appears in


vim +209 drivers/char/mem.c

^1da177e4c3f415 Linus Torvalds                2005-04-16  187  
0df0f0698ee57ec Jens Axboe                    2024-04-09  188  static ssize_t write_mem(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f415 Linus Torvalds                2005-04-16  189  {
0df0f0698ee57ec Jens Axboe                    2024-04-09  190  	size_t count = iov_iter_count(from);
0df0f0698ee57ec Jens Axboe                    2024-04-09  191  	phys_addr_t p = iocb->ki_pos;
^1da177e4c3f415 Linus Torvalds                2005-04-16  192  	ssize_t written, sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  193  	unsigned long copied;
^1da177e4c3f415 Linus Torvalds                2005-04-16  194  	void *ptr;
^1da177e4c3f415 Linus Torvalds                2005-04-16  195  
0df0f0698ee57ec Jens Axboe                    2024-04-09  196  	if (p != iocb->ki_pos)
08d2d00b291ed4e Petr Tesarik                  2014-01-30  197  		return -EFBIG;
08d2d00b291ed4e Petr Tesarik                  2014-01-30  198  
136939a2b5aa430 Bjorn Helgaas                 2006-03-26  199  	if (!valid_phys_addr_range(p, count))
^1da177e4c3f415 Linus Torvalds                2005-04-16  200  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds                2005-04-16  201  
^1da177e4c3f415 Linus Torvalds                2005-04-16  202  	written = 0;
^1da177e4c3f415 Linus Torvalds                2005-04-16  203  
^1da177e4c3f415 Linus Torvalds                2005-04-16  204  #ifdef __ARCH_HAS_NO_PAGE_ZERO_MAPPED
^1da177e4c3f415 Linus Torvalds                2005-04-16  205  	/* we don't have page 0 mapped on sparc and m68k.. */
^1da177e4c3f415 Linus Torvalds                2005-04-16  206  	if (p < PAGE_SIZE) {
7fabaddd09ab32a Wu Fengguang                  2009-12-14  207  		sz = size_inside_page(p, count);
^1da177e4c3f415 Linus Torvalds                2005-04-16  208  		/* Hmm. Do something? */
^1da177e4c3f415 Linus Torvalds                2005-04-16 @209  		buf += sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  210  		p += sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  211  		count -= sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  212  		written += sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  213  	}
^1da177e4c3f415 Linus Torvalds                2005-04-16  214  #endif
^1da177e4c3f415 Linus Torvalds                2005-04-16  215  
^1da177e4c3f415 Linus Torvalds                2005-04-16  216  	while (count > 0) {
a4866aa812518ed Kees Cook                     2017-04-05  217  		int allowed;
a4866aa812518ed Kees Cook                     2017-04-05  218  
f222318e9c3a315 Wu Fengguang                  2009-12-14  219  		sz = size_inside_page(p, count);
^1da177e4c3f415 Linus Torvalds                2005-04-16  220  
a4866aa812518ed Kees Cook                     2017-04-05  221  		allowed = page_is_allowed(p >> PAGE_SHIFT);
a4866aa812518ed Kees Cook                     2017-04-05  222  		if (!allowed)
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  223  			return -EPERM;
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  224  
a4866aa812518ed Kees Cook                     2017-04-05  225  		/* Skip actual writing when a page is marked as restricted. */
a4866aa812518ed Kees Cook                     2017-04-05  226  		if (allowed == 1) {
^1da177e4c3f415 Linus Torvalds                2005-04-16  227  			/*
a4866aa812518ed Kees Cook                     2017-04-05  228  			 * On ia64 if a page has been mapped somewhere as
a4866aa812518ed Kees Cook                     2017-04-05  229  			 * uncached, then it must also be accessed uncached
a4866aa812518ed Kees Cook                     2017-04-05  230  			 * by the kernel or data corruption may occur.
^1da177e4c3f415 Linus Torvalds                2005-04-16  231  			 */
^1da177e4c3f415 Linus Torvalds                2005-04-16  232  			ptr = xlate_dev_mem_ptr(p);
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  233  			if (!ptr) {
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  234  				if (written)
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  235  					break;
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  236  				return -EFAULT;
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  237  			}
^1da177e4c3f415 Linus Torvalds                2005-04-16  238  
0df0f0698ee57ec Jens Axboe                    2024-04-09  239  			copied = copy_from_iter(ptr, sz, from);
fa29e97bb8c70fd Wu Fengguang                  2009-12-14  240  			unxlate_dev_mem_ptr(p, ptr);
^1da177e4c3f415 Linus Torvalds                2005-04-16  241  			if (copied) {
c654d60e8f0ea13 Jan Beulich                   2006-03-25  242  				written += sz - copied;
c654d60e8f0ea13 Jan Beulich                   2006-03-25  243  				if (written)
c654d60e8f0ea13 Jan Beulich                   2006-03-25  244  					break;
^1da177e4c3f415 Linus Torvalds                2005-04-16  245  				return -EFAULT;
^1da177e4c3f415 Linus Torvalds                2005-04-16  246  			}
a4866aa812518ed Kees Cook                     2017-04-05  247  		}
e045fb2a988a9a1 venkatesh.pallipadi@intel.com 2008-03-18  248  
^1da177e4c3f415 Linus Torvalds                2005-04-16  249  		p += sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  250  		count -= sz;
^1da177e4c3f415 Linus Torvalds                2005-04-16  251  		written += sz;
8619e5bdeee8b2c Tetsuo Handa                  2019-08-26  252  		if (should_stop_iteration())
8619e5bdeee8b2c Tetsuo Handa                  2019-08-26  253  			break;
^1da177e4c3f415 Linus Torvalds                2005-04-16  254  	}
^1da177e4c3f415 Linus Torvalds                2005-04-16  255  
0df0f0698ee57ec Jens Axboe                    2024-04-09  256  	iocb->ki_pos += written;
^1da177e4c3f415 Linus Torvalds                2005-04-16  257  	return written;
^1da177e4c3f415 Linus Torvalds                2005-04-16  258  }
^1da177e4c3f415 Linus Torvalds                2005-04-16  259  

:::::: The code at line 209 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
