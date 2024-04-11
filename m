Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B89145FFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Apr 2024 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712827582; cv=none; b=Ukbez66j0YRuo/im+vDU9AMDRgIWY3tOGY7xeqyk6rKN0qT5AHjAXd9NskLJ5wH86u3/p4+Jlet4lklV1ncdcHugXVVN7oTx1zC1ifWb0uYbx2EsODmHTV3JZuNE31jiiHOzP7uaWYem9iYF4JBJk3SV/aKi3XymDlCkxDQFsY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712827582; c=relaxed/simple;
	bh=Y7gwxl7h7M1/Ejzjm+6dBWsJZRSXLZqxBxANr2khs1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQMujz9Pcvlk+JiOGxpKn0an+q++Y0K2OCNNxg2Gbr3bTmR6V484kp53pL6RxSdDxNhY3PlsKarVoFub0zJDpxsMiQnepDaKzjz3a3I6P+voSS4HfGVrKu2e4lk+oIPnRqw1Rc6uxWWbmwk3tx/xI3TYNpzBcdvCknxPVP7lQac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDTIR0fO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDTIR0fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712827580; x=1744363580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7gwxl7h7M1/Ejzjm+6dBWsJZRSXLZqxBxANr2khs1w=;
  b=UDTIR0fOGOOI8SZktmL00QsuhIGmKYFM+9I3w4P46nXWhE8rsNUCeg0C
   oVJKVoc16WhDcajfiILUHNHPLwmC3emZ/aEEmUgUMIdcyMF4JKSUvA+x9
   mVopDMzhqeXa/roRyuklQ0em2qcG2ce6ojVvhjZhbb7oneJUamcjejYJ3
   F+MEyA8zz0uI9nABC5TI/N+6Ts0WN1iwYwSNj/FLhSaXrPlnmMhHoxbXy
   lo1xz6TFi98AIvU0nczKc9OHp3mTwmyNyfAjL2hyeF3m4HtVa5KteSrih
   g6mnunwBqV7UZ6Sf0igF23ifYPzVMpI+wNfqMVnv2fTd8+d+fMmOSnuj0
   Q==;
X-CSE-ConnectionGUID: rd7EqyRkTtO0/6ARHGTwZw==
X-CSE-MsgGUID: jDRh7YSyTOqukWzpZTRldg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8089220"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8089220"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 02:26:18 -0700
X-CSE-ConnectionGUID: FWlwBTgZTIS5Tt2diL45sw==
X-CSE-MsgGUID: kGrS6rVZRZSBIc+JKsxtqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="20821646"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2024 02:26:17 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruqhD-0008St-1P;
	Thu, 11 Apr 2024 09:26:15 +0000
Date: Thu, 11 Apr 2024 17:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 232/415] drivers/watchdog/pc87413_wdt.c:340:
 warning: Function parameter or struct member 'iocb' not described in
 'pc87413_write'
Message-ID: <202404111744.mJS15EMo-lkp@intel.com>
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
commit: cb5e015fa89ea7fba300ff06cd6be7c3572ee42d [232/415] watchdog: pc87413_wdt: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111744.mJS15EMo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111744.mJS15EMo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111744.mJS15EMo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/pc87413_wdt.c:340: warning: Function parameter or struct member 'iocb' not described in 'pc87413_write'
>> drivers/watchdog/pc87413_wdt.c:340: warning: Function parameter or struct member 'from' not described in 'pc87413_write'
>> drivers/watchdog/pc87413_wdt.c:340: warning: Excess function parameter 'file' description in 'pc87413_write'
>> drivers/watchdog/pc87413_wdt.c:340: warning: Excess function parameter 'data' description in 'pc87413_write'
>> drivers/watchdog/pc87413_wdt.c:340: warning: Excess function parameter 'len' description in 'pc87413_write'
>> drivers/watchdog/pc87413_wdt.c:340: warning: Excess function parameter 'ppos' description in 'pc87413_write'


vim +340 drivers/watchdog/pc87413_wdt.c

789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  327  
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  328  /**
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  329   *	pc87413_write:
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  330   *	@file: file handle to the watchdog
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  331   *	@data: data buffer to write
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  332   *	@len: length in bytes
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  333   *	@ppos: pointer to the position to write. No seeks allowed
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  334   *
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  335   *	A write to a watchdog device is defined as a keepalive signal. Any
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  336   *	write of data will do, as we we don't define content meaning.
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  337   */
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  338  
cb5e015fa89ea7 drivers/watchdog/pc87413_wdt.c      Jens Axboe                  2024-04-08  339  static ssize_t pc87413_write(struct kiocb *iocb, struct iov_iter *from)
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24 @340  {
cb5e015fa89ea7 drivers/watchdog/pc87413_wdt.c      Jens Axboe                  2024-04-08  341  	size_t len = iov_iter_count(from);
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  342  	/* See if we got the magic character 'V' and reload the timer */
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  343  	if (len) {
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  344  		if (!nowayout) {
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  345  			size_t i;
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  346  
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  347  			/* reset expect flag */
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  348  			expect_close = 0;
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  349  
aee334c23c9a55 drivers/watchdog/pc87413_wdt.c      Alan Cox                    2008-05-19  350  			/* scan to see whether or not we got the
aee334c23c9a55 drivers/watchdog/pc87413_wdt.c      Alan Cox                    2008-05-19  351  			   magic character */
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  352  			for (i = 0; i != len; i++) {
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  353  				char c;
cb5e015fa89ea7 drivers/watchdog/pc87413_wdt.c      Jens Axboe                  2024-04-08  354  				if (get_iter(c, from))
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  355  					return -EFAULT;
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  356  				if (c == 'V')
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  357  					expect_close = 42;
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  358  			}
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  359  		}
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  360  
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  361  		/* someone wrote to us, we should reload the timer */
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  362  		pc87413_refresh();
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  363  	}
00b3b3e6605d74 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-10-16  364  	return len;
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  365  }
789fc0adbaf3a3 drivers/char/watchdog/pc87413_wdt.c Sven Anders & Marcus Junker 2006-08-24  366  

:::::: The code at line 340 was first introduced by commit
:::::: 789fc0adbaf3a3ca95a3894aedacfc01863e8ae3 [WATCHDOG] NS pc87413-wdt Watchdog driver

:::::: TO: Sven Anders & Marcus Junker <anders@anduras.de, junker@anduras.de>
:::::: CC: Wim Van Sebroeck <wim@iguana.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
