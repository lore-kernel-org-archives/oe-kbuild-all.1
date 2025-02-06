Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348501F60A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738821276; cv=none; b=WmRL4k+FAQ3qlSmJDTxJZsRwwqrRSrX/H1d2O8guW5xNL2WoGIimk2+a+exT5+3//BdLjS/sN4q1/z855nE5aB6f9W0Tg7Dk5JXMhYbJcJy9iDUZXg4/kEErBnOpMqsutTklon5vzjlz1E4Ro+a0RcLtXJ1tOTeBsu4vtGnL+r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738821276; c=relaxed/simple;
	bh=EwIq6rBSS4y3FUgr9DqklvmHfS9GvXu1R+zSyplR3e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7/O0QI853yfPjyseY8DDxrvhUZYppBH8U6c3eDLnRADxcdB8wyqhPq5KoV0T6ZX/p7Qya+KDdH0Wb3uySnAsxHQmSoJer6DqT6OpaNP7MEYfl+Nuf9XNPAabegKTAcidIB0gKTcGb9CXsYcWcm/eanXMYMNZ08e2/1uUYUhGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VGCXbysO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VGCXbysO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738821275; x=1770357275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EwIq6rBSS4y3FUgr9DqklvmHfS9GvXu1R+zSyplR3e4=;
  b=VGCXbysOoA5D2GQ4sAK6QSnyqNDLfeduIVBOf3vld74zfVccCsdEOOsQ
   u0nEB2rGtXQJufvoF4cQfKfsPri0eIqci5WVvQ8mg1C+twcxDy6EHp7M+
   YdTYikqZiahFCL3F8VzkuTNNitz6MWcSw42NuDxppy161Wk3QjS7HBnim
   WF4M329gcqRszUNmKWYRjMvCqhkvOV8C05P0wN3EIat/zVV+zXnA1eajZ
   LpQYhAVwtsYy/VYL9hHLf2Gdlnwtsk+XS1PIi51ePCzTqvHBJZD01kNTi
   C2Nouk31h2SjXVDxjgzii1dTtSoFqXxeM3ZWYZ3e2XFClAQ52x2TKC0+O
   A==;
X-CSE-ConnectionGUID: G966igYbQYGFpjZT24u2RQ==
X-CSE-MsgGUID: Y3bmtygPTO2IbqCNRAslqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="43165454"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="43165454"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 21:54:34 -0800
X-CSE-ConnectionGUID: 9CTfqhnLTyuu7lX5su5EKg==
X-CSE-MsgGUID: RHZlLD/eQ+OXWSU6uAM6CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116308905"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2025 21:54:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfuqM-000wVD-04;
	Thu, 06 Feb 2025 05:54:30 +0000
