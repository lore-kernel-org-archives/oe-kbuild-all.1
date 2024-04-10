Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA015B576
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754929; cv=none; b=uaJQATCYQtBwsid4ccFosHgtdLyah1LbLAy1tam9C0hkIVKBq46BHTPeSmG+kdNk1EKq2HnAVh9ZmJNFjfzLMS4our/5fpAUR8UfqlkzK8sasqHmWwJLyxBTSLnUF6HrEPjjqxFdU7W1fPJoDaFF2hjIMk9eXJlHsE9dpZGRPug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754929; c=relaxed/simple;
	bh=66TGkxQdMp4xyBZAmzhgHWGQ7WvsAV8IyOSXuK+PkgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZnL08DgCHGktuj63FHm7mGSp9+VsnfK9/Ifnmek7Nwo/L8eBDUbw/x/JfG8tjBHvw0le7aB8YcyJ1N3yF6JMd/2IFXAAJNog45v6q5CWpOYps0iCYpLyUlN9/LK5+gxqMJ0IC76mei3yz5ZIJCf5eSDTc6isrxo24ZTVSYbFBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJsDU4Jw; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJsDU4Jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712754927; x=1744290927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66TGkxQdMp4xyBZAmzhgHWGQ7WvsAV8IyOSXuK+PkgQ=;
  b=mJsDU4JwqdNIn7a5YzgTYJ00l+i/jm6X2mMamytWKvT1ZO2xqXFS6pPv
   1HZj/Y769FetNFTx3XecDR8WUcBatRwjb1AU3Jsh+/0qLvZPKpnpGYJz+
   1Spo43FHULa10MDMiAaD0yJlnTxVFUGkY5GgZL8DYsRNHnZVBwVF7sJwQ
   tFS2FasGe1DPfUMeVdwHHFlTQSnRPi7aNOCO2y4S7r3d/slNYO+3htiTB
   ZAHLXvWuRyhECiF3arGAxUAsVyGX0XO0WKryszl6YqFVGsY/1zTK6cmg8
   /BGewIhff/RyeOrWgBZv76caqB5D5ckL6jb+01+wdBGr5hPyM1lf86Fe5
   g==;
X-CSE-ConnectionGUID: y1iAcTalTWCm2GbRcwYLsQ==
X-CSE-MsgGUID: B1a1T95RQryp7xWl/55cpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19541185"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19541185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 06:15:26 -0700
X-CSE-ConnectionGUID: ObXrpBNqSbWQgLOOeGJ7Vw==
X-CSE-MsgGUID: itQ9UGRDThyDyRsAWkm1Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="21033164"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 06:15:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruXn5-0007Ra-0b;
	Wed, 10 Apr 2024 13:15:03 +0000
Date: Wed, 10 Apr 2024 21:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 231/367] drivers/watchdog/wdt.c:318: warning:
 Function parameter or struct member 'iocb' not described in 'wdt_write'
Message-ID: <202404102107.X69uGp3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   ad69a5a8c930e58537ce092334af08caaa412900
commit: b5923a761444a3da472357c072d32ad648e821b6 [231/367] watchdog: wdt: convert to read/write iterators
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240410/202404102107.X69uGp3P-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404102107.X69uGp3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404102107.X69uGp3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/watchdog/wdt.c:318: warning: Function parameter or struct member 'iocb' not described in 'wdt_write'
>> drivers/watchdog/wdt.c:318: warning: Function parameter or struct member 'from' not described in 'wdt_write'
>> drivers/watchdog/wdt.c:318: warning: Excess function parameter 'file' description in 'wdt_write'
>> drivers/watchdog/wdt.c:318: warning: Excess function parameter 'buf' description in 'wdt_write'
>> drivers/watchdog/wdt.c:318: warning: Excess function parameter 'count' description in 'wdt_write'
>> drivers/watchdog/wdt.c:318: warning: Excess function parameter 'ppos' description in 'wdt_write'
>> drivers/watchdog/wdt.c:461: warning: Function parameter or struct member 'iocb' not described in 'wdt_temp_read'
>> drivers/watchdog/wdt.c:461: warning: Function parameter or struct member 'to' not described in 'wdt_temp_read'
>> drivers/watchdog/wdt.c:461: warning: Excess function parameter 'file' description in 'wdt_temp_read'
>> drivers/watchdog/wdt.c:461: warning: Excess function parameter 'buf' description in 'wdt_temp_read'
>> drivers/watchdog/wdt.c:461: warning: Excess function parameter 'count' description in 'wdt_temp_read'
>> drivers/watchdog/wdt.c:461: warning: Excess function parameter 'ptr' description in 'wdt_temp_read'


