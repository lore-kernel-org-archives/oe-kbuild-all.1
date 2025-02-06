Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2A1FF5FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 08:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831074; cv=none; b=qCGntbSxiCBa8RF9RirTXnQbYuelF/12JP8aR9Ey1NHTL0pPCjcAC/cY3s1fPZUH1nNn3K5pw1PX4znssL2+bMRTUtXvmZj1PGKE/9KPwnFdjfuueEIZqkMPZlh20hvqo3+i7kngDwAcg4zG9CaHBIwv/Q/+X4jjliPUEjAwjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831074; c=relaxed/simple;
	bh=UeeJ0YfW++RJZcJOfs+CcEi3vfHFlt4pSLe/2oLblvM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjcjC6SnM78P1wy6fhZ26wXCNdTZyiurk4GQSj+HeBoOwIGojAO8KCNJrVVbX37yIyEseEfc5WpqqUasSqfVSHGZhdv6EQ8NB23b3DB0j1FpCgHhIpVRgYhdK2GLxi//M7k61mYVyd45LUVhW0rO3IqIQPeMU/Ttav9Gcoar1E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJq54x1f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJq54x1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738831071; x=1770367071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UeeJ0YfW++RJZcJOfs+CcEi3vfHFlt4pSLe/2oLblvM=;
  b=IJq54x1fSf2NXkPSPmN9Y0Tvhui7IqXxiN5jEUzFYOkkY5+8nvSB6282
   p4o/eFW3Y+wD9Am+viW3AGI4yfGsHoYHxQZKGZWoRB4Er8HCCxh4G4Cb6
   HfSCumXG1M8fuz0DQ52/Kjevm2+YcEERSA3ju9Sv4hL69laFut9vDNKLc
   5K5/q+tm1ynPwIi/QDSSdsOVVwnq5JoRCPGGDw0MEfLgEFIqpt9LAWENT
   7Cs6DDjT9nlovkIzIizeyujajfqdp8Qpg0MMxWaVOGmzTfQcei2UtXtgy
   K3OjUOnjDfyPTJ+OduNwGaTxrqiqZWe8VegpIkckNy0TayuqhdIMjyKLu
   w==;
X-CSE-ConnectionGUID: DXY++BJxQcqWYJA15PV5wg==
X-CSE-MsgGUID: LQNhwspfRNCxvouD74Yy2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="49667660"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="49667660"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 00:37:50 -0800
X-CSE-ConnectionGUID: vbmGbxQgSeWitR4klweYiA==
X-CSE-MsgGUID: asqLH+O7RKOFytX0+Y827Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="110978626"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2025 00:37:49 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfxOM-000wdn-27;
	Thu, 06 Feb 2025 08:37:46 +0000
Date: Thu, 6 Feb 2025 16:37:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct
 member 'notify_client' not described in 'xhci_sideband_register'
Message-ID: <202502061649.PMOqgDM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   6550429f8dbead9ef7fc53fbabc5c985b491a9eb
commit: 551a5598eaf310b6665a31d28e1199f58f939c08 [0/3] FROMLIST: usb: host: xhci: Notify xHCI sideband on transfer ring free
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502061649.PMOqgDM3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061649.PMOqgDM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061649.PMOqgDM3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:287: warning: Function parameter or struct member 'intr_num' not described in 'xhci_sideband_create_interrupter'
   drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'
>> drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct member 'notify_client' not described in 'xhci_sideband_register'


vim +372 drivers/usb/host/xhci-sideband.c

