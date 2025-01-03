Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20159475
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735874220; cv=none; b=W/vcGuy0yV3Ad+k53WtSZFHN2EfE7B88xiI/uqR0GgX+87SGiKIjxVcyavlkg2eaW4FkbCt7C7t06Da/bJXy+m5MAHKZo+u5JoFaXgaaYHroo2ZEVDqzOwJHJsZKQdN1ZQhdpyv6yeoMaJEHcPexXYOjFFZXbd1e+Olx6buBtKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735874220; c=relaxed/simple;
	bh=7MtLCuDVFmDrxv8imNg8BzGGAzlESufbSRqPDW1SBec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RnK1Yu1G3QTQIMOKI37neagwyUspTonS3fhzzlA7SeSxaW5D/PxvAsZmJoWpd83xJ08+yUExxlXVKahFMcgINZqdN5KTIqbkOmU+NDV+feLP9qD+VZ3FH1gjIoN5091hTtjJ7R3WBKenCFi1TKHYywPdoJZKZZiczC2U7SYZSsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5YYgcvF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5YYgcvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735874218; x=1767410218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7MtLCuDVFmDrxv8imNg8BzGGAzlESufbSRqPDW1SBec=;
  b=B5YYgcvFxr6JxRrtvwn/pkHkxFjUBre3a9MZYppSoO4rPqpGZOa6OWOd
   olL5KinSM0XTTRdJENlsVBnKLwEed/E/zYVx+XSHhbh9vrItPuRhShJTf
   B349vblGNciiU+id8WMhUEz61WkYeFt/40KVJ1Mg+sQ/gim0t+vERdNJt
   k2Wpl1C85lAlp4ISqB4RsmseNWhgrAj7D84b0aipiUn6T9jTtjhm9N8rv
   KNji5toCW4FlGVEWbe4A+mZgnf1uspt28fIyZrK92GmSBKSMlTcah0v5d
   nmHZPIIeK72XcakiaPmUgk5LNJyl4m2J38MWsoGCA3j6fzt2QPil5iTHQ
   Q==;
X-CSE-ConnectionGUID: WI9vgTJUTqigir1a3BpIGQ==
X-CSE-MsgGUID: Cxo0tDVET+6VK2yiPxApDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36284072"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36284072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 19:16:57 -0800
X-CSE-ConnectionGUID: gpn1OvKjTpaiLtctIzdJ5A==
X-CSE-MsgGUID: /Xtt8vwGQnOCbSL4htukCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="102152076"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2025 19:16:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTYBB-00098V-1y;
	Fri, 03 Jan 2025 03:16:53 +0000
Date: Fri, 3 Jan 2025 11:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: drivers/pci/controller/dwc/pcie-designware.c:898:50: warning: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 3
Message-ID: <202501031131.5HTYcxyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Serge,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 939fbcd568fd294034c96edc92ff5b9de1a5fce8 PCI: dwc: Add Root Port and Endpoint controller eDMA engine support
date:   1 year, 10 months ago
config: csky-randconfig-r001-20230826 (https://download.01.org/0day-ci/archive/20250103/202501031131.5HTYcxyd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031131.5HTYcxyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031131.5HTYcxyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-designware.c: In function 'dw_pcie_edma_detect':
>> drivers/pci/controller/dwc/pcie-designware.c:898:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Wformat-truncation=]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                                  ^~
   In function 'dw_pcie_edma_irq_verify',
       inlined from 'dw_pcie_edma_detect' at drivers/pci/controller/dwc/pcie-designware.c:949:8:
   drivers/pci/controller/dwc/pcie-designware.c:898:46: note: directive argument in the range [-2147483648, 29]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                              ^~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:898:17: note: 'snprintf' output between 5 and 15 bytes into a destination of size 6
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +898 drivers/pci/controller/dwc/pcie-designware.c

   878	
   879	static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
   880	{
   881		struct platform_device *pdev = to_platform_device(pci->dev);
   882		u16 ch_cnt = pci->edma.ll_wr_cnt + pci->edma.ll_rd_cnt;
   883		char name[6];
   884		int ret;
   885	
   886		if (pci->edma.nr_irqs == 1)
   887			return 0;
   888		else if (pci->edma.nr_irqs > 1)
   889			return pci->edma.nr_irqs != ch_cnt ? -EINVAL : 0;
   890	
   891		ret = platform_get_irq_byname_optional(pdev, "dma");
   892		if (ret > 0) {
   893			pci->edma.nr_irqs = 1;
   894			return 0;
   895		}
   896	
   897		for (; pci->edma.nr_irqs < ch_cnt; pci->edma.nr_irqs++) {
 > 898			snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
   899	
   900			ret = platform_get_irq_byname_optional(pdev, name);
   901			if (ret <= 0)
   902				return -EINVAL;
   903		}
   904	
   905		return 0;
   906	}
   907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
