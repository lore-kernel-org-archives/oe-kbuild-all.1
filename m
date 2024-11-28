Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B499217BA5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 20:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732825643; cv=none; b=hrsRKC1Kdgg+Xb8mwmIOSbX025cEo2u09NBJ1OS7fAq/IwMXe7z3xjYrs0c3TEvsRBMIrGZt/7VstB++vgf4DLUWtScOD2645Nl+ZN2ydvVCcIfYJdtb/4ccc/Lmf+T+SwzluAAJMZ3Fhq+ljGdwzOY08i5ZlNjaP5XFbbe9TZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732825643; c=relaxed/simple;
	bh=r9LepWviqgs5g29I8l5JSd04WB9B1LbN4wgH7nZhEQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nUMncAwz2X2duGIMBerWXnFCTjqlafLJjO77KxTfySbZl3bsyvdoSbnEN2AYAdOEqrC6iREGOxzHCrH0aBLYE0eO+vqZwhIbiDuF6uwMnstHYYN7rVV5D3pKLUsQlsRN/wAd7hXS5Rc5SCoCk7LlENlYaN1Vnmoe59chOHPyh1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFg3P1Hu; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFg3P1Hu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732825640; x=1764361640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r9LepWviqgs5g29I8l5JSd04WB9B1LbN4wgH7nZhEQI=;
  b=QFg3P1HuAxFoyHggDKHqFXEfPWs093kRuMjhlasv1UUn0XjC8WvN3wba
   5XM7brmUOVpUZC0caUV9uaarR6h6Q6AcWjH7GbK1Ru7bQWS3CPesqn+XA
   FBcR9wiBs621mKZECxvl+k7PujqDB3EosoXvEbMRfoFXHuiEZUDHabkqx
   n5Wu6STRDbeLweNd0TfNZEV0XSpbQ51Ta435iyR6MkRx8Yei+fZL8Oslb
   fHqNUYZLcUdTp/zMfbxAzRU3qT0rIRi/j67fyUvByAZHQhEB6BOcelFb3
   xwFLuQLJYI7WuKS54pXON2DwP4GKnclVq9QiKETkTui0qwSv4mMEILeDe
   w==;
X-CSE-ConnectionGUID: fXZeJIdwRmOuMcz9oXSN1w==
X-CSE-MsgGUID: LLO3qHNeT2OH1lyUAfNYeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20655668"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="20655668"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 12:27:19 -0800
X-CSE-ConnectionGUID: mhThkQ1SRI6/4tiJ/3UQLg==
X-CSE-MsgGUID: zEFk8ashTTeQPlPJ4ITMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="96743958"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 12:27:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGl6a-0009z3-2I;
	Thu, 28 Nov 2024 20:27:16 +0000
Date: Fri, 29 Nov 2024 04:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:perf/core 23/23] core.c:undefined reference to
 `zap_page_range_single'
Message-ID: <202411290418.A6ck1LCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   02fae3a65df8f78e7cbe879f5f089a4e46c95d6b
commit: 02fae3a65df8f78e7cbe879f5f089a4e46c95d6b [23/23] perf: map pages in advance
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241129/202411290418.A6ck1LCB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290418.A6ck1LCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290418.A6ck1LCB-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/events/core.o: in function `perf_mmap':
>> core.c:(.text+0x11ba0): undefined reference to `zap_page_range_single'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1b90): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1b98): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1b9c): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