7b946a32948f90 Mathias Nyman 2023-02-06  358  
7b946a32948f90 Mathias Nyman 2023-02-06  359  /**
7b946a32948f90 Mathias Nyman 2023-02-06  360   * xhci_sideband_register - register a sideband for a usb device
7b946a32948f90 Mathias Nyman 2023-02-06  361   * @intf: usb interface associated with the sideband device
7b946a32948f90 Mathias Nyman 2023-02-06  362   *
7b946a32948f90 Mathias Nyman 2023-02-06  363   * Allows for clients to utilize XHCI interrupters and fetch transfer and event
7b946a32948f90 Mathias Nyman 2023-02-06  364   * ring parameters for executing data transfers.
7b946a32948f90 Mathias Nyman 2023-02-06  365   *
7b946a32948f90 Mathias Nyman 2023-02-06  366   * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
7b946a32948f90 Mathias Nyman 2023-02-06  367   */
7b946a32948f90 Mathias Nyman 2023-02-06  368  struct xhci_sideband *
551a5598eaf310 Wesley Cheng  2025-01-28  369  xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type,
551a5598eaf310 Wesley Cheng  2025-01-28  370  		       int (*notify_client)(struct usb_interface *intf,
551a5598eaf310 Wesley Cheng  2025-01-28  371  				    struct xhci_sideband_event *evt))
7b946a32948f90 Mathias Nyman 2023-02-06 @372  {
7b946a32948f90 Mathias Nyman 2023-02-06  373  	struct usb_device *udev = interface_to_usbdev(intf);
7b946a32948f90 Mathias Nyman 2023-02-06  374  	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
7b946a32948f90 Mathias Nyman 2023-02-06  375  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
7b946a32948f90 Mathias Nyman 2023-02-06  376  	struct xhci_virt_device *vdev;
7b946a32948f90 Mathias Nyman 2023-02-06  377  	struct xhci_sideband *sb;
7b946a32948f90 Mathias Nyman 2023-02-06  378  
7b946a32948f90 Mathias Nyman 2023-02-06  379  	/*
7b946a32948f90 Mathias Nyman 2023-02-06  380  	 * Make sure the usb device is connected to a xhci controller.  Fail
7b946a32948f90 Mathias Nyman 2023-02-06  381  	 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
7b946a32948f90 Mathias Nyman 2023-02-06  382  	 * as this is the only type that is currently supported by xhci-sideband.
7b946a32948f90 Mathias Nyman 2023-02-06  383  	 */
7b946a32948f90 Mathias Nyman 2023-02-06  384  	if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
7b946a32948f90 Mathias Nyman 2023-02-06  385  		return NULL;
7b946a32948f90 Mathias Nyman 2023-02-06  386  
7b946a32948f90 Mathias Nyman 2023-02-06  387  	sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
7b946a32948f90 Mathias Nyman 2023-02-06  388  	if (!sb)
7b946a32948f90 Mathias Nyman 2023-02-06  389  		return NULL;
7b946a32948f90 Mathias Nyman 2023-02-06  390  
7b946a32948f90 Mathias Nyman 2023-02-06  391  	mutex_init(&sb->mutex);
7b946a32948f90 Mathias Nyman 2023-02-06  392  
7b946a32948f90 Mathias Nyman 2023-02-06  393  	/* check this device isn't already controlled via sideband */
7b946a32948f90 Mathias Nyman 2023-02-06  394  	spin_lock_irq(&xhci->lock);
7b946a32948f90 Mathias Nyman 2023-02-06  395  
7b946a32948f90 Mathias Nyman 2023-02-06  396  	vdev = xhci->devs[udev->slot_id];
7b946a32948f90 Mathias Nyman 2023-02-06  397  
7b946a32948f90 Mathias Nyman 2023-02-06  398  	if (!vdev || vdev->sideband) {
7b946a32948f90 Mathias Nyman 2023-02-06  399  		xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
7b946a32948f90 Mathias Nyman 2023-02-06  400  			  udev->slot_id);
7b946a32948f90 Mathias Nyman 2023-02-06  401  		spin_unlock_irq(&xhci->lock);
7b946a32948f90 Mathias Nyman 2023-02-06  402  		kfree(sb);
7b946a32948f90 Mathias Nyman 2023-02-06  403  		return NULL;
7b946a32948f90 Mathias Nyman 2023-02-06  404  	}
7b946a32948f90 Mathias Nyman 2023-02-06  405  
7b946a32948f90 Mathias Nyman 2023-02-06  406  	sb->xhci = xhci;
7b946a32948f90 Mathias Nyman 2023-02-06  407  	sb->vdev = vdev;
7b946a32948f90 Mathias Nyman 2023-02-06  408  	sb->intf = intf;
7b946a32948f90 Mathias Nyman 2023-02-06  409  	sb->type = type;
551a5598eaf310 Wesley Cheng  2025-01-28  410  	sb->notify_client = notify_client;
7b946a32948f90 Mathias Nyman 2023-02-06  411  	vdev->sideband = sb;
7b946a32948f90 Mathias Nyman 2023-02-06  412  
7b946a32948f90 Mathias Nyman 2023-02-06  413  	spin_unlock_irq(&xhci->lock);
7b946a32948f90 Mathias Nyman 2023-02-06  414  
7b946a32948f90 Mathias Nyman 2023-02-06  415  	return sb;
7b946a32948f90 Mathias Nyman 2023-02-06  416  }
7b946a32948f90 Mathias Nyman 2023-02-06  417  EXPORT_SYMBOL_GPL(xhci_sideband_register);
7b946a32948f90 Mathias Nyman 2023-02-06  418  

:::::: The code at line 372 was first introduced by commit
:::::: 7b946a32948f90b198e3e51c824576458ceda3a4 FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity

:::::: TO: Mathias Nyman <mathias.nyman@linux.intel.com>
:::::: CC: Neill Kapron <nkapron@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
