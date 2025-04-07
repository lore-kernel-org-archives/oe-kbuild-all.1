Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC912B73
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 00:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743986903; cv=none; b=LEWpuME6cnQFIEQZp+b3ETxn7TwjsqqmGCMRNElafgL1k5ZskKtthqxjY7pW4KgiB/V5tF/HNYJUHiuE3ROb8IfyPncauN0SkSBY01ty2ZsQr2u7k7HCs0HZqO0vp0LO7lCKGMfG/LmPFpQlKUb+vxh27qOErFMJEg2nCcLTi4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743986903; c=relaxed/simple;
	bh=NXuckBu6WODvQCy/k8MRPBxYflDffXpR51npIy8v0ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QI3M4AveKdPnLBAdCTqyyIAIwiykR+8oT95Zd1BbDz+aKc25y++PtmL4+OJX3vbtvGSf4Zy31Q0KGwp8Elc0Pru4Ot7xpdVvR+FmfMAm4JSZWA200I8S2XBste+rL68FFr4yYwCWjmtirFEwzagtOHJnPlPatSMziaupnSc1SFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkbDjL18; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkbDjL18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743986902; x=1775522902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXuckBu6WODvQCy/k8MRPBxYflDffXpR51npIy8v0ig=;
  b=OkbDjL18k3xwFDlnCU4U66/WpDBlZbZTkn9C4sMIoIzFz6lBXw433hG4
   25p72r66RElSOtRI3BRMX09LRnD9o1Ac67deHXYmLtxi1sYfLyjCFkm0x
   C3sEr0ISkldtApnL6OTO+kOBncZ0CpwjFJoQJ3/1jjlXFV0iWEx94bJs0
   vUvqu6+Td+lI275I6VQOf5XPq7zpeb243YRysaMBd11bGSa6UJT6fYL8q
   6fuYbvYuQtUF7oRJPmy7/Qwo9FhhRy7L0PhF5G9g3G5AArtSa1lODVm+c
   Gc3D8YZYPltX+CmJE+Bf7K9M001FNrChVKhDvRDOmsIrDWiNfL9hvwdE+
   A==;
X-CSE-ConnectionGUID: NahgX0E4TxK6n1Akmph0Aw==
X-CSE-MsgGUID: mWyqEWfmQ2euO66QzpoYlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56718437"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="56718437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 17:48:21 -0700
X-CSE-ConnectionGUID: eiSU1sO1Rgi7qb1gDdCQTw==
X-CSE-MsgGUID: 7FPYLrQnSHeyj0H4DAoraA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127637407"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2025 17:48:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1aev-0002qn-1k;
	Mon, 07 Apr 2025 00:48:17 +0000
Date: Mon, 7 Apr 2025 08:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: Raju Rangoju <Raju.Rangoju@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	Akshata MukundShetty <akshata.mukundshetty@amd.com>
Subject: [broonie-ci:fileH5Eyqu 4/4] drivers/spi/spi-amd-pci.c:67:1: warning:
 parameter names (without types) in function declaration
Message-ID: <202504070813.jYHyeYYe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileH5Eyqu
head:   b644c2776652671256edcd7a8e71161e212b59ac
commit: b644c2776652671256edcd7a8e71161e212b59ac [4/4] spi: spi_amd: Add PCI-based driver for AMD HID2 SPI controller
config: x86_64-buildonly-randconfig-006-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070813.jYHyeYYe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504070813.jYHyeYYe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504070813.jYHyeYYe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-amd-pci.c:67:1: warning: data definition has no type or storage class
      67 | module_pci_driver(amd_spi_pci_driver);
         | ^~~~~~~~~~~~~~~~~
   drivers/spi/spi-amd-pci.c:67:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
>> drivers/spi/spi-amd-pci.c:67:1: warning: parameter names (without types) in function declaration
   drivers/spi/spi-amd-pci.c:61:26: warning: 'amd_spi_pci_driver' defined but not used [-Wunused-variable]
      61 | static struct pci_driver amd_spi_pci_driver = {
         |                          ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +67 drivers/spi/spi-amd-pci.c

    66	
  > 67	module_pci_driver(amd_spi_pci_driver);
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
