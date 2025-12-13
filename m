Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C03B8D48
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765625497; cv=none; b=U7mQEfhd5RYv/kJrUiH9rGs1atYUA14DZZ6mc5Tc9c+wPivKZ8u5cTCJ7rN/y3WsO6Yy6zaS4NLyGIO/OEkw2FDnS87LBSkFT0wup2FGoMK9MWPnjPWKz26CoY+yuSD+dceX33jIwuRMoq3vMduZkO7O3SIzFENdQVlSMPq32cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765625497; c=relaxed/simple;
	bh=MlCkZynIMlHTE+QRDobeZom5fAPwm+55RgtsO4mIvM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bsg2DsFiu7nbderJti7gf28NY+YR0qZilPBTNmLwMZymL2lXzcuqsJ4kTAuVdyV6iQsJrfAVIWe0Puje6I6baPU9nL2SrdQ69cHttWs1lvZdYqBGU0irihIF4Qvclbn+QDhlfReZd6LKaswTox18MH97dffrzr4bUyypujkfUXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2w7DiZQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2w7DiZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765625496; x=1797161496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlCkZynIMlHTE+QRDobeZom5fAPwm+55RgtsO4mIvM0=;
  b=O2w7DiZQY0o4hh0ERhY1pjfEj/oN0k0jQ0vaLlJqOynWIj19HSGI3hZg
   KWVlGjkmNIu2Y4EU0JwmcUEcAWBVegjQLXqaKJyN9oco3H+Ai0XZv92+l
   PQ7A9VDH9QLf6q8mXjfmbRDRwlg1KNtvXAGuXdmul6CDqwNOX1JF69h2s
   MNe5EPGWUK9R6sDfh57+mZvgbaTZX276iAY9kDjhgLLKYM+of20yP/N3y
   cYwYrnG6OFMbaqtv1SgzgrnwOEQeWm/HKh8ZAW6DufNJ+BMYMGaaE10ip
   ZmZAJ7HacU0cRQxEK5nBpzU57VbGCiUgam1XbOk7aDq6uLFEg+qdCfo6y
   w==;
X-CSE-ConnectionGUID: ow4e339uRp+BFQeHDl67mQ==
X-CSE-MsgGUID: RNnhZnXjT2eT/Y1xECH6RA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85016781"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="85016781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:31:35 -0800
X-CSE-ConnectionGUID: y8v43bzPRDeJRxtkGbcffQ==
X-CSE-MsgGUID: bX/CUc2XRtaYPe3V/eRSEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="227960130"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 03:31:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNqV-000000007YD-3AgP;
	Sat, 13 Dec 2025 11:31:31 +0000
Date: Sat, 13 Dec 2025 19:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 drivers/dma-buf/sync_file.c:120:12: sparse: sparse: symbol
 'sync_fence_signaled_driver_name' was not declared. Should it be static?
Message-ID: <202512131956.wReRMxRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: b402a1d75befcddca1b54a72297785474d05a99d [18/18] ANDROID: sync_file: Weakly paper over potential xe driver (and similar) races
config: i386-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131956.wReRMxRi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131956.wReRMxRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131956.wReRMxRi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol 'sync_fence_signaled_obj_name' was not declared. Should it be static?
>> drivers/dma-buf/sync_file.c:120:12: sparse: sparse: symbol 'sync_fence_signaled_driver_name' was not declared. Should it be static?

vim +/sync_fence_signaled_driver_name +120 drivers/dma-buf/sync_file.c

   118	
 > 119	const char *sync_fence_signaled_obj_name = "signaled-timeline";
 > 120	const char *sync_fence_signaled_driver_name = "signaled-driver";
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
