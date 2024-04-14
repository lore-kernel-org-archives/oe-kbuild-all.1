Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AA14AA0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Apr 2024 03:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713066873; cv=none; b=ggko24qmQ3T8iX7CRQ9UhFXwqKEZK0HdLeZOZ/+e9FCts1taERG/47qTOEgrOTWAT8pZ7tFhKnUO5r4CT6a3oss7E0ftLoe28s6RSf3zlCqTzcoFh4E8vyCZEpVKrqjTWXzzxzfCkjOSeislE7aRMEUVHgTPs8wJ5yHZAV2UU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713066873; c=relaxed/simple;
	bh=Hfaiy+RvfKkADRnVITEKGsEaQ7RcRr5cl67jB1gJFPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qP6qFW0tW5hqCqwXcGVW2+P/MGC5ZRx4QQ4SnLGaFQWxB+ZEFozIkEE5c0PpB9kRNigaq7oEC0NUKRlLVoU7FWO3xa8d5v22vInkBnkzJmcB9T+mr+XIBgfJ7JKJsohwAVYXsY0TtB018Bj9sYIvcoxAusTzqH/6b081EZZKfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbr49TA3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbr49TA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713066872; x=1744602872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hfaiy+RvfKkADRnVITEKGsEaQ7RcRr5cl67jB1gJFPc=;
  b=nbr49TA3HGprv1kSlHkw7kTsqKV+3trh6fX3JQM9O68l+CMBxUhruZJn
   FsmCoKnQnVPfrNokgbJj8QplVBiJyszaK+8VkFzq93RltTbiGDfz9Jwm3
   VBTh1N4CQidmCP2Vf/XEsTgGWJ/1usjTom/Iw3iNaf019JaTxqj96wQdd
   MOXtraga60pZUlSMJsfMwUUUdsBG66cPRm4Cr9zVJnLOkMsVyPAMk4MK1
   xS7T+2Y+P16/vJo7znrR8ovMNiPu12XLrDGKlLKGSbPT1P2t5b/U5sWA8
   Mk+5i18zGaXeoPMDjTILNUbu5ji4W5u8V3r4aRh5dNnWHV+9+q6nxiRVY
   w==;
X-CSE-ConnectionGUID: Z00sk3NWS/SNXb/QpO5+jA==
X-CSE-MsgGUID: eklKu2lySYKTxEsD2lLxqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="19626833"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="19626833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 20:54:32 -0700
X-CSE-ConnectionGUID: BI0rJHVqT7ukXBucsffWJA==
X-CSE-MsgGUID: seKH26o+Tcid/kfvodwwkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="26139094"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2024 20:54:30 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvqwl-0003Ge-2e;
	Sun, 14 Apr 2024 03:54:27 +0000
Date: Sun, 14 Apr 2024 11:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1242:undefined reference to
 `ntb_register_device'
Message-ID: <202404141100.XkGZmEJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   cdfd0a7f01396303e9d4fb3513a1127636f12e5e
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: i386-randconfig-054-20240414 (https://download.01.org/0day-ci/archive/20240414/202404141100.XkGZmEJ1-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141100.XkGZmEJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404141100.XkGZmEJ1-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `pci_vntb_probe':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1242:(.text+0x14c1): undefined reference to `ntb_register_device'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_cmd_handler':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:261:(.text+0x1553): undefined reference to `ntb_db_event'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_link_up':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:173:(.text+0x15e0): undefined reference to `ntb_link_event'
>> ld: drivers/pci/endpoint/functions/pci-epf-vntb.c:173:(.text+0x1690): undefined reference to `ntb_link_event'


vim +1242 drivers/pci/endpoint/functions/pci-epf-vntb.c

  1225	
  1226	static int pci_vntb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  1227	{
  1228		int ret;
  1229		struct epf_ntb *ndev = (struct epf_ntb *)pdev->sysdata;
  1230		struct device *dev = &pdev->dev;
  1231	
  1232		ndev->ntb.pdev = pdev;
  1233		ndev->ntb.topo = NTB_TOPO_NONE;
  1234		ndev->ntb.ops =  &vntb_epf_ops;
  1235	
  1236		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
  1237		if (ret) {
  1238			dev_err(dev, "Cannot set DMA mask\n");
  1239			return -EINVAL;
  1240		}
  1241	
> 1242		ret = ntb_register_device(&ndev->ntb);
  1243		if (ret) {
  1244			dev_err(dev, "Failed to register NTB device\n");
  1245			goto err_register_dev;
  1246		}
  1247	
  1248		dev_dbg(dev, "PCI Virtual NTB driver loaded\n");
  1249		return 0;
  1250	
  1251	err_register_dev:
  1252		return -EINVAL;
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
