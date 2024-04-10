Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3A1180A87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 19:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712777129; cv=none; b=NRMtoRZ/pE68GNn4JfKtX8Wc4gb8EVywHXbLB2ijnvhkWkYYwjGmwJu4la8KqXLnGQm9sqmq/sPDeQZkZ+gurbH5oviOluxx5bHfEmp0HZQrYQF/vJEfmjKo5WrmlTz4ohXKDUS4R+DBHlIgIIXG7eiLu5OC0z3iNxIpai9RVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712777129; c=relaxed/simple;
	bh=7euGTGIrwKvl7GSBAfhR+YIvFRepDDDTgbeZjSkg548=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6bbLv7qmSy8C0taVWNzpNrwlX+Fr7l792kzFq8B9wgoYfiJZQFIZ62qrFFc4oc5IwmSf2BBnp5+cgIjLdPivdwbHFpW6L9rSi+Ny9NpYr1030nXOI0K6Q4FgU9fwBdLswIBlUON9WrsAJi3bgaqGBF4nJjZr5Quua5Gs72BOOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4H6VkT+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4H6VkT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712777127; x=1744313127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7euGTGIrwKvl7GSBAfhR+YIvFRepDDDTgbeZjSkg548=;
  b=R4H6VkT+gTouTobW/yZFWyQkhMN2eY2LykLhoyrUqXmCAS4NzrTDco+Z
   vkobniMbbS2ocqINt86RacfDBs2+XLTGMOF3VNTupAgBgrl3a2BdaiUJC
   2obyuQL+0sKGyVQmafurxA5NTi1d7Er/clMRGQR4/gkjb0I0HJjmAQy9I
   74Et2yZu0c2fyDYX/Oi7N0zq9lg0DtG5K/vgkrav63mHMKhl6bG/Pwdlm
   oEZZI/31WY+7DVuo8Z9GEB8TdNrHTyq2s2c6t2N+T4vcKnBgNit7eH8wo
   eQq0MPlT/lNQthZY7rXs4vrOdunbt+r77cJQkcS7XMRhWUpoVfF7zCMof
   w==;
X-CSE-ConnectionGUID: xS0+qUmzTGKduLa01OlSMA==
X-CSE-MsgGUID: PiDzmX0SQ/yWed33/wBogQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33564401"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="33564401"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 12:25:26 -0700
X-CSE-ConnectionGUID: Y82Q4RooS9uivUznfo7Mgg==
X-CSE-MsgGUID: xWbbuQa5QnmMMAlbrh2TPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="21156364"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 12:25:25 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rudZS-0007iY-2z;
	Wed, 10 Apr 2024 19:25:22 +0000
Date: Thu, 11 Apr 2024 03:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 225/367] drivers/watchdog/riowd.c:152:13:
 error: 'count' undeclared; did you mean 'd_count'?
Message-ID: <202404110324.J5YtMFYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   aa6c8a72cad54562e99c8a46f4baeaf6ea9409a6
commit: 63957c75fdffac7f639d79af0c0338abfba7739d [225/367] watchdog: riowd: convert to read/write iterators
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240411/202404110324.J5YtMFYW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110324.J5YtMFYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110324.J5YtMFYW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/watchdog/riowd.c: In function 'riowd_write':
>> drivers/watchdog/riowd.c:152:13: error: 'count' undeclared (first use in this function); did you mean 'd_count'?
     152 |         if (count) {
         |             ^~~~~
         |             d_count
   drivers/watchdog/riowd.c:152:13: note: each undeclared identifier is reported only once for each function it appears in


vim +152 drivers/watchdog/riowd.c

^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  147  
63957c75fdffac drivers/watchdog/riowd.c        Jens Axboe      2024-04-09  148  static ssize_t riowd_write(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  149  {
e42311d75107ca drivers/sbus/char/riowatchdog.c David S. Miller 2008-08-29  150  	struct riowd *p = riowd_device;
e42311d75107ca drivers/sbus/char/riowatchdog.c David S. Miller 2008-08-29  151  
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16 @152  	if (count) {
e42311d75107ca drivers/sbus/char/riowatchdog.c David S. Miller 2008-08-29  153  		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  154  		return 1;
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  155  	}
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  156  
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  157  	return 0;
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  158  }
^1da177e4c3f41 drivers/sbus/char/riowatchdog.c Linus Torvalds  2005-04-16  159  

:::::: The code at line 152 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
