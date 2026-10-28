Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223358;
	b=3jsRzBnFmf7XwtMyKYCPLNJ3Ol4fzwd59rQ7bW9kAFh/4ooq3VutApAMl4VKGoquUHH2
	 919H53hidJfR0Mmji8SijAI5YUGkV8Na40mGhRXfF75nLsgeq5UVf9rq+yik9RWl88qi3
	 a1uEpDbXVtVhWqSbz6UaiTeT+1bIP3AOhwEYV3xBuK1x7IVvOFS7a+48TwIhKFeXgX/RR
	 2GmEIdZlft3lyFylSdHDHJSXfruI3Ej/Q5JdJk1Q8ypr+cYp+m3ngYf76/5g7X75bW+Xs
	 bx34JgcbR9a5VL82VnRb5prZEywdAqV9mre1yBvuWJmENUOLoSb+3rEoXX8oYFQj8Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lrSi2rpB+tsn58CqWcLbmDnkpuP3j84kJ/dAcFgLjoo=;
	b=jiERIQr/RuqyZFs/Lb6GAlJg2tT5NvJ/nR6ZQ+Sko5ph8/EbsQmg7VKtjl6yMVFTHw3j
	 kc4yssqM8oLhK9Ed53ToZXvSDXrjV6K0XFBlgPdIKB0S2lseSjTBuBrBkdEuRnmxeHFwk
	 o8x8scHdGzZxldf665oGb6o9svxzKATNQBHofWMcbR/o8FTE/VDIWK5CCovAKNDwIdRE+
	 mawmccZ22TiIYFrpRGjaE7zUrOEmYJcxyu4GJaqMWpUcsPzQvGTpiv1LilIb4TXTWmR1F
	 6RgqLAntgO83MoxPrkoOzWbjTLQZPVFRbvQzEms8HvGo7ZBXWDwxTo4wk9i6I5pVJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LFopjgyP;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBF606A31D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 21:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04BBF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LFopjgyP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793223358; x=1824759358;
  h=date:from:to:cc:subject:message-id;
  bh=BdZbIuiCwGNWAdidoh3PA2XyqxtuSZRizYiZSMULZsU=;
  b=LFopjgyP+59fWPXNBOdKHqyzyPjVWGhfyPSfB9XVV4tdSUplECL01wMt
   vsZa1sK1rFwTrrnIqHR8PrLYDko2BUzpvGPiZsLp8WmRgbnVrjHRoF3LY
   kSERk8BbLG9sF8xE8D0UWwakOvP5t6m3mOUQkYXVmwDrYWBdQZnesRy/y
   YC62RRirHgTdyOgfj0jMz+97U3yhZSltaCDO3Hu4rZifa36CVhFpwnAbu
   h+PlrFrlrqdaArkwTS3J29oBqZyIU4LYhBouzZixoW7nC9Eaydt0ZwdPf
   S+rQSUfuBPT/XuIL5ZYJQES/U0oP+6D8SPRJkrCqHKXzd1Ekeozsy6EZd
   Q==;
X-CSE-ConnectionGUID: S56YAaDaQnOLnE+ylWnUTw==
X-CSE-MsgGUID: GQ/YfupRR4e+51DIgq174A==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1861939"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1861939"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 14:35:58 -0700
X-CSE-ConnectionGUID: o2YBT+CsS7OuS7rASKW/zQ==
X-CSE-MsgGUID: /iGdL4OzQn6ccWvesZWONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6785061"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 28 Oct 2026 14:35:56 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMBJJ-000000004yp-4A8c;
	Wed, 28 Oct 2026 21:35:53 +0000
Date: Wed, 28 Oct 2026 22:35:30 +0100
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe:block-7.4-fixes 35/103] block/blk.h:379:19: sparse:
 sparse: cast from restricted req_flags_t
Message-ID: <202610282219.nNIWFGRG-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git block-7.4-fixes
head:   8f53d4279d33e424732e9cb87c7938037b1ec949
commit: a3d283680a3623873a7c2f4067ac5ffc7a881d3f [35/103] blk-mq: don't bring back flags of a completed request
config: powerpc-randconfig-r2310-20261028 (https://download.01.org/0day-ci/archive/20261028/202610282219.nNIWFGRG-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610282219.nNIWFGRG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610282219.nNIWFGRG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-timeout.c: note: in included file:
>> block/blk.h:379:19: sparse: sparse: cast from restricted req_flags_t
>> block/blk.h:379:19: sparse: sparse: cast from restricted req_flags_t
>> block/blk.h:379:19: sparse: sparse: cast to restricted req_flags_t
--
   block/blk-mq.c:4412:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4412:16: sparse:     expected void const *objp
   block/blk-mq.c:4412:16: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:4557:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx @@
   block/blk-mq.c:4557:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:4557:41: sparse:     got struct blk_mq_hw_ctx *[noderef] __rcu *queue_hw_ctx
   block/blk-mq.c:759:36: sparse: sparse: dereference of noderef expression
   block/blk-mq.c: note: in included file:
>> block/blk.h:379:19: sparse: sparse: cast from restricted req_flags_t
>> block/blk.h:379:19: sparse: sparse: cast from restricted req_flags_t
>> block/blk.h:379:19: sparse: sparse: cast to restricted req_flags_t
   block/blk-mq.c:5263:31: sparse: sparse: dereference of noderef expression

vim +379 block/blk.h

   367	
   368	/*
   369	 * The timeout handler changes RQF_TIMED_OUT in a request which it does not
   370	 * own: whoever completes it changes rq_flags at the same time, with plain
   371	 * loads and stores. Never write back a flag that has changed under us.
   372	 */
   373	static inline void blk_rq_change_timed_out(struct request *rq, bool set)
   374	{
   375		req_flags_t old = READ_ONCE(rq->rq_flags), new;
   376	
   377		do {
   378			new = set ? old | RQF_TIMED_OUT : old & ~RQF_TIMED_OUT;
 > 379		} while (!try_cmpxchg(&rq->rq_flags, &old, new));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
