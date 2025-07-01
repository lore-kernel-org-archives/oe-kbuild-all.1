Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A120326E6F1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365333; cv=none; b=EvnsGWBT+ZYOx9GBifoxDTmgEhgihNaFJkj32pby/ANPCPM4TGoX6NHzi0uepE+v++Y7BasPIOHTmFw3ZvUJjoW65+PbTYy2sQMoPo8boaoko61x2cSVxJfOBn2w7IXiZozHLyLuPib4kBpK/CP8EheBYHxukqI9FXwISoj9abk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365333; c=relaxed/simple;
	bh=tEzzifPZoW7kQ3MfUGhPe/Mj4AtGYyy0K52V2WWDGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bGgh38SeBpj2Ao2eFNmtPh4p8Aqg6x8oVt+zywV3yC3B7H7ejwviNxZE8ks8AfP8zaICkFeJymqdnEjyHZW2Vnrqwnckm4RrujbclIDftH0mhrM9b8Bm43OYRjidFti4tG/K8IrcHAH/fQC44p2XyfxMNpgG86YqxAB0wlau9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLM95neh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLM95neh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751365331; x=1782901331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEzzifPZoW7kQ3MfUGhPe/Mj4AtGYyy0K52V2WWDGfk=;
  b=BLM95nehk+xbhq2ewFEFmV/NOjNnciHi8tsuguK89J0qs8rezfnkkzHA
   NlqXC/drNt8t8fFy0Cf9U9FAzgO9kgX4sFdZdBCq/9SvbiYbfsNY/XiSG
   yaEYp9GG1f80EN46Xb0a7O7cRC9Q2fZjRa/vaPDdovrVp3Z9T/aUdRqPy
   vzUGojBKr+NiSDVPP02OptnXQ8dyKNlND5a+cEVjFuKUrjjt1pfU8S2ah
   DMjNMUUyRLUuFO18n6cy8v6lCwM5h8MMGb4DRlRD0HNKQ+jp9EjoL6uxe
   Rf1Rqvt6bPR7CthqtVfydFN51FkeEO8CHtl/HZzxSjKYilxTo73Iiujre
   Q==;
X-CSE-ConnectionGUID: 0STm+eoBRCyVvl+hD4fPPw==
X-CSE-MsgGUID: EDAW8PkFRF2lFAfDvY7a6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64976181"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64976181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:22:11 -0700
X-CSE-ConnectionGUID: p25gm577SvK6F5lH5aVSaw==
X-CSE-MsgGUID: XTdLYcORSM2h2R7ct4iamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153205228"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 01 Jul 2025 03:22:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWY7r-000a0k-0S;
	Tue, 01 Jul 2025 10:22:07 +0000
Date: Tue, 1 Jul 2025 18:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 2/12] include/linux/pci.h:2067:28:
 warning: control reaches end of non-void function
Message-ID: <202507011852.9neWn3a6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   44fc32b44e9100467bc59704d09b5aca075ccb06
commit: 1ef9f1a958f948a7ed5a60048c5fc668838007d7 [2/12] PCI: Add pci_bus_isolation()
config: riscv-randconfig-002-20250701 (https://download.01.org/0day-ci/archive/20250701/202507011852.9neWn3a6-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011852.9neWn3a6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011852.9neWn3a6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/iommu.c:24:
   include/linux/pci.h:2066:24: warning: no previous prototype for 'pci_bus_isolated' [-Wmissing-prototypes]
    2066 | enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
         |                        ^~~~~~~~~~~~~~~~
   include/linux/pci.h: In function 'pci_bus_isolated':
   include/linux/pci.h:2067:10: error: 'PCI_NON_ISOLATED' undeclared (first use in this function); did you mean 'PCIE_NON_ISOLATED'?
    2067 | { return PCI_NON_ISOLATED; }
         |          ^~~~~~~~~~~~~~~~
         |          PCIE_NON_ISOLATED
   include/linux/pci.h:2067:10: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/pci.h:2067:28: warning: control reaches end of non-void function [-Wreturn-type]
    2067 | { return PCI_NON_ISOLATED; }
         |                            ^


vim +2067 include/linux/pci.h

  2065	
> 2066	enum pci_bus_isolation pci_bus_isolated(struct pci_bus *bus)
> 2067	{ return PCI_NON_ISOLATED; }
  2068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
