Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F69443
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037611; cv=none; b=YYKT0OxlqHZxTm3nipv246T0qZX/tqNvMicmqA48umQ4iGyq4r1XIiSov/WkqGJ07c3xxgN6k/OZY40mYzXFuWGLGMPNWIiG7VmSqrImQ8CXhNVuNAS8udbLC9DyD3QjtBrhnAwdWWJAvJsKbLn/ogPrRnmy1V2TyKn2imBWs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037611; c=relaxed/simple;
	bh=oYYOnOXdn0GX+o6EqVygQDxxbbM/WbjRNzk1x6naRaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TqvXh8E6+ZOBRG3smzTHaSuKRC+zxExuvEjS2Vvb1LqmpNjTK5ZIrdnAenAMl2UXn82//m5l/RzXSCxwRnOdQ1CarsipeYpce4hSpXY/FLy1glmA2uvtnJDl7gMnoFHbv9Qustvri/7vzR/r+s20HmrNkCTDrFW/CQZ7N285ML0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXy8M2WA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXy8M2WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751037610; x=1782573610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYYOnOXdn0GX+o6EqVygQDxxbbM/WbjRNzk1x6naRaI=;
  b=GXy8M2WAsT7QmhfumNTCuw8WdCMZeJhp4AhnKtbPYYkfy98eZWbAva3w
   sS4lpbh8QH9bYYJkw0Nt6+WupsN0LDNUdPyPnXbLBtoprB5sGGVGerpld
   3Ygxa8/szvmE8gEKrb8dc696aPDcZsxHDyKxR1bFySro2CZWly8vNeye2
   /sdDPHFdmuTMOT/FDxRO+RXuVlCJ5c+LmBwqVUQS99XSPVtdhhTkAK4gs
   B6ARNbok/zzN4LEEVOuDvGxxS1+umoEVK3vs75LJMZUhyTNhxk8HEOR0e
   ptPcpVNkZLuVj18amGUTRZcVLlvjzGHn8Xi12AcHyB0Rxsbkoks3VZIa1
   w==;
X-CSE-ConnectionGUID: EJNI9t6RQAuldPoUAnE2Nw==
X-CSE-MsgGUID: OvNQWEpXSuyd2kN5H9D5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53449957"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53449957"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 08:20:09 -0700
X-CSE-ConnectionGUID: lSgWr0O1TJGVh5FT4OkSKw==
X-CSE-MsgGUID: 9oYJKmEjSoqqDndOLQxdrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152444861"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 27 Jun 2025 08:20:08 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVAs1-0000gd-1d;
	Fri, 27 Jun 2025 15:20:05 +0000
Date: Fri, 27 Jun 2025 17:19:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct
 member 'notify_client' not described in 'xhci_sideband_register'
Message-ID: <202506271754.ZQ5p1ODq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   0144e2490a70c3551bfb173921278f21d8255d44
commit: b7f481d533d071f4d6d6b1480323e50f995efbbe [0/2] FROMGIT: usb: host: xhci: Notify xHCI sideband on transfer ring free
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250627/202506271754.ZQ5p1ODq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271754.ZQ5p1ODq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271754.ZQ5p1ODq-lkp@intel.com/

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
