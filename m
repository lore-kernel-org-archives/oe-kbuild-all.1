Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3602A257B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 08:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685779349; x=1717315349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVKarGov8q2U0gWAAcxdzDlSG0I6xxQ7SdjNs4w0UB8=;
  b=EYJXF6g6S4ld/OgZS2FOTf1dzJA4q42Av6N5azWGT2YHXWhLr8Kgv8Ew
   QeDhiutsZ96+QjkuvLoKWpaIroGbUTv6VrpCc8G9Rd6MOza0iKXhg2V0e
   wMiomnEAaBLbfzRgPhF7hLpDjvWPJJY0MNeSSdcj5Gy4P2WjwjRMJ8pRC
   Rq6tIDsXFPQX2hI7IxBpJaqkWoGwMvZno3i6I52UDhJ6oPtKWp4RDklXV
   uGQLMVZr12CRf8eBJvbyvvB9YE8SkQOEJWi+mCK6A/G/7o0zGwBBASNNe
   Ch3yn0T6j9gO0Wx5KNn7a3DFbt3Mqza4LKN5mVhmJtGKZ1pdao67mABz8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354899163"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="354899163"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 01:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773159943"
X-IronPort-AV: E=Sophos;i="6.00,215,1681196400"; 
   d="scan'208";a="773159943"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Jun 2023 01:02:26 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5MDR-0001RF-32;
	Sat, 03 Jun 2023 08:02:25 +0000
Date: Sat, 3 Jun 2023 16:01:52 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [rmk-arm:clearfog 9/10] drivers/pci/pcie/aspm.c:659
 pcie_aspm_cap_init() warn: inconsistent indenting
Message-ID: <202306031545.K0AqjpsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   ceea2a6f65a7d6cfbae2dba4645a9c6a3ce6b83c
commit: a9d80d9d2d464413fb9794dfd857b179f3681ca2 [9/10] mvebu/clearfog pcie updates
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230603/202306031545.K0AqjpsU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306031545.K0AqjpsU-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/aspm.c:659 pcie_aspm_cap_init() warn: inconsistent indenting

vim +659 drivers/pci/pcie/aspm.c

   622	
   623	static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
   624	{
   625		struct pci_dev *child = link->downstream, *parent = link->pdev;
   626		u32 parent_lnkcap, child_lnkcap;
   627		u16 parent_lnkctl, child_lnkctl;
   628		struct pci_bus *linkbus = parent->subordinate;
   629	
   630		if (blacklist) {
   631			/* Set enabled/disable so that we will disable ASPM later */
   632			link->aspm_enabled = ASPM_STATE_ALL;
   633			link->aspm_disable = ASPM_STATE_ALL;
   634			return;
   635		}
   636	
   637		/*
   638		 * If ASPM not supported, don't mess with the clocks and link,
   639		 * bail out now.
   640		 */
   641		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   642		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   643		if (!(parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPMS))
   644			return;
   645	
   646		/* Configure common clock before checking latencies */
   647		pcie_aspm_configure_common_clock(link);
   648	
   649		/*
   650		 * Re-read upstream/downstream components' register state after
   651		 * clock configuration.  L0s & L1 exit latencies in the otherwise
   652		 * read-only Link Capabilities may change depending on common clock
   653		 * configuration (PCIe r5.0, sec 7.5.3.6).
   654		 */
   655		pcie_capability_read_dword(parent, PCI_EXP_LNKCAP, &parent_lnkcap);
   656		pcie_capability_read_dword(child, PCI_EXP_LNKCAP, &child_lnkcap);
   657		pcie_capability_read_word(parent, PCI_EXP_LNKCTL, &parent_lnkctl);
   658		pcie_capability_read_word(child, PCI_EXP_LNKCTL, &child_lnkctl);
 > 659	dev_info(&parent->dev, "up support %x enabled %x\n",
   660		 (parent_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   661		 !!(parent_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   662	dev_info(&parent->dev, "dn support %x enabled %x\n",
   663		 (child_lnkcap & PCI_EXP_LNKCAP_ASPMS) >> 10,
   664		 !!(child_lnkctl & PCI_EXP_LNKCTL_ASPMC));
   665	
   666		/*
   667		 * Setup L0s state
   668		 *
   669		 * Note that we must not enable L0s in either direction on a
   670		 * given link unless components on both sides of the link each
   671		 * support L0s.
   672		 */
   673		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
   674			link->aspm_support |= ASPM_STATE_L0S;
   675	
   676		if (child_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   677			link->aspm_enabled |= ASPM_STATE_L0S_UP;
   678		if (parent_lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
   679			link->aspm_enabled |= ASPM_STATE_L0S_DW;
   680	
   681		/* Setup L1 state */
   682		if (parent_lnkcap & child_lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
   683			link->aspm_support |= ASPM_STATE_L1;
   684	
   685		if (parent_lnkctl & child_lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
   686			link->aspm_enabled |= ASPM_STATE_L1;
   687	
   688		aspm_l1ss_init(link);
   689	
   690		/* Save default state */
   691		link->aspm_default = link->aspm_enabled;
   692	
   693		/* Setup initial capable state. Will be updated later */
   694		link->aspm_capable = link->aspm_support;
   695	
   696		/* Get and check endpoint acceptable latencies */
   697		list_for_each_entry(child, &linkbus->devices, bus_list) {
   698			if (pci_pcie_type(child) != PCI_EXP_TYPE_ENDPOINT &&
   699			    pci_pcie_type(child) != PCI_EXP_TYPE_LEG_END)
   700				continue;
   701	
   702			pcie_aspm_check_latency(child);
   703		}
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
