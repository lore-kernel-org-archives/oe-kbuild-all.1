Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291382264DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 02:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765508116; cv=none; b=AGQeZZquX5nNLO8vwIBOcIwdbo47OMmmHn4OqANRgLGdCSw0Ccdt4hhG4SH74VkhKqPuLcYU4pHtJrZFrP3w6r9SpWq46BKkIrMupB3xiIeeqLKhs0wuzCQERBCOWFwkDBdLnqD5OCeVfyozq6dn1ayheAmm3OUgVppHc4aa6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765508116; c=relaxed/simple;
	bh=Sgl9gCpNCQzR4+Ru0ThWL6iVYBIZbojZlNuhjk5cFek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KYxgcyuGlEA6zLBKaVObAYcr+gYwNgyVEEtET7gRf69TdMbPkfMK6IZQ6Kgdo9YXQ/op22UgZxVkRelxGWEdRBYcksozZ3j7Gr77M3EcIHLppS/PQ4Oyff5Qsn6h8FxLSFS4Oxmbe4sL6Ut707w2XoUeLSE5NPfiNviwLN5JXkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLkTljQz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLkTljQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765508115; x=1797044115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sgl9gCpNCQzR4+Ru0ThWL6iVYBIZbojZlNuhjk5cFek=;
  b=OLkTljQz5u0bKODNmy3mW47RgZYDnImdKMkY/2gSwPQsxhhJ86mEtqDN
   GLxi3vZFaV5z1uGRIrPir3gpRpJMCE7pogEyq9Ywl1HIGIH6hj/YC4L3A
   SoqKcAGflflveH838X4MS9tdc4XYN/3xLVmNS8R6TcvBzZN2uS6miAk7c
   VAoGjO1cK2fvmznUOE1J0mSIGl7PNC0rAdtjByURefw+oWVcZw++bZD/7
   R1g+4klhcuLI77cVENnznOkvBZ4mryepoCqjwZNdLvwI3vHZ8GzJv8wwz
   GRN1pN/vlI6Iwuhe6s+dcTIJ9pLagVD5S2m5Ey35ALWfHtXv0trWxFad/
   w==;
X-CSE-ConnectionGUID: rjBID3ANTXqj3zsnOOkShw==
X-CSE-MsgGUID: teVtEyd2SR+o+3JQtDVk0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67539015"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67539015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 18:55:14 -0800
X-CSE-ConnectionGUID: bs237X5PQsiZIzMQwfFpqg==
X-CSE-MsgGUID: aytnph7fQU63y973nBokRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="220342399"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Dec 2025 18:55:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTtJH-000000005PJ-17lm;
	Fri, 12 Dec 2025 02:55:11 +0000
Date: Fri, 12 Dec 2025 10:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: io_uring/poll.c:703:33: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202512121019.0fZkeM2r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 162151889267089bb920609830c35f9272087c3f io_uring/poll: introduce io_arm_apoll()
date:   6 months ago
config: i386-randconfig-061-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121019.0fZkeM2r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121019.0fZkeM2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121019.0fZkeM2r-lkp@intel.com/

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
