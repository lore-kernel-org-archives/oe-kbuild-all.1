Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5918C1F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712441454; cv=none; b=nJkGAPiW70CwYDw4toVavna82G4DD2b6PI5+yIUTlmLHDGrUChNM3kqi8WrJ6Y7Ab6XwKDaPER1ZNi7C9Am6qTprd7qq6dFBe6cS/C9AUmPvkKKsYyUzMdbN6WvdWtjreAS3k5I/Agsi/Vl5NMbkK68qD+T3RK9KwFdr5otK1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712441454; c=relaxed/simple;
	bh=5hLcnLJfIK4EdHUIfdsi9cS1PFZq2/5mOqnKRqdQJbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VGIPqvHhoNVPUHCaQzdlkwyH/qzZoXjAPHF9shC0lwuoRyyaeou2A3YcIaGYrTkN4t5Tbexp6GW/n7t2N8WD46gyM6zLB2Gu+j4yrleDXXtSZIQi2qr3m13HDg3NKMP05TtwzzmK1d6MMxlu75qEU2pxH1N962GINrk0fUw1sSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnrpTyzu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnrpTyzu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712441453; x=1743977453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5hLcnLJfIK4EdHUIfdsi9cS1PFZq2/5mOqnKRqdQJbI=;
  b=CnrpTyzu4f7Wz/WSMKeZqf/TaVQ7htatbJCyavGOve6EGAgTFgEvd15c
   kOOE+CHiE//jYPDvbRuS8/XKzLWyWuYrFdOjeN1faJvOkybqozxUCUHrf
   xMi0n7e+YWWVsOGL5f36mX5cpqFrzqE8xQtV8yvp9EPP81Yz2nKR77Cxo
   gxmxAUqUIg+JLOqNWoTjYUQwuOee8o86jVPGHARjCHUWupWBHxiBad0Gn
   kh+SC9G/3pisS2MKEPaAf8PkwF3zn0fgWQHHZrCCQPG6mHQF0Yb6Jh+78
   hQ3MPkcvNRCuHwE3jGgLGMo0lpxfWMLIXfPjs6QLEPnTiO2rTT50hX5Zc
   Q==;
X-CSE-ConnectionGUID: E93vSerZSFGsDZiQjnaxNw==
X-CSE-MsgGUID: g639qaChS3C4MvsQbWKK1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7586060"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7586060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:10:52 -0700
X-CSE-ConnectionGUID: 7fabBYyuT/WbX0sMu9or/g==
X-CSE-MsgGUID: /mdzquW0SNChPUAKwakznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19353735"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 15:10:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEFM-0003ta-22;
	Sat, 06 Apr 2024 22:10:48 +0000
Date: Sun, 7 Apr 2024 06:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 55/126] drivers/rtc/rtc-m41t80.c:698: warning:
 Function parameter or struct member 'iocb' not described in 'wdt_write'
Message-ID: <202404070638.owMbeKiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   dfd9382e4a4aed32db7f783cdb7651dc1ac095bd
commit: 570db5fedfeb2e78d408a62d9a424867844df178 [55/126] drivers/rtc: convert to read/write iterators
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240407/202404070638.owMbeKiU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070638.owMbeKiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070638.owMbeKiU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-m41t80.c:698: warning: Function parameter or struct member 'iocb' not described in 'wdt_write'
>> drivers/rtc/rtc-m41t80.c:698: warning: Function parameter or struct member 'from' not described in 'wdt_write'
>> drivers/rtc/rtc-m41t80.c:698: warning: Excess function parameter 'file' description in 'wdt_write'
>> drivers/rtc/rtc-m41t80.c:698: warning: Excess function parameter 'buf' description in 'wdt_write'
>> drivers/rtc/rtc-m41t80.c:698: warning: Excess function parameter 'count' description in 'wdt_write'
>> drivers/rtc/rtc-m41t80.c:698: warning: Excess function parameter 'ppos' description in 'wdt_write'


vim +698 drivers/rtc/rtc-m41t80.c

617780d290bd6e Atsushi Nemoto 2007-07-17  686  
617780d290bd6e Atsushi Nemoto 2007-07-17  687  /**
b958da7919e2c3 Yang Yingliang 2021-05-17  688   *	wdt_write - write to watchdog.
617780d290bd6e Atsushi Nemoto 2007-07-17  689   *	@file: file handle to the watchdog
617780d290bd6e Atsushi Nemoto 2007-07-17  690   *	@buf: buffer to write (unused as data does not matter here
617780d290bd6e Atsushi Nemoto 2007-07-17  691   *	@count: count of bytes
617780d290bd6e Atsushi Nemoto 2007-07-17  692   *	@ppos: pointer to the position to write. No seeks allowed
617780d290bd6e Atsushi Nemoto 2007-07-17  693   *
617780d290bd6e Atsushi Nemoto 2007-07-17  694   *	A write to a watchdog device is defined as a keepalive signal. Any
b9354487fb795c shaomin Deng   2022-08-08  695   *	write of data will do, as we don't define content meaning.
617780d290bd6e Atsushi Nemoto 2007-07-17  696   */
570db5fedfeb2e Jens Axboe     2024-04-05  697  static ssize_t wdt_write(struct kiocb *iocb, struct iov_iter *from)
617780d290bd6e Atsushi Nemoto 2007-07-17 @698  {
570db5fedfeb2e Jens Axboe     2024-04-05  699  	if (iov_iter_count(from)) {
617780d290bd6e Atsushi Nemoto 2007-07-17  700  		wdt_ping();
617780d290bd6e Atsushi Nemoto 2007-07-17  701  		return 1;
617780d290bd6e Atsushi Nemoto 2007-07-17  702  	}
617780d290bd6e Atsushi Nemoto 2007-07-17  703  	return 0;
617780d290bd6e Atsushi Nemoto 2007-07-17  704  }
617780d290bd6e Atsushi Nemoto 2007-07-17  705  

:::::: The code at line 698 was first introduced by commit
:::::: 617780d290bd6eb2b260928c6acff5b7c6084154 rtc: watchdog support for rtc-m41t80 driver

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
