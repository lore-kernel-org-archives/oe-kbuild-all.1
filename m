Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A22D4801
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 17:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759514268; cv=none; b=NycsIbLCLwaWUQav4v3XKRiCeWi75QV2AE3+Wgwyxu0MovcSqHR1Wqxuk8VHeB4z/SKxS9gOJm5McKv6GPEDshjXtzoeIjYFs48l1tWtoOTiT3gg/bdMbZ/jzbTrMF1gYdJ23oReCkukmuS5McKnb7hFX60xOxaaomkSJEc+g98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759514268; c=relaxed/simple;
	bh=SfAWQlorezkBZxxIHUCsLtcHflDB0Sm2Wq9hiH+hCB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rFPqKYEv/NxCUOtC1WCmTmSGKpD5vI/JybUXoN311jX0BS4RGwPaYTIMbOSkghrzvv6JAZZoRWZKZlRDtWuIUwvD7o061CJ3Yz9yDzafehkvU9+hRIuALPt7qKY0esfUJ7nLiTx6X32VlJuXAf0bcPkBiITz4QbQY3RkTnS2/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJjA7BHz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJjA7BHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759514266; x=1791050266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfAWQlorezkBZxxIHUCsLtcHflDB0Sm2Wq9hiH+hCB0=;
  b=RJjA7BHz7r9RJcmISEpeq/kjLu19TpvsfZI9Vm5S5hQXonqQWn20S4Gb
   CheBi+EZFq+aYOdvDcolVeTDLdWSTaoEaXX2Fkxj98+YgMHiwGQYGSPZY
   +YopSBDiwejNZLkKHYzELJd7xOsPlYsqaGQTjEZEpRq8GXP3G7AP3VDNd
   Gji5p3716ofxvLeOAuMuqRG142UVXiG2ZWVJqwu1l8vGn0LK+6N4iqRe9
   wqMggrkSKlmEZEeHySu676OK9HvSkQjsF9cV/AnGLocT4J25OXeiJntnM
   yMLXolJHt83aX1A6SzRSY8x4POMHlcxNE9xU3r/8DsZlXkS7habd58yeh
   A==;
X-CSE-ConnectionGUID: PA/9RgJOSKWeGdkN655Mlg==
X-CSE-MsgGUID: Q/slyCbuTJKvsQJvwAFdDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61509863"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="61509863"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:57:46 -0700
X-CSE-ConnectionGUID: 2nTpPBVITSyMWNh7U2HbnA==
X-CSE-MsgGUID: fbK/03NWSXGaIAhLlvrs5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="178472428"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Oct 2025 10:57:45 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4k2H-0004n9-2M;
	Fri, 03 Oct 2025 17:57:41 +0000
Date: Sat, 4 Oct 2025 01:57:28 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [arm:clearfog 8/13] drivers/pci/pcie/aspm.c:827 pcie_aspm_cap_init()
 warn: inconsistent indenting
Message-ID: <202510040111.atsuGn0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   0c321d2afb01ca78544750d2c840a22f91251682
commit: 0932b03bba229e9456bb547a09ad43275ca8e6fc [8/13] mvebu/clearfog pcie updates
config: i386-randconfig-141-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040111.atsuGn0D-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040111.atsuGn0D-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/aspm.c:827 pcie_aspm_cap_init() warn: inconsistent indenting

vim +827 drivers/pci/pcie/aspm.c

   790	
   791	static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
   792	{
   793		struct pci_dev *child = link->downstream, *parent = link->pdev;
   794		u32 parent_lnkcap, child_lnkcap;
   795		u16 parent_lnkctl, child_lnkctl;
   796		struct pci_bus *linkbus = parent->subordinate;
   797	
   798		if (blacklist) {
   799			/* Set enabled/disable so that we will disable ASPM later */
   800			link->aspm_enabled = PCIE_LINK_STATE_ASPM_ALL;
   801			link->aspm_disable = PCIE_LINK_STATE_ASPM_ALL;
   802			return;
   803		}
   804	
   805		/*
   806		 * If ASPM not supported, don't mess with the clocks and link,
   807		 * bail out now.
   808		 */
   809		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   810		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   811		if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
   812			return;
   813	
   814		/* Configure common clock before checking latencies */
   815		pcie_aspm_configure_common_clock(link);
   816	
   817		/*
   818		 * Re-read upstream/downstream components' register state after
   819		 * clock configuration.  L0s & L1 exit latencies in the otherwise
   820		 * read-only Link Capabilities may change depending on common clock
   821		 * configuration (PCIe r5.0, sec 7.5.3.6).
   822		 */
   823		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   824		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   825		pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
   826		pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 > 827	dev_info(&parent->dev, "up support %x enabled %x\n",
   828		 (parent_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   829		 !!(parent_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   830	dev_info(&parent->dev, "dn support %x enabled %x\n",
   831		 (child_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   832		 !!(child_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   833	
   834		/* Disable L0s/L1 before updating L1SS config */
   835		if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
   836		    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
   837			pcie_capability_write_word(child, PCI_EXP_LNKCTL,
   838						   child_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
   839			pcie_capability_write_word(parent, PCI_EXP_LNKCTL,
   840						   parent_lnkctl & ~PCI_EXP_LNKCTL_ASPMC);
   841		}
   842	
   843		/*
   844		 * Setup L0s state
   845		 *
   846		 * Note that we must not enable L0s in either direction on a
   847		 * given link unless components on both sides of the link each
   848		 * support L0s.
   849		 */
   850		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
   851			link->aspm_support |= PCIE_LINK_STATE_L0S;
   852	
   853		if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   854			link->aspm_enabled |= PCIE_LINK_STATE_L0S_UP;
   855		if (parent_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   856			link->aspm_enabled |= PCIE_LINK_STATE_L0S_DW;
   857	
   858		/* Setup L1 state */
   859		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
   860			link->aspm_support |= PCIE_LINK_STATE_L1;
   861	
   862		if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
   863			link->aspm_enabled |= PCIE_LINK_STATE_L1;
   864	
   865		aspm_l1ss_init(link);
   866	
   867		/* Restore L0s/L1 if they were enabled */
   868		if (FIELD_GET(PCI_EXP_LNKCTL_ASPMC, child_lnkctl) ||
   869		    FIELD_GET(PCI_EXP_LNKCTL_ASPMC, parent_lnkctl)) {
   870			pcie_capability_write_word(parent, PCI_EXP_LNKCTL, parent_lnkctl);
   871			pcie_capability_write_word(child, PCI_EXP_LNKCTL, child_lnkctl);
   872		}
   873	
   874		/* Save default state */
   875		link->aspm_default = link->aspm_enabled;
   876	
   877		/* Setup initial capable state. Will be updated later */
   878		link->aspm_capable = link->aspm_support;
   879	
   880		/* Get and check endpoint acceptable latencies */
   881		list_for_each_entry(child, &linkbus->devices, bus_list) {
   882			if (pci_pcie_type(child) != PCI_EXP_TYPE_ENDPOINT &&
   883			    pci_pcie_type(child) != PCI_EXP_TYPE_LEG_END)
   884				continue;
   885	
   886			pcie_aspm_check_latency(child);
   887		}
   888	}
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
