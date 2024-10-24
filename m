Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFAA1E7C0E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729781407; cv=none; b=lkbQy1+WO/T1adTCPhOHS4kP04rdc2NmdXii/pwZdCnis4acGSqCcvW//v+s50fSfqPOEvdg5GV+axgOkZwJxxtFG6HAh1t289/6PONOXrsG1KY124SFqLvziCH93awMWj71alqweS7TFKVf4QQi6vSrDJfmfBpbOtdijj/P1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729781407; c=relaxed/simple;
	bh=43UM38OkcGqJSA4BYgzpI4XBmWTe0agrw9H9xQDKDik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GF3cZKEPCYx6K/QS4fuPZL4hyLO1B+jtePDFlLrvEs0tsjT+oO6VEF1GeH5naWgJrXL96i/OCXUNhF+d0317L1Oo5MzmdqlgtBgupewMva7B1tJ0CQf2nBh9XT8FuDyvzhrt21FCpvh5WyadV4CIqNoLobMoIgW6LmF4aKJonMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cu7JLVtH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cu7JLVtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729781404; x=1761317404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=43UM38OkcGqJSA4BYgzpI4XBmWTe0agrw9H9xQDKDik=;
  b=cu7JLVtHGyyZs1VcIyfl6e6leIKjZP6hPHpgS/fu9VeI+GLa0oxQ2Gzn
   xr6ZawnUsD6GNQDTINI4e7xzrBwlg3GHjqPzWPEPCx4LK9KsP2wlzfMPE
   OonXWw+TOxdJfvntX+Or+1+IUEn0u97ItRy3Cwoeo+61aKuRdGuV322YW
   EnzuV5tng+7ea3yBlpgfQ3DPsjWYmgzjRWMXojzIpA6wfMhv5vJZ1h2Gw
   yGXIssXOKSpaKagq5om7amaMu1WM0wiKw3DSfmZvtYcO+J3i8HLFBsP+r
   94OcDYk0mzS9nsIsV4OD1wfRmwFz4nMamiRpFYxzDKdBYXc0E2TH5lF/L
   A==;
X-CSE-ConnectionGUID: vhKkJa7DQPawpYqzJEdEXg==
X-CSE-MsgGUID: zj3XYUqGT+iq38n7D/MQVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29538731"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29538731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 07:50:00 -0700
X-CSE-ConnectionGUID: StgnU/IMTfmk+in4uk4u/A==
X-CSE-MsgGUID: 56E/D7dwSjOK0Rcpm5UMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="84588818"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Oct 2024 07:49:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3z9v-000WXW-2t;
	Thu, 24 Oct 2024 14:49:55 +0000
Date: Thu, 24 Oct 2024 22:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pci-dma-mapping.h 1/1]
 sound/pci/emu10k1/emu10k1_main.c:1555:13: error: implicit declaration of
 function 'dma_set_mask_and_coherent'
Message-ID: <202410242213.tLHmVpJt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git pci-dma-mapping.h
head:   c92fb06444ccb3624f7cd99ada7e2302d083091f
commit: c92fb06444ccb3624f7cd99ada7e2302d083091f [1/1] pci.h: don't include dma-mapping.h
config: x86_64-buildonly-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242213.tLHmVpJt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242213.tLHmVpJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242213.tLHmVpJt-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/pci/emu10k1/emu10k1_main.c: In function 'snd_emu10k1_create':
>> sound/pci/emu10k1/emu10k1_main.c:1555:13: error: implicit declaration of function 'dma_set_mask_and_coherent' [-Werror=implicit-function-declaration]
    1555 |         if (dma_set_mask_and_coherent(&pci->dev, emu->dma_mask) < 0) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/dma_set_mask_and_coherent +1555 sound/pci/emu10k1/emu10k1_main.c

