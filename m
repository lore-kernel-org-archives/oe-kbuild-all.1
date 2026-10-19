Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100AE4D0A05
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 10:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792406698; cv=none; b=jEOCP4kk/lyfHYjZaakJI0/qkKd11+VCNF1pXB0NvOX7WpDOGlEoFKI8RnxbM9oQhRDraRJWC2iiOZAoLHNueor1cMwQKjZcaReKVOTzG2ziSZp90yCofjkYVDhMM/kquEujE6iuo8yjJWH/UhCoJ1iZnSuIBFeu1waC5qOgBtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792406698; c=relaxed/simple;
	bh=V+ISWvDQUZ73sGhVCwG95PHkVCV5ukuhY43OLMhNtwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nynw2ZKYgapb6ghPvJRp13No2RkrzkSHo5pOfuKBXyCiOmDCi17uCO26yrdR2BDk0mfi5BI78frmy1BdZ09o5266S7fV/jG1sK+DNRzqLDZ/Y01XGwZsiBH2XLQ8FhWu3B0lEJQyQMg77QVJtiDylDwN4OTFqgOg30e5Np8C+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYhFSGSy; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYhFSGSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792406690; x=1823942690;
  h=date:from:to:cc:subject:message-id;
  bh=V+ISWvDQUZ73sGhVCwG95PHkVCV5ukuhY43OLMhNtwE=;
  b=bYhFSGSyFHNSuSwsjznEpFE5SVSObaJpnn8G3h3ym9CWPM7Tgea3f5dO
   2wlEgmUPZCWF/CzHOLX6JtDM5CqKXg8uce1zTUiEqzJt6EfrqwadOI8CW
   4DEWfVXGO6fB4HddkHyxlEMx5GGnIXZmwfsZroY71G1m9jH4+3pyMo6UD
   fIOyhVrw0CfHWFP3K8m0e2QEGbU3fn4k0ohzgH7rLm95YKhJUoDbxkl4q
   2mMSFJW7/0vfzBByMNmEZc3UXlYCZBBY38//h3XCaQXhq6ncKllD+8DtZ
   bUIbZogzpCtBfW+n6gmOA9eX2RHQqAon/YcdAA1lNtB5mbeF8c34/WoX+
   Q==;
X-CSE-ConnectionGUID: mACIzYLGRQ6b2pPu2iAhlg==
X-CSE-MsgGUID: q8ytHOnDSE+v54RF5QyFyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="969632"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="969632"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 03:44:48 -0700
X-CSE-ConnectionGUID: fHkuxzU9RXqiOcw30PrY8Q==
X-CSE-MsgGUID: s0EeqoHiRze9Eqmas2Xgvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4346035"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Oct 2026 03:44:46 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIkrD-000000005aV-39L4;
	Mon, 19 Oct 2026 10:44:43 +0000
Date: Mon, 19 Oct 2026 12:43:48 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202610191203.epVqln2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mathias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   49f96790cc7636a02b5b36d2f486a318b80031f2
commit: 7b946a32948f90b198e3e51c824576458ceda3a4 [0/2] FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity
config: i386-randconfig-2103-20261018 (https://download.01.org/0day-ci/archive/20261019/202610191203.epVqln2n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191203.epVqln2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191203.epVqln2n-lkp@intel.com/

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
