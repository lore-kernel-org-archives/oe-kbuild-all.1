Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72D14B092
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 11:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025615; cv=none; b=f4w80FxJqy4XbNLvAahm7J21s1HvwE9tOOfBptHIpCM4UHfaCep6fWJ1xCvJh++1Is+RJ0UJzuFelbHLyL6kvYhFqlv8bEijtrhbtJcericArAgi0zCwWO1AWtJY/zmMuVixwfttyb1kPPU53RVLTI2edC5MrLH/Pv54w7U2NTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025615; c=relaxed/simple;
	bh=FYxiIEU2VLo1DmEYWG5f8SshPaSF1p4qN6/7e4Pp9g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWhyauSlKo3GVdgqb1TSYvIJippvEen0GFoDvV24i65E1M3u70H0MZyHnkwqKSFZXREF8rjM0hWJBjh9xA27AMn+0SQF9BQIRwPRDM7e8/AIB+thLNFPwcZlHxT/5A2rEfnjNhNxAmuf1epMaNvblDe2bcLmebJudOYuDUbZggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+74kgKS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+74kgKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744025614; x=1775561614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYxiIEU2VLo1DmEYWG5f8SshPaSF1p4qN6/7e4Pp9g0=;
  b=X+74kgKSjN/CJHAjWYJowk0y5JqL2B3lHVEYvOnm+Z22i1b3lobGUSOF
   IzuMCvkj/HL0z3l8hP2+hnxZVT0ivfIOTli/yaRnEEimER9Xig6l7tHwi
   njj9xw28ijeqcW6LbLzTwnLYNtMLLU3rzIn/XEytI7G814oIe5RquWSIa
   D3cr6+tafWENiZmD0myZXW7Fh3aqPvy2L9lJuPGZ49I/TQLH8WWNx0cAd
   W4xWqV83hXBHjp+AbCoPYSWNEmJcZHrsUYHaIT9qAt9MwFP8VQUBnqKBQ
   551SB/ZBZ9BCuOje1TwntziotbhamKj0ewDdA4IuyVYk1mJg2FrVsr0m9
   w==;
X-CSE-ConnectionGUID: hozcz6+9RG6CbjYwas3PeQ==
X-CSE-MsgGUID: q7IQtEhsR/6CzDWfCSHVZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45296082"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45296082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:33:33 -0700
X-CSE-ConnectionGUID: g0Om+OuXQnyGI0ugHpVowg==
X-CSE-MsgGUID: bU/KWGk6QJ2+hseKZqW8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127683950"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 04:33:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1kjF-0003M5-0S;
	Mon, 07 Apr 2025 11:33:25 +0000
Date: Mon, 7 Apr 2025 19:32:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2024-05 0/1]
 drivers/net/ethernet/litex/litex_liteeth.c:247:2-9: line 247 is redundant
 because platform_get_irq() already prints an error
Message-ID: <202504071934.7aQnH1EO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-2024-05
head:   96ddb774d408960590543f104a10aba091d123d6
commit: ee7da21ac4c3be1f618b6358e0a38739a5d1773e [0/1] net: Add driver for LiteX's LiteETH network interface
config: i386-randconfig-052-20250403 (https://download.01.org/0day-ci/archive/20250407/202504071934.7aQnH1EO-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071934.7aQnH1EO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/litex/litex_liteeth.c:247:2-9: line 247 is redundant because platform_get_irq() already prints an error

vim +247 drivers/net/ethernet/litex/litex_liteeth.c

   225	
   226	static int liteeth_probe(struct platform_device *pdev)
   227	{
   228		struct net_device *netdev;
   229		void __iomem *buf_base;
   230		struct resource *res;
   231		struct liteeth *priv;
   232		int irq, err;
   233	
   234		netdev = devm_alloc_etherdev(&pdev->dev, sizeof(*priv));
   235		if (!netdev)
   236			return -ENOMEM;
   237	
   238		SET_NETDEV_DEV(netdev, &pdev->dev);
   239		platform_set_drvdata(pdev, netdev);
   240	
   241		priv = netdev_priv(netdev);
   242		priv->netdev = netdev;
   243		priv->dev = &pdev->dev;
   244	
   245		irq = platform_get_irq(pdev, 0);
   246		if (irq < 0) {
 > 247			dev_err(&pdev->dev, "Failed to get IRQ %d\n", irq);
   248			return irq;
   249		}
   250		netdev->irq = irq;
   251	
   252		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mac");
   253		priv->base = devm_ioremap_resource(&pdev->dev, res);
   254		if (IS_ERR(priv->base))
   255			return PTR_ERR(priv->base);
   256	
   257		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "buffer");
   258		buf_base = devm_ioremap_resource(&pdev->dev, res);
   259		if (IS_ERR(buf_base))
   260			return PTR_ERR(buf_base);
   261	
   262		liteeth_setup_slots(priv);
   263	
   264		/* Rx slots */
   265		priv->rx_base = buf_base;
   266		priv->rx_slot = 0;
   267	
   268		/* Tx slots come after Rx slots */
   269		priv->tx_base = buf_base + priv->num_rx_slots * priv->slot_size;
   270		priv->tx_slot = 0;
   271	
   272		err = of_get_mac_address(pdev->dev.of_node, netdev->dev_addr);
   273		if (err)
   274			eth_hw_addr_random(netdev);
   275	
   276		netdev->netdev_ops = &liteeth_netdev_ops;
   277	
   278		err = register_netdev(netdev);
   279		if (err) {
   280			dev_err(&pdev->dev, "Failed to register netdev %d\n", err);
   281			return err;
   282		}
   283	
   284		netdev_info(netdev, "irq %d slots: tx %d rx %d size %d\n",
   285			    netdev->irq, priv->num_tx_slots, priv->num_rx_slots, priv->slot_size);
   286	
   287		return 0;
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
