Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0810A11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712818453; cv=none; b=EREyk9by5iyKcjA6otC8RBTrzgq/0+sPswPtvdkEmPWKLrtIPye0/avR3sgRXoCEpb4hGP1ZUfywPt4OEJawLjn0MSiD0PYw6Ai2ZOnYi1PhewhE3W8o8dHJfjZCdiiinwKjOUiyZ4xI1AxGdTDQVKPRxU1ZBuZyHD3EMBPm1QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712818453; c=relaxed/simple;
	bh=JtdDA4DiM2miWGEPaIiRww6qbrA46xcNczGJgb/Hoh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qkiWtoF/zuAaOCPSJoZd9zCPYbOHehaROG8nn9nPWbXnur1O/UKfmGUVeQzj4Y5e7xz7JWJIJxaF2DeFpdWaHA5VJaiy32mz3Zb6JUfNRwwoPLwh0iQta7aX7xYnEpVllnT3/5+CPVRAdgNKeZtF6y9FzWAummGVw75uu1hO6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrUOojz3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrUOojz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712818452; x=1744354452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtdDA4DiM2miWGEPaIiRww6qbrA46xcNczGJgb/Hoh8=;
  b=FrUOojz3Hhm/3xmHmIT4KD25BmSF6Fso3c5ZfyR82WnT/NzyrHIdoQ67
   iDtlh4MehWIAOYvsXBTJy4oG+cy/i+Uqm+6qVpuwPaWnHT/fydRAxKIGU
   KzVYzH9BI/c8K57C3oR6sgDVpuEt4PtZPqSvOUPJQFgBqT35+5l7bmNFT
   k/a1WRwms9qWa34eDQhh3y0dJtsfs1wrXO+atWezrA8IRPt/M8BOeFiy3
   9y9fHERnMkKEdBAVgCBVpFrTQvOOOXj4zsIRIIKb6Nt9+aAYm2veORH43
   7mTIr5/NOEjOo3iJdliwxmdcibZiXviXlW8QiFIf0Fukxyw3BkUO2UVK3
   w==;
X-CSE-ConnectionGUID: LCp5snu8QNOK1WzdOH0M7w==
X-CSE-MsgGUID: E0E3/TyyQ2q7DuBUHCYyVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8130724"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8130724"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 23:54:12 -0700
X-CSE-ConnectionGUID: YwqtGue6Rja7jhH3sF8fKg==
X-CSE-MsgGUID: h395tqAETgeUfqT2+CkUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="20811558"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Apr 2024 23:54:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruoJz-0008Jt-33;
	Thu, 11 Apr 2024 06:54:07 +0000
Date: Thu, 11 Apr 2024 14:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 224/415] drivers/watchdog/eurotechwdt.c:199:
 warning: Function parameter or struct member 'iocb' not described in
 'eurwdt_write'
Message-ID: <202404111433.wl4NLc6m-lkp@intel.com>
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
commit: 3c90dc14ee8baba7b051b809e8369c8328c2a2a9 [224/415] watchdog: eurotechwdt: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111433.wl4NLc6m-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111433.wl4NLc6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111433.wl4NLc6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/eurotechwdt.c:199: warning: Function parameter or struct member 'iocb' not described in 'eurwdt_write'
>> drivers/watchdog/eurotechwdt.c:199: warning: Function parameter or struct member 'from' not described in 'eurwdt_write'
>> drivers/watchdog/eurotechwdt.c:199: warning: Excess function parameter 'file' description in 'eurwdt_write'
>> drivers/watchdog/eurotechwdt.c:199: warning: Excess function parameter 'buf' description in 'eurwdt_write'
>> drivers/watchdog/eurotechwdt.c:199: warning: Excess function parameter 'count' description in 'eurwdt_write'
>> drivers/watchdog/eurotechwdt.c:199: warning: Excess function parameter 'ppos' description in 'eurwdt_write'


vim +199 drivers/watchdog/eurotechwdt.c

^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  186  
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  187  /**
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  188   * eurwdt_write:
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  189   * @file: file handle to the watchdog
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  190   * @buf: buffer to write (unused as data does not matter here
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  191   * @count: count of bytes
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  192   * @ppos: pointer to the position to write. No seeks allowed
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  193   *
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  194   * A write to a watchdog device is defined as a keepalive signal. Any
08a884cf030481 drivers/watchdog/eurotechwdt.c      shaomin Deng   2022-08-08  195   * write of data will do, as we don't define content meaning.
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  196   */
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  197  
3c90dc14ee8bab drivers/watchdog/eurotechwdt.c      Jens Axboe     2024-04-08  198  static ssize_t eurwdt_write(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16 @199  {
3c90dc14ee8bab drivers/watchdog/eurotechwdt.c      Jens Axboe     2024-04-08  200  	size_t count = iov_iter_count(from);
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  201  	if (count) {
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  202  		if (!nowayout) {
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  203  			size_t i;
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  204  
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  205  			eur_expect_close = 0;
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  206  
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  207  			for (i = 0; i != count; i++) {
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  208  				char c;
3c90dc14ee8bab drivers/watchdog/eurotechwdt.c      Jens Axboe     2024-04-08  209  				if (get_iter(c, from))
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  210  					return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  211  				if (c == 'V')
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  212  					eur_expect_close = 42;
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  213  			}
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  214  		}
89ea2429873e69 drivers/watchdog/eurotechwdt.c      Alan Cox       2008-05-19  215  		spin_lock(&eurwdt_lock);
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  216  		eurwdt_ping();	/* the default timeout */
89ea2429873e69 drivers/watchdog/eurotechwdt.c      Alan Cox       2008-05-19  217  		spin_unlock(&eurwdt_lock);
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  218  	}
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  219  	return count;
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  220  }
^1da177e4c3f41 drivers/char/watchdog/eurotechwdt.c Linus Torvalds 2005-04-16  221  

:::::: The code at line 199 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
