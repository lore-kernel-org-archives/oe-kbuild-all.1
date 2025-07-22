Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E14D2EA17E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753193927; cv=none; b=pDVGI/yuyoHI+vdErHT0+zAevD9gj015uAwD1cDsIu5fadAIGw0Avw+AYbwNzi01IuUC7FbV/bfgrwXSRcpyduIbA47hQMcsPUim3oCtXb3sAGWBgHJjJRVS1hfyxyzq67Jl8JcjziRfeRUrr4L5CsqjvCUZg1opDzAa9kTja64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753193927; c=relaxed/simple;
	bh=u0jR1JoUpQ6c//WPC9ipqNNsKavWGytKRKt6JBReI3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IlGQ04rzackRqpEo8S4780quaPZWr0A2gpm8WKk53joXl2riEy7c4L1PCBp002mtIVZYv75rg0SzcH4FC7n2b08YAR4yHlMGfYn59ge6Ex328Fy93vB79Q4nt9+K1n3Alhh30HRDq0cmuyOp1yWnLGhvTYL1xhLvy5R1E2IeLhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlBQDoM5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlBQDoM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753193926; x=1784729926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0jR1JoUpQ6c//WPC9ipqNNsKavWGytKRKt6JBReI3k=;
  b=FlBQDoM5FcOseggjG2cTJfZRVoK4LC58d/HQg/aCW69GJeX0IrY5X2vh
   wmVWoIQk5WhyMBzEygU5V5wwl6KFhn/Y+DMwjRLx8XENgE2I5QHvlY4tt
   f2itq1p0UjRNppy50Z/6kN32ZKz3flJg9+Xv0beRpQcI20UNkQ8JmmI9y
   QdN/VV0SpknBz3+drYeWbNl+eHTfW+fCb9oPdlQm3hT8PgiBYpA97lwP+
   M1to/0ntjkHdEjQWkaAfaRq+l37Y+5eUxThP34kuKt1LNsKTerW5QJGd0
   HEbecHxIiFHi84WQhhHQDLAoWodshEw+6weVN45BFKVRgZGoucvtivmCm
   A==;
X-CSE-ConnectionGUID: sQ15N7SzQWuM3RmRczOoGw==
X-CSE-MsgGUID: /yRHdyqmRvOcvi3Xd6O+AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="65708164"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="65708164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 07:18:44 -0700
X-CSE-ConnectionGUID: V79IIlzpRD+Jttvy2eWemQ==
X-CSE-MsgGUID: 3/TbSn8ZR+qu7BGngbyOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="158825346"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2025 07:18:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueDpJ-000IKH-24;
	Tue, 22 Jul 2025 14:18:41 +0000
Date: Tue, 22 Jul 2025 22:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:20250722-iommu-hacks 9/10]
 drivers/iommu/iommufd/selftest.c:210:30: error: duplicate member 'domain'
Message-ID: <202507222245.xQ0bdS2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git 20250722-iommu-hacks
head:   6cb9b4fe133575635935efb6cddb19272b481b63
commit: 7bb45e107b4d1f4d101b2124f0c2d3371249de11 [9/10] drivers/iommu-selftests: random fixes
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250722/202507222245.xQ0bdS2h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507222245.xQ0bdS2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507222245.xQ0bdS2h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/selftest.c:210:30: error: duplicate member 'domain'
     210 |         struct iommu_domain *domain;
         |                              ^~~~~~


vim +/domain +210 drivers/iommu/iommufd/selftest.c

   197	
   198	struct mock_dev {
   199		struct device dev;
   200		struct mock_viommu *viommu;
   201		struct rw_semaphore viommu_rwsem;
   202		unsigned long flags;
   203		unsigned long vdev_id;
   204		int id;
   205		u32 cache[MOCK_DEV_CACHE_NUM];
   206		atomic_t pasid_1024_fake_error;
   207		unsigned int iopf_refcount;
   208		struct iommu_domain *domain;
   209	
 > 210		struct iommu_domain *domain;
   211		struct dma_device *dma_dev;
   212		struct mock_dma_chan *dma_channels;
   213		unsigned int num_dma_channels;
   214	};
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
