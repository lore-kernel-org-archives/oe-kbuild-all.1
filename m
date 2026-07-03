Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9C35F8D2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783064430; cv=none; b=Na365EnxU02G3lXGUdbbcX7D9bnW+lWDqf/EDsqQZTmpYwlYC2oTxamRQstrvJd1AOwLfbJiRZlMyXZdU3RU81tQIlsBCAdD5MswPlM06K2/W5wpfQzc2dI+iAAtZbXnXsWfoHvfcqUdkByxaAhqrOIZk0EW4idhZdBp54PMHlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783064430; c=relaxed/simple;
	bh=9sgUE5gen4toUJgD1I9Gn78LE3tDK8MznRZtEvKZErY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jcWY9tnsgdxp8wVyzx7k4qYG+cIfv0ZPtSESqTzY/+bmzfgUTFWMf5IvdvmU1IelkFLwbr3qpQ6llaqj0+CGHF5nYPxPAfa2srsUV2h21Y+oQfVAcATXfIzqG7ZSR5cUE894OtiTwkLGOTxG2mceJhwVmj97PYUFvaMopbxEzsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqYcKVNR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqYcKVNR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783064428; x=1814600428;
  h=date:from:to:cc:subject:message-id;
  bh=9sgUE5gen4toUJgD1I9Gn78LE3tDK8MznRZtEvKZErY=;
  b=CqYcKVNRv6Z9JsgdGsvrAmdCOfpItBB8QfhREMGbDRq6ItEPNyFZyA+d
   t0bqipuPJ3uTzzOawxPKjxs+A64i7CT7FvzPee4Zcfa+UCULis2Q2nFhQ
   b9wefZixKtJE4P+az3XsrN41T7lSRoGmdNLwzW2AQZCPkklDe4MYXzIy2
   H36qzr1qfjABr/KUHYD/tNVkge5HKNyixvX4wOI+GwqQZvjAdUHCxhdm9
   UfvMAW+QwcgQBpkkwo/R52+guEo3F6DaAQAMGS408Yd+GdR70SMe+Z4Al
   y0L6ifC7dvsn1Ppvj9s+DsmfGje9nj0pc+YeqY0hYSAZ4I+b6Kg+vk/lJ
   g==;
X-CSE-ConnectionGUID: YdwgL9+PSH2XnHZXZWJUEw==
X-CSE-MsgGUID: JsngG4ZnQE+UiDIi7A7hxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83679485"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83679485"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 00:40:20 -0700
X-CSE-ConnectionGUID: 1Z1b8KBOTUixBQteVqcxPw==
X-CSE-MsgGUID: f7Us1wHzSjqk2FOCBzqSZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249083673"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2026 00:40:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfYVT-00000000BpH-0GMW;
	Fri, 03 Jul 2026 07:40:15 +0000
Date: Fri, 03 Jul 2026 15:39:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>
Subject: drivers/net/arcnet/com20020-pci.c:225:52: warning:
 'snprintf' output may be truncated before the last format character
