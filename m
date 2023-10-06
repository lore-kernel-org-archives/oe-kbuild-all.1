Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BD161
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 00:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciy4gI0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696550800; x=1728086800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1s8xYikj0kJm8K/rGntYN5Yu17XURK+P4qBKwtvOPYQ=;
  b=ciy4gI0edLitDeaUKuWWKFILgC38B0bq513DnXtEKBahh8LBRTV7ByxQ
   xQmrRNDXnysegdnkn3YgrHuj6gFTxcJNpBFKep+7QUhJBUw6wg+DjVpan
   bSEd809QmwVhRyKhrAvxELSIH9ctsR6bBDzb9llYZQUl7vA6Jd76hAONE
   MMu+o0XYchhEaQlKpMh2nXiqfrp+4pbZzkryu5dH+eBxI7MaSpP+CKkEV
   QJMT4tEILVSq2Ml9i2baWzirKhtBBZ5e9R9x4MHvKLkHsN/R1GKWhnhGx
   7ylWJ6b89F/tokiv997exWsCJ16sVRlhd2zTFYVeUre+3nIEAGAnU+5MR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363007016"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363007016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 17:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="822313920"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="822313920"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2023 17:06:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoYM4-000M2i-0h;
	Fri, 06 Oct 2023 00:06:09 +0000
Date: Fri, 6 Oct 2023 08:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [pci:pm 2/2] arch/x86/pci/fixup.c:929:13: error:
 'pm_suspend_target_state' undeclared
Message-ID: <202310060800.WKT8C7A4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git pm
head:   624306d2c241c274e498619cabc2ae1dc7112ad1
commit: 624306d2c241c274e498619cabc2ae1dc7112ad1 [2/2] x86/PCI: Avoid PME from D3hot/D3cold for AMD Rembrandt and Phoenix USB4
config: i386-buildonly-randconfig-004-20231006 (https://download.01.org/0day-ci/archive/20231006/202310060800.WKT8C7A4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310060800.WKT8C7A4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310060800.WKT8C7A4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/pci/fixup.c: In function 'amd_rp_pme_suspend':
>> arch/x86/pci/fixup.c:929:13: error: 'pm_suspend_target_state' undeclared (first use in this function)
     929 |         if (pm_suspend_target_state == PM_SUSPEND_ON)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/pci/fixup.c:929:13: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/pci/fixup.c:929:40: error: 'PM_SUSPEND_ON' undeclared (first use in this function); did you mean 'RPM_SUSPENDING'?
     929 |         if (pm_suspend_target_state == PM_SUSPEND_ON)
         |                                        ^~~~~~~~~~~~~
         |                                        RPM_SUSPENDING
   arch/x86/pci/fixup.c: In function 'amd_rp_pme_resume':
>> arch/x86/pci/fixup.c:951:27: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     951 |         rp->pme_support = FIELD_GET(PCI_PM_CAP_PME_MASK, pmc);
         |                           ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pm_suspend_target_state +929 arch/x86/pci/fixup.c

   907	
   908	#ifdef CONFIG_SUSPEND
   909	/*
   910	 * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
   911	 * if the SoC is put into a hardware sleep state by the amd-pmc driver, the
   912	 * Root Ports don't generate wakeup interrupts for USB devices.
   913	 *
   914	 * When suspending, remove D3hot and D3cold from the PME_Support advertised
   915	 * by the Root Port so we don't use those states if we're expecting wakeup
   916	 * interrupts.  Restore the advertised PME_Support when resuming.
   917	 */
   918	static void amd_rp_pme_suspend(struct pci_dev *dev)
   919	{
   920		struct pci_dev *rp;
   921	
   922		/*
   923		 * PM_SUSPEND_ON means we're doing runtime suspend, which means
   924		 * amd-pmc will not be involved so PMEs during D3 work as advertised.
   925		 *
   926		 * The PMEs *do* work if amd-pmc doesn't put the SoC in the hardware
   927		 * sleep state, but we assume amd-pmc is always present.
   928		 */
 > 929		if (pm_suspend_target_state == PM_SUSPEND_ON)
   930			return;
   931	
   932		rp = pcie_find_root_port(dev);
   933		if (!rp->pm_cap)
   934			return;
   935	
   936		rp->pme_support &= ~((PCI_PM_CAP_PME_D3hot|PCI_PM_CAP_PME_D3cold) >>
   937					    PCI_PM_CAP_PME_SHIFT);
   938		dev_info_once(&rp->dev, "quirk: disabling D3cold for suspend\n");
   939	}
   940	
   941	static void amd_rp_pme_resume(struct pci_dev *dev)
   942	{
   943		struct pci_dev *rp;
   944		u16 pmc;
   945	
   946		rp = pcie_find_root_port(dev);
   947		if (!rp->pm_cap)
   948			return;
   949	
   950		pci_read_config_word(rp, rp->pm_cap + PCI_PM_PMC, &pmc);
 > 951		rp->pme_support = FIELD_GET(PCI_PM_CAP_PME_MASK, pmc);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
