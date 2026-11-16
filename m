Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851018;
	b=LJYt2/AkdUlbanKVF5bPUR9qcgk7QfctIRoFIn7C/UHYWlzpWZcd3bjqYtdGdH+a56gX
	 XNw4vVi9/FUBmfsaUmea605GVKBWrijF3yi5Jrg01DPqC80CmFgpEPlMf3uc9e8EK7/40
	 jdo27TTWFBRf4hLtFOYMtTrPsK3RfsoTKeOptMRBXKJZEzOl3m9y5wpSyssUyuDLaXkVo
	 y708HUHiZj9w9DEMsWIE3mCec9FH59UbtkV23/gKxQVR7ck6RHfBztG6deyCyqvpk0IW7
	 P25tDAn9s8wBxGnjr935KTr1oNRdAhsaKyOOKuB7OgyWNi4XzZKlNV3Btt2A9fmOlbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851018;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AyXJz5KzLX8NxtxNIuRixyqlfoKA/5zlt12jvJtPtx8=;
	b=tY2i7gwuazWgUMBUU2UdV7krxYpocQASxk8eZsA3B95BmNsWeusAdwlNNcAvRgsJ2g2D
	 qHGEaGpDBbCdklbr3opEktvbCVjgkJEQmPYTdik8DS6eNMfq9MCFmwrxYqz1diVAKMkHk
	 UVkCDYT2Xr5ZxwbT6bEDaqfcfJgpPsmvo9YFpFg1+kjXH0ybUBhf0g84UerCZ3PQUm1D+
	 XYaVI72DZh24gZtGwzYVy6Ozchun8RFSdjf2rwKBVl4k5GWisudnf/WWVzq8yu1fie/0M
	 zW70qThQld9hECcfDU65lmTcC2YZvG2Kf0xbzJUyown+VWyMJG3rMng/hx/47dxOU4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgUo3+KM;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F18606A31C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 17:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YgUo3+KM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794851017; x=1826387017;
  h=date:from:to:cc:subject:message-id;
  bh=qceMnYf8ADuE32ks7OlVmZNi6oD1lZOsPqC3xWI2I0U=;
  b=YgUo3+KME7GSCNE0Br6CqjwoHyHYFUq9h5gm5bYR8pb7X2Z7dqWxZCV7
   keNQS1PJ634m3snDoRhbwaDQXa7QolkIUbCwG7sPuMvdl59NIuXKrZuUB
   TdVEUh9tmaXXJLzWcvEE2sCZ9QImVwWHqhlGrkbx5D3udCKSEYo9zGLqi
   Q1AssnU8FBBtSVonqU0i59meoNNWYJeR+10vkJLNTWeTSpYN7io74+lPM
   7p5QH0OmxEU3c60g3KPQavg7MAoUNfjryAquC2X5iICwiTgJAtZNyrDmA
   PbgoooL3kRrTT/6WKDD3J3d7j5MYAvXt2QDk4Oz6OilrFAT4tWyWmSykI
   g==;
X-CSE-ConnectionGUID: f22IZpDSSfOsLK6UadJimQ==
X-CSE-MsgGUID: gmegU0GISRyX6Xhyw4//qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3703475"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3703475"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 09:43:37 -0800
X-CSE-ConnectionGUID: cnZK2mKfQOexFLS9SSmbPw==
X-CSE-MsgGUID: b0E7y2TKSU+idOfPpXhkYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11395589"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 16 Nov 2026 09:43:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT0jr-000000002lC-3pTT;
	Mon, 16 Nov 2026 17:43:31 +0000
Date: Mon, 16 Nov 2026 18:42:58 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 152/152] clang diag:
 include/linux/page_size_compat.h:136:16: warning: division by zero is
 undefined
Message-ID: <202611161825.tGeFio00-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: d44ff7a3ed2e6df22bedad55abc1ac1c192095cc [152/152] ANDROID: 16K: Introduce rust __page_*() helpers
config: arm64-randconfig-2001-20261116 (https://download.01.org/0day-ci/archive/20261116/202611161825.tGeFio00-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161825.tGeFio00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161825.tGeFio00-lkp@intel.com/

All warnings (new ones prefixed by >>):

   make[3]: *** [rust/Makefile:332: rust/bindings/bindings_helpers_generated.rs] Error 1 shuffle=1536126295
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   include/linux/blkdev.h:1705:17: error: field has incomplete type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blkdev.h:1705:9: note: forward declaration of 'struct rq_list'
   include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
   include/linux/page_size_compat.h:136:16: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:159:9: warning: division by zero is undefined [-Wdivision-by-zero]
   clang diag: include/linux/mman.h:160:9: warning: division by zero is undefined [-Wdivision-by-zero]
>> clang diag: include/linux/page_size_compat.h:136:16: warning: division by zero is undefined [-Wdivision-by-zero]
   Unable to generate bindings: clang diagnosed error: include/linux/blkdev.h:1705:17: error: field has incomplete type 'struct rq_list'
   include/linux/blk-mq.h:239:11: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:244:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:245:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:251:8: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:252:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:254:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:255:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:260:18: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:261:4: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:262:9: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:263:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:268:25: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:5: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:271:16: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:272:10: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:273:6: error: incomplete definition of type 'struct rq_list'
   include/linux/blk-mq.h:282:11: error: incomplete definition of type 'struct rq_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
