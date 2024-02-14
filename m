Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9896FB677
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 05:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707887604; cv=none; b=kJ9FZswPTdyH9bMkeDsGdTsJBV0+URNDGA/T9zssl/jqesw7V6bxhvqQExxNJ9daDPcAZv3LKLlFiJWksr1P8rL4FpBn1rpFAKic+Du5CLOb78R/CSgHfiDzA/bEOWIuwU5++F5wfYgVN0w9xksFGZcP+vVyQQ9Hs8dXCCyiMio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707887604; c=relaxed/simple;
	bh=YKe42CRe4iM3+pxceZTJZd2Jdg89Wp6Mto3qZh7LheU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCK6RlgQoqFbaa/LzHX/JCTDmcfmANJBFut3g8JGT2n70F8eDSEu4GtAyJBWlRRC8W2TD0Kgaxz/uBKlJnVwxeLXKQ3QrOPwgbaRGVwgVCkKideZivMNfw6cY/CNINbQrfBbrrAAwYik8JpcRpj6WfQLqfq0Q/4IgSw4XgxMTqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCEDidmF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCEDidmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707887602; x=1739423602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YKe42CRe4iM3+pxceZTJZd2Jdg89Wp6Mto3qZh7LheU=;
  b=KCEDidmFGxvkd4OntobF9XKw3D/mbNcd25nsZCNXiJgElfo2Md8AIYyV
   IJSUnfszcFFnbwLlc5nCEg5Axtz4tAbl4XBiiwFEC6vxkCe8JLvR7X/P8
   9QT+1JdL1r66S0pt2sJhNuSMfRz9ZUkJUL3cuRb+ukRzOjKf48QWRZyi4
   tIU8jnnb3OBcfR3rQ5mdTNWq1gGpdhZQL28lb6DpEM9fcQiHeK/1+v+V2
   zTOYPEQAwtcabKuh5vHg26hkXtakIU7U4yyYlpIdKdZbNJeNXKvcO+2uL
   5rsYSptRDcrnMTSMjWqHv1m4MiQ5SAu86u0kHd41EF4yjHvZB/+e28ci9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12556520"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="12556520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 21:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7751595"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2024 21:13:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra7a3-0008UW-10;
	Wed, 14 Feb 2024 05:13:11 +0000
Date: Wed, 14 Feb 2024 13:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] media: ipu-bridge: Move graph checking to IPU
 bridge
Message-ID: <202402141359.puqfkWZY-lkp@intel.com>
References: <20240213130815.382792-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213130815.382792-3-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master linus/master v6.8-rc4 next-20240213]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-ipu-bridge-Add-ov01a10-in-Dell-XPS-9315/20240213-211311
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240213130815.382792-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 2/4] media: ipu-bridge: Move graph checking to IPU bridge
config: x86_64-randconfig-161-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141359.puqfkWZY-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141359.puqfkWZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141359.puqfkWZY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu3/ipu3-cio2.c: In function 'cio2_pci_probe':
>> drivers/media/pci/intel/ipu3/ipu3-cio2.c:1676:24: warning: unused variable 'fwnode' [-Wunused-variable]
    1676 |  struct fwnode_handle *fwnode = dev_fwnode(dev);
         |                        ^~~~~~


vim +/fwnode +1676 drivers/media/pci/intel/ipu3/ipu3-cio2.c

