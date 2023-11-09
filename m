Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE04199D3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MymrTp0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699529326; x=1731065326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YQvMi/O74anoUv487vbijeAP355MD6u35CzJ23q3wnw=;
  b=MymrTp0CcgoJMrlCZPsy3bqNCte+gELcdkAdcGvfczQfgHGl6Dn0W7zS
   V5GZVmwTbBc3zw2Jk/gNwJI1EghjYCEpEmT9ccXzj/N94eThRZ5xrpMWm
   NwKbcNm1eYHJj0njNaRWNQauPGqhL0dpthTHoouDrrAkLcs8ijcaXg/cG
   f3HS3hi8NF7EuXNKPVDnrmdyfQ8l3LFt+zv1hnSuO4p7wdge/YTFknQ3O
   HgZpLY7gQrv3Gyj6g05GkNQoLmaySTpD7uAtRgU2XfGFFo0OV0ytxpKfw
   ZRkOhfukj7092Br5yx63E8FxbeyewAOxHLjj40KJ2YC38uj17rgwJoA6N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="476198448"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="476198448"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 03:28:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010604924"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="1010604924"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Nov 2023 03:28:44 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r13DG-0008gi-0v;
	Thu, 09 Nov 2023 11:28:42 +0000
Date: Thu, 9 Nov 2023 19:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Achal Verma <a-verma1@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/17]
 drivers/pci/controller/cadence/pci-j721e-host.c:137:17: sparse: sparse:
 symbol 'j721e_pcie_irq_chip' was not declared. Should it be static?
Message-ID: <202311091952.DDPkQa3P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   ceda18519f490d1e82d84c1edd84782b1ad34c79
commit: 0cc7dd00c998242b68e5ffe1d630f2198a4385db [11/17] PCI: j721e: Add PCI legacy interrupt support for J7200
config: x86_64-randconfig-r111-20231103 (https://download.01.org/0day-ci/archive/20231109/202311091952.DDPkQa3P-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091952.DDPkQa3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091952.DDPkQa3P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/cadence/pci-j721e-host.c:137:17: sparse: sparse: symbol 'j721e_pcie_irq_chip' was not declared. Should it be static?

vim +/j721e_pcie_irq_chip +137 drivers/pci/controller/cadence/pci-j721e-host.c

   136	
 > 137	struct irq_chip j721e_pcie_irq_chip = {
   138		.name		= "J721E-PCIE-INTX",
   139		.irq_eoi	= j721e_pcie_irq_eoi,
   140	};
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
