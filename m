Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637C1F1302
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 01:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765933526; cv=none; b=IVMgwuyCNw5eZDXAnZXqE1FU51TzLzAsxkUjb2UvZkzh1kmgqwIVgLTrBu5UV8YNFpJ/o7OrkpEc5r8/88kvnP57J5Z40unw5pBxqHipcsptCkSYIU7+n3BAEUJ6ZespzH8xF99B6kQci/61njBsHIJR3X2cIOtr1DAAOFarMns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765933526; c=relaxed/simple;
	bh=QcGL5BhRVAmpND/vzlscrXB3c7QDtsi6ecNVFVrTvfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKGUAUlAUEQhKdT2B4taO93J5KfJnepB/ckuOL1LXgb9ICWsA27VItbJTUDfFoQLqT3sWXCFzdegluMoZ3XKkiFiCg2O5re28Y3YbQdozjzN4dSjFJF8xbq27fEtK083nOONic729KY+lam0SCcvthQ57WPX8y87XvEeEF2UhAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ilyv2j7I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ilyv2j7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765933524; x=1797469524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QcGL5BhRVAmpND/vzlscrXB3c7QDtsi6ecNVFVrTvfk=;
  b=Ilyv2j7IGJlzRKrcpNZ98LYCAczat4lhpN9ansYCuOJ1lp/MD4RcEEMm
   bkSHQfAqlcxwaF8Duj45hxZE9EVf0knq2kdcNQQN4Of+RiU6KU7oeCtyI
   JrLt07yEQHacjDLrraYdC6hXED4Ee+xf+wJEguungv2KHnzkqQ0Y9x7Fc
   s0zLIFpnmgLmwN/IKs4axJPJDuYyldlcjaMsnjfrV7KMGLDG98QR85V3w
   vaoTQ9DLLDBsqaEPM/F0uhNkX3Xs/9csBZjv+8IcbQJN/5KA1NjF6TpPn
   aNOp8IpYlcdlu14fkrKIMg5BBeRVkdpvwPdTndZ8IBSANf7xk3Q4dQOYA
   Q==;
X-CSE-ConnectionGUID: nlU0VlOaTriI+e9JyWI8oQ==
X-CSE-MsgGUID: eIugZO8yRE+uk3SZBU5aBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67933056"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="67933056"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 17:05:23 -0800
X-CSE-ConnectionGUID: aeGKo+cyRGyr59FGIHonlQ==
X-CSE-MsgGUID: 6j1HxGlNQQGPpdUyNcEn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198964334"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 17:05:22 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVfyg-000000003zM-2zo2;
	Wed, 17 Dec 2025 01:05:18 +0000
Date: Wed, 17 Dec 2025 09:04:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:985:16: sparse: sparse: symbol
 'vpci_ops' was not declared. Should it be static?
Message-ID: <202512170846.hiYG3NE0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [2/2] PCI: endpoint: Support NTB transfer between RC and EP
config: arm64-randconfig-r113-20251217 (https://download.01.org/0day-ci/archive/20251217/202512170846.hiYG3NE0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170846.hiYG3NE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170846.hiYG3NE0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mw_addr @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     expected void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     got void *
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     got void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using plain integer as NULL pointer
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:985:16: sparse: sparse: symbol 'vpci_ops' was not declared. Should it be static?
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse:     got struct epf_ntb_ctrl *reg

vim +/vpci_ops +985 drivers/pci/endpoint/functions/pci-epf-vntb.c

   984	
 > 985	struct pci_ops vpci_ops = {
   986		.read = pci_read,
   987		.write = pci_write,
   988	};
   989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
