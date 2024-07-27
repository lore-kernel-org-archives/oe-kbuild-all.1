Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A867217F4EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jul 2024 16:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722099518; cv=none; b=ZVmMzL9C9xk/jRSDMhgFr8hTsFwBbxACOvabx8eWijiCxeIw0D0hOoKJ7G/DrPrCxPGkFU/src91O4k/RS66COFO3F/ILrik2EQdNo9OYvjdJ4Vbmht6S1x9nLXztOoy5v4DZO5wnSYwRnFM32F1EwoGok6oOcQADV/DOC/P0ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722099518; c=relaxed/simple;
	bh=h8G6Yal/zxMnSSSZk0xd58A1Ma4dHG0TMba3L9SJUyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KW11VnMYlSUOYj89f5CNZ3+lhcgYP/kNUxGgUapYx1IM7B/s5+BBA5IcoTaIL4YnVbqLnhY+4smPMRNzKkwvmzm+xMpecz6+N/DvblEkXaRiAeYzqNQT6kBWwC9q1NPEqG6xPvYDQ+8I4Y4Q70nRdJtoyJKEWfe9KbJ/hwV7qRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9TSRHzH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9TSRHzH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722099515; x=1753635515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8G6Yal/zxMnSSSZk0xd58A1Ma4dHG0TMba3L9SJUyc=;
  b=T9TSRHzHquGgoy352kN3k8k5gh5IFPqzO8zIxRGB4IGF7RAXwnP1BFED
   e1tw7U+Mivr7i+km2x6hPJ2iVp6BtK7MTIhfrjZxfd6oZofDdxSH5z/4G
   Som4IWA58EnDcLSKQ/yG8UugSRa5hmdPWc/sT5IUchZ2FQDnTOBCHQCED
   VMIFdknqmagzzX3ucqMRLmbWmZgQoBhI+hXB+6vZxqlQg9x2+YCsH7oZU
   LCYxdrZauMS2G2Y1hXxKagKxjgKWVAmhpn3locmmdd3ykJj6BkZpml1Ej
   zrxkAdvHqWucVGnVAWUzxAwJPDlOIM3BNuRUxok92eWNgAC6hdSQRlVk9
   g==;
X-CSE-ConnectionGUID: PArgL0HBQnmE1qjQ/nhK3g==
X-CSE-MsgGUID: mtRuqpNoR/eLcnCchpwSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31285411"
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="31285411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2024 09:58:32 -0700
X-CSE-ConnectionGUID: rFcjcIYcTdK2DoRss4rkWw==
X-CSE-MsgGUID: ptJtIce3RWuFGCbe86LUJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,242,1716274800"; 
   d="scan'208";a="53215933"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jul 2024 09:58:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXkkX-000q5S-1H;
	Sat, 27 Jul 2024 16:58:29 +0000
Date: Sun, 28 Jul 2024 00:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 4/10] drivers/usb/cdns3/gadget.c:123:26:
 sparse: sparse: symbol 'cdns3_next_align_buf' was not declared. Should it be
 static?
