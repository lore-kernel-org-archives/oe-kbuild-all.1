Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74098181B97
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Apr 2024 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712781107; cv=none; b=ReIx8XK+akqVf/Y+t9pauZ6UWXIMOp1Z8gCrxy018Xo8gv3snrRp16JsZMGAB4JUNXB4++uZGE+SPEiCsGO8zpQNypH50xPN/rgQlI7dvHfY2qzO2eS/T3pPRe/tueHcsNInV00u1tpbRlRJBwad1tkpzZHZ62Sh1DCypqrDQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712781107; c=relaxed/simple;
	bh=cClPLIVXsAGmZLcFk4h7/qWWMaNF2nfoEuH8U6807Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LxxhrbxyVMvsMqPF6no4SmfH6l2sXZ6vFgUlkK8v0DCrpxo71L/4N+EOSMtI/VOpJXnoa3UH60Dt7VHJjP45NupFvfQXnoLQmSVRiAG6TWbvnZo2yeyWKBcqZ6Bt6LvtBdCJhv4/t0rnrDGNrDWlcB9SqWvyDsGcbLm38hDVOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7Drbs9b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7Drbs9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712781105; x=1744317105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cClPLIVXsAGmZLcFk4h7/qWWMaNF2nfoEuH8U6807Tk=;
  b=j7Drbs9bvI6z7FH1UnlGkmD06bDQcBnJ4y0RfbJS7qVMIW1sbIMmIJlH
   Qz/jht8s9Ipw7kDpTWLS47+SrFbRgoyB9e52heH0V6Drvv6feq1TN7SDS
   3QXNkI3aJPSL9B/hVf/jI1O9+5hebaUDxPv6u4ed22rjBtKPvNtsQcPp9
   QbSUP9YYVqKs1swuvi1/stABd269GwmlGhq3d3FWcqmq3GXp0TExj3rwl
   9OnlZ+qCzvemqoySYL3957i8ECpeaIw2Q1zZKbpbcy/R0e6Uo4jE/yKmy
   iZoRuQ8+fdLVngAKHu5guwHg9FShyIEqk3xvh/ahexVWbKgTdxJt0wshl
   w==;
X-CSE-ConnectionGUID: Uv5HojGcTQKkCiO1QVp+ZQ==
X-CSE-MsgGUID: OlGf2uWETd+lyA+1vs21uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="25683992"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="25683992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 13:31:44 -0700
X-CSE-ConnectionGUID: TniOPAb3S0mhZPa+NmSGSA==
X-CSE-MsgGUID: uHOyrYdgRRS6ApbeiocD2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="51652118"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2024 13:31:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruebc-0007mI-2r;
	Wed, 10 Apr 2024 20:31:40 +0000
Date: Thu, 11 Apr 2024 04:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 362/367] drivers/sbus/char/flash.c:114:17:
 error: 'buf' undeclared
Message-ID: <202404110444.7HNCQfL0-lkp@intel.com>
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
commit: 5d67f5b9ec2d12a246f28d2a37eb07568e93ee11 [362/367] sbus: flash: convert to read/write iterators
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240411/202404110444.7HNCQfL0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404110444.7HNCQfL0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404110444.7HNCQfL0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/sbus/char/flash.c: In function 'flash_read':
>> drivers/sbus/char/flash.c:114:17: error: 'buf' undeclared (first use in this function)
     114 |                 buf++;
         |                 ^~~
   drivers/sbus/char/flash.c:114:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/buf +114 drivers/sbus/char/flash.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  100  
5d67f5b9ec2d12 Jens Axboe     2024-04-09  101  static ssize_t flash_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 Linus Torvalds 2005-04-16  102  {
5d67f5b9ec2d12 Jens Axboe     2024-04-09  103  	size_t count = iov_iter_count(to);
5d67f5b9ec2d12 Jens Axboe     2024-04-09  104  	loff_t p = iocb->ki_pos;
^1da177e4c3f41 Linus Torvalds 2005-04-16  105  	int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  106  
^1da177e4c3f41 Linus Torvalds 2005-04-16  107  	if (count > flash.read_size - p)
^1da177e4c3f41 Linus Torvalds 2005-04-16  108  		count = flash.read_size - p;
^1da177e4c3f41 Linus Torvalds 2005-04-16  109  
^1da177e4c3f41 Linus Torvalds 2005-04-16  110  	for (i = 0; i < count; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  111  		u8 data = upa_readb(flash.read_base + p + i);
5d67f5b9ec2d12 Jens Axboe     2024-04-09  112  		if (put_iter(data, to))
^1da177e4c3f41 Linus Torvalds 2005-04-16  113  			return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @114  		buf++;
^1da177e4c3f41 Linus Torvalds 2005-04-16  115  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  116  
5d67f5b9ec2d12 Jens Axboe     2024-04-09  117  	iocb->ki_pos += count;
^1da177e4c3f41 Linus Torvalds 2005-04-16  118  	return count;
^1da177e4c3f41 Linus Torvalds 2005-04-16  119  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  120  

:::::: The code at line 114 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
