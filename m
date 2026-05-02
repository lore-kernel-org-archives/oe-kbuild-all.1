Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3D1D555
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 06:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777703433; cv=none; b=BbvRmf91vtGsA2ZNgfecVvt+FWGtl/WiDDPeRURDqJiwG5MigTaeMY5ncCjrEOtf0vJonfxutnO6p+vzh4UOiYPawZvTuHz2FiP1F8Yl5r1ysenbEGMJpWgnnNq9gbIf2oi1ju2x3xeb/E5G/cw1d/2ngNLuTxsUyxJEckFEsHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777703433; c=relaxed/simple;
	bh=3t5zMyowDctmoHPn2LezGJJ86pRYkNoM8HPhBEHeJl8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gKhZ9ArKa9T7NoRU620zg2sTmcHkieQ4JgwZ5L62li7jeR80DFUiPIUBSMFgJcEk73RLrBi18F4BcQuA8l0eyt9FhvNbMeYsRAuXuEq/MRjpZOXu8+0i6Ga5FMIQHSTGzCvztlS4XLDE1WWpprgrQic8R06DFepBdpTvs04t5PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6oZn68T; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6oZn68T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777703431; x=1809239431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3t5zMyowDctmoHPn2LezGJJ86pRYkNoM8HPhBEHeJl8=;
  b=E6oZn68TWAMcJKIaabwpuVQFhoKfHAjtiIBMkmt/erR1To/DPClQae3U
   AgP5VYe//tdL5Yoh7h3dd25JHFjzIa8NYFuuDYTChSIs7cilI0DKy0FEm
   5zLfQmFWeyNqMu7yByN9iYWZpfnoOuWpiqL3dCw2A2keHvuuU389+3amg
   F17P/zEH3yAcB/vYG4qLXlSKcEBIVM2wLAYeWK54B9m2FwONyf+j9+O0S
   c7Ockdopxv30Jb30/YSAU6GBT4e1BEr5tyxelFBqe/UX8UTRz/lYiRsAP
   AAYrBc7BVdGCVZkckboEqwZlPQv4a5lH9D9iIVSeGY1bEUCRbIUE9kMES
   w==;
X-CSE-ConnectionGUID: 9E5J2oLnQfi1sbhELVabHg==
X-CSE-MsgGUID: memZJs5wS2Ohvq396+r0mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78517528"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78517528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 23:30:30 -0700
X-CSE-ConnectionGUID: v6pkUW4wRgiT+n3VAeWC6A==
X-CSE-MsgGUID: r62b402cTRWILX4B6UaP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="258398470"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2026 23:30:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ3ru-000000001Cr-0fQE;
	Sat, 02 May 2026 06:30:26 +0000
Date: Sat, 02 May 2026 14:29:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: drivers/dma-buf/sw_sync.c:88:24: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202605021435.i9s35ZfI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cd546f7ae2fce8b695c834143b50e712d62ebed8
commit: f4cc3ab824d6772a48ca9d9c74ac623b3309985d dma-buf: protected fence ops by RCU v8
date:   10 weeks ago
config: sparc64-randconfig-r113-20260430 (https://download.01.org/0day-ci/archive/20260502/202605021435.i9s35ZfI-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021435.i9s35ZfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4cc3ab824d6 ("dma-buf: protected fence ops by RCU v8")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021435.i9s35ZfI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/sw_sync.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, include/linux/trace_events.h, include/trace/trace_events.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: Expected ) in function call
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: got ,
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: undefined identifier '_res'
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: undefined identifier '_res'
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/dma-buf/sw_sync.c:104:15: sparse: sparse: undefined identifier '_res'
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: undefined identifier '_res'
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: undefined identifier '_res'
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: undefined identifier '__VA_OPT__'
   drivers/dma-buf/sw_sync.c:255:14: sparse: sparse: undefined identifier '_res'
>> drivers/dma-buf/sw_sync.c:88:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const *
>> drivers/dma-buf/sw_sync.c:88:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const *
>> drivers/dma-buf/sw_sync.c:88:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/dma-buf/sw_sync.c:88:24: sparse:    struct dma_fence_ops const *

vim +88 drivers/dma-buf/sw_sync.c

aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  85  
f54d1867005c33 drivers/dma-buf/sw_sync.c         Chris Wilson    2016-10-25  86  static inline struct sync_pt *dma_fence_to_sync_pt(struct dma_fence *fence)
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  87  {
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31 @88  	if (fence->ops != &timeline_fence_ops)
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  89  		return NULL;
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  90  	return container_of(fence, struct sync_pt, base);
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  91  }
aff9da10e218c5 drivers/staging/android/sw_sync.c Gustavo Padovan 2016-05-31  92  

:::::: The code at line 88 was first introduced by commit
:::::: aff9da10e218c54f5ffc8bcb66c9837135074190 staging/android: make sync_timeline internal to sw_sync

:::::: TO: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
