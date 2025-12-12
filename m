Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884C1AC44D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 07:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765524099; cv=none; b=tPErU3n7Pr2YvYqt4jbsjG9fhdPKuj5cC4uD1fNa9HNPd68S4TTknkxc4LPQtC6rKVTMS7H7gQJNYpe2k6NsC9Cb52jHbkyQLjFoBvBQw0WlzY2jRA85EtafmCZr74za1lrGSxIUHXBE+Df8ACZIVLPZ4dqkXNeDlSvsW+T1r7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765524099; c=relaxed/simple;
	bh=faH9xqCZYs3GVEsOIwLExSO9DdUMlgy8utyvb/ZGcgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzlQDjatXnYYMd9GICjThmbvq0MvVonMm9GaZl+1Zxvcp7tR31vcHXObfb4SQMHW+vFOolr0pURfb55R6LKhLwBGwmTcqh+DI4/AYj+ZTJgSJt1+UzquPSWeQJOlouDqyE3xa44BGvrof7/W7vYYijXPS1AxHUL4AGtEAJ7UH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4xb+C0f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4xb+C0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765524096; x=1797060096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faH9xqCZYs3GVEsOIwLExSO9DdUMlgy8utyvb/ZGcgU=;
  b=S4xb+C0fx6ElhAgQxMQGMe2HEpkFK9xh75NI7vdJYkUfEtAnB/YXOFKo
   2nKF8P3x/9qylpLiTBcg7J6rNjeWD41V7wTdu95lWK+Wq7ZcjXJOtXgMa
   LkL1K7sOvgZpTI9MNTZoXZEpT5trLK73t7VvrZF8Iy/Ij3DCodGVE0bkc
   ZwDnfreSyHj8Gsv12/0oOMAY4bBkBEdmDRFghrz0fe8QBvMJMrrz8ubZi
   2x339YT5Owz/3Qo9u4Kb3DebbGDqQPMdEr59UVV9djoBczjLCGY08ZaYf
   Slgm1H7F7qgPFUv7pQNwW1T7TT4TdS40GuVRLZcBrZvwV4uJB388mK1rj
   g==;
X-CSE-ConnectionGUID: jBPe+cK4SwavK+7RpsVYuw==
X-CSE-MsgGUID: qd9EsxUKTTS/p5BEFJKXSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84922933"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="84922933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 23:21:36 -0800
X-CSE-ConnectionGUID: mybidevXQg2OnPcXV53arw==
X-CSE-MsgGUID: nLax5tBsQq2WTD1hOMcULA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="201431950"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Dec 2025 23:21:35 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTxT2-000000005j1-3Oyw;
	Fri, 12 Dec 2025 07:21:32 +0000
Date: Fri, 12 Dec 2025 15:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in
 'dma_heap'
Message-ID: <202512121523.pEaDBfFU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6200e441dba51518e2ddf4ae8d430d8faaa8b598
commit: a5f9b0171db0c1e78d2c8da744f82ee20b2064fb [2/2] Merge 3e443d167327 ("Merge tag 'docs-6.16' of git://git.lwn.net/linux") into android-mainline
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251212/202512121523.pEaDBfFU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121523.pEaDBfFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121523.pEaDBfFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'list' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'refcount' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_dev' not described in 'dma_heap'
--
>> Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
   Warning: net/netfilter/xt_quota2.c:200 Excess function parameter 'name' description in 'q2_get_counter'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
