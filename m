Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B34DDC1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 02:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737426669; cv=none; b=kKcy9Yaw7kX6PnPR5LWEQWcx9EqFSAVUO3bQqqZQzS5ryv2/3d1oi4y/MViYkjKKHAfDQMGCoWN1RB6EWbKIA9aOR369jcXT0Hqjr7+qWyaUr99GftZuxDhbEno6wcZg4m0+ZskSag9tsUYWPg402KhXN/Yrhc8bfu4u1pdHYCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737426669; c=relaxed/simple;
	bh=cr2LsEX0pLsDOj/Ht53nuZeyvNbW3Qu9HTkdgp+DXws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UN4sCd9ZUJop+BgctxN7SJ87mDRUiQxj+tFKApm5gNc+wrHMOpC4IuQIR1p1H2wzlToakgmy4taNPRPiasSFXib3N1WcWD4w2JZJXRQPKl7bFuwE2Nj9WnM29SffU18vlg7HJz4UwNxNYvu0UD/d9T35YUG4bQOUhJc4S+JwqLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BOLZ34XL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BOLZ34XL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737426668; x=1768962668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cr2LsEX0pLsDOj/Ht53nuZeyvNbW3Qu9HTkdgp+DXws=;
  b=BOLZ34XLoJ8ZS6GdXBhHZ1b6SVCgAvsKVaM0HBW//QKsPhOdGWCzrAZc
   0W93KUGrJsEOG9spKO9SxotxWSmEypvy5+LXnkqsik2iXn6pEvevRbdYc
   OKGwya5xEXiyL9rQGEbFP1iB+vC7fygsejE0nQD/w8mk7fs/K5rvzHyZW
   qlOva0WxRTCTaXJnzcdEV3X6Js7mmIq9qqa6kaOToe3CtgPioizKFGYf+
   4Wycl8DODL3qLbjWIfUlf3WiZiTKjGBm1gphBDJipJbzUkfgMJA1EtkyV
   H6YlUU63+9ujgUZNm0MXstjzJLx8lF0maQrprqOdjD118YxNoKdofBjZH
   w==;
X-CSE-ConnectionGUID: IBisYInETf6WNXfPPnoW9g==
X-CSE-MsgGUID: QIBC3XH1S7CZS8/I740jxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48818484"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48818484"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 18:31:08 -0800
X-CSE-ConnectionGUID: evypWLYySlueMjr3CDT9Gg==
X-CSE-MsgGUID: Y4VIuEOXTRuVYUnnQG5YUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110712873"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jan 2025 18:31:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta42Y-000XVb-2N;
	Tue, 21 Jan 2025 02:30:54 +0000
Date: Tue, 21 Jan 2025 10:29:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/13]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:1242: undefined reference to
 `ntb_register_device'
Message-ID: <202501211018.FSoKK0UW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Frank,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   21a8754aa33228c1b822c1104d24fce691357678
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [0/13] PCI: endpoint: Support NTB transfer between RC and EP
config: i386-randconfig-052-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211018.FSoKK0UW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211018.FSoKK0UW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211018.FSoKK0UW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `pci_vntb_probe':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:1242: undefined reference to `ntb_register_device'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_cmd_handler':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:261: undefined reference to `ntb_db_event'
   ld: drivers/pci/endpoint/functions/pci-epf-vntb.o: in function `epf_ntb_link_up':
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:173: undefined reference to `ntb_link_event'
>> ld: drivers/pci/endpoint/functions/pci-epf-vntb.c:173: undefined reference to `ntb_link_event'


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
