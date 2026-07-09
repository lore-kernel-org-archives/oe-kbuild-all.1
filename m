Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B152F369980
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557452; cv=none; b=FGVu7aM8fIOs+Z7v40T2cI2Ac3KguVIhQrp0p1vLevAr0upxo2PxCvfrRfGv9IgyoDuf3HgeKRi73030Ps0egH1TfoU3494xZI5PJPf0gnz1t8JLAfSh0ilVrCJ0iLrWWV67KmR8Wz89+t6gQVrEtVwfZ0XLkcKepJWsRB4jgfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557452; c=relaxed/simple;
	bh=GRlrqMX668vhekYvA+xCrMqElB/hSnMLJL3P0KfIimo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hvQhrAVTD13ZXUZoDp/X6sO35YPA0DMOFQLDdn7gOn7RasZLwO4USS3og9c1LsXGfk/waX2d/YZHzDOEGaMPXq71KophBkvschDb5yLnd+aaiVTwSj3vt1e/cp6auoBuXmBK7EL0mnD/IP4h2Y0FSksmLHz9yQF5f17kGbJMkHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQBYUd6r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQBYUd6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783557451; x=1815093451;
  h=date:from:to:cc:subject:message-id;
  bh=GRlrqMX668vhekYvA+xCrMqElB/hSnMLJL3P0KfIimo=;
  b=iQBYUd6rmpWHmthNlMhi2hXjYCwUWp9T0CVTfLxIz+Zk1Ht5HTfc/evX
   JAyv6FZowhV2fA8cZ0FyPkHgnWj0BoZbOBj5bsxNGOlc3BAnExtqcECL4
   hMIT+ZPp9jKvxUrllUg6rjUSiBEFMHt9hNIXLTWyUj3llY2Zobph/FExr
   obXgA3M6S/iIhKOj00p1lPNEVfqlTjMOB3G4j8mt6gYClGH/ezrYML9O6
   QFaXQHHWNUEfIjcHiHs8Z7e4TYt0t6t/fByLd9WTBtNSl3yfbgVmDrIpL
   /H+kryhjaITxigL4xCN5AvHZit66fqytZlZEUUPSVLAo6hiEzN+PAKY+B
   w==;
X-CSE-ConnectionGUID: xZhZCig5RdaTxcFs6KuCtA==
X-CSE-MsgGUID: w7SYAnA5SPuYCh8mMwuEvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88145863"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88145863"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 17:37:29 -0700
X-CSE-ConnectionGUID: ia7YVYsBRNiWecK7E0uwdA==
X-CSE-MsgGUID: Pl8bE/l7Tn+L0kDl7bX62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258731616"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2026 17:37:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whclY-00000000H4v-2MZU;
	Thu, 09 Jul 2026 00:37:24 +0000
Date: Thu, 09 Jul 2026 08:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct
 member 'notify_client' not described in 'xhci_sideband_register'
Message-ID: <202607090805.SBQbUakl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6417b973d924236b080ef26fbfee42586a7b3704
commit: 551a5598eaf310b6665a31d28e1199f58f939c08 [1/1] FROMLIST: usb: host: xhci: Notify xHCI sideband on transfer ring free
config: x86_64-buildonly-randconfig-002-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090805.SBQbUakl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090805.SBQbUakl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090805.SBQbUakl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'
>> drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'notify_client' not described in 'xhci_sideband_register'


vim +372 drivers/usb/host/xhci-sideband.c

