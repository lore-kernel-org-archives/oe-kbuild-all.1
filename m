Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B44415AAA1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714151524; cv=none; b=WQ69+SL8RdwBtUSg17qfJIw6KxBZbGQqTvhl3ybsNOesvyFfiOqhkgHxXhEwBqIAccKC1wunzZZ2N0TcozHEHp3y4ww3KXqLzdEKDfQWOoQX5d9FC7tR6sXVdpQerETeJBc3LdfB4jCkNpaVQvgFOfMPf9n5Sj/TSYHyel0z5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714151524; c=relaxed/simple;
	bh=3Pd/l/+E5Qm5+7Ld6em+fLyRN0LjhCMbADm7ZQPuL/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZR2XZSWOhZoPfuHu3d04oA0tNlL2GrFpVmvDcsXWpBEmZtYiBh1RzpkNHBGSWXRCUH4s2FL71JMiT5+Nb3Cg/hmtxSRCpi50fXw5t8dYX/3YxCuL5cXM7gZa0HB8Hx5/rp2SA4KmXOoD4oJjcxZJC0hYQXQ8UnNZlJv+yYo7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aimx6+oy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aimx6+oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714151523; x=1745687523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Pd/l/+E5Qm5+7Ld6em+fLyRN0LjhCMbADm7ZQPuL/w=;
  b=Aimx6+oyKaGXNgbP6MLWPdeq2SqpHqletsPKK6mX263eVGvtOOhtOg5x
   ppZhHaJCiL7T5huoV7t4wwjH+MNs4ENue8FtPvDMk/43ceNDfYyaLnPWH
   rPO6AXdTW0JOkcSvM1Yxf0DGog57xaj95tx4N2k5/6kvzLcG+NoMJbapU
   bBzMMsp6qguJgWO4eDbha8LiWgF0IN7spNXqm9FHgAOYPbQfrLwEjE8+h
   +1edD8iJ1hCux8O6lMQ5QqNrbrNq4Zid1ykIkPAl0TEFs2DmUl+ksIP1S
   6uLdKd+QunSUEfXk2rltbCaZGJCrCx9juOTL+3vHW2Cs7tVkVEqStLV2u
   Q==;
X-CSE-ConnectionGUID: SoaQDWmiSAGXA07WaZXxYA==
X-CSE-MsgGUID: 4gFqfe3OThO/oFuGBjlTRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="20449275"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="20449275"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 10:12:02 -0700
X-CSE-ConnectionGUID: 7A0i5Nk8R1SFT6S1ocLM+Q==
X-CSE-MsgGUID: YZxipWCARm25Dx49Iw6AIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; 
   d="scan'208";a="25451311"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2024 10:12:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0P77-0003zy-2O;
	Fri, 26 Apr 2024 17:11:57 +0000
Date: Sat, 27 Apr 2024 01:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: drivers/pci/controller/dwc/pcie-designware.c:898:50: error: '%d'
 directive output may be truncated writing between 1 and 11 bytes into a
 region of size 3
Message-ID: <202404270143.m5ItVzEF-lkp@intel.com>
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
head:   c942a0cd3603e34dd2d7237e064d9318cb7f9654
commit: 939fbcd568fd294034c96edc92ff5b9de1a5fce8 PCI: dwc: Add Root Port and Endpoint controller eDMA engine support
date:   1 year, 2 months ago
config: x86_64-sof-customedconfig-bpf-defconfig (https://download.01.org/0day-ci/archive/20240427/202404270143.m5ItVzEF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404270143.m5ItVzEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404270143.m5ItVzEF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/dwc/pcie-designware.c: In function 'dw_pcie_edma_detect':
>> drivers/pci/controller/dwc/pcie-designware.c:898:50: error: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 3 [-Werror=format-truncation=]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                                  ^~
   In function 'dw_pcie_edma_irq_verify',
       inlined from 'dw_pcie_edma_detect' at drivers/pci/controller/dwc/pcie-designware.c:949:8:
   drivers/pci/controller/dwc/pcie-designware.c:898:46: note: directive argument in the range [-2147483648, 15]
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                                              ^~~~~~~
   drivers/pci/controller/dwc/pcie-designware.c:898:17: note: 'snprintf' output between 5 and 15 bytes into a destination of size 6
     898 |                 snprintf(name, sizeof(name), "dma%d", pci->edma.nr_irqs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
