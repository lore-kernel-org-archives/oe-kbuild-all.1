Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B421C3AA1B3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 15:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768489706; cv=none; b=sBPin1iMcbayorJn/L0Gc4+EixrIzp1UyspaD0vWhfGrXDDC7KOImRWxhpKWq4R6qllO8XtePn88LSUNTV30eRVKQwG3VCLRT53k8TvbfGlORnRbFdzTVjQTLZuF7JmDmADruod3HqB+muFxMYlVEsDrzK4octeu9S4Z4SwPwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768489706; c=relaxed/simple;
	bh=R5Jhn8JTbwLFlieibOQgjir54DfHkIlyE1bWTi8QyPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lwPpxbnkdSITU+kmtO4K+iyRW1rbGZbz4a9uIFpxPiKWY0+8h2mKWCcRjxSBAZ07iguCKpeU5iN8fkri0s8nglwQ1rjNPgBEDzfiAukhp3wYu8Zpdk91ph3GDFkkj3/HiOh4cq3cSz0cDIzTSFZnwix1JXr1/DiiwWGSeEhuVHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiLohBfK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiLohBfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768489697; x=1800025697;
  h=date:from:to:cc:subject:message-id;
  bh=R5Jhn8JTbwLFlieibOQgjir54DfHkIlyE1bWTi8QyPo=;
  b=JiLohBfK1S9VaPhd1PDkxSFLUUfbVmOYsSkYcpqIae1LoHSmSsAGljPY
   bzLv+AOMTX2aXAswG45V32oC3v3AQLhGcR1DoAo35iybFcJY7C0H1b+BT
   8xBqvP7HbomQ20GO9mOgMteqHQ1B9IdflyAppPHnwEFanViaPwFFiC9UT
   UkOxUili9LuRbQdme8afg/3jq+jiAb4blN5cjPCtfiZSssLks+KjoOJlk
   ya984GO5vfib/tgdgVMSL3KyQ43Jez64N7viozK1cIIB7+25QXamn19uU
   3rp6mSwp10upSr1vgzj7jOLBqFxYYPk3rPrBwO3c/yWm9KVeaUr7qf530
   w==;
X-CSE-ConnectionGUID: o2MUJNN5Ta+Vyrz3YCDeHA==
X-CSE-MsgGUID: J0JPqSDfQKeSZk4SIurxgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="95275140"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="95275140"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 07:08:12 -0800
X-CSE-ConnectionGUID: zwglCMcGTeKwqMD4mCsdQQ==
X-CSE-MsgGUID: 2iHPafT4SvKMEr1M+C5xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209833346"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2026 07:08:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgOxE-00000000I6y-0Sl7;
	Thu, 15 Jan 2026 15:08:08 +0000
Date: Thu, 15 Jan 2026 23:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:virtio/msg-xen 2/17]
 include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a
 function definition is a C23 extension
Message-ID: <202601152337.KBfCEzmN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   2978a84b82627a16bee8e2cd5718a51de47e7d5e
commit: 085cecef6ce6cb8d0cbc931f9425224def2164ec [2/17] dma-buf: add no-op stubs when CONFIG_DMA_SHARED_BUFFER is disabled
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260115/202601152337.KBfCEzmN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152337.KBfCEzmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152337.KBfCEzmN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:101:
   In file included from io_uring/zcrx.h:6:
>> include/linux/dma-buf.h:706:52: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     706 |                                struct vm_area_struct *vma, unsigned long)
         |                                                                         ^
   1 warning generated.


vim +706 include/linux/dma-buf.h

   699	
   700	static inline void
   701	dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
   702					  struct sg_table *sg_table,
   703					  enum dma_data_direction direction) { }
   704	
   705	static inline int dma_buf_mmap(struct dma_buf *dmabuf,
 > 706				       struct vm_area_struct *vma, unsigned long)
   707	{
   708		return -EOPNOTSUPP;
   709	}
   710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
