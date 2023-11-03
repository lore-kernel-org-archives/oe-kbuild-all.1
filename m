Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42A1F616
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGt2maBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699031764; x=1730567764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eojza9ja2ChqPCYZKSmqvL3IB+p4R54Gj2aRZ2CarjI=;
  b=VGt2maBbKmdMcd1BJlCMAtTI7OuhQpAfcmtPnwzyhQfSzex2Uk6PJLYo
   W6XLPBiHtwgvUXAkyW6R+SX1iwpO1RIqPaK4Yc5vUqKhsVBvEzveRQ8Za
   BoRHIpQoSz6wMEEjKsPP+J1kzqTBX1HjZxoAEeReHR8G9OVlufPlCB2zP
   FbnAG3qe9Ev2s0632NJPX/K1I/C41IP9WCsT4ZTNo3cMi+13T9KcdZ/b9
   CaZaZkNkyxmGwy5505pjkroXtvNYhGPfObyAacfilDL8QnVy8ZrnTwuW5
   lhI751B9AZ24mrCAf/lI6KUKze5NnjkHGSVkzHMiWDG/cL4v4fwk4Gs/1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="374023452"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="374023452"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 10:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="796682023"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="796682023"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Nov 2023 10:15:57 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyxly-0002k8-2b;
	Fri, 03 Nov 2023 17:15:54 +0000
Date: Sat, 4 Nov 2023 01:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/edac/thunderx_edac.c:1899:17: warning: 'strncat' specified
 bound 1024 equals destination size
Message-ID: <202311040036.nQTx8Hy8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vlastimil,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: eb4940d4adf590590a9d0c47e38d2799c2ff9670 mm/slab: remove !CONFIG_TRACING variants of kmalloc_[node_]trace()
date:   12 months ago
config: arm64-randconfig-003-20231101 (https://download.01.org/0day-ci/archive/20231104/202311040036.nQTx8Hy8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040036.nQTx8Hy8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040036.nQTx8Hy8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/edac/thunderx_edac.c: In function 'thunderx_l2c_threaded_isr':
>> drivers/edac/thunderx_edac.c:1899:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-truncation]
    1899 |                 strncat(msg, other, L2C_MESSAGE_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1899:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-overflow=]
   drivers/edac/thunderx_edac.c: In function 'thunderx_ocx_lnk_threaded_isr':
   drivers/edac/thunderx_edac.c:1220:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-truncation]
    1220 |                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1220:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-overflow=]
   drivers/edac/thunderx_edac.c: In function 'thunderx_ocx_com_threaded_isr':
   drivers/edac/thunderx_edac.c:1136:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-truncation]
    1136 |                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1145:33: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-truncation]
    1145 |                                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1150:33: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-truncation]
    1150 |                                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1136:17: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-overflow=]
    1136 |                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1145:33: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-overflow=]
    1145 |                                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/edac/thunderx_edac.c:1150:33: warning: 'strncat' specified bound 1024 equals destination size [-Wstringop-overflow=]
    1150 |                                 strncat(msg, other, OCX_MESSAGE_SIZE);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncat +1899 drivers/edac/thunderx_edac.c

