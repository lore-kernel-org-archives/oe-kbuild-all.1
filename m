Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487F20311
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757961252; cv=none; b=u8xq9bdSunWCfsDU4SilpuFTBBNoD7fSSQ7dppDfwS2doq/0MthIEp1sn1T3csswDbU4Pbq9KNeEeWgzqcnp5gB+R/SUOvAaZrtyQrTiLGj7q9FHTauRREvZ3c+HreofZXNVwAqLzLqiFl3iXq+w39G+opWgcO4AV1HJ51IFLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757961252; c=relaxed/simple;
	bh=T6kG0XmFzL2XqEgTRtkuJUEz7yV8SyqtEbyJErMpMlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TNrOEhf632FBfGp3M8ndFWyLBklJKD2mwSMAZLXn1hyxyrWuL7UNLMoA5v3/pIBURA3rUy/wpegxnBQNVDl/9EksS2dIHy6uWXVyS3vBcirDmCl0pb1G0w9AsoUSUtx8XUxbkZUPeqECvCvZzOXqA/kaLj0rJ0KL/h72lu/2kfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xp0zEVPs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xp0zEVPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757961250; x=1789497250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T6kG0XmFzL2XqEgTRtkuJUEz7yV8SyqtEbyJErMpMlM=;
  b=Xp0zEVPsoVKXX3dGG2iDkXH+cA5io7LKaFXqAF2qUJUPXVxm9Q5WmT6/
   f23fva/qxOB6cUKGo1+iL3JJ3CiMiGtdQW2xvFp5rOSEfNVJFVEeWLJs8
   E4UY1eTZLMpG0FeFZ1a9GueuRe0TbXWzGLvU9K1o/6fEy4pyx1M8QghcB
   /kbIzuldiDs5FkEIwGaH/urih0unm0epo2hvlbDyUEy1HpV8yGg2Q88Kr
   kgsXfrRlTVwUoBhM75hcitRx6IOsK13XbXlD1DOw1N8CNHpb4YPwgJMJm
   YOWvAc9nM/z5bOhC3ZGTtUWpzGnjswWvUXwBje/1UWnzKoszkTT9PYN11
   A==;
X-CSE-ConnectionGUID: mDOim8ymTju3qAwABK67jw==
X-CSE-MsgGUID: /B8+qP6BRqewsrGvCOXC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70475609"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="70475609"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 11:34:10 -0700
X-CSE-ConnectionGUID: v8xeJuJGTSCI8UjNMkSTew==
X-CSE-MsgGUID: RYE5riAKQLmEOCvHAiivDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="205490162"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Sep 2025 11:34:09 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyE1e-0000ZV-31;
	Mon, 15 Sep 2025 18:34:06 +0000
Date: Tue, 16 Sep 2025 02:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:dmabuf-vfio 31/32] Warning:
 arch/arm/mm/dma-mapping.c:1371 function parameter 'attrs' not described in
 'arm_iommu_map_phys'
Message-ID: <202509160255.OF28vWDA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git dmabuf-vfio
head:   0fe84bb3e06b37d52102a606728b6838c918a7be
commit: c9c7df43e3a084b2e9605cb945f92800ba601db2 [31/32] ARM: dma-mapping: Switch to physical address mapping callbacks
config: arm-randconfig-001-20250916 (https://download.01.org/0day-ci/archive/20250916/202509160255.OF28vWDA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509160255.OF28vWDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509160255.OF28vWDA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/arm/mm/dma-mapping.c:1244 function parameter 'attrs' not described in 'arm_iommu_map_sg'
   Warning: arch/arm/mm/dma-mapping.c:1303 function parameter 'attrs' not described in 'arm_iommu_unmap_sg'
>> Warning: arch/arm/mm/dma-mapping.c:1371 function parameter 'attrs' not described in 'arm_iommu_map_phys'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
