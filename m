Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF21E878
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216391; cv=none; b=mr20LW2UzTtYPn7wI8JsG2eYMWYb7+kFUBIjxT8nMwSsg/VjiBmMale7tmNr/yvfQbAg0EaFdYy359Fh0xrIFhFBpx6XpELNi25jlazCb4pFnZGBaipf0dlWQA2Ln3v3LsehciNNMnSIUSEXqci7/+qVtjSy/RO34pvnmm0O2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216391; c=relaxed/simple;
	bh=vFfmdSaTJDGhES67w/gqQFHL71qDrO4q/NTzc+wg/i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8ZcB+uGXaLtCV3MOIJSmARfhtKejzLc+e3Oe8YjN4V/FL7ng30xCI3o9Qaju+UzbkTNaToPWzFWzPOv1U6jFBpetgOpXJltYgQpMZF4RkRnDRSvMueUHzgufjGPonTYrTUbZumA7qKI/Wqs5x/lBFfkKqX1TBNDPViJ3ofn+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWyi0aEN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWyi0aEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716216389; x=1747752389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vFfmdSaTJDGhES67w/gqQFHL71qDrO4q/NTzc+wg/i8=;
  b=hWyi0aENnBI023nMuO1/BGVPScjnrbX5RPzyO/oLIeMKKfqsV77nJmrK
   IVoWFJhBHSX/zrg0bhi/gokB8EOon06f6n6LNNrHCT+wVAM5OioWdhc75
   aNKpR1t7lg0HW87LvaL0zkHgARItUbYfdwhye192F1rYNVY+cawkS91jb
   Jbv9YrbahMVNuRoZIoGEaA7feVmBwhAv51c9xsDJ0t+mGHO8L6+SusoPZ
   qQH7SEH5G6OqZFwX8S3rQPMyOMvpiVjYfRnaXDojFsRR6ruu8xuJsMkwD
   F0nlVKRrQEWfAGpA4ge9+zy6DIfd3u/SjeFNDph1S+YRDl1wA/I7iGkCS
   Q==;
X-CSE-ConnectionGUID: X8H5W5T8QG2wM9QrOvzhcw==
X-CSE-MsgGUID: ah2Ore2bTxOtGt9ywwohIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12524273"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12524273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 07:46:28 -0700
X-CSE-ConnectionGUID: B48JMDGtRPurYae+YCixzQ==
X-CSE-MsgGUID: vAsmEy92R1yUHTur0JzJ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="37087025"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 May 2024 07:46:27 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s94HL-0004ud-2T;
	Mon, 20 May 2024 14:46:21 +0000
Date: Mon, 20 May 2024 22:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9620/9669]
 arch/x86/kernel/zhaoxin_kh40000.c:348:16: error: 'struct device' has no
 member named 'dma_ops'
Message-ID: <202405202248.hKgUtGVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: ef20808db09987137fba30519fb94a6b12b63ee7 [9620/9669] Add kh40000_iommu_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-002-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202248.hKgUtGVI-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405202248.hKgUtGVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202248.hKgUtGVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/zhaoxin_kh40000.c: In function 'kh40000_set_iommu_dma_ops':
>> arch/x86/kernel/zhaoxin_kh40000.c:348:16: error: 'struct device' has no member named 'dma_ops'
     348 |         if (dev->dma_ops) {
         |                ^~
   arch/x86/kernel/zhaoxin_kh40000.c:349:36: error: 'struct device' has no member named 'dma_ops'
     349 |                 iommu_dma_ops = dev->dma_ops;
         |                                    ^~


vim +348 arch/x86/kernel/zhaoxin_kh40000.c

   345	
   346	void kh40000_set_iommu_dma_ops(struct device *dev)
   347	{
 > 348		if (dev->dma_ops) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