41003396f932d7 Sergey Temerkhanov 2017-03-24  1841  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1842  static irqreturn_t thunderx_l2c_threaded_isr(int irq, void *irq_id)
41003396f932d7 Sergey Temerkhanov 2017-03-24  1843  {
41003396f932d7 Sergey Temerkhanov 2017-03-24  1844  	struct msix_entry *msix = irq_id;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1845  	struct thunderx_l2c *l2c = container_of(msix, struct thunderx_l2c,
41003396f932d7 Sergey Temerkhanov 2017-03-24  1846  						msix_ent);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1847  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1848  	unsigned long tail = ring_pos(l2c->ring_tail, ARRAY_SIZE(l2c->err_ctx));
41003396f932d7 Sergey Temerkhanov 2017-03-24  1849  	struct l2c_err_ctx *ctx = &l2c->err_ctx[tail];
41003396f932d7 Sergey Temerkhanov 2017-03-24  1850  	irqreturn_t ret = IRQ_NONE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1851  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1852  	u64 mask_ue, mask_ce;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1853  	const struct error_descr *l2_errors;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1854  	char *reg_int_name;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1855  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1856  	char *msg;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1857  	char *other;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1858  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1859  	msg = kmalloc(OCX_MESSAGE_SIZE, GFP_KERNEL);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1860  	other = kmalloc(OCX_OTHER_SIZE, GFP_KERNEL);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1861  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1862  	if (!msg || !other)
41003396f932d7 Sergey Temerkhanov 2017-03-24  1863  		goto err_free;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1864  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1865  	switch (l2c->pdev->device) {
41003396f932d7 Sergey Temerkhanov 2017-03-24  1866  	case PCI_DEVICE_ID_THUNDER_L2C_TAD:
41003396f932d7 Sergey Temerkhanov 2017-03-24  1867  		reg_int_name = "L2C_TAD_INT";
41003396f932d7 Sergey Temerkhanov 2017-03-24  1868  		mask_ue = L2C_TAD_INT_UE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1869  		mask_ce = L2C_TAD_INT_CE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1870  		l2_errors = l2_tad_errors;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1871  		break;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1872  	case PCI_DEVICE_ID_THUNDER_L2C_CBC:
41003396f932d7 Sergey Temerkhanov 2017-03-24  1873  		reg_int_name = "L2C_CBC_INT";
41003396f932d7 Sergey Temerkhanov 2017-03-24  1874  		mask_ue = L2C_CBC_INT_UE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1875  		mask_ce = L2C_CBC_INT_CE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1876  		l2_errors = l2_cbc_errors;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1877  		break;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1878  	case PCI_DEVICE_ID_THUNDER_L2C_MCI:
41003396f932d7 Sergey Temerkhanov 2017-03-24  1879  		reg_int_name = "L2C_MCI_INT";
41003396f932d7 Sergey Temerkhanov 2017-03-24  1880  		mask_ue = L2C_MCI_INT_VBFDBE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1881  		mask_ce = L2C_MCI_INT_VBFSBE;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1882  		l2_errors = l2_mci_errors;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1883  		break;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1884  	default:
41003396f932d7 Sergey Temerkhanov 2017-03-24  1885  		dev_err(&l2c->pdev->dev, "Unsupported device: %04x\n",
41003396f932d7 Sergey Temerkhanov 2017-03-24  1886  			l2c->pdev->device);
d8c27ba86a2fd8 Dan Carpenter      2018-10-13  1887  		goto err_free;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1888  	}
41003396f932d7 Sergey Temerkhanov 2017-03-24  1889  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1890  	while (CIRC_CNT(l2c->ring_head, l2c->ring_tail,
41003396f932d7 Sergey Temerkhanov 2017-03-24  1891  			ARRAY_SIZE(l2c->err_ctx))) {
41003396f932d7 Sergey Temerkhanov 2017-03-24  1892  		snprintf(msg, L2C_MESSAGE_SIZE,
41003396f932d7 Sergey Temerkhanov 2017-03-24  1893  			 "%s: %s: %016llx, %s: %016llx",
41003396f932d7 Sergey Temerkhanov 2017-03-24  1894  			 l2c->edac_dev->ctl_name, reg_int_name, ctx->reg_int,
41003396f932d7 Sergey Temerkhanov 2017-03-24  1895  			 ctx->reg_ext_name, ctx->reg_ext);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1896  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1897  		decode_register(other, L2C_OTHER_SIZE, l2_errors, ctx->reg_int);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1898  
41003396f932d7 Sergey Temerkhanov 2017-03-24 @1899  		strncat(msg, other, L2C_MESSAGE_SIZE);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1900  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1901  		if (ctx->reg_int & mask_ue)
41003396f932d7 Sergey Temerkhanov 2017-03-24  1902  			edac_device_handle_ue(l2c->edac_dev, 0, 0, msg);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1903  		else if (ctx->reg_int & mask_ce)
41003396f932d7 Sergey Temerkhanov 2017-03-24  1904  			edac_device_handle_ce(l2c->edac_dev, 0, 0, msg);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1905  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1906  		l2c->ring_tail++;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1907  	}
41003396f932d7 Sergey Temerkhanov 2017-03-24  1908  
d8c27ba86a2fd8 Dan Carpenter      2018-10-13  1909  	ret = IRQ_HANDLED;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1910  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1911  err_free:
41003396f932d7 Sergey Temerkhanov 2017-03-24  1912  	kfree(other);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1913  	kfree(msg);
41003396f932d7 Sergey Temerkhanov 2017-03-24  1914  
41003396f932d7 Sergey Temerkhanov 2017-03-24  1915  	return ret;
41003396f932d7 Sergey Temerkhanov 2017-03-24  1916  }
41003396f932d7 Sergey Temerkhanov 2017-03-24  1917  

:::::: The code at line 1899 was first introduced by commit
:::::: 41003396f932d7f027725c7acebb6a7caa41dc3e EDAC, thunderx: Add Cavium ThunderX EDAC driver

:::::: TO: Sergey Temerkhanov <s.temerkhanov@gmail.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
