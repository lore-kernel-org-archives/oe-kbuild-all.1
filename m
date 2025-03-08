Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F04D8CE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741419188; cv=none; b=YTa3Db05qtKzNcgcY2M/VnW06hlVTuS+JvmXXIaBuiuKSW6bC1OZqp38NQzVcPLu7EQJgyleGaAysO7CMDCoubgcXXmQhUuDRMpAgMpW8Ez09xlfloIkTIKyEBEZ0xJ/cdYurTde0E7wJSSHjQpWDyObYfa1z0ZHk/92pfBJxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741419188; c=relaxed/simple;
	bh=nJeRCCldkck8VZjDPnh/S091A7C4ue4ice6e5XldjDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5/+oeThgX+3dGpffPEROWYEYOAVXbQfo/9CaCqA9bfFuEaiIsYrFMPLZe4+ULzITojNjUnhM+zUzZGwf4VPvjRMB7y338gjNFXJGSjxB8sQOUZH7gCN4vaagcrUQq0o0vzzw0fIz1HWd7QhEHhhUKGPC+qnXxk9C8ok2NwW4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqz+M6Me; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqz+M6Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741419186; x=1772955186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJeRCCldkck8VZjDPnh/S091A7C4ue4ice6e5XldjDA=;
  b=dqz+M6MePE9a+gMi/9v7lPxJYeHGgsc0veo4hfWaLJiXvPvG+tcYL8Jt
   usa/q8Z+9m3fSfuvaBk4fnkTChpd/rCqMq9Cfzv90QwXca+Fafq6Cnohx
   VuQ1/oK7dnJBTosRQ5JPLXv/7BGkP1mtyETVEgmKVthg5qGCEY/BhuboN
   44n56V15DJ3tL9n79qO5okiwf2J120GBGR/zopUXnjXOyt9wrdQN7N9UT
   ngzPGNWJawKi9yYQ+77VJq+TnJIHcjKv3IftFRGLLTNluIo1HaLPK7Yaa
   XErTTXnn12Bi/iRMH1efWoeAx13tG0ojNoKnQNy6KIHND+ZqHsVVHxV9H
   w==;
X-CSE-ConnectionGUID: C5rm5CZgRpurguXQCxg8BQ==
X-CSE-MsgGUID: tsqB2rMiQSycAeBMbiGpAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="42613114"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="42613114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 23:33:05 -0800
X-CSE-ConnectionGUID: 2IwOeaItTCi4yg1nyxMEFQ==
X-CSE-MsgGUID: z5u2iqEoQzKanql5SQhngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="120218626"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2025 23:33:05 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqogA-0001fO-0H;
	Sat, 08 Mar 2025 07:33:02 +0000
Date: Sat, 8 Mar 2025 15:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 231/411]
 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:24:15: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202503081504.RNQMZqra-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 09de2f1993ad7c90f7cdf93e32d29d14f92e7b0b [231/411] vfio/vgpu_mgr: introduce vGPU host RPC channel
config: powerpc-randconfig-r112-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081504.RNQMZqra-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081504.RNQMZqra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081504.RNQMZqra-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:8:1: sparse: sparse: symbol 'vgpu_mgr_attach_lock' was not declared. Should it be static?
>> drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:24:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *vaddr @@     got void [noderef] __iomem * @@
   drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:24:15: sparse:     expected void *vaddr
   drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:24:15: sparse:     got void [noderef] __iomem *
>> drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:28:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *bar0_vaddr @@     got void *vaddr @@
   drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:28:30: sparse:     expected void [noderef] __iomem *bar0_vaddr
   drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c:28:30: sparse:     got void *vaddr

vim +24 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.c

    14	
    15	static int map_pf_mmio(struct nvidia_vgpu_mgr *vgpu_mgr)
    16	{
    17		struct pci_dev *pdev = vgpu_mgr->pdev;
    18		resource_size_t start, size;
    19		void *vaddr;
    20	
    21		start = pci_resource_start(pdev, 0);
    22		size = pci_resource_len(pdev, 0);
    23	
  > 24		vaddr = ioremap(start, size);
    25		if (!vaddr)
    26			return -ENOMEM;
    27	
  > 28		vgpu_mgr->bar0_vaddr = vaddr;
    29	
    30		return 0;
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
