Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606304C8C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 02:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712543819; cv=none; b=iZ5qxBC8A48MtU1OXHDEG5pXcORqdhYNLh1ql3nKWzk2GHOMP6ZpdBTsV5l85tyBZH7/rC+E1Z0Cq/RD4v3yR4H7gr6TLBxpxrRqBxK7/x6q9VwgG5M0+eYfMWssiWW6VjYqKUCVUFpS+braHyOanhmSzcN/dy8iBtUV7ZFov7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712543819; c=relaxed/simple;
	bh=2HF8yC3FYmeHLx733OfOstxuz0Nvj4/00VWqGdHdIEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ip6L6Ocq+CCHUKzWffoZI/c+YuQSnqCl9uqwkesgN5gaPgTyFmN+H4+BpHrAs0z/Hx3Pqy/SyEU5NQM/j+tU7EpY2dGTpohKneYs3nios2aju/cetb3y8euUuUe+vv9qRMnx5pPQtYA/czUtjFxrJLXhGGZJkgqLX2yzbtAPN08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhZMxePT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhZMxePT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712543817; x=1744079817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2HF8yC3FYmeHLx733OfOstxuz0Nvj4/00VWqGdHdIEQ=;
  b=nhZMxePTm6cpWmCcE3lnZ+2TyzGuF8XRtiP9rZ60b5TH8bwso9Cnmenr
   qlpzJbpmVVJzooGlgnAfMnm3Ssm2pJe/jllO9X0vLmIKHF1P7Znn97AlQ
   1tpETr7gbCBISKeaKSN6HutYXAhvImmruSVBm4OQWlq6OZ2BRH53krHst
   xC9xMQmc6uvdXMoSC4ov5Otc1zxdjbcRC0c/fi1UVO4Q3sQFg3K7hsaQP
   wLkUwa0TQMj+cdjkBI4ZAsQxV3eGJzPRN1wkbyP+GlwD/pfqhZoyxxA9r
   BWOw/U0eKt4p/y08EmqbCN2p9SiHIJPQ9KOUIkkgQJUZU16dxzBKdO2kH
   g==;
X-CSE-ConnectionGUID: EpiJJGHJSsyQmKInWyQx9A==
X-CSE-MsgGUID: RQop8TGjSEu0fjGvbvxkDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7987126"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7987126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 19:36:57 -0700
X-CSE-ConnectionGUID: VxkerL9VSNSG4KjliMByuw==
X-CSE-MsgGUID: SczoU5TpTQ2FL8jrNWPqnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="19854667"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Apr 2024 19:36:55 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtesP-0004oA-2C;
	Mon, 08 Apr 2024 02:36:53 +0000
Date: Mon, 8 Apr 2024 10:36:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 92/142] drivers/watchdog/wdt_pci.c:501:
 warning: Function parameter or struct member 'iocb' not described in
 'wdtpci_temp_read'
Message-ID: <202404081052.EmJga5Xk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   cf2473f3412d424a2c184396bc812a45f3ada363
commit: 810c89277644e1980a4ce245765b0e62676efb48 [92/142] drivers/watchdog: convert to read/write iterators
config: arc-randconfig-002-20240408 (https://download.01.org/0day-ci/archive/20240408/202404081052.EmJga5Xk-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404081052.EmJga5Xk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404081052.EmJga5Xk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/wdt_pci.c:275: warning: Function parameter or struct member 'temperature' not described in 'wdtpci_get_temperature'
>> drivers/watchdog/wdt_pci.c:501: warning: Function parameter or struct member 'iocb' not described in 'wdtpci_temp_read'
>> drivers/watchdog/wdt_pci.c:501: warning: Function parameter or struct member 'to' not described in 'wdtpci_temp_read'
>> drivers/watchdog/wdt_pci.c:501: warning: Excess function parameter 'file' description in 'wdtpci_temp_read'
>> drivers/watchdog/wdt_pci.c:501: warning: Excess function parameter 'buf' description in 'wdtpci_temp_read'
>> drivers/watchdog/wdt_pci.c:501: warning: Excess function parameter 'count' description in 'wdtpci_temp_read'
>> drivers/watchdog/wdt_pci.c:501: warning: Excess function parameter 'ptr' description in 'wdtpci_temp_read'


vim +501 drivers/watchdog/wdt_pci.c

^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  488  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  489  /**
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  490   *	wdtpci_temp_read:
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  491   *	@file: file handle to the watchdog board
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  492   *	@buf: buffer to write 1 byte into
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  493   *	@count: length of buffer
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  494   *	@ptr: offset (no seek allowed)
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  495   *
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  496   *	Read reports the temperature in degrees Fahrenheit. The API is in
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  497   *	fahrenheit. It was designed by an imperial measurement luddite.
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  498   */
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  499  
810c89277644e1 drivers/watchdog/wdt_pci.c      Jens Axboe     2024-04-07  500  static ssize_t wdtpci_temp_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16 @501  {
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  502  	int temperature;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  503  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  504  	if (wdtpci_get_temperature(&temperature))
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  505  		return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  506  
810c89277644e1 drivers/watchdog/wdt_pci.c      Jens Axboe     2024-04-07  507  	if (!copy_to_iter_full(&temperature, 1, to))
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  508  		return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  509  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  510  	return 1;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  511  }
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds 2005-04-16  512  

:::::: The code at line 501 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
