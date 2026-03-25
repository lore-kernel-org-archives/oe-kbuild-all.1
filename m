Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401A33509B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774429749; cv=none; b=Wv50MBt7H+PXEvehZEXqXgXWnDBOHZnu3/mvRjqJ1kw6tyQkzEnJ3LsF8oLWtrkPUr5afCbT56gnrXPpX8IK/iQTf2Z1SmvRUX39xUQkf6lbnMqOAfjp6RdnEXIkUsVup6Oy3xaJ6JZx5QbdWZroAcgG+f6SF5hZDh6va3tygJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774429749; c=relaxed/simple;
	bh=S6JQ6jPBXvbqwGwByosctpssvJZtmTtSr2eeKl920yU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rOMkgjeHSeyISWGHXB7Pbmg1QOobdf0vzCFAyZERU3UL3knKbrbhQYQA7nGXQUHai93k+qulw8+/UK9mC54I2Uzoqo/KFHXCHdO8yUIS4ygcv5bsZRhCVJag3MBB1p2cP4NzN+FqhEl0pMbMaW82udWsRZXwPAyODF/koD7Cqow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlPtvAr9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlPtvAr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774429748; x=1805965748;
  h=date:from:to:cc:subject:message-id;
  bh=S6JQ6jPBXvbqwGwByosctpssvJZtmTtSr2eeKl920yU=;
  b=QlPtvAr9OcsONivPZzlZJdlwHFDVHuEMNfn+xv4LJ9IvTS/TPKLzTBX4
   PRYPsDMCbR9qIFRc479uRSR3zAYfMpQIRORLOqkNFnFyh73/rrLKMeim9
   bUaR97Azc84nEglYtInK7FC/LFZG3tHRAfVqdk8qiMfAbGz/kGPnN/zhk
   JIezezzbhfPsOINshm/stw1V9Rbd69m0NL1tir9CZ3aStXPOkyd8arWlU
   c9mhb7Wfn0Aopg5dISaPVUrGitRnWjoQHdY2YAo6ps6kd+85wGOQjKZBV
   iQUs0rOKG9T7Mc8IrH5+Idzs3ObcbS4nceLOzEqX/NKOb+zBeDsTWrZmb
   w==;
X-CSE-ConnectionGUID: YQKdsOOmR92fArCZ6nFeIQ==
X-CSE-MsgGUID: pb+wxb/+SAOfQyOOSO5CWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79368184"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="79368184"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 02:09:07 -0700
X-CSE-ConnectionGUID: GRWNMjUzR4+sXCuMEl/qYw==
X-CSE-MsgGUID: mmAVUPFwT4K2pn1I0zrErw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="223682538"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Mar 2026 02:09:06 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5KEZ-000000006YD-1cYo;
	Wed, 25 Mar 2026 09:09:03 +0000
Date: Wed, 25 Mar 2026 17:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/usb/host/xhci-sideband.c:372: warning: Function parameter or struct
 member 'notify_client' not described in 'xhci_sideband_register'
Message-ID: <202603251706.MJixdrwK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Wesley,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: b7f481d533d071f4d6d6b1480323e50f995efbbe [44/44] FROMGIT: usb: host: xhci: Notify xHCI sideband on transfer ring free
config: arm64-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251706.MJixdrwK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251706.MJixdrwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251706.MJixdrwK-lkp@intel.com/

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
