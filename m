Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD82186F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WX0Jye66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697875319; x=1729411319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osltQ9lUDrCTb843+0LhpqeDqVSGW6t/fS04T6hWCgw=;
  b=WX0Jye663tJ4HJZ2Ack6WF3TmMf5f6G4/77VRf5Ijs2HvAulZ2J7iwfd
   q3Ao6jRhiWozjY7N2LUC9opvnqTnijUg7jdQclkql44ciMOxN6kBlNwmC
   YdJGGdPG0QHl5sQxbNR/ZGLj/nxyYPyR185WRR+FOx7K2U3a7lRj3x76m
   GZsUbYZbp9CWmOdmLNF6i/tSK8/7zweJ/34iWkCONobr+kYPpXTtMZSo2
   /F11GHm1FR0oM6TJIYoOgDRke2t0qPypTjf3MXuMnwTVPIGKblCtKzcVX
   bN/+aK3b62qWOHrYG6Lh8t61lFKRvyubPI9UNmb37rEATQpv1O/0dCPSV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453095808"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="453095808"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 01:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="707440677"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="707440677"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Oct 2023 01:01:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu6vi-0004b0-2n;
	Sat, 21 Oct 2023 08:01:54 +0000
Date: Sat, 21 Oct 2023 16:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:clearfog 8/14] drivers/pci/pcie/aspm.c:624 pcie_aspm_cap_init()
 warn: inconsistent indenting
Message-ID: <202310211548.HPWDuq57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   38d8521ad3b341d839cd6d581811a1d35c0554f1
commit: b7b2c89d530fa5bff1fe6c3c1466f7b21c1f2b51 [8/14] mvebu/clearfog pcie updates
config: x86_64-randconfig-161-20231021 (https://download.01.org/0day-ci/archive/20231021/202310211548.HPWDuq57-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310211548.HPWDuq57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310211548.HPWDuq57-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/aspm.c:624 pcie_aspm_cap_init() warn: inconsistent indenting

vim +624 drivers/pci/pcie/aspm.c

   587	
   588	static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
   589	{
   590		struct pci_dev *child = link->downstream, *parent = link->pdev;
   591		u32 parent_lnkcap, child_lnkcap;
   592		u16 parent_lnkctl, child_lnkctl;
   593		struct pci_bus *linkbus = parent->subordinate;
   594	
   595		if (blacklist) {
   596			/* Set enabled/disable so that we will disable ASPM later */
   597			link->aspm_enabled = ASPM_STATE_ALL;
   598			link->aspm_disable = ASPM_STATE_ALL;
   599			return;
   600		}
   601	
   602		/*
   603		 * If ASPM not supported, don't mess with the clocks and link,
   604		 * bail out now.
   605		 */
   606		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   607		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   608		if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
   609			return;
   610	
   611		/* Configure common clock before checking latencies */
   612		pcie_aspm_configure_common_clock(link);
   613	
   614		/*
   615		 * Re-read upstream/downstream components' register state after
   616		 * clock configuration.  L0s & L1 exit latencies in the otherwise
   617		 * read-only Link Capabilities may change depending on common clock
   618		 * configuration (PCIe r5.0, sec 7.5.3.6).
   619		 */
   620		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   621		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   622		pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
   623		pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 > 624	dev_info(&parent->dev, "up support %x enabled %x\n",
   625		 (parent_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   626		 !!(parent_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   627	dev_info(&parent->dev, "dn support %x enabled %x\n",
   628		 (child_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   629		 !!(child_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   630	
   631		/*
   632		 * Setup L0s state
   633		 *
   634		 * Note that we must not enable L0s in either direction on a
   635		 * given link unless components on both sides of the link each
   636		 * support L0s.
   637		 */
   638		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
   639			link->aspm_support |= ASPM_STATE_L0S;
   640	
   641		if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   642			link->aspm_enabled |= ASPM_STATE_L0S_UP;
   643		if (parent_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   644			link->aspm_enabled |= ASPM_STATE_L0S_DW;
   645	
   646		/* Setup L1 state */
   647		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
   648			link->aspm_support |= ASPM_STATE_L1;
   649	
   650		if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
   651			link->aspm_enabled |= ASPM_STATE_L1;
   652	
   653		aspm_l1ss_init(link);
   654	
   655		/* Save default state */
   656		link->aspm_default = link->aspm_enabled;
   657	
   658		/* Setup initial capable state. Will be updated later */
   659		link->aspm_capable = link->aspm_support;
   660	
   661		/* Get and check endpoint acceptable latencies */
   662		list_for_each_entry(child, &linkbus->devices, bus_list) {
   663			if (pci_pcie_type(child) != PCI_EXP_TYPE_ENDPOINT &&
   664			    pci_pcie_type(child) != PCI_EXP_TYPE_LEG_END)
   665				continue;
   666	
   667			pcie_aspm_check_latency(child);
   668		}
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
