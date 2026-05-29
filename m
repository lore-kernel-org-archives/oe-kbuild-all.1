Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C625348C62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780041177; cv=none; b=caTO7KSlj1KyLMQ9QxAN+4oEbH5jxUKhAEAdg86qJRHC3UOHz/l+ddalruYUEwhTNuawENt29zdV8qa3svD15tRc82I36w/G8DF5STn68htZruCDwbxsrETw2R4/JKZS2CjuuY3jJCOR09BjpkM0qFIVHpFX+51b66DfdjNmOIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780041177; c=relaxed/simple;
	bh=NzoYqOOWEVdNQaTdcWD7B3fut36RuQuvY07r706L66Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SRQLOh9Uuna7Uujoc5wVHyms0Qpmjk1nSvTKAQdrP2PFZ6BLOJtXGEBffpHChLvQleKCEtxbK2F/zsbOG0dPPfqLd/K6uEYaYWsNkshQvp/LQ2tZhv/n81TEgZbmgH7qYE2P6sVddwP3VRuEBDOVajzPTzagDefdAIER6xBKwJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVBYX5ad; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVBYX5ad"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780041176; x=1811577176;
  h=date:from:to:cc:subject:message-id;
  bh=NzoYqOOWEVdNQaTdcWD7B3fut36RuQuvY07r706L66Y=;
  b=XVBYX5adyiOnGamnRbwFIWGWidWfjFp8Hw+yhvi3Mx9lGtcX9W8/Ozq4
   Z+t0Es9d9QLH1mU2oSYaTTQ3m7poTnawlnLxnNsbc9qhKwU8mgxLvTNr5
   REZ4PHz2N0+OQ/BeDRwCIlDBcAN+6DyEh7d55HX0iG5hh792vrJ4kvF1V
   rB+NhUbsUxdm/cspHmQMCyhWfHlJpGeGcMZBFM2/o/5s8PRcEJw4OnMHN
   Vk7hvkMwsDALy7KUI1lfnMYFNDTA6KBY+o+8kBo1qqZcE1ddo8i9ffAyo
   ZWEmo/LUglTF0ejvgqxMQxJY0IYjLn8MrBuzLc3NSby9qTyPnVT8seqiv
   A==;
X-CSE-ConnectionGUID: 2alv53LsS/+RBfVnivdRvA==
X-CSE-MsgGUID: p9LMrPmBT1S8RvuRAsXcsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98306132"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="98306132"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 00:52:55 -0700
X-CSE-ConnectionGUID: 52ns9171RpC1GBaFIGTZFg==
X-CSE-MsgGUID: zQ6OhdEFRlGM7vb8A0mWBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="280902613"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2026 00:52:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSs1T-000000006wg-1BB9;
	Fri, 29 May 2026 07:52:51 +0000
Date: Fri, 29 May 2026 15:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:io_uring-bpf-poll-gate 4/7] io_uring/poll.c:408:35:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202605291509.kisPLwTw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git io_uring-bpf-poll-gate
head:   4942cfc0b61b662aa2d89efbfccec8119f6201b4
commit: 3baada92d32c9321f312d2a683746aefbcc20370 [4/7] io_uring/poll: invoke BPF poll_gate from io_poll_wake
config: um-randconfig-r134-20260529 (https://download.01.org/0day-ci/archive/20260529/202605291509.kisPLwTw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605291509.kisPLwTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605291509.kisPLwTw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/poll.c:467:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:467:40: sparse:     expected int mask
   io_uring/poll.c:467:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:284:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t @@
   io_uring/poll.c:284:38: sparse:     expected signed int [usertype] res
   io_uring/poll.c:284:38: sparse:     got restricted __poll_t
   io_uring/poll.c:304:56: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:303:66: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:303:66: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:303:66: sparse:     got unsigned int
   io_uring/poll.c:303:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/poll.c:303:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:303:52: sparse:     got unsigned short
   io_uring/poll.c:306:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:306:51: sparse:     expected signed int [usertype] res
   io_uring/poll.c:306:51: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:307:53: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:307:53: sparse:     expected signed int [usertype] res
   io_uring/poll.c:307:53: sparse:     got restricted __poll_t [usertype] mask
   io_uring/poll.c:360:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:360:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/poll.c:360:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/poll.c:360:65: sparse:     got unsigned int
>> io_uring/poll.c:408:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/poll.c:408:35: sparse:     expected unsigned int [usertype] mask
   io_uring/poll.c:408:35: sparse:     got restricted __poll_t [usertype] mask
>> io_uring/poll.c:415:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/poll.c:415:14: sparse:    int ( [noderef] __rcu * )( ... )
   io_uring/poll.c:415:14: sparse:    int ( * )( ... )
   io_uring/poll.c:655:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:655:40: sparse:     expected int mask
   io_uring/poll.c:655:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:735:38: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/poll.c:735:38: sparse:     expected int mask
   io_uring/poll.c:735:38: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/poll.c:735:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/poll.c:735:55: sparse:     expected int events
   io_uring/poll.c:735:55: sparse:     got restricted __poll_t [usertype] events
   io_uring/poll.c:742:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got int @@
   io_uring/poll.c:742:33: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/poll.c:742:33: sparse:     got int
   io_uring/poll.c:880:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:880:24: sparse:    left side has type unsigned int
   io_uring/poll.c:880:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:882:24: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:882:24: sparse:    left side has type unsigned int
   io_uring/poll.c:882:24: sparse:    right side has type restricted __poll_t
   io_uring/poll.c:884:55: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:883:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:883:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/poll.c:883:38: sparse:     expected restricted __poll_t
   io_uring/poll.c:883:38: sparse:     got unsigned int
   io_uring/poll.c:944:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [addressable] [assigned] [usertype] result_mask @@
   io_uring/poll.c:944:40: sparse:     expected signed int [usertype] res
   io_uring/poll.c:944:40: sparse:     got restricted __poll_t [addressable] [assigned] [usertype] result_mask
   io_uring/poll.c:975:38: sparse: sparse: invalid assignment: &=
   io_uring/poll.c:975:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:975:38: sparse:    right side has type int
   io_uring/poll.c:976:52: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/poll.c:976:38: sparse: sparse: invalid assignment: |=
   io_uring/poll.c:976:38: sparse:    left side has type restricted __poll_t
   io_uring/poll.c:976:38: sparse:    right side has type unsigned int

vim +408 io_uring/poll.c

   400	
   401	static int __io_bpf_poll_gate(struct io_kiocb *req, __poll_t mask)
   402	{
   403		int (*fn)(struct io_uring_poll_event *);
   404		struct io_ring_ctx *ctx = req->ctx;
   405		struct io_uring_poll_event_priv ev = {
   406			.pub.user_data	= req->cqe.user_data,
   407			.pub.gate_state	= req->poll_bpf_val,
 > 408			.pub.mask	= mask,
   409			.pub.opcode	= req->opcode,
   410			.req		= req,
   411		};
   412		int ret = 0;
   413	
   414		guard(rcu)();
 > 415		fn = rcu_dereference(ctx->poll_gate);
   416		if (fn)
   417			ret = fn(&ev.pub);
   418	
   419		req->poll_bpf_val = ev.pub.gate_state;
   420		return ret;
   421	}
   422	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