Date: Thu, 6 Feb 2025 13:53:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202502061331.DuhKmxmk-lkp@intel.com>
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
commit: 7b946a32948f90b198e3e51c824576458ceda3a4 [0/3] FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250206/202502061331.DuhKmxmk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061331.DuhKmxmk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061331.DuhKmxmk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +263 drivers/usb/host/xhci-sideband.c

   244	
   245	/**
   246	 * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
   247	 * @sb: sideband instance for this usb device
   248	 * @num_seg: number of event ring segments to allocate
   249	 * @ip_autoclear: IP autoclearing support such as MSI implemented
   250	 *
   251	 * Sets up a xhci interrupter that can be used for this sideband accessed usb
   252	 * device. Transfer events for this device can be routed to this interrupters
   253	 * event ring by setting the 'Interrupter Target' field correctly when queueing
   254	 * the transfer TRBs.
   255	 * Once this interrupter is created the interrupter target ID can be obtained
   256	 * by calling xhci_sideband_interrupter_id()
   257	 *
   258	 * Returns 0 on success, negative error otherwise
   259	 */
   260	int
   261	xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
   262					 bool ip_autoclear, u32 imod_interval)
 > 263	{
   264		int ret = 0;
   265	
   266		if (!sb || !sb->xhci)
   267			return -ENODEV;
   268	
   269		mutex_lock(&sb->mutex);
   270		if (sb->ir) {
   271			ret = -EBUSY;
   272			goto out;
   273		}
   274	
   275		sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
   276							   num_seg, imod_interval);
   277		if (!sb->ir) {
   278			ret = -ENOMEM;
   279			goto out;
   280		}
   281	
   282		sb->ir->ip_autoclear = ip_autoclear;
   283	
   284	out:
   285		mutex_unlock(&sb->mutex);
   286	
   287		return ret;
   288	}
   289	EXPORT_SYMBOL_GPL(xhci_sideband_create_interrupter);
   290	
   291	/**
   292	 * xhci_sideband_remove_interrupter - remove the interrupter from a sideband
   293	 * @sb: sideband instance for this usb device
   294	 *
   295	 * Removes a registered interrupt for a sideband.  This would allow for other
   296	 * sideband users to utilize this interrupter.
   297	 */
   298	void
   299	xhci_sideband_remove_interrupter(struct xhci_sideband *sb)
   300	{
   301		if (!sb || !sb->ir)
   302			return;
   303	
   304		mutex_lock(&sb->mutex);
   305		xhci_remove_secondary_interrupter(xhci_to_hcd(sb->xhci), sb->ir);
   306	
   307		sb->ir = NULL;
   308		mutex_unlock(&sb->mutex);
   309	}
   310	EXPORT_SYMBOL_GPL(xhci_sideband_remove_interrupter);
   311	
   312	/**
   313	 * xhci_sideband_interrupter_id - return the interrupter target id
   314	 * @sb: sideband instance for this usb device
   315	 *
   316	 * If a secondary xhci interrupter is set up for this usb device then this
   317	 * function returns the ID used by the interrupter. The sideband client
   318	 * needs to write this ID to the 'Interrupter Target' field of the transfer TRBs
   319	 * it queues on the endpoints transfer ring to ensure transfer completion event
   320	 * are written by xHC to the correct interrupter event ring.
   321	 *
   322	 * Returns interrupter id on success, negative error othgerwise
   323	 */
   324	int
   325	xhci_sideband_interrupter_id(struct xhci_sideband *sb)
   326	{
   327		if (!sb || !sb->ir)
   328			return -ENODEV;
   329	
   330		return sb->ir->intr_num;
   331	}
   332	EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
   333	
   334	/**
   335	 * xhci_sideband_register - register a sideband for a usb device
   336	 * @intf: usb interface associated with the sideband device
   337	 *
   338	 * Allows for clients to utilize XHCI interrupters and fetch transfer and event
   339	 * ring parameters for executing data transfers.
   340	 *
   341	 * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
   342	 */
   343	struct xhci_sideband *
   344	xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
 > 345	{
   346		struct usb_device *udev = interface_to_usbdev(intf);
   347		struct usb_hcd *hcd = bus_to_hcd(udev->bus);
   348		struct xhci_hcd *xhci = hcd_to_xhci(hcd);
   349		struct xhci_virt_device *vdev;
   350		struct xhci_sideband *sb;
   351	
   352		/*
   353		 * Make sure the usb device is connected to a xhci controller.  Fail
   354		 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
   355		 * as this is the only type that is currently supported by xhci-sideband.
   356		 */
   357		if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
   358			return NULL;
   359	
   360		sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
   361		if (!sb)
   362			return NULL;
   363	
   364		mutex_init(&sb->mutex);
   365	
   366		/* check this device isn't already controlled via sideband */
   367		spin_lock_irq(&xhci->lock);
   368	
   369		vdev = xhci->devs[udev->slot_id];
   370	
   371		if (!vdev || vdev->sideband) {
   372			xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
   373				  udev->slot_id);
   374			spin_unlock_irq(&xhci->lock);
   375			kfree(sb);
   376			return NULL;
   377		}
   378	
   379		sb->xhci = xhci;
   380		sb->vdev = vdev;
   381		sb->intf = intf;
   382		sb->type = type;
   383		vdev->sideband = sb;
   384	
   385		spin_unlock_irq(&xhci->lock);
   386	
   387		return sb;
   388	}
   389	EXPORT_SYMBOL_GPL(xhci_sideband_register);
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
