Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9841C862E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 05:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749102262; cv=none; b=ZePqWOSR7lF8/9lbPIrMgCnf+T20bnCNIvXqdtxxeQujwDLn6Vj814hmkVu5KTz1OnVF2m6Hj/vM1q5D422Oz7zHvmpWMJfBXssqsmCRJv1fDAniebNTWJanirXZxPH6jiIWOwKBPV33+VeFp8Xhr738wq7TsqSFryNdQ8G58VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749102262; c=relaxed/simple;
	bh=0M73SuJ8VQUZ6C4dh2WI1xETYTLr+O4e6/9CmnJVqAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sowmSis1rDvLQizxV+3mjdecSdMVGDf0KMXOCeJkgFnQFiNpqK/NUeQkrtXqtp7y0eCMal2yu4gF3r0Sqkra4Rd+H/Ozkbu5+xY33EEtjosinqXx3dmWxFYG1I2fMn7RghBdpzz5mnTXOACXqhk/8FqwZtUfYEZiIDRhzGTK8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFD9lIUY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFD9lIUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749102260; x=1780638260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0M73SuJ8VQUZ6C4dh2WI1xETYTLr+O4e6/9CmnJVqAI=;
  b=oFD9lIUYgHNioY1dmUbQ15WMq9i0tvciSee0Vd//ECMPWaRsIEQ9AMa5
   iC9gsAM6HaDHB9iRYn1IcwzRviBrbFpCRiH+WwucoroNH9t4urN5kkNdx
   u5q2FxyYLKK1IhSjsS3ZyFf8IjDABXZOtXpA42vJ0eQDfDFJgDmp2af9m
   jK51KlpZzm593veDGDRYayBmNBm2cF707aR/5Fr0vmXTj6vfdsEdPoAZ5
   W3SehMB6Uk07xkOv3pFLT2Nn8eP180g0mEZcLFeztJ/wPFkEeIGmB6q2/
   DASz/LlLCDe+eWbo4z6T9zk7XvMUykjA3iKVFexvb+09diWkYTsJAg81g
   g==;
X-CSE-ConnectionGUID: VDzxMHUgSgiaBEr7jYMcnw==
X-CSE-MsgGUID: ghiuakteTe2SWpsFBRb+/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68643432"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="68643432"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:44:19 -0700
X-CSE-ConnectionGUID: XBzwfGNCQoambKJfbSTS+w==
X-CSE-MsgGUID: XvTstzDESke7SatDOjGapw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="168570391"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2025 22:44:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN3Oh-0003lB-30;
	Thu, 05 Jun 2025 05:44:15 +0000
Date: Thu, 5 Jun 2025 13:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] io_uring/poll: introduce io_arm_apoll()
Message-ID: <202506051309.et6tM2ju-lkp@intel.com>
References: <959e9230cc9c0a11e8ffda604ddec27e27a71573.1749026421.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <959e9230cc9c0a11e8ffda604ddec27e27a71573.1749026421.git.asml.silence@gmail.com>

Hi Pavel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.15 next-20250604]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/net-timestamp-add-helper-returning-skb-s-tx-tstamp/20250604-164433
base:   net/main
patch link:    https://lore.kernel.org/r/959e9230cc9c0a11e8ffda604ddec27e27a71573.1749026421.git.asml.silence%40gmail.com
patch subject: [PATCH v2 2/5] io_uring/poll: introduce io_arm_apoll()
config: arm-randconfig-r113-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051309.et6tM2ju-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051309.et6tM2ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051309.et6tM2ju-lkp@intel.com/

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
