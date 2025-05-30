Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7672820CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640605; cv=none; b=h/4t9o5ft/8MA/axYQOZcS5XRhVT+B8O55Nt1xmAlTK63HZ7iAELCRO1nrQKmi65MIam4/OGthTdT99lxYHQ8gm9vSaCzIzparAZHt+DSIYx5vxyi17d3caE9dBXBeCNpiEtk089mhTAt/C1b/nrjcgWShG/TqPKCsPhb7fAczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640605; c=relaxed/simple;
	bh=RPqPj3an7NqDO+dEe33fvy4XMP57+6OXMI/mJkNu6b4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIxcpWQO/cyb1HmJfwPgelotphk/3VWy1k6VYuYUXrzOdegH0sY2wKdfdG8nagf/Yr6yiKAh9OxWk0OvYhyiG7FffGsUyjtpH8t0uR7fh4UjlkLvnUVsGY+T6pRrqrh5vP9h9QVCdgUeUbMg19p+CNIJ3k0RV593JBHI0IsAGPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRCoYfl0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRCoYfl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748640603; x=1780176603;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RPqPj3an7NqDO+dEe33fvy4XMP57+6OXMI/mJkNu6b4=;
  b=nRCoYfl0qfBy/QDdOn1xoWZsgS6XmNlY9iRrNo/2xOPUM0v/ZCkgkyZn
   ZnD55qOQ7oaU3xLLaHd2h23Fqlhr/1tRm6HwUwYHiCVToST7ypUg4CbHC
   VGxvANQwIPGWO7Irk5E9Zdd+t3odLYlCq56UuUKo4ZNku1kmLygCKw+Yx
   2BEBIyBM8djNY9XDEHSiHQ9o1PgeBDICllBU5/QJQja+fvXduUsPFM/ab
   kIs6JB4Z/LD7gyXZR4jrClvf/UCXcHbKNpZq+2tZCK5UfWOON5cGT4dCp
   3sZ57GpsQPBq45M3+Q2Cr9ttgsXdEGe0F42fJ8BupOIc4boRmoWJC2Tgq
   A==;
X-CSE-ConnectionGUID: awA9eFEITwCG1U7gu0hTZA==
X-CSE-MsgGUID: tcVVW5mQR2K3CwrDHjcMcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="49981064"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="49981064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 14:30:01 -0700
X-CSE-ConnectionGUID: sIY6UoNOT4KYK9qluW5FPw==
X-CSE-MsgGUID: MVRYU/xFQ+i4pIsfSsvOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144450548"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 May 2025 14:29:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL7Ib-000Xyc-0z;
	Fri, 30 May 2025 21:29:57 +0000
Date: Sat, 31 May 2025 05:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Zhang <18255117159@163.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [pci:controller/dw-rockchip 2/3]
 drivers/pci/controller/dwc/pcie-dw-rockchip.c:227:9: error:
 'PCIE_T_PVPERL_MS' undeclared; did you mean 'PCIE_ATU_TYPE_MSG'?
Message-ID: <202505310520.ElO2YbM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Niklas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/dw-rockchip
head:   a47c73d6a884edf2a8b09015596744a495c6a236
commit: 56825f5946a0da29658fa8e768c8706dffdac82b [2/3] PCI: dw-rockchip: Replace PERST# sleep time with proper macro
config: arm-randconfig-003-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310520.ElO2YbM3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310520.ElO2YbM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310520.ElO2YbM3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-dw-rockchip.c: In function 'rockchip_pcie_start_link':
>> drivers/pci/controller/dwc/pcie-dw-rockchip.c:227:9: error: 'PCIE_T_PVPERL_MS' undeclared (first use in this function); did you mean 'PCIE_ATU_TYPE_MSG'?
     msleep(PCIE_T_PVPERL_MS);
            ^~~~~~~~~~~~~~~~
            PCIE_ATU_TYPE_MSG
   drivers/pci/controller/dwc/pcie-dw-rockchip.c:227:9: note: each undeclared identifier is reported only once for each function it appears in


vim +227 drivers/pci/controller/dwc/pcie-dw-rockchip.c

   208	
   209	static int rockchip_pcie_start_link(struct dw_pcie *pci)
   210	{
   211		struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
   212	
   213		/* Reset device */
   214		gpiod_set_value_cansleep(rockchip->rst_gpio, 0);
   215	
   216		rockchip_pcie_enable_ltssm(rockchip);
   217	
   218		/*
   219		 * PCIe requires the refclk to be stable for 100µs prior to releasing
   220		 * PERST. See table 2-4 in section 2.6.2 AC Specifications of the PCI
   221		 * Express Card Electromechanical Specification, 1.1. However, we don't
   222		 * know if the refclk is coming from RC's PHY or external OSC. If it's
   223		 * from RC, so enabling LTSSM is the just right place to release #PERST.
   224		 * We need more extra time as before, rather than setting just
   225		 * 100us as we don't know how long should the device need to reset.
   226		 */
 > 227		msleep(PCIE_T_PVPERL_MS);
   228		gpiod_set_value_cansleep(rockchip->rst_gpio, 1);
   229	
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