vim +318 drivers/watchdog/wdt.c

^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  304  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  305  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  306  /**
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  307   *	wdt_write:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  308   *	@file: file handle to the watchdog
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  309   *	@buf: buffer to write (unused as data does not matter here
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  310   *	@count: count of bytes
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  311   *	@ppos: pointer to the position to write. No seeks allowed
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  312   *
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  313   *	A write to a watchdog device is defined as a keepalive signal. Any
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  314   *	write of data will do, as we we don't define content meaning.
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  315   */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  316  
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  317  static ssize_t wdt_write(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16 @318  {
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  319  	size_t count = iov_iter_count(from);
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  320  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  321  	if (count) {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  322  		if (!nowayout) {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  323  			size_t i;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  324  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  325  			/* In case it was set long ago */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  326  			expect_close = 0;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  327  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  328  			for (i = 0; i != count; i++) {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  329  				char c;
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  330  				if (get_iter(c, from))
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  331  					return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  332  				if (c == 'V')
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  333  					expect_close = 42;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  334  			}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  335  		}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  336  		wdt_ping();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  337  	}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  338  	return count;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  339  }
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  340  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  341  /**
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  342   *	wdt_ioctl:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  343   *	@file: file handle to the device
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  344   *	@cmd: watchdog command
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  345   *	@arg: argument pointer
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  346   *
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  347   *	The watchdog API defines a common set of functions for all watchdogs
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  348   *	according to their available features. We only actually usefully support
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  349   *	querying capabilities and current status.
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  350   */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  351  
9f2d1f0da766f8 drivers/watchdog/wdt.c      Alan Cox            2008-08-04  352  static long wdt_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  353  {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  354  	void __user *argp = (void __user *)arg;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  355  	int __user *p = argp;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  356  	int new_heartbeat;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  357  	int status;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  358  
c1bf3acffcddcf drivers/watchdog/wdt.c      Andrew Morton       2010-03-03  359  	struct watchdog_info ident = {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  360  		.options =		WDIOF_SETTIMEOUT|
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  361  					WDIOF_MAGICCLOSE|
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  362  					WDIOF_KEEPALIVEPING,
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  363  		.firmware_version =	1,
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  364  		.identity =		"WDT500/501",
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  365  	};
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  366  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  367  	/* Add options according to the card we have */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  368  	ident.options |= (WDIOF_EXTERN1|WDIOF_EXTERN2);
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  369  	if (type == 501) {
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  370  		ident.options |= (WDIOF_OVERHEAT|WDIOF_POWERUNDER|
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  371  							WDIOF_POWEROVER);
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  372  		if (tachometer)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  373  			ident.options |= WDIOF_FANFAULT;
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  374  	}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  375  
9f2d1f0da766f8 drivers/watchdog/wdt.c      Alan Cox            2008-08-04  376  	switch (cmd) {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  377  	case WDIOC_GETSUPPORT:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  378  		return copy_to_user(argp, &ident, sizeof(ident)) ? -EFAULT : 0;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  379  	case WDIOC_GETSTATUS:
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  380  		status = wdt_get_status();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  381  		return put_user(status, p);
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  382  	case WDIOC_GETBOOTSTATUS:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  383  		return put_user(0, p);
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  384  	case WDIOC_KEEPALIVE:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  385  		wdt_ping();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  386  		return 0;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  387  	case WDIOC_SETTIMEOUT:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  388  		if (get_user(new_heartbeat, p))
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  389  			return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  390  		if (wdt_set_heartbeat(new_heartbeat))
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  391  			return -EINVAL;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  392  		wdt_ping();
bd490f8222510d drivers/watchdog/wdt.c      Gustavo A. R. Silva 2020-07-07  393  		fallthrough;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  394  	case WDIOC_GETTIMEOUT:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  395  		return put_user(heartbeat, p);
0c06090c9472db drivers/watchdog/wdt.c      Wim Van Sebroeck    2008-07-18  396  	default:
0c06090c9472db drivers/watchdog/wdt.c      Wim Van Sebroeck    2008-07-18  397  		return -ENOTTY;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  398  	}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  399  }
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  400  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  401  /**
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  402   *	wdt_open:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  403   *	@inode: inode of device
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  404   *	@file: file handle to device
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  405   *
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  406   *	The watchdog device has been opened. The watchdog device is single
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  407   *	open and on opening we load the counters. Counter zero is a 100Hz
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  408   *	cascade, into counter 1 which downcounts to reboot. When the counter
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  409   *	triggers counter 2 downcounts the length of the reset pulse which
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  410   *	set set to be as long as possible.
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  411   */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  412  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  413  static int wdt_open(struct inode *inode, struct file *file)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  414  {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  415  	if (test_and_set_bit(0, &wdt_is_open))
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  416  		return -EBUSY;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  417  	/*
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  418  	 *	Activate
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  419  	 */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  420  	wdt_start();
c5bf68fe0c86a5 drivers/watchdog/wdt.c      Kirill Smelkov      2019-03-26  421  	return stream_open(inode, file);
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  422  }
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  423  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  424  /**
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  425   *	wdt_release:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  426   *	@inode: inode to board
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  427   *	@file: file handle to board
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  428   *
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  429   *	The watchdog has a configurable API. There is a religious dispute
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  430   *	between people who want their watchdog to be able to shut down and
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  431   *	those who want to be sure if the watchdog manager dies the machine
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  432   *	reboots. In the former case we disable the counters, in the latter
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  433   *	case you have to open it again very soon.
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  434   */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  435  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  436  static int wdt_release(struct inode *inode, struct file *file)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  437  {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  438  	if (expect_close == 42) {
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  439  		wdt_stop();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  440  		clear_bit(0, &wdt_is_open);
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  441  	} else {
27c766aaacb265 drivers/watchdog/wdt.c      Joe Perches         2012-02-15  442  		pr_crit("WDT device closed unexpectedly.  WDT will not stop!\n");
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  443  		wdt_ping();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  444  	}
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  445  	expect_close = 0;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  446  	return 0;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  447  }
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  448  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  449  /**
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  450   *	wdt_temp_read:
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  451   *	@file: file handle to the watchdog board
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  452   *	@buf: buffer to write 1 byte into
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  453   *	@count: length of buffer
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  454   *	@ptr: offset (no seek allowed)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  455   *
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  456   *	Temp_read reports the temperature in degrees Fahrenheit. The API is in
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  457   *	farenheit. It was designed by an imperial measurement luddite.
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  458   */
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  459  
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  460  static ssize_t wdt_temp_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16 @461  {
04bedfa542d90a drivers/watchdog/wdt.c      Alan Cox            2009-03-22  462  	int temperature = wdt_get_temperature();
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  463  
b5923a761444a3 drivers/watchdog/wdt.c      Jens Axboe          2024-04-09  464  	if (!copy_to_iter_full(&temperature, 1, to))
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  465  		return -EFAULT;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  466  
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  467  	return 1;
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  468  }
^1da177e4c3f41 drivers/char/watchdog/wdt.c Linus Torvalds      2005-04-16  469  

:::::: The code at line 318 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
