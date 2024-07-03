Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5224C6C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 20:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720036926; cv=none; b=Zva89ymVo6/nXBcayPP3vrTrlN04zgLkVLOSmxcAd3vwNOKNgJZ7XF7iShBvVGLG39kZ7GwKXHiR3D4SPg6OJIUYgg/knWX2cQpQB7V25cZdaP+SZB6XPl/QD4nAODhvYL4Q9Z4PggqY6KY8TzuoOPeg2Jqz5zDai9O67BhCdSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720036926; c=relaxed/simple;
	bh=n3c4q2RJlw1lfg/kbM57aUaMTmsuagk0nh9KfUErUmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPotRenXrWPvgypQIg/eimadjUkwqQrPe0/wODzi5LXh7bRdStGPRa4SKwBFZrqkptL+TbDtcmcHo73shMcL4eFJuQ1McLzT62IEkrdhQsZnfGEwyGgv6zt4hfU+TkDGgwEM4LAmnnzkzOluuBsKTalSzM/SFBOzQOkFJepHZcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBu5inl6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBu5inl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720036924; x=1751572924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n3c4q2RJlw1lfg/kbM57aUaMTmsuagk0nh9KfUErUmw=;
  b=OBu5inl6bSKL2q1+YqAvoKnBfRKoPWPrOHtXO7Am+x95dBSZdUsuyeQy
   OzPpWg44yqJLvwDuQJHWFwWTImzsx8SzbFjgGimVjugEYxvK3sOLDpxND
   xV6v4Zw8BhtCTmjzlw/lVjsFpIXHeWxKV7rp/ydLAItOFAhdyKhBjEZ6M
   3MFgdXmYmCr2cZOs9nCnmgp9z9cvDrtqgzr4CLv/yoVuspAabRX14cIjz
   I4I9I0D3Yj5obZqR8tfsmCa3SEZoNF0IVTDrcINu7qTLCeNKmtTl/+k+G
   aJ60DJcpUgbE3aJ82BHv4Q+pIRxZS4m1gxFx8Lk7r2S0raeN8S3SbK54i
   A==;
X-CSE-ConnectionGUID: dozS76ImQmGuMt4lOf09pQ==
X-CSE-MsgGUID: qYTAh+32SEWmMwNQn011jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28684749"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="28684749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 13:02:04 -0700
X-CSE-ConnectionGUID: WWgjk1xmQwuR8aZPtGm5iw==
X-CSE-MsgGUID: aqCH0XsJQny4cbH7FjtJqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46242536"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2024 13:02:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP6Ay-000QBy-1v;
	Wed, 03 Jul 2024 20:02:00 +0000
Date: Thu, 4 Jul 2024 04:01:42 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/2] PCI: microchip: rework reg region handing to
 support using either instance 1 or 2
Message-ID: <202407040339.i1nFFozS-lkp@intel.com>
References: <20240701-charger-recognize-fd8a65026a89@spud>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-charger-recognize-fd8a65026a89@spud>

Hi Conor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on robh/for-next linus/master v6.10-rc6]
[cannot apply to pci/next next-20240703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/dt-bindings-PCI-microchip-pcie-host-fix-reg-properties/20240701-183154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20240701-charger-recognize-fd8a65026a89%40spud
patch subject: [PATCH v3 2/2] PCI: microchip: rework reg region handing to support using either instance 1 or 2
config: x86_64-randconfig-102-20240703 (https://download.01.org/0day-ci/archive/20240704/202407040339.i1nFFozS-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040339.i1nFFozS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-microchip-host.c:1142:5-11: inconsistent IS_ERR and PTR_ERR on line 1143.

vim +1142 drivers/pci/controller/pcie-microchip-host.c

  1118	
  1119	static int mc_host_probe(struct platform_device *pdev)
  1120	{
  1121		struct device *dev = &pdev->dev;
  1122		void __iomem *apb_base_addr;
  1123		int ret;
  1124		u32 val;
  1125	
  1126		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
  1127		if (!port)
  1128			return -ENOMEM;
  1129	
  1130		port->dev = dev;
  1131	
  1132		port->bridge_base_addr = devm_platform_ioremap_resource_byname(pdev, "bridge");
  1133		port->ctrl_base_addr = devm_platform_ioremap_resource_byname(pdev, "ctrl");
  1134		if(!IS_ERR(port->bridge_base_addr) && !IS_ERR(port->ctrl_base_addr))
  1135			goto addrs_set;
  1136	
  1137		/*
  1138		 * The original, incorrect, binding that lumped the control and
  1139		 * bridge addresses together still needs to be handled by the driver.
  1140		 */
  1141		apb_base_addr = devm_platform_ioremap_resource_byname(pdev, "apb");
> 1142		if (IS_ERR(apb_base_addr))
> 1143			return dev_err_probe(dev, PTR_ERR(port->bridge_base_addr),
  1144					     "both legacy apb register and ctrl/bridge regions missing");
  1145	
  1146		port->bridge_base_addr = apb_base_addr + MC_PCIE1_BRIDGE_ADDR;
  1147		port->ctrl_base_addr = apb_base_addr + MC_PCIE1_CTRL_ADDR;
  1148	
  1149	addrs_set:
  1150		mc_disable_interrupts(port);
  1151	
  1152		/* Allow enabling MSI by disabling MSI-X */
  1153		val = readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
  1154		val &= ~MSIX_CAP_MASK;
  1155		writel(val, port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
  1156	
  1157		/* Pick num vectors from bitfile programmed onto FPGA fabric */
  1158		val = readl(port->bridge_base_addr + PCIE_PCI_IRQ_DW0);
  1159		val &= NUM_MSI_MSGS_MASK;
  1160		val >>= NUM_MSI_MSGS_SHIFT;
  1161	
  1162		port->msi.num_vectors = 1 << val;
  1163	
  1164		/* Pick vector address from design */
  1165		port->msi.vector_phy = readl_relaxed(port->bridge_base_addr + IMSI_ADDR);
  1166	
  1167		ret = mc_pcie_init_clks(dev);
  1168		if (ret) {
  1169			dev_err(dev, "failed to get clock resources, error %d\n", ret);
  1170			return -ENODEV;
  1171		}
  1172	
  1173		return pci_host_common_probe(pdev);
  1174	}
  1175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