c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1671  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1672  static int cio2_pci_probe(struct pci_dev *pci_dev,
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1673  			  const struct pci_device_id *id)
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1674  {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1675  	struct device *dev = &pci_dev->dev;
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13 @1676  	struct fwnode_handle *fwnode = dev_fwnode(dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1677  	struct cio2_device *cio2;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1678  	int r;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1679  
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1680  	/*
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1681  	 * On some platforms no connections to sensors are defined in firmware,
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1682  	 * if the device has no endpoints then we can try to build those as
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1683  	 * software_nodes parsed from SSDB.
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1684  	 */
998af18082fe4e3 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Hans de Goede         2023-07-05  1685  	r = ipu_bridge_init(dev, ipu_bridge_parse_ssdb);
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1686  	if (r)
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1687  		return r;
803abec64ef9d31 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Daniel Scally         2021-01-07  1688  
fc2c204538a9fbf drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Hans de Goede         2021-12-03  1689  	cio2 = devm_kzalloc(dev, sizeof(*cio2), GFP_KERNEL);
fc2c204538a9fbf drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Hans de Goede         2021-12-03  1690  	if (!cio2)
fc2c204538a9fbf drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Hans de Goede         2021-12-03  1691  		return -ENOMEM;
fc2c204538a9fbf drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Hans de Goede         2021-12-03  1692  	cio2->pci_dev = pci_dev;
fc2c204538a9fbf drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Hans de Goede         2021-12-03  1693  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1694  	r = pcim_enable_device(pci_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1695  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1696  		dev_err(dev, "failed to enable device (%d)\n", r);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1697  		return r;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1698  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1699  
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1700  	dev_info(dev, "device 0x%x (rev: 0x%x)\n",
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1701  		 pci_dev->device, pci_dev->revision);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1702  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1703  	r = pcim_iomap_regions(pci_dev, 1 << CIO2_PCI_BAR, pci_name(pci_dev));
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1704  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1705  		dev_err(dev, "failed to remap I/O memory (%d)\n", r);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1706  		return -ENODEV;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1707  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1708  
c12841388e16184 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Andy Shevchenko       2020-08-17  1709  	cio2->base = pcim_iomap_table(pci_dev)[CIO2_PCI_BAR];
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1710  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1711  	pci_set_drvdata(pci_dev, cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1712  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1713  	pci_set_master(pci_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1714  
887069f424550eb drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Christophe JAILLET    2021-08-22  1715  	r = dma_set_mask(&pci_dev->dev, CIO2_DMA_MASK);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1716  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1717  		dev_err(dev, "failed to set DMA mask (%d)\n", r);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1718  		return -ENODEV;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1719  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1720  
34a07e65bae27ab drivers/media/pci/intel/ipu3/ipu3-cio2.c      Andy Shevchenko       2020-08-17  1721  	r = pci_enable_msi(pci_dev);
34a07e65bae27ab drivers/media/pci/intel/ipu3/ipu3-cio2.c      Andy Shevchenko       2020-08-17  1722  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1723  		dev_err(dev, "failed to enable MSI (%d)\n", r);
34a07e65bae27ab drivers/media/pci/intel/ipu3/ipu3-cio2.c      Andy Shevchenko       2020-08-17  1724  		return r;
34a07e65bae27ab drivers/media/pci/intel/ipu3/ipu3-cio2.c      Andy Shevchenko       2020-08-17  1725  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1726  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1727  	r = cio2_fbpt_init_dummy(cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1728  	if (r)
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1729  		return r;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1730  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1731  	mutex_init(&cio2->lock);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1732  
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1733  	cio2->media_dev.dev = dev;
c0decac19da3906 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Mauro Carvalho Chehab 2018-09-10  1734  	strscpy(cio2->media_dev.model, CIO2_DEVICE_NAME,
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1735  		sizeof(cio2->media_dev.model));
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1736  	cio2->media_dev.hw_revision = 0;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1737  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1738  	media_device_init(&cio2->media_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1739  	r = media_device_register(&cio2->media_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1740  	if (r < 0)
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1741  		goto fail_mutex_destroy;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1742  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1743  	cio2->v4l2_dev.mdev = &cio2->media_dev;
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1744  	r = v4l2_device_register(dev, &cio2->v4l2_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1745  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1746  		dev_err(dev, "failed to register V4L2 device (%d)\n", r);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1747  		goto fail_media_device_unregister;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1748  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1749  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1750  	r = cio2_queues_init(cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1751  	if (r)
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1752  		goto fail_v4l2_device_unregister;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1753  
b8ec754ae4c563f drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2023-02-23  1754  	v4l2_async_nf_init(&cio2->notifier, &cio2->v4l2_dev);
2c93346698bacd5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1755  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1756  	/* Register notifier for subdevices we care */
2c93346698bacd5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1757  	r = cio2_parse_firmware(cio2);
706c0cffaf2a1b5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1758  	if (r)
2c93346698bacd5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1759  		goto fail_clean_notifier;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1760  
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1761  	r = devm_request_irq(dev, pci_dev->irq, cio2_irq, IRQF_SHARED,
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1762  			     CIO2_NAME, cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1763  	if (r) {
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1764  		dev_err(dev, "failed to request IRQ (%d)\n", r);
2c93346698bacd5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1765  		goto fail_clean_notifier;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1766  	}
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1767  
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1768  	pm_runtime_put_noidle(dev);
cfd13612a5a7071 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Andy Shevchenko       2021-07-13  1769  	pm_runtime_allow(dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1770  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1771  	return 0;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1772  
2c93346698bacd5 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Sakari Ailus          2019-03-04  1773  fail_clean_notifier:
3c8c153914812a9 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Sakari Ailus          2021-03-05  1774  	v4l2_async_nf_unregister(&cio2->notifier);
3c8c153914812a9 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c Sakari Ailus          2021-03-05  1775  	v4l2_async_nf_cleanup(&cio2->notifier);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1776  	cio2_queues_exit(cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1777  fail_v4l2_device_unregister:
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1778  	v4l2_device_unregister(&cio2->v4l2_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1779  fail_media_device_unregister:
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1780  	media_device_unregister(&cio2->media_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1781  	media_device_cleanup(&cio2->media_dev);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1782  fail_mutex_destroy:
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1783  	mutex_destroy(&cio2->lock);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1784  	cio2_fbpt_exit_dummy(cio2);
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1785  
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1786  	return r;
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1787  }
c2a6a07afe4a466 drivers/media/pci/intel/ipu3/ipu3-cio2.c      Yong Zhi              2017-11-08  1788  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
