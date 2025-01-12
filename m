Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A57F1B415D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jan 2025 11:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736681933; cv=none; b=rtF0mQEWZp1R7I+ycOMpakbHI8dGT74sritE6z7Bdyko7l6ZmzNPQFOfrCzcVQhX2ljvF5whgXZSaeQ4om5wRiL73gcjHgUXLDmJBYEJ6b1NIMNvWEqn2HdClspTzI6ZBZLGDqChOgg5FT4YzX+5KB+hRe9VEsGtKTyvUcbRSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736681933; c=relaxed/simple;
	bh=wBcfjJfTNhYqS6DSAyc4Tlmg52oXNOFPdlNcWOb+WeE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOrBvJndPInv7/Dt7sNfBmN9I31IjoRtBSFJrlO1UbeF0I0F31ByqYvdKb2LNRgeOpPOPnkvoyeGGP8GYosZQgmVU8lL1XMsZ0NyPeil9GKu5r/bGrFSeYJ9cEGUlxgYMT+I1vZ9oPwmG4EGSjlvTnwuQDPv97FuLlqJl0fTGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PVXhYFh9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PVXhYFh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736681930; x=1768217930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBcfjJfTNhYqS6DSAyc4Tlmg52oXNOFPdlNcWOb+WeE=;
  b=PVXhYFh9W+RBztllv5kM2T9EyWgaRsNN8SfndG4VWDmBk4HauMJpmliy
   6zkCF5VVAEfe4FAxZvFiGsDgD/xRfGRw84Uv14UYGJQJIwD7MizXQb5a/
   1iBXgMYsEHdKFtWyN4ScMTfWjJIZu5QqlobSNPqPzR20Gh+5QCOt/7h1f
   C2VxSP5jD00lyB84fmkRuYHJHU71cguquOXzmEj8rzzCOfo6gUmSInJG8
   Bcpd8SVZEdDMzM4RTqL4UsQUhVr+8bVBJtRB62a6gjLnm2OZxBLfcuCrl
   w2fO6fZowcB9FQ5KdgHuSED2VVkrwscVUWpr8az1KJVJqklmsDnikJ2D/
   g==;
X-CSE-ConnectionGUID: FiVOJNLrRZCooo2ysKhRsA==
X-CSE-MsgGUID: lwBpbbKXSGi5JDy94fFi/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="47493448"
X-IronPort-AV: E=Sophos;i="6.12,309,1728975600"; 
   d="scan'208";a="47493448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 03:38:49 -0800
X-CSE-ConnectionGUID: aMi+IAVZQGaAh5ttQq12tw==
X-CSE-MsgGUID: u7iGIyK7RsmUYwW31hQCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141460188"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jan 2025 03:38:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWwIn-000Lqh-15;
	Sun, 12 Jan 2025 11:38:45 +0000
