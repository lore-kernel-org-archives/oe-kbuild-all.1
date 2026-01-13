Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C94934EEF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768326517; cv=none; b=hcamzwvcj3fBpnF5WZmwkj6081vrAniqij86WoDApuV2+AatUKeZEbb6colKcGRl3t0ERwIXFwZ7Dgg8JnyyKSHJI+HyCEtMw2A0FhnskJ3JE0l9jDZmej1Q1DcSxkscAB00tVJc4Dkwd/qKGzjSZEh9cr8uQ02TO7/bUKAFexU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768326517; c=relaxed/simple;
	bh=O7Dg6azFU1p2PD4fs+5iUWtYkNgBDi2j/B4RvBJaGXU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dKVHv+J9YB9gm35IUhf6T2aCuOj6i1cDT/DrsfgchFj4eBfGQtJpaF2BHple9T42nIiYfWUY9lH0Nm6rlHs1oyqwCF1MJrHKCbThrbpuEn9m3udqkWuOgFnjsOeh6RylNZwBCeqayyRLXl+oOnqNhY7JXsUT7pMC3NYuLUaoU3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oG4/g/MP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oG4/g/MP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768326515; x=1799862515;
  h=date:from:to:cc:subject:message-id;
  bh=O7Dg6azFU1p2PD4fs+5iUWtYkNgBDi2j/B4RvBJaGXU=;
  b=oG4/g/MPCEbFbGop0cuUp69dccWzxO91urGyEzN1HyQgrJac5U4Nt+cI
   yTgbPVp1P8O6vQg6RzhqYJ4exurFYEgFKoyBpyz+ef/9v52PBZJYzE2EY
   oW1LqDWX/7tTLzX+f+6Vkff+0LCut1MZSJE87bIh19v8V8y9dZeVrWshv
   m1dmKMbBtkjfhWnYu06SxOh/rK0NDhNKJFko5dyHxb527JejAb+nX2ilz
   cpZpNPMVOvm/Yz51C5ElwJSMAcVFXYwoCJY4tViC+/fO5CxKB67RsPuxE
   1zJ0tpx8VZYeo4l07FOIoDyGU5EPdTYh4rRtQ7HJUAb68/smGyugTw2zj
   Q==;
X-CSE-ConnectionGUID: TLDgCrzYRICP6ksGVc3Q/Q==
X-CSE-MsgGUID: tprJgVQgRXWwQq/M7Z/p7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81069313"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="81069313"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:48:35 -0800
X-CSE-ConnectionGUID: nmi8Qq76TvKNKRFB8iJlYw==
X-CSE-MsgGUID: MFkgcOWHS+ePvvq3yG84HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204233725"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Jan 2026 09:48:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfiVK-00000000FC0-1kw1;
	Tue, 13 Jan 2026 17:48:30 +0000
Date: Wed, 14 Jan 2026 01:48:26 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: io_uring/poll.c:703:33: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202601140112.a9TENdma-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 162151889267089bb920609830c35f9272087c3f io_uring/poll: introduce io_arm_apoll()
date:   7 months ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140112.a9TENdma-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140112.a9TENdma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140112.a9TENdma-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c:426:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:426:40: sparse:     expected int mask
   io_uring/poll.c:426:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:262:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:262:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:262:38: sparse:     got restricted __poll_t
   io_uring/poll.c:276:21: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:284:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:283:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:283:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:283:66: sparse:     got unsigned int
   io_uring/poll.c:283:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:283:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:283:52: sparse:     got unsigned short
   io_uring/poll.c:286:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:286:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:286:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:287:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:287:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:287:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:337:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:337:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:337:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:337:65: sparse:     got unsigned int
   io_uring/poll.c:614:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:614:40: sparse:     expected int mask
   io_uring/poll.c:614:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:696:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:696:38: sparse:     expected int mask
   io_uring/poll.c:696:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:696:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:696:55: sparse:     expected int events
   io_uring/poll.c:696:55: sparse:     got restricted __poll_t [usertype] events
>> io_uring/poll.c:703:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   io_uring/poll.c:703:33: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:703:33: sparse:     got int
   io_uring/poll.c:841:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:841:24: sparse:    left side has type unsigned int
   io_uring/poll.c:841:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:843:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:843:24: sparse:    left side has type unsigned int
   io_uring/poll.c:843:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:845:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:844:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:844:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:844:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:844:38: sparse:     got unsigned int
   io_uring/poll.c:905:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:905:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:905:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:936:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:936:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:936:38: sparse:    right side has type int
   io_uring/poll.c:937:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:937:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:937:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:937:38: sparse:    right side has type unsigned int

vim +703 io_uring/poll.c

   699	
   700	int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
   701	{
   702		const struct io_issue_def *def = &io_issue_defs[req->opcode];
 > 703		__poll_t mask = POLLPRI | POLLERR;
   704	
   705		if (!def->pollin && !def->pollout)
   706			return IO_APOLL_ABORTED;
   707		if (!io_file_can_poll(req))
   708			return IO_APOLL_ABORTED;
   709	
   710		if (def->pollin) {
   711			mask |= EPOLLIN | EPOLLRDNORM;
   712	
   713			/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
   714			if (req->flags & REQ_F_CLEAR_POLLIN)
   715				mask &= ~EPOLLIN;
   716		} else {
   717			mask |= EPOLLOUT | EPOLLWRNORM;
   718		}
   719		if (def->poll_exclusive)
   720			mask |= EPOLLEXCLUSIVE;
   721	
   722		return io_arm_apoll(req, issue_flags, mask);
   723	}
   724	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
