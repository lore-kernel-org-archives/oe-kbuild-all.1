Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D5179A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 01:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740445222; cv=none; b=Gu8gXq6BYjiHpk4FgXw2+4kEuzwscCv1GrJ92cOFJbQhwB9elX+ipK8C8WiVwlKuM4u0sLMHMrD9oh9OQhP9z5XFjMwdLnkKEXq0RwrUJ6PlAY1PRV8qWPtT0V7ov3m1PabvKti2jAaEyMFIN6bTzO65Vv6Ftz/tso7jgvBGYWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740445222; c=relaxed/simple;
	bh=xNARkDKkdVhuyUA5X32vbZ1vIQdTg1DjrS0HB1PapUc=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hpz0X7hA0cHRc7DO1mfrHiZr7VrNVZjn1XX0PEwWCJP7Yz5a/kNyuZE7F7WvLzhdjrpBoS7XkjrTwd8u+fwzIp0RMysyfG1ND+KhUWXv1aSqdsYTEWbCHXeP82Cue+H4ZOIb0tQXA4S/PRSRNNSX2czKJFnnFvVksKHgCCp8j8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqZBUswt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqZBUswt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740445221; x=1771981221;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xNARkDKkdVhuyUA5X32vbZ1vIQdTg1DjrS0HB1PapUc=;
  b=nqZBUswtSbx8Bs0MBSK4UD9APu+KakJttJBpZH1v/uB1Tsaqt7bQKJD0
   AnjvZbOxuEzIaHkIUrNkDS2O4tK71NG2X9EwCXNhjyz0pW78V+6EQSSPH
   iuXuRbTDmZdWKYtJM4/pKB17FO8/0+XkVDGN5jqYnqkK1LxYD2R5hpbev
   ddN9f9+9BDyvql/kyq+xsIl7Ecrmai7oLjlgH2th04ejidN6+hmShIoaz
   00qBG7JXlXpYlGUqNz6xlvmesYc9T52Bu34ylMjwbC7MoQpI4d4H2GZ6p
   twi9MugAQpHKWfr+GF2Mr07fbkG5z2OxpggHNsYXsX0yKwFgynmFwoCn9
   A==;
X-CSE-ConnectionGUID: OSfCgn2xQMOC7ld79w7o/Q==
X-CSE-MsgGUID: k4dMXhIESuyZrQdv+Ee9mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52657460"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52657460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 17:00:20 -0800
X-CSE-ConnectionGUID: UxOYg4DSS/m9wXldotkprA==
X-CSE-MsgGUID: yr7EBkXgTkKZz6XyZNQoGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116032066"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2025 17:00:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmjIr-0009XH-19
	for oe-kbuild-all@lists.linux.dev;
	Tue, 25 Feb 2025 01:00:05 +0000
Date: Tue, 25 Feb 2025 08:59:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] drivers/pci/host/pcie-mediatek.c:305:42:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <202502250833.EToiEb3H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 637cfacae96fa6d4166866a7fd2f97af681e6e0d [1/1] PCI: mediatek: Add MediaTek PCIe host controller support
config: arm-randconfig-003-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250833.EToiEb3H-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250833.EToiEb3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250833.EToiEb3H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/host/pcie-mediatek.c: In function 'mtk_pcie_setup':
>> drivers/pci/host/pcie-mediatek.c:305:42: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     snprintf(name, sizeof(name), "pcie-rst%d", index);
                                             ^
   drivers/pci/host/pcie-mediatek.c:305:2: note: 'snprintf' output between 10 and 11 bytes into a destination of size 10
     snprintf(name, sizeof(name), "pcie-rst%d", index);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/host/pcie-mediatek.c:311:42: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     snprintf(name, sizeof(name), "pcie-phy%d", index);
                                             ^
   drivers/pci/host/pcie-mediatek.c:311:2: note: 'snprintf' output between 10 and 11 bytes into a destination of size 10
     snprintf(name, sizeof(name), "pcie-phy%d", index);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +305 drivers/pci/host/pcie-mediatek.c

   269	
   270	static int mtk_pcie_parse_ports(struct mtk_pcie *pcie,
   271					struct device_node *node,
   272					int index)
   273	{
   274		struct mtk_pcie_port *port;
   275		struct resource *regs;
   276		struct device *dev = pcie->dev;
   277		struct platform_device *pdev = to_platform_device(dev);
   278		char name[10];
   279		int err;
   280	
   281		port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
   282		if (!port)
   283			return -ENOMEM;
   284	
   285		err = of_property_read_u32(node, "num-lanes", &port->lane);
   286		if (err) {
   287			dev_err(dev, "missing num-lanes property\n");
   288			return err;
   289		}
   290	
   291		regs = platform_get_resource(pdev, IORESOURCE_MEM, index + 1);
   292		port->base = devm_ioremap_resource(dev, regs);
   293		if (IS_ERR(port->base)) {
   294			dev_err(dev, "failed to map port%d base\n", index);
   295			return PTR_ERR(port->base);
   296		}
   297	
   298		snprintf(name, sizeof(name), "sys_ck%d", index);
   299		port->sys_ck = devm_clk_get(dev, name);
   300		if (IS_ERR(port->sys_ck)) {
   301			dev_err(dev, "failed to get port%d clock\n", index);
   302			return PTR_ERR(port->sys_ck);
   303		}
   304	
 > 305		snprintf(name, sizeof(name), "pcie-rst%d", index);
   306		port->reset = devm_reset_control_get_optional(dev, name);
   307		if (PTR_ERR(port->reset) == -EPROBE_DEFER)
   308			return PTR_ERR(port->reset);
   309	
   310		/* some platforms may use default PHY setting */
   311		snprintf(name, sizeof(name), "pcie-phy%d", index);
   312		port->phy = devm_phy_optional_get(dev, name);
   313		if (IS_ERR(port->phy))
   314			return PTR_ERR(port->phy);
   315	
   316		port->index = index;
   317		port->pcie = pcie;
   318	
   319		INIT_LIST_HEAD(&port->list);
   320		list_add_tail(&port->list, &pcie->ports);
   321	
   322		return 0;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