Date: Sun, 12 Jan 2025 19:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: drivers/pci/controller/pcie-mediatek.c:929:43: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 6
Message-ID: <202501121916.nUmT0i3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b62cef9a5c673f1b8083159f5dc03c1c5daced2f
commit: 77216702c8f6288f948ee230772b4612b835c5d6 PCI: mediatek: Use PCI domain to handle ports detection
date:   3 years, 5 months ago
config: arm-randconfig-004-20250102 (https://download.01.org/0day-ci/archive/20250112/202501121916.nUmT0i3M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121916.nUmT0i3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121916.nUmT0i3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from drivers/pci/controller/pcie-mediatek.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1341:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1341 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1327:27: note: 'mem_section' declared here
    1327 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c: In function 'mtk_pcie_parse_port':
>> drivers/pci/controller/pcie-mediatek.c:929:43: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
     929 |         snprintf(name, sizeof(name), "port%d", slot);
         |                                           ^~
   drivers/pci/controller/pcie-mediatek.c:929:38: note: directive argument in the range [0, 2147483647]
     929 |         snprintf(name, sizeof(name), "port%d", slot);
         |                                      ^~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:929:9: note: 'snprintf' output between 6 and 15 bytes into a destination of size 10
     929 |         snprintf(name, sizeof(name), "port%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:936:45: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     936 |         snprintf(name, sizeof(name), "sys_ck%d", slot);
         |                                             ^~
   drivers/pci/controller/pcie-mediatek.c:936:38: note: directive argument in the range [0, 2147483647]
     936 |         snprintf(name, sizeof(name), "sys_ck%d", slot);
         |                                      ^~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:936:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 10
     936 |         snprintf(name, sizeof(name), "sys_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:944:45: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     944 |         snprintf(name, sizeof(name), "ahb_ck%d", slot);
         |                                             ^~
   drivers/pci/controller/pcie-mediatek.c:944:38: note: directive argument in the range [0, 2147483647]
     944 |         snprintf(name, sizeof(name), "ahb_ck%d", slot);
         |                                      ^~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:944:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 10
     944 |         snprintf(name, sizeof(name), "ahb_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:949:45: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     949 |         snprintf(name, sizeof(name), "axi_ck%d", slot);
         |                                             ^~
   drivers/pci/controller/pcie-mediatek.c:949:38: note: directive argument in the range [0, 2147483647]
     949 |         snprintf(name, sizeof(name), "axi_ck%d", slot);
         |                                      ^~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:949:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 10
     949 |         snprintf(name, sizeof(name), "axi_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:954:45: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
     954 |         snprintf(name, sizeof(name), "aux_ck%d", slot);
         |                                             ^~
   drivers/pci/controller/pcie-mediatek.c:954:38: note: directive argument in the range [0, 2147483647]
     954 |         snprintf(name, sizeof(name), "aux_ck%d", slot);
         |                                      ^~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:954:9: note: 'snprintf' output between 8 and 17 bytes into a destination of size 10
     954 |         snprintf(name, sizeof(name), "aux_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:959:46: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
     959 |         snprintf(name, sizeof(name), "obff_ck%d", slot);
         |                                              ^~
   drivers/pci/controller/pcie-mediatek.c:959:38: note: directive argument in the range [0, 2147483647]
     959 |         snprintf(name, sizeof(name), "obff_ck%d", slot);
         |                                      ^~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:959:9: note: 'snprintf' output between 9 and 18 bytes into a destination of size 10
     959 |         snprintf(name, sizeof(name), "obff_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:964:46: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
     964 |         snprintf(name, sizeof(name), "pipe_ck%d", slot);
         |                                              ^~
   drivers/pci/controller/pcie-mediatek.c:964:38: note: directive argument in the range [0, 2147483647]
     964 |         snprintf(name, sizeof(name), "pipe_ck%d", slot);
         |                                      ^~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:964:9: note: 'snprintf' output between 9 and 18 bytes into a destination of size 10
     964 |         snprintf(name, sizeof(name), "pipe_ck%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:969:47: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     969 |         snprintf(name, sizeof(name), "pcie-rst%d", slot);
         |                                               ^~
   drivers/pci/controller/pcie-mediatek.c:969:38: note: directive argument in the range [0, 2147483647]
     969 |         snprintf(name, sizeof(name), "pcie-rst%d", slot);
         |                                      ^~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:969:9: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     969 |         snprintf(name, sizeof(name), "pcie-rst%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:975:47: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
     975 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                               ^~
   drivers/pci/controller/pcie-mediatek.c:975:38: note: directive argument in the range [0, 2147483647]
     975 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |                                      ^~~~~~~~~~~~
   drivers/pci/controller/pcie-mediatek.c:975:9: note: 'snprintf' output between 10 and 19 bytes into a destination of size 10
     975 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +929 drivers/pci/controller/pcie-mediatek.c

637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  914  
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  915  static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  916  			       struct device_node *node,
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  917  			       int slot)
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  918  {
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  919  	struct mtk_pcie_port *port;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  920  	struct device *dev = pcie->dev;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  921  	struct platform_device *pdev = to_platform_device(dev);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  922  	char name[10];
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  923  	int err;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  924  
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  925  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  926  	if (!port)
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  927  		return -ENOMEM;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  928  
1eacd7b84e0413f drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10 @929  	snprintf(name, sizeof(name), "port%d", slot);
e2dcd20b1645a72 drivers/pci/controller/pcie-mediatek.c Dejin Zheng   2020-06-03  930  	port->base = devm_platform_ioremap_resource_byname(pdev, name);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  931  	if (IS_ERR(port->base)) {
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  932  		dev_err(dev, "failed to map port%d base\n", slot);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  933  		return PTR_ERR(port->base);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  934  	}
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  935  
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  936  	snprintf(name, sizeof(name), "sys_ck%d", slot);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  937  	port->sys_ck = devm_clk_get(dev, name);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  938  	if (IS_ERR(port->sys_ck)) {
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  939  		dev_err(dev, "failed to get sys_ck%d clock\n", slot);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  940  		return PTR_ERR(port->sys_ck);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  941  	}
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  942  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  943  	/* sys_ck might be divided into the following parts in some chips */
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  944  	snprintf(name, sizeof(name), "ahb_ck%d", slot);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  945  	port->ahb_ck = devm_clk_get_optional(dev, name);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  946  	if (IS_ERR(port->ahb_ck))
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  947  		return PTR_ERR(port->ahb_ck);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  948  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  949  	snprintf(name, sizeof(name), "axi_ck%d", slot);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  950  	port->axi_ck = devm_clk_get_optional(dev, name);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  951  	if (IS_ERR(port->axi_ck))
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  952  		return PTR_ERR(port->axi_ck);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  953  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  954  	snprintf(name, sizeof(name), "aux_ck%d", slot);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  955  	port->aux_ck = devm_clk_get_optional(dev, name);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  956  	if (IS_ERR(port->aux_ck))
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  957  		return PTR_ERR(port->aux_ck);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  958  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  959  	snprintf(name, sizeof(name), "obff_ck%d", slot);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  960  	port->obff_ck = devm_clk_get_optional(dev, name);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  961  	if (IS_ERR(port->obff_ck))
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  962  		return PTR_ERR(port->obff_ck);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  963  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  964  	snprintf(name, sizeof(name), "pipe_ck%d", slot);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  965  	port->pipe_ck = devm_clk_get_optional(dev, name);
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  966  	if (IS_ERR(port->pipe_ck))
6be22343cc546b4 drivers/pci/controller/pcie-mediatek.c Chunfeng Yun  2019-04-10  967  		return PTR_ERR(port->pipe_ck);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  968  
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  969  	snprintf(name, sizeof(name), "pcie-rst%d", slot);
608fcac7ce31b96 drivers/pci/host/pcie-mediatek.c       Philipp Zabel 2017-07-19  970  	port->reset = devm_reset_control_get_optional_exclusive(dev, name);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  971  	if (PTR_ERR(port->reset) == -EPROBE_DEFER)
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  972  		return PTR_ERR(port->reset);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  973  
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  974  	/* some platforms may use default PHY setting */
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  975  	snprintf(name, sizeof(name), "pcie-phy%d", slot);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  976  	port->phy = devm_phy_optional_get(dev, name);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  977  	if (IS_ERR(port->phy))
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  978  		return PTR_ERR(port->phy);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  979  
4f6f0460448d572 drivers/pci/host/pcie-mediatek.c       Honghui Zhang 2017-08-10  980  	port->slot = slot;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  981  	port->pcie = pcie;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  982  
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  983  	if (pcie->soc->setup_irq) {
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  984  		err = pcie->soc->setup_irq(port, node);
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  985  		if (err)
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  986  			return err;
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  987  	}
b099631df160ec6 drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-08-10  988  
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  989  	INIT_LIST_HEAD(&port->list);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  990  	list_add_tail(&port->list, &pcie->ports);
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  991  
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  992  	return 0;
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  993  }
637cfacae96fa6d drivers/pci/host/pcie-mediatek.c       Ryder Lee     2017-05-21  994  

:::::: The code at line 929 was first introduced by commit
:::::: 1eacd7b84e0413f55fbc0c61874f745cc5e2ed9e PCI: mediatek: Switch to use platform_get_resource_byname()

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
