Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D401B85FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 19:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753558039; cv=none; b=ar3uWZwyQ7PVf0VVx8nOpIWWMygaHFouV3IpJhhLHi5ZQ4nJlZDv43PFMPevrwMxOHeXM8UvLLs2jzsJFLAunBLPAhDAPYFboBNxKQY7bbjvqMXpsqw7bC8kHLu5gyI3DkgC4BKu8+aNRw6weu4bfX1tT+nzOqru4UQq8ItIR9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753558039; c=relaxed/simple;
	bh=glF+NYXLfiFtHFDnriyQyD+XHmdv9VCBW1QPu5Q3nlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gy+EnPRzVrOjdTi2klLD/idoXe2KefPXLu8xpR0O4C4v0kMVFZ8kP7vxA3A0aIwwKUgCOxGOsjgmD4iR20kn1w9XuskmpvMLvyJZxJdvhN74dLW2c3HJYBbOPmQkiJUYXhsbbvNmb9O+ASLYWwhjebHWHaN7MvUxcpx3HQLMTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mpMXSNR+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mpMXSNR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753558038; x=1785094038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glF+NYXLfiFtHFDnriyQyD+XHmdv9VCBW1QPu5Q3nlY=;
  b=mpMXSNR+hoRLJoSh6tq3OE1a4T3ttuXchyjHDCU8sjLOC4AxH2u2gbe3
   gi/FxsylW20xIoyD39tSE3D58YICYVI6yKnreC9dfN9lGhVryGQNJkxxx
   c0d0Q8uihS63/uZurw3PzgpdT9eAbGwQrQCT2MH2/ynOZe/6VzGYbA8+H
   UjYtXonqHuXSKIgkxd7PiMCY9VJnY1TCOqu4dPzckkjdYA5Nf5RTaaUCh
   /AW2H5sspvCsr2j5DXCNCsALej6Xx1S9Mv76N340g6kV4JHbOfw0QD3+I
   NJ/dLW504nRR3DzXjYp8sq0mVlhCoShd9O3ttlD8doz97Wxaugn4DDuvz
   w==;
X-CSE-ConnectionGUID: VX0olAVTSk+lN30LoSKQPg==
X-CSE-MsgGUID: Hvpkl55dTSGg+xFFiFMyPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55741403"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55741403"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 12:27:18 -0700
X-CSE-ConnectionGUID: ajisgASURYS8EtGd3aiAdQ==
X-CSE-MsgGUID: 2LDFXhdzRxi/aX9xunkoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160972992"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jul 2025 12:27:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufkY6-000MDv-13;
	Sat, 26 Jul 2025 19:27:14 +0000
Date: Sun, 27 Jul 2025 03:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 45/45]
 drivers/input/touchscreen/dwav-usb-mt.c:462:17: warning: 'strncpy' specified
 bound 128 equals destination size