Message-ID: <202607031526.MY7Ztdga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ethan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   51512e22efe813d8223de27f6fd02a8a48ea2323
commit: eb8ffe14a554808eb68cf050ba5343dbbe15bb54 net: arcnet: com20020-pci: avoid -Wformat-truncation warning
date:   6 weeks ago
config: alpha-randconfig-r113-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031526.MY7Ztdga-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031526.MY7Ztdga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: eb8ffe14a554 ("net: arcnet: com20020-pci: avoid -Wformat-truncation warning")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031526.MY7Ztdga-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/arcnet/com20020-pci.c: In function 'com20020pci_probe':
>> drivers/net/arcnet/com20020-pci.c:225:52: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
       snprintf(dev->name, sizeof(dev->name), "arc%d-%d", dev->dev_id, i);
                                                       ^
   drivers/net/arcnet/com20020-pci.c:225:4: note: 'snprintf' output between 7 and 17 bytes into a destination of size 16
       snprintf(dev->name, sizeof(dev->name), "arc%d-%d", dev->dev_id, i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +225 drivers/net/arcnet/com20020-pci.c

c51da42a6346c0 Michal Grzeschik   2014-09-29  121  
d6d7d3ed56e3bf Joe Perches        2015-05-05  122  static int com20020pci_probe(struct pci_dev *pdev,
d6d7d3ed56e3bf Joe Perches        2015-05-05  123  			     const struct pci_device_id *id)
^1da177e4c3f41 Linus Torvalds     2005-04-16  124  {
8c14f9c70327a6 Michal Grzeschik   2014-09-29  125  	struct com20020_pci_card_info *ci;
5ef216c1f84825 Michal Grzeschik   2014-09-18  126  	struct com20020_pci_channel_map *mm;
^1da177e4c3f41 Linus Torvalds     2005-04-16  127  	struct net_device *dev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  128  	struct arcnet_local *lp;
c51da42a6346c0 Michal Grzeschik   2014-09-29  129  	struct com20020_priv *priv;
eb8ffe14a55480 Ethan Nelson-Moore 2026-05-20  130  	int ioaddr, ret;
eb8ffe14a55480 Ethan Nelson-Moore 2026-05-20  131  	u8 i;
c51da42a6346c0 Michal Grzeschik   2014-09-29  132  	struct resource *r;
^1da177e4c3f41 Linus Torvalds     2005-04-16  133  
6577b9a551aedb Tong Zhang         2021-03-14  134  	ret = 0;
6577b9a551aedb Tong Zhang         2021-03-14  135  
^1da177e4c3f41 Linus Torvalds     2005-04-16  136  	if (pci_enable_device(pdev))
^1da177e4c3f41 Linus Torvalds     2005-04-16  137  		return -EIO;
c51da42a6346c0 Michal Grzeschik   2014-09-29  138  
c51da42a6346c0 Michal Grzeschik   2014-09-29  139  	priv = devm_kzalloc(&pdev->dev, sizeof(struct com20020_priv),
c51da42a6346c0 Michal Grzeschik   2014-09-29  140  			    GFP_KERNEL);
e8a308affcd79d Kiran Padwal       2015-02-05  141  	if (!priv)
e8a308affcd79d Kiran Padwal       2015-02-05  142  		return -ENOMEM;
e8a308affcd79d Kiran Padwal       2015-02-05  143  
c51da42a6346c0 Michal Grzeschik   2014-09-29  144  	ci = (struct com20020_pci_card_info *)id->driver_data;
bd6f1fd5d33dfe Zheyu Ma           2022-03-02  145  	if (!ci)
c7d9be66b71af4 Ethan Nelson-Moore 2026-02-12  146  		ci = &card_info_2p5mbit;
bd6f1fd5d33dfe Zheyu Ma           2022-03-02  147  
c51da42a6346c0 Michal Grzeschik   2014-09-29  148  	priv->ci = ci;
5ef216c1f84825 Michal Grzeschik   2014-09-18  149  	mm = &ci->misc_map;
c51da42a6346c0 Michal Grzeschik   2014-09-29  150  
6577b9a551aedb Tong Zhang         2021-03-14  151  	pci_set_drvdata(pdev, priv);
6577b9a551aedb Tong Zhang         2021-03-14  152  
c51da42a6346c0 Michal Grzeschik   2014-09-29  153  	INIT_LIST_HEAD(&priv->list_dev);
c51da42a6346c0 Michal Grzeschik   2014-09-29  154  
5ef216c1f84825 Michal Grzeschik   2014-09-18  155  	if (mm->size) {
5ef216c1f84825 Michal Grzeschik   2014-09-18  156  		ioaddr = pci_resource_start(pdev, mm->bar) + mm->offset;
5ef216c1f84825 Michal Grzeschik   2014-09-18  157  		r = devm_request_region(&pdev->dev, ioaddr, mm->size,
5ef216c1f84825 Michal Grzeschik   2014-09-18  158  					"com20020-pci");
5ef216c1f84825 Michal Grzeschik   2014-09-18  159  		if (!r) {
5ef216c1f84825 Michal Grzeschik   2014-09-18  160  			pr_err("IO region %xh-%xh already allocated.\n",
5ef216c1f84825 Michal Grzeschik   2014-09-18  161  			       ioaddr, ioaddr + mm->size - 1);
5ef216c1f84825 Michal Grzeschik   2014-09-18  162  			return -EBUSY;
5ef216c1f84825 Michal Grzeschik   2014-09-18  163  		}
5ef216c1f84825 Michal Grzeschik   2014-09-18  164  		priv->misc = ioaddr;
5ef216c1f84825 Michal Grzeschik   2014-09-18  165  	}
5ef216c1f84825 Michal Grzeschik   2014-09-18  166  
c51da42a6346c0 Michal Grzeschik   2014-09-29  167  	for (i = 0; i < ci->devcount; i++) {
c51da42a6346c0 Michal Grzeschik   2014-09-29  168  		struct com20020_pci_channel_map *cm = &ci->chan_map_tbl[i];
c51da42a6346c0 Michal Grzeschik   2014-09-29  169  		struct com20020_dev *card;
cb108619f2fc77 Michal Grzeschik   2017-06-28  170  		int dev_id_mask = 0xf;
c51da42a6346c0 Michal Grzeschik   2014-09-29  171  
^1da177e4c3f41 Linus Torvalds     2005-04-16  172  		dev = alloc_arcdev(device);
c51da42a6346c0 Michal Grzeschik   2014-09-29  173  		if (!dev) {
c51da42a6346c0 Michal Grzeschik   2014-09-29  174  			ret = -ENOMEM;
6577b9a551aedb Tong Zhang         2021-03-14  175  			break;
c51da42a6346c0 Michal Grzeschik   2014-09-29  176  		}
ae8ede6a0cdcf3 Michal Grzeschik   2015-03-20  177  		dev->dev_port = i;
a1799af4d7deef Stephen Hemminger  2009-01-09  178  
a1799af4d7deef Stephen Hemminger  2009-01-09  179  		dev->netdev_ops = &com20020_netdev_ops;
a1799af4d7deef Stephen Hemminger  2009-01-09  180  
454d7c9b14e20f Wang Chen          2008-11-12  181  		lp = netdev_priv(dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  182  
a34c0932c3b2f2 Joe Perches        2015-05-05  183  		arc_printk(D_NORMAL, dev, "%s Controls\n", ci->name);
c51da42a6346c0 Michal Grzeschik   2014-09-29  184  		ioaddr = pci_resource_start(pdev, cm->bar) + cm->offset;
c51da42a6346c0 Michal Grzeschik   2014-09-29  185  
c51da42a6346c0 Michal Grzeschik   2014-09-29  186  		r = devm_request_region(&pdev->dev, ioaddr, cm->size,
c51da42a6346c0 Michal Grzeschik   2014-09-29  187  					"com20020-pci");
c51da42a6346c0 Michal Grzeschik   2014-09-29  188  		if (!r) {
05a24b234b9dda Joe Perches        2015-05-05  189  			pr_err("IO region %xh-%xh already allocated\n",
c51da42a6346c0 Michal Grzeschik   2014-09-29  190  			       ioaddr, ioaddr + cm->size - 1);
c51da42a6346c0 Michal Grzeschik   2014-09-29  191  			ret = -EBUSY;
6577b9a551aedb Tong Zhang         2021-03-14  192  			goto err_free_arcdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  193  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  194  
c51da42a6346c0 Michal Grzeschik   2014-09-29  195  		/* Dummy access after Reset
c51da42a6346c0 Michal Grzeschik   2014-09-29  196  		 * ARCNET controller needs
c51da42a6346c0 Michal Grzeschik   2014-09-29  197  		 * this access to detect bustype
c51da42a6346c0 Michal Grzeschik   2014-09-29  198  		 */
e859db8ac49083 Ethan Nelson-Moore 2026-05-20  199  		outb(0x00, ioaddr + COM20020_REG_W_COMMAND);
e859db8ac49083 Ethan Nelson-Moore 2026-05-20  200  		inb(ioaddr + COM20020_REG_R_DIAGSTAT);
^1da177e4c3f41 Linus Torvalds     2005-04-16  201  
2a0ea04c83ab82 Michal Grzeschik   2017-06-28  202  		SET_NETDEV_DEV(dev, &pdev->dev);
^1da177e4c3f41 Linus Torvalds     2005-04-16  203  		dev->base_addr = ioaddr;
13b5ffa0e282f3 Jakub Kicinski     2021-10-12  204  		arcnet_set_addr(dev, node);
ede07a1fc7d70a Michal Grzeschik   2017-06-28  205  		dev->sysfs_groups[0] = &com20020_state_group;
c51da42a6346c0 Michal Grzeschik   2014-09-29  206  		dev->irq = pdev->irq;
^1da177e4c3f41 Linus Torvalds     2005-04-16  207  		lp->card_name = "PCI COM20020";
8c14f9c70327a6 Michal Grzeschik   2014-09-29  208  		lp->card_flags = ci->flags;
^1da177e4c3f41 Linus Torvalds     2005-04-16  209  		lp->backplane = backplane;
^1da177e4c3f41 Linus Torvalds     2005-04-16  210  		lp->clockp = clockp & 7;
^1da177e4c3f41 Linus Torvalds     2005-04-16  211  		lp->clockm = clockm & 3;
^1da177e4c3f41 Linus Torvalds     2005-04-16  212  		lp->timeout = timeout;
^1da177e4c3f41 Linus Torvalds     2005-04-16  213  		lp->hw.owner = THIS_MODULE;
^1da177e4c3f41 Linus Torvalds     2005-04-16  214  
52ab12e4f99437 Michal Grzeschik   2017-06-28  215  		lp->backplane = (inb(priv->misc) >> (2 + i)) & 0x1;
52ab12e4f99437 Michal Grzeschik   2017-06-28  216  
a356ab1c3d4651 Michal Grzeschik   2017-06-28  217  		if (!strncmp(ci->name, "EAE PLX-PCI FB2", 15))
a356ab1c3d4651 Michal Grzeschik   2017-06-28  218  			lp->backplane = 1;
a356ab1c3d4651 Michal Grzeschik   2017-06-28  219  
6b17a597fc2f13 Thomas Reichinger  2023-11-30  220  		if (ci->flags & ARC_HAS_ROTARY) {
5ef216c1f84825 Michal Grzeschik   2014-09-18  221  			/* Get the dev_id from the PLX rotary coder */
5ef216c1f84825 Michal Grzeschik   2014-09-18  222  			if (!strncmp(ci->name, "EAE PLX-PCI MA1", 15))
cb108619f2fc77 Michal Grzeschik   2017-06-28  223  				dev_id_mask = 0x3;
cb108619f2fc77 Michal Grzeschik   2017-06-28  224  			dev->dev_id = (inb(priv->misc + ci->rotary) >> 4) & dev_id_mask;
5ef216c1f84825 Michal Grzeschik   2014-09-18 @225  			snprintf(dev->name, sizeof(dev->name), "arc%d-%d", dev->dev_id, i);
6b17a597fc2f13 Thomas Reichinger  2023-11-30  226  		}
5ef216c1f84825 Michal Grzeschik   2014-09-18  227  
e859db8ac49083 Ethan Nelson-Moore 2026-05-20  228  		if (inb(ioaddr + COM20020_REG_R_STATUS) == 0xFF) {
c51da42a6346c0 Michal Grzeschik   2014-09-29  229  			pr_err("IO address %Xh is empty!\n", ioaddr);
c51da42a6346c0 Michal Grzeschik   2014-09-29  230  			ret = -EIO;
6577b9a551aedb Tong Zhang         2021-03-14  231  			goto err_free_arcdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  232  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  233  		if (com20020_check(dev)) {
c51da42a6346c0 Michal Grzeschik   2014-09-29  234  			ret = -EIO;
6577b9a551aedb Tong Zhang         2021-03-14  235  			goto err_free_arcdev;
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  237  
6b17a597fc2f13 Thomas Reichinger  2023-11-30  238  		ret = com20020_found(dev, IRQF_SHARED);
6b17a597fc2f13 Thomas Reichinger  2023-11-30  239  		if (ret)
6b17a597fc2f13 Thomas Reichinger  2023-11-30  240  			goto err_free_arcdev;
6b17a597fc2f13 Thomas Reichinger  2023-11-30  241  
c51da42a6346c0 Michal Grzeschik   2014-09-29  242  		card = devm_kzalloc(&pdev->dev, sizeof(struct com20020_dev),
c51da42a6346c0 Michal Grzeschik   2014-09-29  243  				    GFP_KERNEL);
01c3521f794ce9 Christophe Jaillet 2017-07-07  244  		if (!card) {
01c3521f794ce9 Christophe Jaillet 2017-07-07  245  			ret = -ENOMEM;
6577b9a551aedb Tong Zhang         2021-03-14  246  			goto err_free_arcdev;
01c3521f794ce9 Christophe Jaillet 2017-07-07  247  		}
c51da42a6346c0 Michal Grzeschik   2014-09-29  248  
c51da42a6346c0 Michal Grzeschik   2014-09-29  249  		card->index = i;
c51da42a6346c0 Michal Grzeschik   2014-09-29  250  		card->pci_priv = priv;
6b17a597fc2f13 Thomas Reichinger  2023-11-30  251  
6b17a597fc2f13 Thomas Reichinger  2023-11-30  252  		if (ci->flags & ARC_HAS_LED) {
8890624a4e8c2c Michal Grzeschik   2014-09-18  253  			card->tx_led.brightness_set = led_tx_set;
8890624a4e8c2c Michal Grzeschik   2014-09-18  254  			card->tx_led.default_trigger = devm_kasprintf(&pdev->dev,
8890624a4e8c2c Michal Grzeschik   2014-09-18  255  							GFP_KERNEL, "arc%d-%d-tx",
8890624a4e8c2c Michal Grzeschik   2014-09-18  256  							dev->dev_id, i);
fda8c491db2a90 Henry Martin       2025-04-02  257  			if (!card->tx_led.default_trigger) {
fda8c491db2a90 Henry Martin       2025-04-02  258  				ret = -ENOMEM;
fda8c491db2a90 Henry Martin       2025-04-02  259  				goto err_free_arcdev;
fda8c491db2a90 Henry Martin       2025-04-02  260  			}
8890624a4e8c2c Michal Grzeschik   2014-09-18  261  			card->tx_led.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
8890624a4e8c2c Michal Grzeschik   2014-09-18  262  							"pci:green:tx:%d-%d",
8890624a4e8c2c Michal Grzeschik   2014-09-18  263  							dev->dev_id, i);
fda8c491db2a90 Henry Martin       2025-04-02  264  			if (!card->tx_led.name) {
fda8c491db2a90 Henry Martin       2025-04-02  265  				ret = -ENOMEM;
fda8c491db2a90 Henry Martin       2025-04-02  266  				goto err_free_arcdev;
fda8c491db2a90 Henry Martin       2025-04-02  267  			}
8890624a4e8c2c Michal Grzeschik   2014-09-18  268  			card->tx_led.dev = &dev->dev;
8890624a4e8c2c Michal Grzeschik   2014-09-18  269  			card->recon_led.brightness_set = led_recon_set;
8890624a4e8c2c Michal Grzeschik   2014-09-18  270  			card->recon_led.default_trigger = devm_kasprintf(&pdev->dev,
8890624a4e8c2c Michal Grzeschik   2014-09-18  271  							GFP_KERNEL, "arc%d-%d-recon",
8890624a4e8c2c Michal Grzeschik   2014-09-18  272  							dev->dev_id, i);
fda8c491db2a90 Henry Martin       2025-04-02  273  			if (!card->recon_led.default_trigger) {
fda8c491db2a90 Henry Martin       2025-04-02  274  				ret = -ENOMEM;
fda8c491db2a90 Henry Martin       2025-04-02  275  				goto err_free_arcdev;
fda8c491db2a90 Henry Martin       2025-04-02  276  			}
8890624a4e8c2c Michal Grzeschik   2014-09-18  277  			card->recon_led.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
8890624a4e8c2c Michal Grzeschik   2014-09-18  278  							"pci:red:recon:%d-%d",
8890624a4e8c2c Michal Grzeschik   2014-09-18  279  							dev->dev_id, i);
fda8c491db2a90 Henry Martin       2025-04-02  280  			if (!card->recon_led.name) {
fda8c491db2a90 Henry Martin       2025-04-02  281  				ret = -ENOMEM;
fda8c491db2a90 Henry Martin       2025-04-02  282  				goto err_free_arcdev;
fda8c491db2a90 Henry Martin       2025-04-02  283  			}
8890624a4e8c2c Michal Grzeschik   2014-09-18  284  			card->recon_led.dev = &dev->dev;
c51da42a6346c0 Michal Grzeschik   2014-09-29  285  
8890624a4e8c2c Michal Grzeschik   2014-09-18  286  			ret = devm_led_classdev_register(&pdev->dev, &card->tx_led);
8890624a4e8c2c Michal Grzeschik   2014-09-18  287  			if (ret)
6577b9a551aedb Tong Zhang         2021-03-14  288  				goto err_free_arcdev;
8890624a4e8c2c Michal Grzeschik   2014-09-18  289  
8890624a4e8c2c Michal Grzeschik   2014-09-18  290  			ret = devm_led_classdev_register(&pdev->dev, &card->recon_led);
8890624a4e8c2c Michal Grzeschik   2014-09-18  291  			if (ret)
6577b9a551aedb Tong Zhang         2021-03-14  292  				goto err_free_arcdev;
8890624a4e8c2c Michal Grzeschik   2014-09-18  293  
c51da42a6346c0 Michal Grzeschik   2014-09-29  294  			dev_set_drvdata(&dev->dev, card);
8890624a4e8c2c Michal Grzeschik   2014-09-18  295  			devm_arcnet_led_init(dev, dev->dev_id, i);
6b17a597fc2f13 Thomas Reichinger  2023-11-30  296  		}
8890624a4e8c2c Michal Grzeschik   2014-09-18  297  
6b17a597fc2f13 Thomas Reichinger  2023-11-30  298  		card->dev = dev;
c51da42a6346c0 Michal Grzeschik   2014-09-29  299  		list_add(&card->list, &priv->list_dev);
6577b9a551aedb Tong Zhang         2021-03-14  300  		continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  301  
6577b9a551aedb Tong Zhang         2021-03-14  302  err_free_arcdev:
6577b9a551aedb Tong Zhang         2021-03-14  303  		free_arcdev(dev);
6577b9a551aedb Tong Zhang         2021-03-14  304  		break;
6577b9a551aedb Tong Zhang         2021-03-14  305  	}
6577b9a551aedb Tong Zhang         2021-03-14  306  	if (ret)
c51da42a6346c0 Michal Grzeschik   2014-09-29  307  		com20020pci_remove(pdev);
c51da42a6346c0 Michal Grzeschik   2014-09-29  308  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  309  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  310  

:::::: The code at line 225 was first introduced by commit
:::::: 5ef216c1f84825c6942fdd6c24d12a08ac2df135 arcnet: com20020-pci: add rotary index support

:::::: TO: Michael Grzeschik <m.grzeschik@pengutronix.de>
:::::: CC: Michael Grzeschik <m.grzeschik@pengutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