Message-ID: <202407280018.aAYHgRUB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   24f95d0e9b1707db180c68181603937d90783fd9
commit: 1a36f8033bac1979c6bb6c2166a6c143f2113f97 [4/10] BACKPORT: usb: cdns3: make signed 1 bit bitfields unsigned
config: x86_64-randconfig-123-20240727 (https://download.01.org/0day-ci/archive/20240728/202407280018.aAYHgRUB-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407280018.aAYHgRUB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407280018.aAYHgRUB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/gadget.c:123:26: sparse: sparse: symbol 'cdns3_next_align_buf' was not declared. Should it be static?
>> drivers/usb/cdns3/gadget.c:134:22: sparse: sparse: symbol 'cdns3_next_priv_request' was not declared. Should it be static?
>> drivers/usb/cdns3/gadget.c:161:5: sparse: sparse: symbol 'cdns3_ring_size' was not declared. Should it be static?
>> drivers/usb/cdns3/gadget.c:202:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:202:26: sparse:     expected restricted __le32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:202:26: sparse:     got unsigned long long
>> drivers/usb/cdns3/gadget.c:203:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:203:27: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:203:27: sparse:     got unsigned long
>> drivers/usb/cdns3/gadget.c:298:6: sparse: sparse: symbol 'cdns3_move_deq_to_next_trb' was not declared. Should it be static?
>> drivers/usb/cdns3/gadget.c:438:20: sparse: sparse: symbol 'cdns3_wa2_gadget_giveback' was not declared. Should it be static?
>> drivers/usb/cdns3/gadget.c:471:5: sparse: sparse: symbol 'cdns3_wa2_gadget_ep_queue' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:689:49: sparse: sparse: restricted __le32 degrades to integer
>> drivers/usb/cdns3/gadget.c:688:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:688:51: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:688:51: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:692:49: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/gadget.c:691:51: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:691:51: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:691:51: sparse:     got unsigned int
>> drivers/usb/cdns3/gadget.c:679:6: sparse: sparse: symbol 'cdns3_wa1_restore_cycle_bit' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:903:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:903:35: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:903:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:919:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:919:29: sparse:     expected restricted __le32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:919:29: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:931:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] length @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:931:29: sparse:     expected restricted __le32 [usertype] length
   drivers/usb/cdns3/gadget.c:931:29: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:934:37: sparse: sparse: invalid assignment: |=
   drivers/usb/cdns3/gadget.c:934:37: sparse:    left side has type restricted __le32
   drivers/usb/cdns3/gadget.c:934:37: sparse:    right side has type unsigned long
>> drivers/usb/cdns3/gadget.c:956:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:956:38: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:956:38: sparse:     got unsigned int [assigned] [usertype] control
   drivers/usb/cdns3/gadget.c:958:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned int [assigned] [usertype] control @@
   drivers/usb/cdns3/gadget.c:958:48: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:958:48: sparse:     got unsigned int [assigned] [usertype] control
   drivers/usb/cdns3/gadget.c:972:30: sparse: sparse: invalid assignment: |=
   drivers/usb/cdns3/gadget.c:972:30: sparse:    left side has type restricted __le32
   drivers/usb/cdns3/gadget.c:972:30: sparse:    right side has type unsigned long
   drivers/usb/cdns3/gadget.c:981:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/gadget.c:981:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned int @@
   drivers/usb/cdns3/gadget.c:981:30: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:981:30: sparse:     got unsigned int
   drivers/usb/cdns3/gadget.c:1120:17: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/gadget.c:1169:21: sparse: sparse: restricted __le32 degrades to integer
>> drivers/usb/cdns3/gadget.c:1533:6: sparse: sparse: symbol 'cdns3_configure_dmult' was not declared. Should it be static?
   drivers/usb/cdns3/gadget.c:2126:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] buffer @@     got unsigned long long @@
   drivers/usb/cdns3/gadget.c:2126:34: sparse:     expected restricted __le32 [usertype] buffer
   drivers/usb/cdns3/gadget.c:2126:34: sparse:     got unsigned long long
   drivers/usb/cdns3/gadget.c:2128:46: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/gadget.c:2128:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2128:35: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:2128:35: sparse:     got unsigned long
   drivers/usb/cdns3/gadget.c:2186:43: sparse: sparse: restricted __le32 degrades to integer
   drivers/usb/cdns3/gadget.c:2186:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] control @@     got unsigned long @@
   drivers/usb/cdns3/gadget.c:2186:38: sparse:     expected restricted __le32 [usertype] control
   drivers/usb/cdns3/gadget.c:2186:38: sparse:     got unsigned long

vim +/cdns3_next_align_buf +123 drivers/usb/cdns3/gadget.c