7b946a32948f90b Mathias Nyman 2023-02-06  358  
7b946a32948f90b Mathias Nyman 2023-02-06  359  /**
7b946a32948f90b Mathias Nyman 2023-02-06  360   * xhci_sideband_register - register a sideband for a usb device
7b946a32948f90b Mathias Nyman 2023-02-06  361   * @intf: usb interface associated with the sideband device
7b946a32948f90b Mathias Nyman 2023-02-06  362   *
7b946a32948f90b Mathias Nyman 2023-02-06  363   * Allows for clients to utilize XHCI interrupters and fetch transfer and event
7b946a32948f90b Mathias Nyman 2023-02-06  364   * ring parameters for executing data transfers.
7b946a32948f90b Mathias Nyman 2023-02-06  365   *
7b946a32948f90b Mathias Nyman 2023-02-06  366   * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
7b946a32948f90b Mathias Nyman 2023-02-06  367   */
7b946a32948f90b Mathias Nyman 2023-02-06  368  struct xhci_sideband *
551a5598eaf310b Wesley Cheng  2025-01-28  369  xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
551a5598eaf310b Wesley Cheng  2025-01-28  370  		       int (*notify_client)(struct usb_interface *intf,
551a5598eaf310b Wesley Cheng  2025-01-28  371  				    struct xhci_sideband_event *evt))
7b946a32948f90b Mathias Nyman 2023-02-06 @372  {
7b946a32948f90b Mathias Nyman 2023-02-06  373  	struct usb_device *udev = interface_to_usbdev(intf);
7b946a32948f90b Mathias Nyman 2023-02-06  374  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
7b946a32948f90b Mathias Nyman 2023-02-06  375  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
7b946a32948f90b Mathias Nyman 2023-02-06  376  	struct xhci_virt_device *vdev;
7b946a32948f90b Mathias Nyman 2023-02-06  377  	struct xhci_sideband *sb;
7b946a32948f90b Mathias Nyman 2023-02-06  378  
7b946a32948f90b Mathias Nyman 2023-02-06  379  	/*
7b946a32948f90b Mathias Nyman 2023-02-06  380  	 * Make sure the usb device is connected to a xhci controller.  Fail
7b946a32948f90b Mathias Nyman 2023-02-06  381  	 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
7b946a32948f90b Mathias Nyman 2023-02-06  382  	 * as this is the only type that is currently supported by xhci-sideband.
7b946a32948f90b Mathias Nyman 2023-02-06  383  	 */
7b946a32948f90b Mathias Nyman 2023-02-06  384  	if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
7b946a32948f90b Mathias Nyman 2023-02-06  385  		return NULL;
7b946a32948f90b Mathias Nyman 2023-02-06  386  
7b946a32948f90b Mathias Nyman 2023-02-06  387  	sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
7b946a32948f90b Mathias Nyman 2023-02-06  388  	if (!sb)
7b946a32948f90b Mathias Nyman 2023-02-06  389  		return NULL;
7b946a32948f90b Mathias Nyman 2023-02-06  390  
7b946a32948f90b Mathias Nyman 2023-02-06  391  	mutex_init(&sb->mutex);
7b946a32948f90b Mathias Nyman 2023-02-06  392  
7b946a32948f90b Mathias Nyman 2023-02-06  393  	/* check this device isn't already controlled via sideband */
7b946a32948f90b Mathias Nyman 2023-02-06  394  	spin_lock_irq(&xhci->lock);
7b946a32948f90b Mathias Nyman 2023-02-06  395  
7b946a32948f90b Mathias Nyman 2023-02-06  396  	vdev = xhci->devs[udev->slot_id];
7b946a32948f90b Mathias Nyman 2023-02-06  397  
7b946a32948f90b Mathias Nyman 2023-02-06  398  	if (!vdev || vdev->sideband) {
7b946a32948f90b Mathias Nyman 2023-02-06  399  		xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
7b946a32948f90b Mathias Nyman 2023-02-06  400  			  udev->slot_id);
7b946a32948f90b Mathias Nyman 2023-02-06  401  		spin_unlock_irq(&xhci->lock);
7b946a32948f90b Mathias Nyman 2023-02-06  402  		kfree(sb);
7b946a32948f90b Mathias Nyman 2023-02-06  403  		return NULL;
7b946a32948f90b Mathias Nyman 2023-02-06  404  	}
7b946a32948f90b Mathias Nyman 2023-02-06  405  
7b946a32948f90b Mathias Nyman 2023-02-06  406  	sb->xhci = xhci;
7b946a32948f90b Mathias Nyman 2023-02-06  407  	sb->vdev = vdev;
7b946a32948f90b Mathias Nyman 2023-02-06  408  	sb->intf = intf;
7b946a32948f90b Mathias Nyman 2023-02-06  409  	sb->type = type;
551a5598eaf310b Wesley Cheng  2025-01-28  410  	sb->notify_client = notify_client;
7b946a32948f90b Mathias Nyman 2023-02-06  411  	vdev->sideband = sb;
7b946a32948f90b Mathias Nyman 2023-02-06  412  
7b946a32948f90b Mathias Nyman 2023-02-06  413  	spin_unlock_irq(&xhci->lock);
7b946a32948f90b Mathias Nyman 2023-02-06  414  
7b946a32948f90b Mathias Nyman 2023-02-06  415  	return sb;
7b946a32948f90b Mathias Nyman 2023-02-06  416  }
7b946a32948f90b Mathias Nyman 2023-02-06  417  EXPORT_SYMBOL_GPL(xhci_sideband_register);
7b946a32948f90b Mathias Nyman 2023-02-06  418  

:::::: The code at line 372 was first introduced by commit
:::::: 7b946a32948f90b198e3e51c824576458ceda3a4 FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Neill Kapron <nkapron@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
