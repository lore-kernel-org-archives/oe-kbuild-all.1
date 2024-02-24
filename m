Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480222941B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708775396; cv=none; b=rnKEgTMb56L5VmAO5hnUT7YxPD/5/C7taBMQ/2lJQb4SbHtPlUcg6Es9SOCn17qVjAGpgrPmD3SUA2XpBYAvuDvzRAOqtwoAHBPhPwaIBBvyg6z4jU6ELLy9+w3vB7ihPUtvJUBJAsTKOffdyM5ab4N4vmWk+qqKUGkEsTPiMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708775396; c=relaxed/simple;
	bh=50D7FXIN0leSNjqSF6+kBcqNxCOsENDaNQtYz6tH1Cc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hrd16VrjyByEVFeNNc0B44djzmbV8icbWRibyeknc9H02nIgx9t95FexC99xPDLbhPCDP2P3ImquDDCbPKGFMAWvBfRysCxLv5w0EmczMsFvzz45Z9ARFzspV+j7d9cKws7dbUxHn8I9FG534ct7JbRgZSL72QHAzBJPouYH30k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6CS+rxY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6CS+rxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708775394; x=1740311394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50D7FXIN0leSNjqSF6+kBcqNxCOsENDaNQtYz6tH1Cc=;
  b=I6CS+rxYRKUHV/Lbvdz0LQXMkiveMrQe9sjP0J2AXo2j9JI4f1dwjUFb
   Dca9XUgmK8ChyyWsMKCkPiVPgjvku3hVph7I99hVoFGQiFstQlXe/IhzN
   TgxCGwn0EBo2OsnxUI7tf1vdnReRheG8frcXx/S+21yqu/FML19+ixUft
   oxLueHP/eubMxjddbJ6zUXzs2vcu1uxbRK0RdJn+Mms0IcoUWUH6H14TB
   naSZu/y6umJGwrBjxKFMueyIE4qghjOWUOhDowI/ekc1l3J/xy6qxsV0Q
   anX6cVlgfOrMqHymee6sjW2Guqtq9YDDQE4MB97Cad9o6veouUTm8dHdR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6915727"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6915727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 03:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="37181858"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Feb 2024 03:49:52 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdqXO-0008VK-12;
	Sat, 24 Feb 2024 11:49:50 +0000
Date: Sat, 24 Feb 2024 19:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 2/3] drivers/gpu/drm/xe/xe_ggtt.c:78:9: error:
 implicit declaration of function 'writeq'; did you mean 'writel'?
Message-ID: <202402241903.R5J8hKVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   a9e483dda3efa5b9aae5d9eef94d2c3a878d9bea
commit: 3121fed0c51beb8ea7b18ab2ceff1ac9e358ac53 [2/3] drm/xe: Cleanup some layering in GGTT
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240224/202402241903.R5J8hKVI-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241903.R5J8hKVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_ggtt.c: In function 'xe_ggtt_set_pte':
>> drivers/gpu/drm/xe/xe_ggtt.c:78:9: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
      78 |         writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
         |         ^~~~~~
         |         writel
   cc1: some warnings being treated as errors


vim +78 drivers/gpu/drm/xe/xe_ggtt.c

dd08ebf6c3525a Matthew Brost   2023-03-30  72  
dd08ebf6c3525a Matthew Brost   2023-03-30  73  void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
dd08ebf6c3525a Matthew Brost   2023-03-30  74  {
c73acc1eeba5e3 Francois Dugast 2023-09-12  75  	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
c73acc1eeba5e3 Francois Dugast 2023-09-12  76  	xe_tile_assert(ggtt->tile, addr < ggtt->size);
dd08ebf6c3525a Matthew Brost   2023-03-30  77  
58e19acf0cdf3f Lucas De Marchi 2023-04-12 @78  	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
dd08ebf6c3525a Matthew Brost   2023-03-30  79  }
dd08ebf6c3525a Matthew Brost   2023-03-30  80  

:::::: The code at line 78 was first introduced by commit
:::::: 58e19acf0cdf3f18c1c868165f45d3ea626b9c3f drm/xe: Cleanup page-related defines

:::::: TO: Lucas De Marchi <lucas.demarchi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
