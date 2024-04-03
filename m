Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15A3C2D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 04:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712118249; cv=none; b=uS5et+/SjNSC9PnRgtUUtnNf/CRp9awokxeXCdXr2ECFjuFN/6ticnNPo/xAcYfowMMvF6pyL1gNzhLSmOK47HeV/g+BJcoIwnmaL+0OhPzjlRYHuG59XCT8qpK3GNk7T4Z7zkwt1GBG0r2R2ZdGE3Afw3MPcLYbuFzbRvkIcqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712118249; c=relaxed/simple;
	bh=uIsdVP7yKziJJFX2ZZcky0eS9rIlLp1aewrNmTTM6DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTxTN8FQyVX7PbzpnuAdOCCtz3Jbc0blPyMK0k/Dxdcxor+oFmwdFGIqQUhn1hnvvqPQtbBwhd/sbApF3k8gvAcXnsTlRnUnRu20q8Xj+W+V31SLjji3KU0+kZYD7XIG1k3zYiYuk+mF56NhDMx91n5Nws0LnWatgk4Xej1m7+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvKbAygo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvKbAygo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712118248; x=1743654248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uIsdVP7yKziJJFX2ZZcky0eS9rIlLp1aewrNmTTM6DM=;
  b=lvKbAygoF8yt97K70Y09BauqO8qbn2wJ9QqsVjCbvSL97SVHOI+FgQb4
   BOQenlO1PTqHW22zieawE65WB4/mj6KNR1LqO1PIusu56sbrS/wmfBYc4
   7nopW6hzgMB/oBu5bTYWD0fEHZfezJrFWlHYa++AqBFvDNpe0h9SWN/1t
   TNCSoq/JzZtPutbXg22ur7hajFF09mPW1ACgG7iObMkvE+RQT3DsVkfEv
   0Pu4YCZ5L3c3frvOk+2Xf6MD0zpmq87gZk+BHL3F5SXzhkAWo1+fujNOb
   Y7yO6Vdy8csLhIOxcFtEhVDXaH5EQ2O3vw7yrYDbl2IWhXGcAoz2wgYBk
   w==;
X-CSE-ConnectionGUID: CXDwZR5XTiqbViyQ0BAMOQ==
X-CSE-MsgGUID: 4BCXzK43T/2/osuAEjqn1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="32720225"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="32720225"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 21:24:07 -0700
X-CSE-ConnectionGUID: Ud+jEfykSFK466PxRdSRew==
X-CSE-MsgGUID: xgCcR9p8Qke1q5Q84Jvztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="49521432"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2024 21:24:06 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrsAO-0001qX-01;
	Wed, 03 Apr 2024 04:24:04 +0000
Date: Wed, 3 Apr 2024 12:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and-v4 41/51] drivers/pci/controller/pcie-apple.c:686:8:
 error: call to undeclared function '__find_and_set_bit'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202404031258.fwH2xHpn-lkp@intel.com>
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
config: arm64-randconfig-002-20240403 (https://download.01.org/0day-ci/archive/20240403/202404031258.fwH2xHpn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404031258.fwH2xHpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404031258.fwH2xHpn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pcie-apple.c:686:8: error: call to undeclared function '__find_and_set_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     686 |         idx = __find_and_set_bit(port->sid_map, port->sid_map_sz);
         |               ^
   1 error generated.


vim +/__find_and_set_bit +686 drivers/pci/controller/pcie-apple.c

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
