Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278028C2B1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184385; cv=none; b=JMRjG8xhCnskSHRKbXRJHuHrFIoVjnQVCTCNhK+8Zfq6C+wzCRb34fuflJFy/Ylz/XzgjUePTWRh2qJnKsmETry8Id0aTNrbrQx27LjM2SKxW0atW2pgYi1y4JobX9aDOxLktF4AZNMd0He2zA5UoxaiekrRw9QfH/tbRBfsXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184385; c=relaxed/simple;
	bh=l0JQd4Ur8oIiLajJ1sQvSf2MfYqBdxx9W/2Pz21+AGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZujWtcMdiGbFKvkevKJfusnw+72Uk8iyUc6NMPj1fHKU1sM4LwpJ/ki3u6rbErSjA3SbBCicg+7CkyDKSrsrqEdT5ru58ZFcuPQGXng41D637ZRLn5g6MfFHX+78SkStr830xlVgszqp9Vcra6G99Lnp+VwsgRIUMKYNKwisq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1OSugyl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1OSugyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752184384; x=1783720384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0JQd4Ur8oIiLajJ1sQvSf2MfYqBdxx9W/2Pz21+AGs=;
  b=H1OSugyl4LaHPSnfyAaCUlcdNVEs33ZdvOTSn5UoCBkJxWWSSs5VtMmg
   KsQivkLU7JDTHrKDI0lK74GFTkUiCB9pqTXfsF3k5gYSJxFDwnlbGfv1D
   rgV0tHKAOz17ZbZ5XQfYcXMnfj5nu92Jcjqkn3hl2mVvV+vzy2xPCj0Vs
   RDGh9RnGw967FSMcpbQ5BznpWBmMgQwbp5zLa6i+Bz7RmCqx00ST9K09t
   CSpSxymvSsqivBperp/BROZRwvqcej0UuI6HqE1Ci1Dk9ztJlMWfbWlIU
   Kl/aphAdxNsqnrh3CA7IEoL2NoBp4U0vbLb2eIA1FXkvuqBMWcoebyVUf
   g==;
X-CSE-ConnectionGUID: ImTgmkl+QpKD3y1x14wQIQ==
X-CSE-MsgGUID: mAb13MffQZWMdo26NJbnng==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54604051"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="54604051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 14:53:04 -0700
X-CSE-ConnectionGUID: HrrKqXw6Qf29kqi93qwu1g==
X-CSE-MsgGUID: 5ffsmrMVRFOLomCTSdSA9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="156689905"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Jul 2025 14:53:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZzCM-0005VX-19;
	Thu, 10 Jul 2025 21:52:58 +0000
Date: Fri, 11 Jul 2025 05:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 10/19] (.text+0x8a4): multiple
 definition of `pci_mfd_isolated';
 arch/microblaze/kernel/setup.o:(.text+0x0): first defined here
Message-ID: <202507110522.xA0c1ans-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   dd09b165dc2dbc1b7e1e7032a7afb0632d03faf8
commit: 565636ce5907d6262d2eb1935671179d125b9b25 [10/19] PCI: Add pci_mfd_isolation()
config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20250711/202507110522.xA0c1ans-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507110522.xA0c1ans-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110522.xA0c1ans-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: kernel/dma/direct.o: in function `pci_mfd_isolated':
>> (.text+0x8a4): multiple definition of `pci_mfd_isolated'; arch/microblaze/kernel/setup.o:(.text+0x0): first defined here
   microblaze-linux-ld: drivers/pci/of.o: in function `pci_mfd_isolated':
   (.text+0x3f4): multiple definition of `pci_mfd_isolated'; arch/microblaze/kernel/setup.o:(.text+0x0): first defined here
   microblaze-linux-ld: drivers/of/address.o: in function `pci_mfd_isolated':
   (.text+0x2d4c): multiple definition of `pci_mfd_isolated'; arch/microblaze/kernel/setup.o:(.text+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
