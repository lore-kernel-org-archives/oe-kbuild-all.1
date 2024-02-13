Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767A5F54E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Feb 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846010; cv=none; b=aM0ZvorVo1d03XtYjCrTXa9QNlS364LYMaPDpEuf9kFgGHf2SO8IiUbucSJpz6m9HW7gJY7t6EAE/aUcd6h38ZFX9vCRpFwbuVz518X4ujAwePdjNRUCCLQm5e9VNqdFDHb0BYW5xDptQ1w/cdeUJ42KKOKJwCpKvsmY5Z1jxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846010; c=relaxed/simple;
	bh=jWHAF3dt0d+UwRwL80OufqpmuwrmwHAx4TG6/LMevVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8mEiQNc9QShTybzE80JEcEmAp+u0802QP5np/H8PJPjp2cVdkSjegLTiR8EiRB5lUFk2aL0qn6uPo8YAudY0xgy0pQ6Ng4EadVT/sFHLu3AoujDY9aiSR4TTDZfyMWpbQoQIlHJ8sLXDM4vRq665AQJx6MRvredT5i2gJ+vPnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7lp8pDE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7lp8pDE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707846007; x=1739382007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWHAF3dt0d+UwRwL80OufqpmuwrmwHAx4TG6/LMevVo=;
  b=O7lp8pDEqu3xLC6UXpPLhHNa1XI1QVvOGZNKYvq9A3N3O80oLCVwEBYO
   UI4kSzmQL0cUQIOmnh7UZXsdpQHiQA0Unr4XgSDypk/j5ypAw0xlEClef
   AlzqpUr9iYKqzNfXdAqqcsMupV+1SKYhFf8bUiG2mN1miUvTsQCLhSE2k
   +NFkqdbTvquSdyd8zpjErnDQjt22HA59I4IeWx9n8k59c50WdKeOkKZqx
   4/l0G0Ey/3lr4ayaOYYZwTtj1APZiGFb/GBWt3IAy2CP3zXbIPZOk1PFX
   ER23iN3He0vEiNHmffUBEKQq/Tj3m1//MjSi2MxjfGD7m542w8RpKwl0h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1742353"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1742353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 09:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2990424"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Feb 2024 09:40:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZwlH-0007xY-0x;
	Tue, 13 Feb 2024 17:40:03 +0000
Date: Wed, 14 Feb 2024 01:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:dma-buf/ecc-heap 2/2] ecc_heap.c:undefined reference to
 `gen_pool_free_owner'
Message-ID: <202402140142.Gbk73IGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git dma-buf/ecc-heap
head:   99c09d3182d745f4f38ef4af1c119f1fb7b548b1
commit: 99c09d3182d745f4f38ef4af1c119f1fb7b548b1 [2/2] dma-buf: heap: Introduce a new ECC Heap
config: nios2-randconfig-r113-20240213 (https://download.01.org/0day-ci/archive/20240214/202402140142.Gbk73IGw-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240214/202402140142.Gbk73IGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402140142.Gbk73IGw-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/dma-buf/heaps/ecc_heap.o: in function `ecc_heap_dma_buf_release':
>> ecc_heap.c:(.text+0x270): undefined reference to `gen_pool_free_owner'
>> ecc_heap.c:(.text+0x270): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_free_owner'
   nios2-linux-ld: drivers/dma-buf/heaps/ecc_heap.o: in function `ecc_heap_allocate':
>> ecc_heap.c:(.text+0x41c): undefined reference to `gen_pool_dma_zalloc'
>> ecc_heap.c:(.text+0x41c): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_dma_zalloc'
>> nios2-linux-ld: ecc_heap.c:(.text+0x4c4): undefined reference to `gen_pool_free_owner'
   ecc_heap.c:(.text+0x4c4): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_free_owner'
   nios2-linux-ld: drivers/dma-buf/heaps/ecc_heap.o: in function `ecc_heap_init':
>> ecc_heap.c:(.init.text+0xa8): undefined reference to `gen_pool_create'
>> ecc_heap.c:(.init.text+0xa8): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_create'
>> nios2-linux-ld: ecc_heap.c:(.init.text+0xec): undefined reference to `gen_pool_add_owner'
>> ecc_heap.c:(.init.text+0xec): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_add_owner'
>> nios2-linux-ld: ecc_heap.c:(.init.text+0x138): undefined reference to `gen_pool_free_owner'
>> ecc_heap.c:(.init.text+0x138): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_free_owner'
>> nios2-linux-ld: ecc_heap.c:(.init.text+0x15c): undefined reference to `gen_pool_destroy'
>> ecc_heap.c:(.init.text+0x15c): relocation truncated to fit: R_NIOS2_CALL26 against `gen_pool_destroy'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
