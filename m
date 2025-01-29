Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9543F1E882F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738159412; cv=none; b=D7ptvSCOt5HaOCtOzHwqFeQPytFcBzfOOzDsDmiVlJYTXdBZEcmVB/DBjTZtmcLycPrCV7rEaqe2RWKwpRN1MpNErAqwCZJIeiLOm8px5lzYUlZ1334DvWnI4CdmCBsTZzQH34exvUTs6snWrerVNMR2n0XvFXsptCRi6/l3b3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738159412; c=relaxed/simple;
	bh=uPtQ7X5sdWsWSNvrBvsSzZyQ3hxNs99QArFvg6b4hFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RExQXnXN2KEomfp4m6SfOmArnKKLdZ3KjzVaihkB9oCe9m07IXAbxgatdFqC+rqplOg56Xvr3cxpm31m5FKtmGps/2qFr5SD6UwBHUCD/dH3Lq3DOaPcAQ4s9WmefvuNsRa6gGa/fI/x99+NFfm9Z3r8H1gVMfKn6fKJv/aE3BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8Hi1Kl6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8Hi1Kl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738159410; x=1769695410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uPtQ7X5sdWsWSNvrBvsSzZyQ3hxNs99QArFvg6b4hFs=;
  b=Y8Hi1Kl6MU1gmvhdXShzdVDzZt/qHDRZ91k8/lWl9vJih962L3FO6Msc
   ownlsJ2Q6iIaiU5o1QdUByY4CCclXfefq1lgIsInHCW2L0vpi1TrQ2VHZ
   gj0AQn6W6tBHnev/MT0Ak59wrArAnbBpRfqOOWizOpqqcBTGVTZrDYkYx
   e5n/3Kb//hDgxOaDitYvmBArIrSSzFd3Q3SF1fkzCSXorqqdM8G7pml1S
   6OmCHhXUXX/sZr7wEgMJh4Nit7dxeR3yp65tXtnvRRP6QXfrb7HOyL92/
   xJsoBUYBLmanjtfxcp11q4TI6c9WHI5kmKwrNWVnAo4mFdF6PzY47yYq7
   w==;
X-CSE-ConnectionGUID: 1ZadY6O9RSSrUISpVTablg==
X-CSE-MsgGUID: 1YILR1GCS06innI++0JtWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38702599"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38702599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 06:03:06 -0800
X-CSE-ConnectionGUID: AHtbedjTQzC+xNLkZ7x5Xw==
X-CSE-MsgGUID: Hq9mX7TJSEGqPysCjOw4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132311336"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 06:03:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td8ei-000j0N-2f;
	Wed, 29 Jan 2025 14:03:00 +0000
Date: Wed, 29 Jan 2025 22:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
 sparse: dubious: !x | !y
Message-ID: <202501292144.eFDq4ovr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
date:   3 weeks ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse: sparse: dubious: !x | !y
   drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false

vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c

   287	
   288	static void release_dma_buffers(struct thc_device *dev,
   289					struct thc_dma_configuration *config)
   290	{
   291		size_t prd_tbls_size = array_size(PRD_TABLE_SIZE, config->prd_tbl_num);
   292		unsigned int i;
   293	
   294		if (!config->is_enabled)
   295			return;
   296	
   297		for (i = 0; i < config->prd_tbl_num; i++) {
 > 298			if (!config->sgls[i] | !config->sgls_nent[i])
   299				continue;
   300	
   301			dma_unmap_sg(dev->dev, config->sgls[i],
   302				     config->sgls_nent[i],
   303				     config->dir);
   304	
   305			sgl_free(config->sgls[i]);
   306			config->sgls[i] = NULL;
   307		}
   308	
   309		memset(config->prd_tbls, 0, prd_tbls_size);
   310	
   311		if (config->prd_tbls) {
   312			dma_free_coherent(dev->dev, prd_tbls_size, config->prd_tbls,
   313					  config->prd_tbls_dma_handle);
   314			config->prd_tbls = NULL;
   315			config->prd_tbls_dma_handle = 0;
   316		}
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
