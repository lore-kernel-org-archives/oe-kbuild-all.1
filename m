Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128364;
	b=RynTAi9NALXFw9GwfqYzzNSauQN1ooJ5ip9AZslN8eQ6cxtn/EToatpM9dJ+Vk3J7BUm
	 GsDKrRXLx4It0S+4mGW5D1iMwCoEJUIZrWpZO4BGDJWUK2JNc3xpxWK1IXShHXP+AdG0z
	 IGjQito01kmEMN5oUVo9ncYdxznu1cY44VhV5x4kYfBeugcL5LzSVRWwhUsCz+SwA3uL3
	 w5+J/BbJd3eL8P5NHKB4mkgvNua8Z4I15uRl7VFjcXk9a1OKWxcVHoUVJ8PY/6PJJnPUc
	 8KQMiSBjahWSLodvQj6csncWhjZzoR31FeZynliWCf0hwQ9cHMkH27kjHDcNbe4Aniw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DICTMRpykTUJkxxdVz7t4qOqvxcXCMDQcS4+E34KIDs=;
	b=WfdO6X7xxPJaBbUHaKfTVHjV62lQd7XItwGQIaD0ia7YKe3hH81F+CEz4xIBrNaGq+U/
	 KjC2TupLuGj9uIP7rBbK9ce6wCfg9F6FMuf8vHrie3XLsowOVZD1jqg0WFvQh9/AV/y28
	 qeyLjp7aU9RrDqwJKqGbs9NBC6HRm2Gyi6Smx+3VcxX7Eg5yuJDUN6/XoRHc1VpMjf1S6
	 0oCqcwLy8SkUxic4Z1UYqaTPtFMVXmsZefaTBPAdWQmsUHgTlkjrSVGr3fJh9WFjNYlw5
	 jGPmQyaiYtio+PSNsEnnQ5wImCt/MRJLe8ynHoJsMh+KEKu5ZuQto4hUMecYwp8/Ucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ndwxr0M1;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55710606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 19:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55710606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ndwxr0M1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793128363; x=1824664363;
  h=date:from:to:cc:subject:message-id;
  bh=s2LuLQuKH7iir7zloGn5m2loKJbhgU5H80Amh9uDdUI=;
  b=Ndwxr0M1GerKAM5u3bIoEo7rkXPKkHODv9JXhifu68RS41ZwmsYOHeu5
   Uz5Yw1nGfsW/eqOk3sOWFrEGLL1ayJb/fD9N4JzZ5kAO5d494iYdfmjoh
   2XNON1lsbwyen75Fa9zbe6tLaX5BfSzbqZB7V8nM0MS3/MN36ZGKMku+e
   4oup1HSKgMNmXgCW7fnGBZhbtj1AHxJjJzhVK4ljO8LnOPhtu5hFKhQLx
   P7IiMeTpfOu7ROnersVIUxc2pHJlhuGshEOkNYSlPHv+LGlM7B7jxjnwf
   DcA/X4LRahuH2FPDeCjqT1hUoCGpcy3NIQBN5VEVVCJn9onJqNRkVEXLy
   Q==;
X-CSE-ConnectionGUID: TMN/1KP1SNi9ROmP1nQLjQ==
X-CSE-MsgGUID: 4B3P7/hETdqIURV3CKma6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1853509"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1853509"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:12:42 -0700
X-CSE-ConnectionGUID: Z25yEHuwR4yq8jMehXuc9g==
X-CSE-MsgGUID: dPm3I9gEQ8Kzu31jw/v92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6465330"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 12:12:40 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLmb6-000000004bD-405B;
	Tue, 27 Oct 2026 19:12:36 +0000
Date: Tue, 27 Oct 2026 20:12:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 io_uring/io_uring.c:1634:55: sparse: sparse: incorrect type in argument 3
 (different base types)
