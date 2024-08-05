Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F542AE95
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Aug 2024 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722880076; cv=none; b=g6X4TsWHCaN/PRwezPBAe4UbmrhyRmrzXJjEUfhWp+3a+gYfCA4/z6fBQv3TcYQRBmfOTLFla8mhRwGyHLygojy8Azu/MWKfypDR9BIKa/hIkrKF50MkMqI+S/cUHakLcHkaZRDY8Zc1hxubmI0BbAoNbmIea+G2a7m7fit/66M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722880076; c=relaxed/simple;
	bh=ZuMKSkdGNmPBsGmQcawZ6Mxe2+0npFevLkwgcbfV+og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXTUTxBcBZYoxnarRFPldhtzP3x+0HZJEG7eklwzKb8fvzcr+eZsb0V39you/cINVURGOuwyJg9/w6zrtclWpjlMXVjrajyyKMOCrTlpY0jTy/Bc+YjSGSjhxAmYZt085hNGZ0ZyWxtKh9m7l3Ra512TkO2H1yeu8e+1wO74SSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQJ932Jd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQJ932Jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722880075; x=1754416075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZuMKSkdGNmPBsGmQcawZ6Mxe2+0npFevLkwgcbfV+og=;
  b=DQJ932JdFj/nc1pemERFMZDIeHJJJn4SJYcArxI8WwMqVRyz925Fv7pg
   DV8FKfJ91RwNp7m7ug+6Tf4vVZ7kJAu7k9OcK+TIFzqkGTP5IMU8cRhw/
   fbTraUfbHNNemJO5P4HAlDhzv7C74qCHyUC0rAOsnQsszobMMteC6Yo3U
   cK5qNNpvisyrOHV4MAfk+wvfozwaa4q3liJC4n7Y9bGFXYt9IaJwHaRd0
   ZqzAhx4efo6qPgbURiscZQbJBS9r7U9NK0iOYU5jAL4SbStR1CkBYlGy4
   LvTRPUiBba2FYrWBC9o3/WNfipPQjzEFnR4jo+L67FN3iCHgCJh5T5Shx
   Q==;
X-CSE-ConnectionGUID: Jq4Cml3fTZuakzhkGJpZ/w==
X-CSE-MsgGUID: dmD0qiZoRiqxF/lkrbuQQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20824463"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="20824463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 10:47:54 -0700
X-CSE-ConnectionGUID: +bpzcGaSR3asC1qN9DRw0A==
X-CSE-MsgGUID: eNfZe+MATpqtJYJeUBVQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; 
   d="scan'208";a="56160398"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2024 10:47:53 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sb1oE-0003Mh-1D;
	Mon, 05 Aug 2024 17:47:50 +0000
Date: Tue, 6 Aug 2024 01:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 332/442] arch/x86/kernel/apm_32.c:1446:35:
 error: 'fp' undeclared; did you mean 'up'?
Message-ID: <202408060153.Z7f5SGDq-lkp@intel.com>
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
commit: 3da08857bbcbd903db68fc36c7a2f79f8fecbadb [332/442] x86/kernel: convert to read/write iterators
config: i386-randconfig-012-20240805 (https://download.01.org/0day-ci/archive/20240806/202408060153.Z7f5SGDq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408060153.Z7f5SGDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408060153.Z7f5SGDq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/apm_32.c: In function 'do_read':
>> arch/x86/kernel/apm_32.c:1446:35: error: 'fp' undeclared (first use in this function); did you mean 'up'?
    1446 |         if ((queue_empty(as)) && (fp->f_flags & O_NONBLOCK))
         |                                   ^~
         |                                   up
   arch/x86/kernel/apm_32.c:1446:35: note: each undeclared identifier is reported only once for each function it appears in


vim +1446 arch/x86/kernel/apm_32.c

^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1433  
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1434  static ssize_t do_read(struct kiocb *iocb, struct iov_iter *to)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1435  {
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1436  	size_t count = iov_iter_count(to);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1437  	struct apm_user *as;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1438  	int i;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1439  	apm_event_t event;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1440  
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1441  	as = iocb->ki_filp->private_data;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1442  	if (check_apm_user(as, "read"))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1443  		return -EIO;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1444  	if ((int)count < sizeof(apm_event_t))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1445  		return -EINVAL;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16 @1446  	if ((queue_empty(as)) && (fp->f_flags & O_NONBLOCK))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1447  		return -EAGAIN;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1448  	wait_event_interruptible(apm_waitqueue, !queue_empty(as));
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1449  	i = count;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1450  	while ((i >= sizeof(event)) && !queue_empty(as)) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1451  		event = get_queued_event(as);
3da08857bbcbd9 arch/x86/kernel/apm_32.c Jens Axboe     2024-04-11  1452  		if (!copy_to_iter_full(&event, sizeof(event), to)) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1453  			if (i < count)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1454  				break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1455  			return -EFAULT;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1456  		}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1457  		switch (event) {
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1458  		case APM_SYS_SUSPEND:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1459  		case APM_USER_SUSPEND:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1460  			as->suspends_read++;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1461  			break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1462  
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1463  		case APM_SYS_STANDBY:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1464  		case APM_USER_STANDBY:
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1465  			as->standbys_read++;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1466  			break;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1467  		}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1468  		i -= sizeof(event);
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1469  	}
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1470  	if (i < count)
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1471  		return count - i;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1472  	if (signal_pending(current))
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1473  		return -ERESTARTSYS;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1474  	return 0;
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1475  }
^1da177e4c3f41 arch/i386/kernel/apm.c   Linus Torvalds 2005-04-16  1476  

:::::: The code at line 1446 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
