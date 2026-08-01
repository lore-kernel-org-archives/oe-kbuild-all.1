Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10A51DA0E1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 20:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615723; cv=none; b=HG3cDlrsGa+NouYng319JPg+TC7hD0NNtCPAWzTHQscjzoNj2MraNAXCWjIt/Nozyt1c4d39qzuw5rPGNX21Ufv6PX4qplSlUhpnhXL6/1DaVAoKyZvpwrT4BiiUnNVN8CIGQQcXkW3Dlp2aQP6/Sj0KCb8LkCVx2BhB3fPMQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615723; c=relaxed/simple;
	bh=jaJ5FpjqCdSglK7sU5nnv0z3g9Q/3DAlihcbChRkiSk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQHGu3GHExP18pGE1d7X57ehg4PAAnS8u6UmDBqFMQ41xkD4SHlhcy0f2BtVOy2GZkMEdkFxa3hNj1T2JJCo3p7A7a8Xhgb1+zlE+3h/p0C385GPDurPKPDUJBo0rnYM6t4cHkzVCWNYs/SQqPMFxMXgEpLa6FNliqKYzjoiWcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUhGK7H5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUhGK7H5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785615722; x=1817151722;
  h=date:from:to:cc:subject:message-id;
  bh=jaJ5FpjqCdSglK7sU5nnv0z3g9Q/3DAlihcbChRkiSk=;
  b=IUhGK7H5pUp64HaZ0itZAOf/30Ch61V0YPn/Q4mTwNiTB6qy63OYJB9v
   cRgUk6iWz9qkInEdz7bI+vlZ70s3rx9n+47WS4moqXPAEH6RDnHfLMJ/L
   MLWaYCF3JoLQtQ2A7BxtUHgfyzyiT3jmvWO3jYXiQ4cPNjnzpMfJDc89w
   E83hSCVD0d5vAkKor7Ny8KJTxgzS6hQDn6FntvzlfNVlko6vZ8q0RT8Gq
   FiHJ+z5pj7aMBBHvS5jGTYA8tWnRgOlsYG3VrHYLLDhtCdtGeZI+FqhxV
   CyqXyt475tTrPJ3opxyYNV4y5kIAK7iPHVGal8mr7MIu9th+Lxvk+f0xM
   A==;
X-CSE-ConnectionGUID: CoQKJhjHSReKSpHfZSfRZg==
X-CSE-MsgGUID: bXN7/25QTdSBdCBUzD/TXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="88741914"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="88741914"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 13:22:01 -0700
X-CSE-ConnectionGUID: 4UBrrqhnRtGgZOfAe9dhug==
X-CSE-MsgGUID: 3e4yWtzLQNmgO+nVMDirkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="284232194"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2026 13:22:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqGDV-000000003rV-364Y;
	Sat, 01 Aug 2026 20:21:57 +0000
Date: Sun, 02 Aug 2026 04:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 356/700]
 drivers/net/ethernet/cadence/macb_main.c:4708:12: warning: 'msc313_init'
 defined but not used
Message-ID: <202608020455.QLUczTAO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 3eff6bbbe433f0cb27875c6395a2db83a68744f0 [356/700] macb: don't rely on u-boot to fix the rx descriptors
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020455.QLUczTAO-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020455.QLUczTAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020455.QLUczTAO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:4708:12: warning: 'msc313_init' defined but not used [-Wunused-function]
    4708 | static int msc313_init(struct platform_device *pdev)
         |            ^~~~~~~~~~~


vim +/msc313_init +4708 drivers/net/ethernet/cadence/macb_main.c

  4707	
> 4708	static int msc313_init(struct platform_device *pdev)
  4709	{
  4710		struct net_device *dev = platform_get_drvdata(pdev);
  4711		struct macb *bp = netdev_priv(dev);
  4712		struct device_node *phy_node = of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
  4713	
  4714		/** Note to self: Check if the julian registers are visible over XIU on msc313 */
  4715	
  4716		/*
  4717		 * This switches to "software rx descriptors".
  4718		 * Without this rx doesn't work like this driver
  4719		 * thinks it should work and the controller
  4720		 * corrupts the memory. So a must have.
  4721		 */
  4722		macb_writel(bp, MSC313_13A, 0x100);
  4723		macb_writel(bp, MSC313_JULIAN_104, 1);
  4724	
  4725		/*
  4726		 * We need a few magic numbers to get the PHY to work.
  4727		 * Most versions of these chips have an integrated PHY,
  4728		 * some have one interface with an integrated PHY and RMII
  4729		 * external, some only have RMII. There are various magic
  4730		 * numbers in the vendor code for this.
  4731		 */
  4732		if (!phy_node)
  4733			goto no_phy;
  4734	
  4735		if (of_property_read_bool(phy_node, "phy-is-integrated")) {
  4736			/* noop for now */
  4737		}
  4738		else {
  4739			/* valid for the ssd20xd */
  4740			macb_writel(bp, MSC313_JULIAN_100, 0xf017);
  4741		}
  4742	
  4743		of_node_put(phy_node);
  4744	
  4745	no_phy:
  4746		return at91ether_init(pdev);
  4747	}
  4748	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