Message-ID: <202507270342.UavLf10C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   5970e23fb597e5a60b1284c83332aee45fb222d0
commit: 5970e23fb597e5a60b1284c83332aee45fb222d0 [45/45] squash! ODROID-COMMON: input/touchscreen: Add D-WAV Multitouch driver.
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250727/202507270342.UavLf10C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270342.UavLf10C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270342.UavLf10C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/dwav-usb-mt.c: In function 'dwav_usb_mt_probe':
>> drivers/input/touchscreen/dwav-usb-mt.c:462:17: warning: 'strncpy' specified bound 128 equals destination size [-Wstringop-truncation]
     462 |                 strncpy(dwav_usb_mt->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
     463 |                                 udev->manufacturer, sizeof(dwav_usb_mt->name));
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +462 drivers/input/touchscreen/dwav-usb-mt.c

   397	
   398	static int dwav_usb_mt_probe(struct usb_interface *intf,
   399				  const struct usb_device_id *id)
   400	{
   401		struct dwav_usb_mt *dwav_usb_mt = NULL;
   402		struct input_dev *input_dev = NULL;
   403		struct usb_endpoint_descriptor *endpoint;
   404		struct usb_device *udev = interface_to_usbdev(intf);
   405	
   406		int err = 0;
   407	
   408		endpoint = dwav_usb_mt_get_input_endpoint(intf->cur_altsetting);
   409		if (!endpoint)
   410			return  -ENXIO;
   411	
   412		dwav_usb_mt = kzalloc(sizeof(struct dwav_usb_mt), GFP_KERNEL);
   413		if (!dwav_usb_mt)
   414			return  -ENOMEM;
   415	
   416		dwav_usb_mt->dev_id = id->driver_info;
   417	
   418		dwav_usb_mt->finger = kzalloc(sizeof(struct finger_t) *
   419					      DEV_INFO[dwav_usb_mt->dev_id].max_finger,
   420					      GFP_KERNEL);
   421	
   422		if (!dwav_usb_mt->finger)
   423			goto err_free_mem;
   424	
   425		input_dev = input_allocate_device();
   426		if (!input_dev)
   427			goto err_free_mem;
   428	
   429		dwav_usb_mt->data_size = sizeof(struct dwav_raw);
   430		dwav_usb_mt->data = usb_alloc_coherent(udev, dwav_usb_mt->data_size,
   431				GFP_KERNEL, &dwav_usb_mt->data_dma);
   432		if (!dwav_usb_mt->data)
   433			goto err_free_mem;
   434	
   435		dwav_usb_mt->irq = usb_alloc_urb(0, GFP_KERNEL);
   436		if (!dwav_usb_mt->irq) {
   437			dev_dbg(&intf->dev,
   438					"%s - usb_alloc_urb failed: usbtouch->irq\n",
   439					__func__);
   440			goto err_free_buffers;
   441		}
   442	
   443		if (usb_endpoint_type(endpoint) == USB_ENDPOINT_XFER_INT)   {
   444			usb_fill_int_urb(dwav_usb_mt->irq, udev,
   445				usb_rcvintpipe(udev, endpoint->bEndpointAddress),
   446				dwav_usb_mt->data, dwav_usb_mt->data_size,
   447				dwav_usb_mt_irq, dwav_usb_mt, endpoint->bInterval);
   448		} else {
   449			usb_fill_bulk_urb(dwav_usb_mt->irq, udev,
   450				 usb_rcvbulkpipe(udev, endpoint->bEndpointAddress),
   451				 dwav_usb_mt->data, dwav_usb_mt->data_size,
   452				 dwav_usb_mt_irq, dwav_usb_mt);
   453		}
   454	
   455		dwav_usb_mt->irq->dev = udev;
   456		dwav_usb_mt->irq->transfer_dma = dwav_usb_mt->data_dma;
   457		dwav_usb_mt->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
   458	
   459		dwav_usb_mt->interface  = intf;
   460	
   461		if (udev->manufacturer)
 > 462			strncpy(dwav_usb_mt->name,
   463					udev->manufacturer, sizeof(dwav_usb_mt->name));
   464	
   465		if (udev->product) {
   466			if (udev->manufacturer)
   467				strlcat(dwav_usb_mt->name,
   468						" ", sizeof(dwav_usb_mt->name));
   469	
   470			strlcat(dwav_usb_mt->name,
   471					udev->product, sizeof(dwav_usb_mt->name));
   472		}
   473	
   474		if (!strlen(dwav_usb_mt->name)) {
   475			snprintf(dwav_usb_mt->name, sizeof(dwav_usb_mt->name),
   476					"D-WAV Scientific MultiTouch %04x:%04x",
   477					le16_to_cpu(udev->descriptor.idVendor),
   478					le16_to_cpu(udev->descriptor.idProduct));
   479		}
   480	
   481		usb_make_path(udev, dwav_usb_mt->phys, sizeof(dwav_usb_mt->phys));
   482		strlcat(dwav_usb_mt->phys, "/input0", sizeof(dwav_usb_mt->phys));
   483	
   484		usb_to_input_id(udev, &input_dev->id);
   485	
   486		input_dev->dev.parent = &intf->dev;
   487	
   488		err = dwav_usb_mt_init(dwav_usb_mt, (void *)input_dev);
   489		if (err)
   490			goto err_free_urb;
   491	
   492		usb_set_intfdata(intf, dwav_usb_mt);
   493	
   494		dev_info(&intf->dev, "%s\n", DEV_INFO[dwav_usb_mt->dev_id].name);
   495	
   496		return 0;
   497	
   498	err_free_urb:
   499		usb_free_urb(dwav_usb_mt->irq);
   500	
   501	err_free_buffers:
   502		dwav_usb_mt_free_buffers(udev, dwav_usb_mt);
   503	
   504	err_free_mem:
   505		if (input_dev)
   506			input_free_device(input_dev);
   507		kfree(dwav_usb_mt);
   508	
   509		return err;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