7733f6c32e36ff Pawel Laszczak 2019-08-26  116  
7733f6c32e36ff Pawel Laszczak 2019-08-26  117  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  118   * cdns3_next_align_buf - returns next buffer from list
7733f6c32e36ff Pawel Laszczak 2019-08-26  119   * @list: list containing buffers
7733f6c32e36ff Pawel Laszczak 2019-08-26  120   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  121   * Returns buffer or NULL if no buffers in list
7733f6c32e36ff Pawel Laszczak 2019-08-26  122   */
7733f6c32e36ff Pawel Laszczak 2019-08-26 @123  struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
7733f6c32e36ff Pawel Laszczak 2019-08-26  124  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  125  	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
7733f6c32e36ff Pawel Laszczak 2019-08-26  126  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  127  
6bbf87a131edd3 Pawel Laszczak 2019-08-26  128  /**
6bbf87a131edd3 Pawel Laszczak 2019-08-26  129   * cdns3_next_priv_request - returns next request from list
6bbf87a131edd3 Pawel Laszczak 2019-08-26  130   * @list: list containing requests
6bbf87a131edd3 Pawel Laszczak 2019-08-26  131   *
6bbf87a131edd3 Pawel Laszczak 2019-08-26  132   * Returns request or NULL if no requests in list
6bbf87a131edd3 Pawel Laszczak 2019-08-26  133   */
6bbf87a131edd3 Pawel Laszczak 2019-08-26 @134  struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
6bbf87a131edd3 Pawel Laszczak 2019-08-26  135  {
6bbf87a131edd3 Pawel Laszczak 2019-08-26  136  	return list_first_entry_or_null(list, struct cdns3_request, list);
6bbf87a131edd3 Pawel Laszczak 2019-08-26  137  }
6bbf87a131edd3 Pawel Laszczak 2019-08-26  138  
7733f6c32e36ff Pawel Laszczak 2019-08-26  139  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  140   * select_ep - selects endpoint
7733f6c32e36ff Pawel Laszczak 2019-08-26  141   * @priv_dev:  extended gadget object
7733f6c32e36ff Pawel Laszczak 2019-08-26  142   * @ep: endpoint address
7733f6c32e36ff Pawel Laszczak 2019-08-26  143   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  144  void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  145  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  146  	if (priv_dev->selected_ep == ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  147  		return;
7733f6c32e36ff Pawel Laszczak 2019-08-26  148  
7733f6c32e36ff Pawel Laszczak 2019-08-26  149  	priv_dev->selected_ep = ep;
7733f6c32e36ff Pawel Laszczak 2019-08-26  150  	writel(ep, &priv_dev->regs->ep_sel);
7733f6c32e36ff Pawel Laszczak 2019-08-26  151  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  152  
7733f6c32e36ff Pawel Laszczak 2019-08-26  153  dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
7733f6c32e36ff Pawel Laszczak 2019-08-26  154  				 struct cdns3_trb *trb)
7733f6c32e36ff Pawel Laszczak 2019-08-26  155  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  156  	u32 offset = (char *)trb - (char *)priv_ep->trb_pool;
7733f6c32e36ff Pawel Laszczak 2019-08-26  157  
7733f6c32e36ff Pawel Laszczak 2019-08-26  158  	return priv_ep->trb_pool_dma + offset;
7733f6c32e36ff Pawel Laszczak 2019-08-26  159  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  160  
7733f6c32e36ff Pawel Laszczak 2019-08-26 @161  int cdns3_ring_size(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  162  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  163  	switch (priv_ep->type) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  164  	case USB_ENDPOINT_XFER_ISOC:
7733f6c32e36ff Pawel Laszczak 2019-08-26  165  		return TRB_ISO_RING_SIZE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  166  	case USB_ENDPOINT_XFER_CONTROL:
7733f6c32e36ff Pawel Laszczak 2019-08-26  167  		return TRB_CTRL_RING_SIZE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  168  	default:
7733f6c32e36ff Pawel Laszczak 2019-08-26  169  		return TRB_RING_SIZE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  170  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  171  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  172  
7733f6c32e36ff Pawel Laszczak 2019-08-26  173  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  174   * cdns3_allocate_trb_pool - Allocates TRB's pool for selected endpoint
7733f6c32e36ff Pawel Laszczak 2019-08-26  175   * @priv_ep:  endpoint object
7733f6c32e36ff Pawel Laszczak 2019-08-26  176   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  177   * Function will return 0 on success or -ENOMEM on allocation error
7733f6c32e36ff Pawel Laszczak 2019-08-26  178   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  179  int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  180  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  181  	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
7733f6c32e36ff Pawel Laszczak 2019-08-26  182  	int ring_size = cdns3_ring_size(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  183  	struct cdns3_trb *link_trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  184  
7733f6c32e36ff Pawel Laszczak 2019-08-26  185  	if (!priv_ep->trb_pool) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  186  		priv_ep->trb_pool = dma_alloc_coherent(priv_dev->sysdev,
7733f6c32e36ff Pawel Laszczak 2019-08-26  187  						       ring_size,
7733f6c32e36ff Pawel Laszczak 2019-08-26  188  						       &priv_ep->trb_pool_dma,
7733f6c32e36ff Pawel Laszczak 2019-08-26  189  						       GFP_DMA32 | GFP_ATOMIC);
7733f6c32e36ff Pawel Laszczak 2019-08-26  190  		if (!priv_ep->trb_pool)
7733f6c32e36ff Pawel Laszczak 2019-08-26  191  			return -ENOMEM;
7733f6c32e36ff Pawel Laszczak 2019-08-26  192  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  193  
961bfe1277ae71 Sasha Levin    2020-08-28  194  	memset(priv_ep->trb_pool, 0, ring_size);
961bfe1277ae71 Sasha Levin    2020-08-28  195  
7733f6c32e36ff Pawel Laszczak 2019-08-26  196  	if (!priv_ep->num)
7733f6c32e36ff Pawel Laszczak 2019-08-26  197  		return 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  198  
7733f6c32e36ff Pawel Laszczak 2019-08-26  199  	priv_ep->num_trbs = ring_size / TRB_SIZE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  200  	/* Initialize the last TRB as Link TRB. */
7733f6c32e36ff Pawel Laszczak 2019-08-26  201  	link_trb = (priv_ep->trb_pool + (priv_ep->num_trbs - 1));
7733f6c32e36ff Pawel Laszczak 2019-08-26 @202  	link_trb->buffer = TRB_BUFFER(priv_ep->trb_pool_dma);
7733f6c32e36ff Pawel Laszczak 2019-08-26 @203  	link_trb->control = TRB_CYCLE | TRB_TYPE(TRB_LINK) | TRB_TOGGLE;
7733f6c32e36ff Pawel Laszczak 2019-08-26  204  
7733f6c32e36ff Pawel Laszczak 2019-08-26  205  	return 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  206  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  207  
7733f6c32e36ff Pawel Laszczak 2019-08-26  208  static void cdns3_free_trb_pool(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  209  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  210  	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
7733f6c32e36ff Pawel Laszczak 2019-08-26  211  
7733f6c32e36ff Pawel Laszczak 2019-08-26  212  	if (priv_ep->trb_pool) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  213  		dma_free_coherent(priv_dev->sysdev,
7733f6c32e36ff Pawel Laszczak 2019-08-26  214  				  cdns3_ring_size(priv_ep),
7733f6c32e36ff Pawel Laszczak 2019-08-26  215  				  priv_ep->trb_pool, priv_ep->trb_pool_dma);
7733f6c32e36ff Pawel Laszczak 2019-08-26  216  		priv_ep->trb_pool = NULL;
7733f6c32e36ff Pawel Laszczak 2019-08-26  217  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  218  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  219  
7733f6c32e36ff Pawel Laszczak 2019-08-26  220  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  221   * cdns3_ep_stall_flush - Stalls and flushes selected endpoint
7733f6c32e36ff Pawel Laszczak 2019-08-26  222   * @priv_ep: endpoint object
7733f6c32e36ff Pawel Laszczak 2019-08-26  223   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  224   * Endpoint must be selected before call to this function
7733f6c32e36ff Pawel Laszczak 2019-08-26  225   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  226  static void cdns3_ep_stall_flush(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  227  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  228  	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
7733f6c32e36ff Pawel Laszczak 2019-08-26  229  	int val;
7733f6c32e36ff Pawel Laszczak 2019-08-26  230  
7733f6c32e36ff Pawel Laszczak 2019-08-26  231  	trace_cdns3_halt(priv_ep, 1, 1);
7733f6c32e36ff Pawel Laszczak 2019-08-26  232  
7733f6c32e36ff Pawel Laszczak 2019-08-26  233  	writel(EP_CMD_DFLUSH | EP_CMD_ERDY | EP_CMD_SSTALL,
7733f6c32e36ff Pawel Laszczak 2019-08-26  234  	       &priv_dev->regs->ep_cmd);
7733f6c32e36ff Pawel Laszczak 2019-08-26  235  
7733f6c32e36ff Pawel Laszczak 2019-08-26  236  	/* wait for DFLUSH cleared */
7733f6c32e36ff Pawel Laszczak 2019-08-26  237  	readl_poll_timeout_atomic(&priv_dev->regs->ep_cmd, val,
7733f6c32e36ff Pawel Laszczak 2019-08-26  238  				  !(val & EP_CMD_DFLUSH), 1, 1000);
7733f6c32e36ff Pawel Laszczak 2019-08-26  239  	priv_ep->flags |= EP_STALLED;
7733f6c32e36ff Pawel Laszczak 2019-08-26  240  	priv_ep->flags &= ~EP_STALL_PENDING;
7733f6c32e36ff Pawel Laszczak 2019-08-26  241  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  242  
7733f6c32e36ff Pawel Laszczak 2019-08-26  243  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  244   * cdns3_hw_reset_eps_config - reset endpoints configuration kept by controller.
7733f6c32e36ff Pawel Laszczak 2019-08-26  245   * @priv_dev: extended gadget object
7733f6c32e36ff Pawel Laszczak 2019-08-26  246   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  247  void cdns3_hw_reset_eps_config(struct cdns3_device *priv_dev)
7733f6c32e36ff Pawel Laszczak 2019-08-26  248  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  249  	writel(USB_CONF_CFGRST, &priv_dev->regs->usb_conf);
7733f6c32e36ff Pawel Laszczak 2019-08-26  250  
7733f6c32e36ff Pawel Laszczak 2019-08-26  251  	cdns3_allow_enable_l1(priv_dev, 0);
7733f6c32e36ff Pawel Laszczak 2019-08-26  252  	priv_dev->hw_configured_flag = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  253  	priv_dev->onchip_used_size = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  254  	priv_dev->out_mem_is_allocated = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  255  	priv_dev->wait_for_setup = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  256  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  257  
7733f6c32e36ff Pawel Laszczak 2019-08-26  258  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  259   * cdns3_ep_inc_trb - increment a trb index.
7733f6c32e36ff Pawel Laszczak 2019-08-26  260   * @index: Pointer to the TRB index to increment.
7733f6c32e36ff Pawel Laszczak 2019-08-26  261   * @cs: Cycle state
7733f6c32e36ff Pawel Laszczak 2019-08-26  262   * @trb_in_seg: number of TRBs in segment
7733f6c32e36ff Pawel Laszczak 2019-08-26  263   *
7733f6c32e36ff Pawel Laszczak 2019-08-26  264   * The index should never point to the link TRB. After incrementing,
7733f6c32e36ff Pawel Laszczak 2019-08-26  265   * if it is point to the link TRB, wrap around to the beginning and revert
7733f6c32e36ff Pawel Laszczak 2019-08-26  266   * cycle state bit The
7733f6c32e36ff Pawel Laszczak 2019-08-26  267   * link TRB is always at the last TRB entry.
7733f6c32e36ff Pawel Laszczak 2019-08-26  268   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  269  static void cdns3_ep_inc_trb(int *index, u8 *cs, int trb_in_seg)
7733f6c32e36ff Pawel Laszczak 2019-08-26  270  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  271  	(*index)++;
7733f6c32e36ff Pawel Laszczak 2019-08-26  272  	if (*index == (trb_in_seg - 1)) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  273  		*index = 0;
7733f6c32e36ff Pawel Laszczak 2019-08-26  274  		*cs ^=  1;
7733f6c32e36ff Pawel Laszczak 2019-08-26  275  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  276  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  277  
7733f6c32e36ff Pawel Laszczak 2019-08-26  278  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  279   * cdns3_ep_inc_enq - increment endpoint's enqueue pointer
7733f6c32e36ff Pawel Laszczak 2019-08-26  280   * @priv_ep: The endpoint whose enqueue pointer we're incrementing
7733f6c32e36ff Pawel Laszczak 2019-08-26  281   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  282  static void cdns3_ep_inc_enq(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  283  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  284  	priv_ep->free_trbs--;
7733f6c32e36ff Pawel Laszczak 2019-08-26  285  	cdns3_ep_inc_trb(&priv_ep->enqueue, &priv_ep->pcs, priv_ep->num_trbs);
7733f6c32e36ff Pawel Laszczak 2019-08-26  286  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  287  
7733f6c32e36ff Pawel Laszczak 2019-08-26  288  /**
7733f6c32e36ff Pawel Laszczak 2019-08-26  289   * cdns3_ep_inc_deq - increment endpoint's dequeue pointer
7733f6c32e36ff Pawel Laszczak 2019-08-26  290   * @priv_ep: The endpoint whose dequeue pointer we're incrementing
7733f6c32e36ff Pawel Laszczak 2019-08-26  291   */
7733f6c32e36ff Pawel Laszczak 2019-08-26  292  static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
7733f6c32e36ff Pawel Laszczak 2019-08-26  293  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  294  	priv_ep->free_trbs++;
7733f6c32e36ff Pawel Laszczak 2019-08-26  295  	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs, priv_ep->num_trbs);
7733f6c32e36ff Pawel Laszczak 2019-08-26  296  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  297  
7733f6c32e36ff Pawel Laszczak 2019-08-26 @298  void cdns3_move_deq_to_next_trb(struct cdns3_request *priv_req)
7733f6c32e36ff Pawel Laszczak 2019-08-26  299  {
7733f6c32e36ff Pawel Laszczak 2019-08-26  300  	struct cdns3_endpoint *priv_ep = priv_req->priv_ep;
7733f6c32e36ff Pawel Laszczak 2019-08-26  301  	int current_trb = priv_req->start_trb;
7733f6c32e36ff Pawel Laszczak 2019-08-26  302  
7733f6c32e36ff Pawel Laszczak 2019-08-26  303  	while (current_trb != priv_req->end_trb) {
7733f6c32e36ff Pawel Laszczak 2019-08-26  304  		cdns3_ep_inc_deq(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  305  		current_trb = priv_ep->dequeue;
7733f6c32e36ff Pawel Laszczak 2019-08-26  306  	}
7733f6c32e36ff Pawel Laszczak 2019-08-26  307  
7733f6c32e36ff Pawel Laszczak 2019-08-26  308  	cdns3_ep_inc_deq(priv_ep);
7733f6c32e36ff Pawel Laszczak 2019-08-26  309  }
7733f6c32e36ff Pawel Laszczak 2019-08-26  310  

:::::: The code at line 123 was first introduced by commit
:::::: 7733f6c32e36ff9d7adadf40001039bf219b1cbe usb: cdns3: Add Cadence USB3 DRD Driver

:::::: TO: Pawel Laszczak <pawell@cadence.com>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
