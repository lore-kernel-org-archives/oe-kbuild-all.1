Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972792EB87D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765572692; cv=none; b=A2PbaONZapIlKuhtrKIfUV8P2eO7ZNkxDOye3N2/iHzEPVuR1BZZLNAKqWvlNexV/WLNB51dJoPLYsi8b5hOsE62Iotr61z/uLlHGAiCI1gquzh9+l2R/zfc5+WJfIbo6rqARMzmmvU/Bp62UaFrCYilc1L7qnAkiKWCEYz7VbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765572692; c=relaxed/simple;
	bh=6QacTFhkvAxswQtoQiO8pf+Y9qk8aNyhSQcliQffPok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lGZXm4WYZHLvrtdgbKc6BcrOtbS74EVHFRusEPSn8locyS47R67hR/4pEJcebHcwt2nkLetiPBVq/m/UonnLTaujEkY6/vjcIMLfByJ2K2UMYxray1gd3HssjveydebZCjyylh54Kcu9WzdXT5zkAz7syV9MnYaNcYcCZj9ruTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5i8+4kg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5i8+4kg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765572691; x=1797108691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QacTFhkvAxswQtoQiO8pf+Y9qk8aNyhSQcliQffPok=;
  b=C5i8+4kgITDFsDwvv22o6TVPeyaZ0ZLzSI2T6+6XPCpSUvu3p6kWgF2T
   Ymq91g3IPkJkdct0cDpc1se6YJfyTObo2MSGK+8bapCkgeBqngYo11MFH
   tYrZVtc3J4/oC1hqTl7mtyonGGC9YPNbet6hi96oXApbPN1uJuk5uhZ4M
   Q48hZs/QCy/v8LyywUgLwtgokdHd0f4oyJYMLq8l8YkCD5/ItalZ3d7WY
   ibw1V2x30DbOuo9/oCpjLKR8WCUJ3/cNohsHxhN8/SsGtRzpXWSYLqzSl
   rFDAlG4AHowVF0AikxFFVyIsMALGqPjtMsthipTKo/mXOb1EPewGCzgog
   g==;
X-CSE-ConnectionGUID: XHCWm54CSBiGd/V+ohBWgQ==
X-CSE-MsgGUID: +TJd6vaHRe+RP6VBwTAc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67653389"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67653389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:51:30 -0800
X-CSE-ConnectionGUID: eQZM6hJnRcGcKsESQ81cxw==
X-CSE-MsgGUID: kBwyXjErQLqa0bKnSTsShg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="198000801"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 12:51:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUA6o-000000006cD-3nrC;
	Fri, 12 Dec 2025 20:51:26 +0000
Date: Sat, 13 Dec 2025 04:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct
 member 'notify_client' not described in 'xhci_sideband_register'
Message-ID: <202512130426.U5UcerNL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: b7f481d533d071f4d6d6b1480323e50f995efbbe [0/5] FROMGIT: usb: host: xhci: Notify xHCI sideband on transfer ring free
config: i386-randconfig-052-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130426.U5UcerNL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130426.U5UcerNL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130426.U5UcerNL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'
>> drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'notify_client' not described in 'xhci_sideband_register'


vim +372 drivers/usb/host/xhci-sideband.c

8b9c57ce39a5a8 Mathias Nyman 2025-04-09  358  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  359  /**
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  360   * xhci_sideband_register - register a sideband for a usb device
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  361   * @intf: usb interface associated with the sideband device
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  362   *
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  363   * Allows for clients to utilize XHCI interrupters and fetch transfer and event
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  364   * ring parameters for executing data transfers.
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  365   *
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  366   * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  367   */
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  368  struct xhci_sideband *
b7f481d533d071 Wesley Cheng  2025-04-09  369  xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
b7f481d533d071 Wesley Cheng  2025-04-09  370  		       int (*notify_client)(struct usb_interface *intf,
b7f481d533d071 Wesley Cheng  2025-04-09  371  				    struct xhci_sideband_event *evt))
8b9c57ce39a5a8 Mathias Nyman 2025-04-09 @372  {
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  373  	struct usb_device *udev = interface_to_usbdev(intf);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  374  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  375  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  376  	struct xhci_virt_device *vdev;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  377  	struct xhci_sideband *sb;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  378  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  379  	/*
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  380  	 * Make sure the usb device is connected to a xhci controller.  Fail
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  381  	 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  382  	 * as this is the only type that is currently supported by xhci-sideband.
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  383  	 */
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  384  	if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  385  		return NULL;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  386  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  387  	sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  388  	if (!sb)
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  389  		return NULL;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  390  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  391  	mutex_init(&sb->mutex);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  392  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  393  	/* check this device isn't already controlled via sideband */
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  394  	spin_lock_irq(&xhci->lock);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  395  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  396  	vdev = xhci->devs[udev->slot_id];
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  397  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  398  	if (!vdev || vdev->sideband) {
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  399  		xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  400  			  udev->slot_id);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  401  		spin_unlock_irq(&xhci->lock);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  402  		kfree(sb);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  403  		return NULL;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  404  	}
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  405  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  406  	sb->xhci = xhci;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  407  	sb->vdev = vdev;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  408  	sb->intf = intf;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  409  	sb->type = type;
b7f481d533d071 Wesley Cheng  2025-04-09  410  	sb->notify_client = notify_client;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  411  	vdev->sideband = sb;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  412  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  413  	spin_unlock_irq(&xhci->lock);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  414  
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  415  	return sb;
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  416  }
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  417  EXPORT_SYMBOL_GPL(xhci_sideband_register);
8b9c57ce39a5a8 Mathias Nyman 2025-04-09  418  

:::::: The code at line 372 was first introduced by commit
:::::: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
