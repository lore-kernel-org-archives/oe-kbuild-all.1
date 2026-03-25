Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D953D47D7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 12:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440515; cv=none; b=YJ76V7MWbZFLcJCj/T470oxvgW7Oc28oO3bqjUH7FfUqZHV0xLZs9fJrHXasZnrE3y3KqUyDJ2iCPlaAktLWpACpRglwid1xKXIlz82KssO9HQ8vdZ72t4sbtQZ07yJM0t7W0a+8MVYoRFYwCTrz4vkFjU6rB5hzP9q0sv7B8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440515; c=relaxed/simple;
	bh=YGxXisc98Lij+dLiELcRr0T5li9WzTUGonUpLiABE9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ERaoEzhbxNPW+Ew9hb5dfHt69zeDDC9fvKGXJbKMHd+gY/xrzblndy5f+R3D1bWUS2FwTQ8LaLzAxMQYNaQl5LiVhQHTcPx5R82F1vWQhDXh5M7M9jpXBwSXJycosBqYimoogLto5cZYXBK6+jyWs5+j5I0Q3+rvThxSaAvANyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3hhBJ25; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3hhBJ25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440515; x=1805976515;
  h=date:from:to:cc:subject:message-id;
  bh=YGxXisc98Lij+dLiELcRr0T5li9WzTUGonUpLiABE9M=;
  b=d3hhBJ25mc20P3UnGG8SSYqe/XZuZbmDskCNc7s3QxNB9jZprVzkXaZE
   ERYBLhzbPW/iNdCAXdAZ3yItnxGAz5iypdDKngI/twzpw74gBqfcEHF4e
   fGJi0BI9NFFCkTI7aMi8EvMpr0VPz0oXVGF5BJDzdK/xa62gbkhKJuj4I
   /5Jj5KFraWRFze9fSP0UkOJWDnziAl/iSyI7iKuAhGy9j0dBFJupUh1cu
   Qu4XX0M6P+YBPvVJP/W0GvxTylm+s4lvdXm9JAi+6YTJn/tTzcYtQuIRw
   iLbwDWJJEwpU2L9ttCmPCzHx+5NPN98GsjndmKpCb47RPTMMS4gHfe7CS
   g==;
X-CSE-ConnectionGUID: xtfCMXYdSWagKKyC7VF4Rw==
X-CSE-MsgGUID: ikqjrmZ3TviapIwNk1a90w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79330527"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79330527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:08:35 -0700
X-CSE-ConnectionGUID: GGEGxIJ7RFixMSctUqeNyQ==
X-CSE-MsgGUID: t3m7ydYFSNWdADAFL0C/Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224925539"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 05:08:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5N2D-000000006mN-06ul;
	Wed, 25 Mar 2026 12:08:29 +0000
Date: Wed, 25 Mar 2026 20:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 36/36]
 drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct
 member 'type' not described in 'xhci_sideband_register'
Message-ID: <202603252008.9abpxxhD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mathias,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 7b946a32948f90b198e3e51c824576458ceda3a4 [36/36] FROMLIST: xhci: sideband: add initial api to register a secondary interrupter entity
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260325/202603252008.9abpxxhD-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252008.9abpxxhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252008.9abpxxhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +345 drivers/usb/host/xhci-sideband.c

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
