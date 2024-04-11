Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18F914A09C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712836590; cv=none; b=G2SU1jAK+PVKyrHmXaBBY0cA5r8SaZjDibc2nQv1LKvkTJ7EV085pSbhw4y6zBSheSjnhmloXyazraYQAK96S3hzMNLOPasQtnIswU9W4oipSQPHni4jw1AMNUluHcBxzD0QBTnr3iKRJIkiJW1Bv0gbqpPQHQLhhUiVM5Kueq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712836590; c=relaxed/simple;
	bh=8z/EB/Lr4O9eyrlEjuGAFSZOjkNgZf4B55JgAkFjoos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fMyYqItoKqJ/R6T2wLwUgue+w4Dsp1rwvQYI+qHD7AxNNxHy8NsqdeNeX1xh/ws7NYe9+diQ6rKralQB6QIYWEtWSjFdvTC0ex5ADzarQ2OOBBN79c8mPqlVsvzqcFXs8Omy9fhxmXRgCeZb9kzibvdnhjgbZWiKk4kJZR4DL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0SDTfU+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0SDTfU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712836589; x=1744372589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8z/EB/Lr4O9eyrlEjuGAFSZOjkNgZf4B55JgAkFjoos=;
  b=T0SDTfU+npSF4fbPgsNy3NQvZF8bI2pkjIP/7656U/f2fyhWK4C7FHtD
   nbbWPBip2ceiH9VqRdsZPGpuDpvVmAFpkYjSgxy/d7vukSB4w20R/ia6B
   IDFnjoqSD052JmrOzL8EGkAz1oXOayJhECaRowx/RQHI1Inaic91+TCkJ
   m8gcRuNkkAVry1aX+g/BGxhVpi8SouO3mChKTLXyEM3VGvqeZc26MHFDd
   dEGyMBSSKph9FyOGMvssxIcQcNfP1wnV2IfuUbuyS0iFivHZT9fJtNvdG
   TcFh2FIoK0oJR57vFAVdIK3MVTt7Oe2qIVVjOkWSXwTkzpze60oe0Tefn
   Q==;
X-CSE-ConnectionGUID: Z1gr86oJTvq9AxhN5Fxs3w==
X-CSE-MsgGUID: efB+HOFnTQiCsbRqyut0ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="12030183"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="12030183"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 04:56:29 -0700
X-CSE-ConnectionGUID: T0/bxb+7QwyRq5g99ej65w==
X-CSE-MsgGUID: 4BGOmraMSI2k5BFv7+ePUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="58298545"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Apr 2024 04:56:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rut2W-0008aH-29;
	Thu, 11 Apr 2024 11:56:24 +0000
Date: Thu, 11 Apr 2024 19:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 248/415] drivers/watchdog/wdt_pci.c:354:
 warning: Function parameter or struct member 'iocb' not described in
 'wdtpci_write'
Message-ID: <202404111921.8eVxdCGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   2cdbd541e4481cb9cbd08913e0586dc8a2570aec
commit: 60d0d51708c1525ed4585715db06bd77e5b8f7c1 [248/415] watchdog: wdt_pci: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111921.8eVxdCGM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111921.8eVxdCGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111921.8eVxdCGM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/wdt_pci.c:275: warning: Function parameter or struct member 'temperature' not described in 'wdtpci_get_temperature'
>> drivers/watchdog/wdt_pci.c:354: warning: Function parameter or struct member 'iocb' not described in 'wdtpci_write'
>> drivers/watchdog/wdt_pci.c:354: warning: Function parameter or struct member 'from' not described in 'wdtpci_write'
>> drivers/watchdog/wdt_pci.c:354: warning: Excess function parameter 'file' description in 'wdtpci_write'
>> drivers/watchdog/wdt_pci.c:354: warning: Excess function parameter 'buf' description in 'wdtpci_write'
>> drivers/watchdog/wdt_pci.c:354: warning: Excess function parameter 'count' description in 'wdtpci_write'
>> drivers/watchdog/wdt_pci.c:354: warning: Excess function parameter 'ppos' description in 'wdtpci_write'


vim +354 drivers/watchdog/wdt_pci.c

^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  340  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  341  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  342  /**
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  343   *	wdtpci_write:
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  344   *	@file: file handle to the watchdog
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  345   *	@buf: buffer to write (unused as data does not matter here
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  346   *	@count: count of bytes
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  347   *	@ppos: pointer to the position to write. No seeks allowed
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  348   *
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  349   *	A write to a watchdog device is defined as a keepalive signal. Any
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  350   *	write of data will do, as we we don't define content meaning.
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  351   */
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  352  
60d0d51708c152 drivers/watchdog/wdt_pci.c      Jens Axboe       2024-04-08  353  static ssize_t wdtpci_write(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16 @354  {
60d0d51708c152 drivers/watchdog/wdt_pci.c      Jens Axboe       2024-04-08  355  	size_t count = iov_iter_count(from);
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  356  	if (count) {
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  357  		if (!nowayout) {
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  358  			size_t i;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  359  
9b901ee0cb007e drivers/watchdog/wdt_pci.c      Wim Van Sebroeck 2009-06-19  360  			/* In case it was set long ago */
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  361  			expect_close = 0;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  362  
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  363  			for (i = 0; i != count; i++) {
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  364  				char c;
60d0d51708c152 drivers/watchdog/wdt_pci.c      Jens Axboe       2024-04-08  365  				if (get_iter(c, from))
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  366  					return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  367  				if (c == 'V')
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  368  					expect_close = 42;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  369  			}
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  370  		}
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  371  		wdtpci_ping();
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  372  	}
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  373  	return count;
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  374  }
^1da177e4c3f41 drivers/char/watchdog/wdt_pci.c Linus Torvalds   2005-04-16  375  

:::::: The code at line 354 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
