Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7421B9D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024508; cv=none; b=EzOyipCzw4pjxnDFOWnZQTilS4Ik297ReTR1fhIpYC93RCIStRVolr0jEM9LNy4UgagyacudMy55aCk6a8QQwLnp1MyuvHcvpKNjhSqndorDoFJIbyxQLmL+XN4P2fI9j5i815NqW6WyeizfojsQvcaSotYLfiSW15sK2bCtRyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024508; c=relaxed/simple;
	bh=/ORQnClbxF24ouU64c4TszS8Ht6vizzTzMgLTXn4qaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqwzMTMz8wAuFnxveE0IZIrFo/IJA11htucNBR26rgI8KS9xXlMfA/MOL/MhqcGX5i4Bg0Rin89P+ENbZqo3DoFmY5xuaxLy2RsvDZYjXeNa2dh0gUKZbnPqNEbsOZIBki5qwtQdpkZZlPXHZOL5bQ3b7z+nEUsEt/Qof1nFxdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWig4Kmm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWig4Kmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751024506; x=1782560506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ORQnClbxF24ouU64c4TszS8Ht6vizzTzMgLTXn4qaI=;
  b=SWig4KmmieQH3wU0OW8rMjk24phLRyyD3ZhARur6iyMij3PhE783bc36
   9MUbrc9XJULL7ePW8cnyxfEij+Y91eGiTggZXt73IRdJLmpiz7CWR5H9E
   H6NGl6/ajoUS9elbGErN8dNCWb56CTJMW/4Pv/tcpl2DF2vMzhLjQL0TB
   V0Aa4+YTJSQvSDAKW/RTOXkejud2gLy7B+J6dQXLVVgyd1BDzMqb/HpLY
   tSFdp22rfzrIrObh6XjoRJu5YPWrzqEGTRvxOopfm6YfbvwST9Y16SGe/
   yns31Xt4U7OjEx/4ZSNwxvdJYC5V8hbHDYQhWaLAi5I+PU5KWBYji5MEg
   w==;
X-CSE-ConnectionGUID: S9l3RfKeTXm9zLmQsNXpTQ==
X-CSE-MsgGUID: 9jLiG/6iSTKoJKf136oxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53432754"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53432754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:41:45 -0700
X-CSE-ConnectionGUID: 20/K6So9SUOa2ll67WyeLA==
X-CSE-MsgGUID: 1AM11bIxRSm61m/czvOKPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157171806"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2025 04:41:45 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV7Sg-0000eV-15;
	Fri, 27 Jun 2025 11:41:42 +0000
Date: Fri, 27 Jun 2025 13:40:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct
 member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
Message-ID: <202506271933.JldoP9ef-lkp@intel.com>
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
commit: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 [0/2] FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity
config: x86_64-buildonly-randconfig-2001-20250626 (https://download.01.org/0day-ci/archive/20250627/202506271933.JldoP9ef-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271933.JldoP9ef-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271933.JldoP9ef-lkp@intel.com/

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
