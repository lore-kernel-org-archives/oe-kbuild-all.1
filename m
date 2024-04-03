Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944E36F083
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712134273; cv=none; b=FO4SHfivG30Lerw97P19brJHZsmnjzgV/wRthy3Tj7oVo6WFf4jYU9TwQJdb7ENTKtbDcG+EdtLjwQkVbUgn0TyKWpGDh3K9TfNq3rUhAQtdvxvOMtr6cPhXI7KqToXkJ46R3omtrL1ZNVHMRQvVNt/0wNBlabKHvfx/cRZu7fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712134273; c=relaxed/simple;
	bh=uZBf6NyJczoaTXE1njEWVHCVlMsvZXMCIe/9/WidGQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UoeIzurZU7yITRfP7u4/O+qxy6h3shFG18FyRSBWuX8lmuG3nVDS2xYdoBUYXWJ/fSCPzykCxwLIjiJtsq+Aj/UJsTIEX6210qxEa59CyovhUQssXNz0QeRiLWYAecCVl45bIgbMKjZ6SGgLTXaQ1iA8Ysv9O5nGQ6YQL4mp56c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4Piml1I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4Piml1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712134272; x=1743670272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZBf6NyJczoaTXE1njEWVHCVlMsvZXMCIe/9/WidGQ0=;
  b=b4Piml1IK3xqdFgSoBhwg1DccrgXVuV/KOpInjBjdUCNggMQCQvFGjz8
   ZD32PfW8jwtgSf4iUpPfhVeQRqoSrKmDzldxhXbucVkmccfSP15hChbmD
   /yPAW8RrO4nsrG8dS1slyP81nI2eVYqeqoJbBgLlQWNqRL46uZZiLm0Xq
   WPYoc0x63GgTeGFfZybEQm5NuF9T1T3MbRTbW/T09yVGBes6x+dlXeiQk
   BTRSvuhBEDwUvIXpjm1304FD3FLVJypXm/F6T9mNK1x7q9Uwv4GDcQxgY
   c8DtCvy4XOnDAoanTFolxr2nu8a+cK1PFkxJVIjHwglTW+9EFulZCC0SJ
   w==;
X-CSE-ConnectionGUID: BQ+cy+uxSra0c4NZ4aiQ5Q==
X-CSE-MsgGUID: XSv0mYWHTkyqxxSKWRmScQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7205112"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7205112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 01:51:11 -0700
X-CSE-ConnectionGUID: p876rVKdQh+pmz15y4x0Fw==
X-CSE-MsgGUID: xaAuMtKIR368gMxXxrO34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="22997477"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Apr 2024 01:51:10 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrwJn-00022v-0p;
	Wed, 03 Apr 2024 08:50:33 +0000
Date: Wed, 3 Apr 2024 16:47:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 41/51]
 drivers/pci/controller/pcie-apple.c:686:15: error: implicit declaration of
 function '__find_and_set_bit'; did you mean '_find_last_bit'?
Message-ID: <202404031604.Cfr0aueZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and-v4
head:   db33a7d65f9e64f900f68e46da4f113fbe6a7faa
commit: 6ea81a413ca9e91c020ae6c0ac60b886ab34b38b [41/51] apple
config: arc-randconfig-002-20240403 (https://download.01.org/0day-ci/archive/20240403/202404031604.Cfr0aueZ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031604.Cfr0aueZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031604.Cfr0aueZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-apple.c: In function 'apple_pcie_add_device':
>> drivers/pci/controller/pcie-apple.c:686:15: error: implicit declaration of function '__find_and_set_bit'; did you mean '_find_last_bit'? [-Werror=implicit-function-declaration]
     686 |         idx = __find_and_set_bit(port->sid_map, port->sid_map_sz);
         |               ^~~~~~~~~~~~~~~~~~
         |               _find_last_bit
   cc1: some warnings being treated as errors


vim +686 drivers/pci/controller/pcie-apple.c

   669	
   670	static int apple_pcie_add_device(struct apple_pcie_port *port,
   671					 struct pci_dev *pdev)
   672	{
   673		u32 sid, rid = pci_dev_id(pdev);
   674		int idx, err;
   675	
   676		dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
   677			pci_name(pdev->bus->self), port->idx);
   678	
   679		err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
   680				"iommu-map-mask", NULL, &sid);
   681		if (err)
   682			return err;
   683	
   684		mutex_lock(&port->pcie->lock);
   685	
 > 686		idx = __find_and_set_bit(port->sid_map, port->sid_map_sz);
   687		if (idx >= port->sid_map_sz) {
   688			mutex_unlock(&port->pcie->lock);
   689			return -ENOSPC;
   690		}
   691	
   692		apple_pcie_rid2sid_write(port, idx,
   693					 PORT_RID2SID_VALID |
   694					 (sid << PORT_RID2SID_SID_SHIFT) | rid);
   695	
   696		dev_dbg(&pdev->dev, "mapping RID%x to SID%x (index %d)\n", rid, sid, idx);
   697	
   698		mutex_unlock(&port->pcie->lock);
   699	
   700		return 0;
   701	}
   702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
