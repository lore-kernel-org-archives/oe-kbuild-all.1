Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679B6339AE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707474564; cv=none; b=CtR/Wn/qMnDwzKgAxieyrK0QGQVYfArXQYqWm8R2q3Sjp3xF2kszjrhOwqJrxZ30t7u3Kauq4bKLxCUPbNleytmPRvTyDzKoT4NLt8QQCDtWV+KWhUepH+rbEs3lS7AS5fhfln5X6PsEn8xSQLoZgbYX2GiZbS7cQkcuotLK3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707474564; c=relaxed/simple;
	bh=f+hfYXIDT0jX08J64/93qFHdjg+i0p4ic92Z5i10gWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfBaN/EtTgvVjnKw6asFBV+Dn/VZzV606wwvh2fIBzpWLP10oradjNVcMPWBpkI1qUVcyZJ272fB3ah8CEloGY8d2GXG9HHpOhswof8hVSJTVt01d/JH9F+euJ0qRXyzf8r8nwwWMeHJapenqGd9aBWpLFVpifgV1I2zfNwO5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9dsFNQC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9dsFNQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707474562; x=1739010562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f+hfYXIDT0jX08J64/93qFHdjg+i0p4ic92Z5i10gWQ=;
  b=T9dsFNQCtXacfymkjUZ7Uukyzx/FgsSqVD8CnV/9d0tH6qiqhZwI/vhc
   RHHN8oyZuOUPy43rSGOGRpJHBWg+G83NPMRUKmUnChdXASRBOxilH0dvC
   goWZhVOYXdN2adbn7DR9H9rSQ2uni1viJSHa3bA/uRKFlgMDTVoYcWj4C
   t1QttP8DVATogxMAR6H8ks1PzlAHgnPK7tCNwab9DUf+ofuiguUruXppf
   JOBzRXtjJRmzP7alYg9QFuoauJ0R56mHfK2CghB+wCUgyw+QWrb1q8/P1
   RIOBBt7DGn2a4+EzCvnhcUd09VsNA4EQg7emodtCDsEU0YdkgJXNr/vaG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1714641"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="1714641"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 02:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6553610"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Feb 2024 02:29:21 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYO8E-0004cU-2J;
	Fri, 09 Feb 2024 10:29:18 +0000
Date: Fri, 9 Feb 2024 18:29:08 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 02/12] bcm2835-dma: Add proper 40-bit DMA support
Message-ID: <202402091831.DXlfjVKF-lkp@intel.com>
References: <eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on linus/master v6.8-rc3 next-20240209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/bcm2835-dma-Add-support-for-per-channel-flags/20240204-150430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/eeb94204c30c2182f5ffd3ec083c04399ecdee32.1706948717.git.andrea.porta%40suse.com
patch subject: [PATCH 02/12] bcm2835-dma: Add proper 40-bit DMA support
config: arm64-randconfig-r131-20240209 (https://download.01.org/0day-ci/archive/20240209/202402091831.DXlfjVKF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402091831.DXlfjVKF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091831.DXlfjVKF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/bcm2835-dma.c:288:23: sparse: sparse: symbol 'memcpy_parent' was not declared. Should it be static?
>> drivers/dma/bcm2835-dma.c:292:1: sparse: sparse: symbol 'memcpy_lock' was not declared. Should it be static?

vim +/memcpy_parent +288 drivers/dma/bcm2835-dma.c

   276	
   277	#define BCM2711_DMA40_MEMCPY_FLAGS \
   278		(BCM2711_DMA40_QOS(0) | \
   279		 BCM2711_DMA40_PANIC_QOS(0) | \
   280		 BCM2711_DMA40_WAIT_FOR_WRITES | \
   281		 BCM2711_DMA40_DISDEBUG)
   282	
   283	#define BCM2711_DMA40_MEMCPY_XFER_INFO \
   284		(BCM2711_DMA40_SIZE_128 | \
   285		 BCM2711_DMA40_INC | \
   286		 BCM2711_DMA40_BURST_LEN(16))
   287	
 > 288	struct bcm2835_dmadev *memcpy_parent;
   289	static void __iomem *memcpy_chan;
   290	static struct bcm2711_dma40_scb *memcpy_scb;
   291	static dma_addr_t memcpy_scb_dma;
 > 292	DEFINE_SPINLOCK(memcpy_lock);
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