Message-ID: <202610272011.JAFXZrRX-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: b52fdbc1b3bf870f42ba0f5a280221104b6df0ac [1/1] UPSTREAM: io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261027/202610272011.JAFXZrRX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272011.JAFXZrRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272011.JAFXZrRX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:1634:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:1634:55: sparse:     expected unsigned int mask
   io_uring/io_uring.c:1634:55: sparse:     got restricted __poll_t [usertype]
   io_uring/io_uring.c:1651:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:1651:55: sparse:     expected unsigned int mask
   io_uring/io_uring.c:1651:55: sparse:     got restricted __poll_t [usertype]
   io_uring/io_uring.c:3153:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got struct io_buffer *[assigned] kbuf @@
   io_uring/io_uring.c:3153:24: sparse:     expected void [noderef] __user *
   io_uring/io_uring.c:3153:24: sparse:     got struct io_buffer *[assigned] kbuf
   io_uring/io_uring.c:4551:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   io_uring/io_uring.c:4551:14: sparse:     expected struct file *file
   io_uring/io_uring.c:4551:14: sparse:     got struct file [noderef] __rcu *
   io_uring/io_uring.c:5347:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] result @@     got restricted __poll_t @@
   io_uring/io_uring.c:5347:37: sparse:     expected unsigned int [usertype] result
   io_uring/io_uring.c:5347:37: sparse:     got restricted __poll_t
   io_uring/io_uring.c:5352:71: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5352:65: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/io_uring.c:5352:65: sparse:     expected restricted __poll_t [usertype] val
   io_uring/io_uring.c:5352:65: sparse:     got unsigned int
   io_uring/io_uring.c:5352:52: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned short @@
   io_uring/io_uring.c:5352:52: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5352:52: sparse:     got unsigned short
   io_uring/io_uring.c:5356:71: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected signed int [usertype] res @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5356:71: sparse:     expected signed int [usertype] res
   io_uring/io_uring.c:5356:71: sparse:     got restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5390:66: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5390:55: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __poll_t [usertype] val @@     got unsigned int @@
   io_uring/io_uring.c:5390:55: sparse:     expected restricted __poll_t [usertype] val
   io_uring/io_uring.c:5390:55: sparse:     got unsigned int
   io_uring/io_uring.c:5493:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5493:40: sparse:     expected int mask
   io_uring/io_uring.c:5493:40: sparse:     got restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5577:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/io_uring.c:5577:24: sparse:     expected int
   io_uring/io_uring.c:5577:24: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/io_uring.c:5596:40: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected int mask @@     got restricted __poll_t [assigned] [usertype] mask @@
   io_uring/io_uring.c:5596:40: sparse:     expected int mask
   io_uring/io_uring.c:5596:40: sparse:     got restricted __poll_t [assigned] [usertype] mask
   io_uring/io_uring.c:5630:25: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5630:48: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t [usertype] mask @@     got unsigned int @@
   io_uring/io_uring.c:5630:48: sparse:     expected restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5630:48: sparse:     got unsigned int
   io_uring/io_uring.c:5641:22: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5641:22: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5641:22: sparse:    right side has type int
   io_uring/io_uring.c:5646:30: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.c:5646:30: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5646:30: sparse:    right side has type int
   io_uring/io_uring.c:5648:22: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5648:22: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5648:22: sparse:    right side has type int
   io_uring/io_uring.c:5664:33: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected int mask @@     got restricted __poll_t [usertype] mask @@
   io_uring/io_uring.c:5664:33: sparse:     expected int mask
   io_uring/io_uring.c:5664:33: sparse:     got restricted __poll_t [usertype] mask
   io_uring/io_uring.c:5664:50: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected int events @@     got restricted __poll_t [usertype] events @@
   io_uring/io_uring.c:5664:50: sparse:     expected int events
   io_uring/io_uring.c:5664:50: sparse:     got restricted __poll_t [usertype] events
   io_uring/io_uring.c:5746:24: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5746:24: sparse:    left side has type unsigned int
   io_uring/io_uring.c:5746:24: sparse:    right side has type restricted __poll_t
   io_uring/io_uring.c:5747:65: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5747:29: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5747:38: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int @@
   io_uring/io_uring.c:5747:38: sparse:     expected restricted __poll_t
   io_uring/io_uring.c:5747:38: sparse:     got unsigned int
   io_uring/io_uring.c:5836:43: sparse: sparse: invalid assignment: &=
   io_uring/io_uring.c:5836:43: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5836:43: sparse:    right side has type int
   io_uring/io_uring.c:5837:62: sparse: sparse: restricted __poll_t degrades to integer
   io_uring/io_uring.c:5837:43: sparse: sparse: invalid assignment: |=
   io_uring/io_uring.c:5837:43: sparse:    left side has type restricted __poll_t
   io_uring/io_uring.c:5837:43: sparse:    right side has type unsigned int
   io_uring/io_uring.c: note: in included file (through include/linux/irqflags.h, include/linux/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
   arch/arm64/include/asm/percpu.h:126:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   io_uring/io_uring.c:7824:9: sparse: sparse: context imbalance in 'io_sq_thread_unpark' - wrong count at exit
   io_uring/io_uring.c:7835:9: sparse: sparse: context imbalance in 'io_sq_thread_park' - wrong count at exit

vim +1634 io_uring/io_uring.c

  1613	
  1614	/*
  1615	 * This should only get called when at least one event has been posted.
  1616	 * Some applications rely on the eventfd notification count only changing
  1617	 * IFF a new CQE has been added to the CQ ring. There's no depedency on
  1618	 * 1:1 relationship between how many times this function is called (and
  1619	 * hence the eventfd count) and number of CQEs posted to the CQ ring.
  1620	 */
  1621	static void io_cqring_ev_posted(struct io_ring_ctx *ctx)
  1622	{
  1623		/*
  1624		 * wake_up_all() may seem excessive, but io_wake_function() and
  1625		 * io_should_wake() handle the termination of the loop and only
  1626		 * wake as many waiters as we need to.
  1627		 */
  1628		if (wq_has_sleeper(&ctx->cq_wait))
  1629			__wake_up(&ctx->cq_wait, TASK_NORMAL, 0,
  1630					poll_to_key(EPOLL_URING_WAKE | EPOLLIN));
  1631		if (ctx->sq_data && waitqueue_active(&ctx->sq_data->wait))
  1632			wake_up(&ctx->sq_data->wait);
  1633		if (io_should_trigger_evfd(ctx))
> 1634			eventfd_signal_mask(ctx->cq_ev_fd, 1, EPOLL_URING_WAKE);
  1635		if (waitqueue_active(&ctx->poll_wait))
  1636			__wake_up(&ctx->poll_wait, TASK_INTERRUPTIBLE, 0,
  1637					poll_to_key(EPOLL_URING_WAKE | EPOLLIN));
  1638	}
  1639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