04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1462  
e23e7a14362072 Bill Pemberton        2012-12-06  1463  int snd_emu10k1_create(struct snd_card *card,
^1da177e4c3f41 Linus Torvalds        2005-04-16  1464  		       struct pci_dev *pci,
^1da177e4c3f41 Linus Torvalds        2005-04-16  1465  		       unsigned short extin_mask,
^1da177e4c3f41 Linus Torvalds        2005-04-16  1466  		       unsigned short extout_mask,
^1da177e4c3f41 Linus Torvalds        2005-04-16  1467  		       long max_cache_bytes,
^1da177e4c3f41 Linus Torvalds        2005-04-16  1468  		       int enable_ir,
79e8b218b36dfa Takashi Iwai          2021-07-15  1469  		       uint subsystem)
^1da177e4c3f41 Linus Torvalds        2005-04-16  1470  {
79e8b218b36dfa Takashi Iwai          2021-07-15  1471  	struct snd_emu10k1 *emu = card->private_data;
09668b441dacdf Takashi Iwai          2005-11-17  1472  	int idx, err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1473  	int is_audigy;
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1474  	size_t page_table_size;
6a7322df2c2825 Takashi Iwai          2020-02-06  1475  	__le32 *pgtbl;
09668b441dacdf Takashi Iwai          2005-11-17  1476  	unsigned int silent_page;
eb4698f347ec90 Takashi Iwai          2005-11-17  1477  	const struct snd_emu_chip_details *c;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1478  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1479  	/* enable PCI device */
79e8b218b36dfa Takashi Iwai          2021-07-15  1480  	err = pcim_enable_device(pci);
67679b1fd166da Vedran Miletic        2008-10-23  1481  	if (err < 0)
^1da177e4c3f41 Linus Torvalds        2005-04-16  1482  		return err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1483  
79e8b218b36dfa Takashi Iwai          2021-07-15  1484  	card->private_free = snd_emu10k1_free;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1485  	emu->card = card;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1486  	spin_lock_init(&emu->reg_lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1487  	spin_lock_init(&emu->emu_lock);
c94fa4c9168e51 James Courtier-Dutton 2007-11-10  1488  	spin_lock_init(&emu->spi_lock);
c94fa4c9168e51 James Courtier-Dutton 2007-11-10  1489  	spin_lock_init(&emu->i2c_lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1490  	spin_lock_init(&emu->voice_lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1491  	spin_lock_init(&emu->synth_lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1492  	spin_lock_init(&emu->memblk_lock);
62932df8fb20ba Ingo Molnar           2006-01-16  1493  	mutex_init(&emu->fx8010.lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1494  	INIT_LIST_HEAD(&emu->mapped_link_head);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1495  	INIT_LIST_HEAD(&emu->mapped_order_link_head);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1496  	emu->pci = pci;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1497  	emu->irq = -1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1498  	emu->synth = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1499  	emu->get_synth_voice = NULL;
f848337cd801c7 Oswald Buddenhagen    2024-04-28  1500  	INIT_WORK(&emu->emu1010.work, emu1010_work);
2d3f4810886eb7 Oswald Buddenhagen    2024-04-28  1501  	mutex_init(&emu->emu1010.lock);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1502  	/* read revision & serial */
44c10138fd4bbc Auke Kok              2007-06-08  1503  	emu->revision = pci->revision;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1504  	pci_read_config_dword(pci, PCI_SUBSYSTEM_VENDOR_ID, &emu->serial);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1505  	pci_read_config_word(pci, PCI_SUBSYSTEM_ID, &emu->model);
6f002b02166cc0 Takashi Iwai          2014-02-25  1506  	dev_dbg(card->dev,
6f002b02166cc0 Takashi Iwai          2014-02-25  1507  		"vendor = 0x%x, device = 0x%x, subsystem_vendor_id = 0x%x, subsystem_id = 0x%x\n",
6f002b02166cc0 Takashi Iwai          2014-02-25  1508  		pci->vendor, pci->device, emu->serial, emu->model);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1509  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1510  	for (c = emu_chip_details; c->vendor; c++) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  1511  		if (c->vendor == pci->vendor && c->device == pci->device) {
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1512  			if (subsystem) {
67679b1fd166da Vedran Miletic        2008-10-23  1513  				if (c->subsystem && (c->subsystem == subsystem))
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1514  					break;
67679b1fd166da Vedran Miletic        2008-10-23  1515  				else
67679b1fd166da Vedran Miletic        2008-10-23  1516  					continue;
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1517  			} else {
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1518  				if (c->subsystem && (c->subsystem != emu->serial))
bdaed50292bea3 Takashi Iwai          2005-04-07  1519  					continue;
bdaed50292bea3 Takashi Iwai          2005-04-07  1520  				if (c->revision && c->revision != emu->revision)
bdaed50292bea3 Takashi Iwai          2005-04-07  1521  					continue;
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1522  			}
bdaed50292bea3 Takashi Iwai          2005-04-07  1523  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1524  		}
^1da177e4c3f41 Linus Torvalds        2005-04-16  1525  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  1526  	if (c->vendor == 0) {
6f002b02166cc0 Takashi Iwai          2014-02-25  1527  		dev_err(card->dev, "emu10k1: Card not recognised\n");
^1da177e4c3f41 Linus Torvalds        2005-04-16  1528  		return -ENOENT;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1529  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  1530  	emu->card_capabilities = c;
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1531  	if (c->subsystem && !subsystem)
6f002b02166cc0 Takashi Iwai          2014-02-25  1532  		dev_dbg(card->dev, "Sound card name = %s\n", c->name);
e66bc8b2a7d851 James Courtier-Dutton 2005-07-06  1533  	else if (subsystem)
6f002b02166cc0 Takashi Iwai          2014-02-25  1534  		dev_dbg(card->dev, "Sound card name = %s, "
67679b1fd166da Vedran Miletic        2008-10-23  1535  			"vendor = 0x%x, device = 0x%x, subsystem = 0x%x. "
88393161210493 Thomas Weber          2010-03-16  1536  			"Forced to subsystem = 0x%x\n",	c->name,
67679b1fd166da Vedran Miletic        2008-10-23  1537  			pci->vendor, pci->device, emu->serial, c->subsystem);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1538  	else
6f002b02166cc0 Takashi Iwai          2014-02-25  1539  		dev_dbg(card->dev, "Sound card name = %s, "
67679b1fd166da Vedran Miletic        2008-10-23  1540  			"vendor = 0x%x, device = 0x%x, subsystem = 0x%x.\n",
67679b1fd166da Vedran Miletic        2008-10-23  1541  			c->name, pci->vendor, pci->device,
67679b1fd166da Vedran Miletic        2008-10-23  1542  			emu->serial);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1543  
c989954938761a Takashi Iwai          2019-04-16  1544  	if (!*card->id && c->id)
75b1a8f9d62e50 Joe Perches           2021-01-04  1545  		strscpy(card->id, c->id, sizeof(card->id));
aec72e0a4be407 Takashi Iwai          2005-03-30  1546  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1547  	is_audigy = emu->audigy = c->emu10k2_chip;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1548  
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1549  	snd_emu10k1_detect_iommu(emu);
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1550  
7241ea558c6715 Peter Zubaj           2015-04-28  1551  	/* set addressing mode */
7241ea558c6715 Peter Zubaj           2015-04-28  1552  	emu->address_mode = is_audigy ? 0 : 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1553  	/* set the DMA transfer mask */
7241ea558c6715 Peter Zubaj           2015-04-28  1554  	emu->dma_mask = emu->address_mode ? EMU10K1_DMA_MASK : AUDIGY_DMA_MASK;
70d0bc7dca918a Maciej S. Szmigiero   2018-02-14 @1555  	if (dma_set_mask_and_coherent(&pci->dev, emu->dma_mask) < 0) {
6f002b02166cc0 Takashi Iwai          2014-02-25  1556  		dev_err(card->dev,
6f002b02166cc0 Takashi Iwai          2014-02-25  1557  			"architecture does not support PCI busmaster DMA with mask 0x%lx\n",
6f002b02166cc0 Takashi Iwai          2014-02-25  1558  			emu->dma_mask);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1559  		return -ENXIO;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1560  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  1561  	if (is_audigy)
^1da177e4c3f41 Linus Torvalds        2005-04-16  1562  		emu->gpr_base = A_FXGPREGBASE;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1563  	else
^1da177e4c3f41 Linus Torvalds        2005-04-16  1564  		emu->gpr_base = FXGPREGBASE;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1565  
67679b1fd166da Vedran Miletic        2008-10-23  1566  	err = pci_request_regions(pci, "EMU10K1");
79e8b218b36dfa Takashi Iwai          2021-07-15  1567  	if (err < 0)
^1da177e4c3f41 Linus Torvalds        2005-04-16  1568  		return err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1569  	emu->port = pci_resource_start(pci, 0);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1570  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1571  	emu->max_cache_pages = max_cache_bytes >> PAGE_SHIFT;
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1572  
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1573  	page_table_size = sizeof(u32) * (emu->address_mode ? MAXPAGES1 :
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1574  					 MAXPAGES0);
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1575  	if (snd_emu10k1_alloc_pages_maybe_wider(emu, page_table_size,
79e8b218b36dfa Takashi Iwai          2021-07-15  1576  						&emu->ptb_pages) < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1577  		return -ENOMEM;
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1578  	dev_dbg(card->dev, "page table address range is %.8lx:%.8lx\n",
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1579  		(unsigned long)emu->ptb_pages.addr,
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1580  		(unsigned long)(emu->ptb_pages.addr + emu->ptb_pages.bytes));
^1da177e4c3f41 Linus Torvalds        2005-04-16  1581  
42bc47b35320e0 Kees Cook             2018-06-12  1582  	emu->page_ptr_table = vmalloc(array_size(sizeof(void *),
42bc47b35320e0 Kees Cook             2018-06-12  1583  						 emu->max_cache_pages));
42bc47b35320e0 Kees Cook             2018-06-12  1584  	emu->page_addr_table = vmalloc(array_size(sizeof(unsigned long),
42bc47b35320e0 Kees Cook             2018-06-12  1585  						  emu->max_cache_pages));
79e8b218b36dfa Takashi Iwai          2021-07-15  1586  	if (!emu->page_ptr_table || !emu->page_addr_table)
79e8b218b36dfa Takashi Iwai          2021-07-15  1587  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1588  
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1589  	if (snd_emu10k1_alloc_pages_maybe_wider(emu, EMUPAGESIZE,
79e8b218b36dfa Takashi Iwai          2021-07-15  1590  						&emu->silent_page) < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1591  		return -ENOMEM;
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1592  	dev_dbg(card->dev, "silent page range is %.8lx:%.8lx\n",
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1593  		(unsigned long)emu->silent_page.addr,
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1594  		(unsigned long)(emu->silent_page.addr +
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1595  				emu->silent_page.bytes));
541b9bad169d24 Maciej S. Szmigiero   2018-02-14  1596  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1597  	emu->memhdr = snd_util_memhdr_new(emu->max_cache_pages * PAGE_SIZE);
79e8b218b36dfa Takashi Iwai          2021-07-15  1598  	if (!emu->memhdr)
79e8b218b36dfa Takashi Iwai          2021-07-15  1599  		return -ENOMEM;
eb4698f347ec90 Takashi Iwai          2005-11-17  1600  	emu->memhdr->block_extra_size = sizeof(struct snd_emu10k1_memblk) -
eb4698f347ec90 Takashi Iwai          2005-11-17  1601  		sizeof(struct snd_util_memblk);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1602  
^1da177e4c3f41 Linus Torvalds        2005-04-16  1603  	pci_set_master(pci);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1604  
e81995a81e25e8 Oswald Buddenhagen    2023-04-21  1605  	// The masks are not used for Audigy.
e81995a81e25e8 Oswald Buddenhagen    2023-04-21  1606  	// FIXME: these should come from the card_capabilites table.
^1da177e4c3f41 Linus Torvalds        2005-04-16  1607  	if (extin_mask == 0)
e81995a81e25e8 Oswald Buddenhagen    2023-04-21  1608  		extin_mask = 0x3fcf;  // EXTIN_*
^1da177e4c3f41 Linus Torvalds        2005-04-16  1609  	if (extout_mask == 0)
e81995a81e25e8 Oswald Buddenhagen    2023-04-21  1610  		extout_mask = 0x7fff;  // EXTOUT_*
^1da177e4c3f41 Linus Torvalds        2005-04-16  1611  	emu->fx8010.extin_mask = extin_mask;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1612  	emu->fx8010.extout_mask = extout_mask;
09668b441dacdf Takashi Iwai          2005-11-17  1613  	emu->enable_ir = enable_ir;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1614  
d9e8a552d486ef James Courtier-Dutton 2007-07-14  1615  	if (emu->card_capabilities->ca_cardbus_chip) {
67679b1fd166da Vedran Miletic        2008-10-23  1616  		err = snd_emu10k1_cardbus_init(emu);
67679b1fd166da Vedran Miletic        2008-10-23  1617  		if (err < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1618  			return err;
d9e8a552d486ef James Courtier-Dutton 2007-07-14  1619  	}
2b637da5a1bb3c Lee Revell            2005-03-30  1620  	if (emu->card_capabilities->ecard) {
67679b1fd166da Vedran Miletic        2008-10-23  1621  		err = snd_emu10k1_ecard_init(emu);
67679b1fd166da Vedran Miletic        2008-10-23  1622  		if (err < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1623  			return err;
190d2c46e52592 James Courtier-Dutton 2007-11-04  1624  	} else if (emu->card_capabilities->emu_model) {
67679b1fd166da Vedran Miletic        2008-10-23  1625  		err = snd_emu10k1_emu1010_init(emu);
79e8b218b36dfa Takashi Iwai          2021-07-15  1626  		if (err < 0)
19b99fbaed2e29 James Courtier-Dutton 2005-12-04  1627  			return err;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1628  	} else {
^1da177e4c3f41 Linus Torvalds        2005-04-16  1629  		/* 5.1: Enable the additional AC97 Slots. If the emu10k1 version
^1da177e4c3f41 Linus Torvalds        2005-04-16  1630  			does not support this, it shouldn't do any harm */
67679b1fd166da Vedran Miletic        2008-10-23  1631  		snd_emu10k1_ptr_write(emu, AC97SLOT, 0,
67679b1fd166da Vedran Miletic        2008-10-23  1632  					AC97SLOT_CNTR|AC97SLOT_LFE);
^1da177e4c3f41 Linus Torvalds        2005-04-16  1633  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  1634  
09668b441dacdf Takashi Iwai          2005-11-17  1635  	/* initialize TRAM setup */
09668b441dacdf Takashi Iwai          2005-11-17  1636  	emu->fx8010.itram_size = (16 * 1024)/2;
09668b441dacdf Takashi Iwai          2005-11-17  1637  	emu->fx8010.etram_pages.area = NULL;
09668b441dacdf Takashi Iwai          2005-11-17  1638  	emu->fx8010.etram_pages.bytes = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1639  
868e15dbd2940f Jaroslav Franek       2008-06-06  1640  	/* irq handler must be registered after I/O ports are activated */
79e8b218b36dfa Takashi Iwai          2021-07-15  1641  	if (devm_request_irq(&pci->dev, pci->irq, snd_emu10k1_interrupt,
79e8b218b36dfa Takashi Iwai          2021-07-15  1642  			     IRQF_SHARED, KBUILD_MODNAME, emu))
79e8b218b36dfa Takashi Iwai          2021-07-15  1643  		return -EBUSY;
868e15dbd2940f Jaroslav Franek       2008-06-06  1644  	emu->irq = pci->irq;
66471aa715f0d4 Takashi Iwai          2019-12-10  1645  	card->sync_irq = emu->irq;
868e15dbd2940f Jaroslav Franek       2008-06-06  1646  
09668b441dacdf Takashi Iwai          2005-11-17  1647  	/*
09668b441dacdf Takashi Iwai          2005-11-17  1648  	 *  Init to 0x02109204 :
09668b441dacdf Takashi Iwai          2005-11-17  1649  	 *  Clock accuracy    = 0     (1000ppm)
09668b441dacdf Takashi Iwai          2005-11-17  1650  	 *  Sample Rate       = 2     (48kHz)
09668b441dacdf Takashi Iwai          2005-11-17  1651  	 *  Audio Channel     = 1     (Left of 2)
09668b441dacdf Takashi Iwai          2005-11-17  1652  	 *  Source Number     = 0     (Unspecified)
09668b441dacdf Takashi Iwai          2005-11-17  1653  	 *  Generation Status = 1     (Original for Cat Code 12)
09668b441dacdf Takashi Iwai          2005-11-17  1654  	 *  Cat Code          = 12    (Digital Signal Mixer)
09668b441dacdf Takashi Iwai          2005-11-17  1655  	 *  Mode              = 0     (Mode 0)
09668b441dacdf Takashi Iwai          2005-11-17  1656  	 *  Emphasis          = 0     (None)
09668b441dacdf Takashi Iwai          2005-11-17  1657  	 *  CP                = 1     (Copyright unasserted)
09668b441dacdf Takashi Iwai          2005-11-17  1658  	 *  AN                = 0     (Audio data)
09668b441dacdf Takashi Iwai          2005-11-17  1659  	 *  P                 = 0     (Consumer)
09668b441dacdf Takashi Iwai          2005-11-17  1660  	 */
09668b441dacdf Takashi Iwai          2005-11-17  1661  	emu->spdif_bits[0] = emu->spdif_bits[1] =
09668b441dacdf Takashi Iwai          2005-11-17  1662  		emu->spdif_bits[2] = SPCS_CLKACCY_1000PPM | SPCS_SAMPLERATE_48 |
09668b441dacdf Takashi Iwai          2005-11-17  1663  		SPCS_CHANNELNUM_LEFT | SPCS_SOURCENUM_UNSPEC |
09668b441dacdf Takashi Iwai          2005-11-17  1664  		SPCS_GENERATIONSTATUS | 0x00001200 |
09668b441dacdf Takashi Iwai          2005-11-17  1665  		0x00000000 | SPCS_EMPHASIS_NONE | SPCS_COPYRIGHT;
09668b441dacdf Takashi Iwai          2005-11-17  1666  
09668b441dacdf Takashi Iwai          2005-11-17  1667  	/* Clear silent pages and set up pointers */
04f8773a3e980f Maciej S. Szmigiero   2018-02-14  1668  	memset(emu->silent_page.area, 0, emu->silent_page.bytes);
7241ea558c6715 Peter Zubaj           2015-04-28  1669  	silent_page = emu->silent_page.addr << emu->address_mode;
6a7322df2c2825 Takashi Iwai          2020-02-06  1670  	pgtbl = (__le32 *)emu->ptb_pages.area;
7241ea558c6715 Peter Zubaj           2015-04-28  1671  	for (idx = 0; idx < (emu->address_mode ? MAXPAGES1 : MAXPAGES0); idx++)
6a7322df2c2825 Takashi Iwai          2020-02-06  1672  		pgtbl[idx] = cpu_to_le32(silent_page | idx);
09668b441dacdf Takashi Iwai          2005-11-17  1673  
09668b441dacdf Takashi Iwai          2005-11-17  1674  	/* set up voice indices */
14a5c5a44b6195 Oswald Buddenhagen    2023-04-21  1675  	for (idx = 0; idx < NUM_G; idx++)
09668b441dacdf Takashi Iwai          2005-11-17  1676  		emu->voices[idx].number = idx;
^1da177e4c3f41 Linus Torvalds        2005-04-16  1677  
be250b7c9b2d8b Oswald Buddenhagen    2023-04-22  1678  	err = snd_emu10k1_init(emu, enable_ir);
67679b1fd166da Vedran Miletic        2008-10-23  1679  	if (err < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1680  		return err;
c7561cd80469f2 Takashi Iwai          2012-08-14  1681  #ifdef CONFIG_PM_SLEEP
67679b1fd166da Vedran Miletic        2008-10-23  1682  	err = alloc_pm_buffer(emu);
67679b1fd166da Vedran Miletic        2008-10-23  1683  	if (err < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1684  		return err;
09668b441dacdf Takashi Iwai          2005-11-17  1685  #endif
09668b441dacdf Takashi Iwai          2005-11-17  1686  
09668b441dacdf Takashi Iwai          2005-11-17  1687  	/*  Initialize the effect engine */
67679b1fd166da Vedran Miletic        2008-10-23  1688  	err = snd_emu10k1_init_efx(emu);
67679b1fd166da Vedran Miletic        2008-10-23  1689  	if (err < 0)
79e8b218b36dfa Takashi Iwai          2021-07-15  1690  		return err;
09668b441dacdf Takashi Iwai          2005-11-17  1691  	snd_emu10k1_audio_enable(emu);
09668b441dacdf Takashi Iwai          2005-11-17  1692  

:::::: The code at line 1555 was first introduced by commit
:::::: 70d0bc7dca918a0add6da817bae70f334fb4cc60 ALSA: emu10k1: use dma_set_mask_and_coherent()

:::::: TO: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
