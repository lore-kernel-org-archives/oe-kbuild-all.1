Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0CEEDE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 00:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755564624; cv=none; b=JYcdO+PVjUO+d91Vm5n3XNCVsyOt/iZmpRFgtpg6m3u6CSPzZpxDWYK6f/UUdSlIdONwUyCTA4f93bu/pBg6Xo/5I25cVxTcVc8NpC3+iZjFZQSAWEAa10tOrdfTsffug4GFVWT8tBJdFqfrZgiWw/u6NWq15uidXzJhGbfQM+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755564624; c=relaxed/simple;
	bh=0GYNkBZHqCPvLDQkS/GhAMMChsmPDrYEINseLmCQKXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eHqP+G/x2S6+tIl7hMu3GPEeCzXx0i0zsJw7C0ryRsqXkFFxKbmxOotq208UZdVdTIjt5vkEFLBTipdv/p30oJdUN6tqY90aL953J/seehr0IYxCsYdQyHlZimQyir+LyvnHjppw1iEMk5MWM0HRRx+ivOW8Kt7qRCnPTaUlxo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1wRiMz6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1wRiMz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755564622; x=1787100622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0GYNkBZHqCPvLDQkS/GhAMMChsmPDrYEINseLmCQKXM=;
  b=m1wRiMz64zQMirpslfewpd8ql84BOcHfQUWOB1nMlpoSB+zy9LLRnDa4
   EZu1HzKXkxGUlL4W2ciQ6V9Krf6zQgzAnzekDhHszYiBcRZ3p0pV8yrCM
   5J4dGHvUOV4qUiKc2Ojsdb9xzPkFJ07UfAkEFpNkkMsOwF83PkaubrF0X
   ZP7iBEr88lYfQNWOHxbR6AqO1lZtCN6qsX4EQhBuHAnjMRTHYQprPYWbY
   fPmFplg+1rv2koVevXmJHGXYJlUX4gfyNjv5ZL3i0dWMGU7pbGxvendqS
   N414hPd6+Uv18860qS9emYG/7RW5o3Q5N9U2eXJkIM5uyCR25/bcwXfgB
   g==;
X-CSE-ConnectionGUID: LZUPMkxRRNiVVOKfrGiSJw==
X-CSE-MsgGUID: RrPA1YQQRgK4F+v2ip7WKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="45374829"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="45374829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 17:50:21 -0700
X-CSE-ConnectionGUID: ENe3XkS/R8WGeCQZ0w9KAw==
X-CSE-MsgGUID: cUEnRIkGTmiG+BywKecktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168075873"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 18 Aug 2025 17:50:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoAYM-000GM3-0v;
	Tue, 19 Aug 2025 00:50:18 +0000
Date: Tue, 19 Aug 2025 08:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?xaBlcmlm?= Rami <ramiserifpersia@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2423/2971] sound/usb/usx2y/us144mkii.c:517:28:
 sparse: sparse: restricted __le16 degrades to integer
Message-ID: <202508190811.tjQJZI1X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3ac864c2d9bb8608ee236e89bf561811613abfce
commit: 0ec417aa85467c6fad0563621b74868be0faf00d [2423/2971] ALSA: usb-audio: Add infrastructure for TASCAM US-144MKII
config: x86_64-randconfig-r131-20250818 (https://download.01.org/0day-ci/archive/20250819/202508190811.tjQJZI1X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190811.tjQJZI1X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190811.tjQJZI1X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/usb/usx2y/us144mkii.c:517:28: sparse: sparse: restricted __le16 degrades to integer
   sound/usb/usx2y/us144mkii.c:520:35: sparse: sparse: restricted __le16 degrades to integer

vim +517 sound/usb/usx2y/us144mkii.c

dee1bcf28a3dd1 Šerif Rami 2025-08-14  392  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  393  /**
dee1bcf28a3dd1 Šerif Rami 2025-08-14  394   * tascam_probe() - Probes for the TASCAM US-144MKII device.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  395   * @intf: The USB interface being probed.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  396   * @usb_id: The USB device ID.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  397   *
5c8c10796e274d Šerif Rami 2025-08-14  398   * This function is the entry point for the USB driver when a matching device
dee1bcf28a3dd1 Šerif Rami 2025-08-14  399   * is found. It performs initial device setup, including:
dee1bcf28a3dd1 Šerif Rami 2025-08-14  400   * - Checking for the second interface (MIDI) and associating it.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  401   * - Performing a vendor-specific handshake with the device.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  402   * - Setting alternate settings for USB interfaces.
67afec157fe63d Šerif Rami 2025-08-14  403   * - Creating and registering the ALSA sound card, PCM device, and MIDI device.
67afec157fe63d Šerif Rami 2025-08-14  404   * - Allocating and initializing URBs for audio and MIDI transfers.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  405   *
dee1bcf28a3dd1 Šerif Rami 2025-08-14  406   * Return: 0 on success, or a negative error code on failure.
dee1bcf28a3dd1 Šerif Rami 2025-08-14  407   */
dee1bcf28a3dd1 Šerif Rami 2025-08-14  408  static int tascam_probe(struct usb_interface *intf,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  409  			const struct usb_device_id *usb_id)
dee1bcf28a3dd1 Šerif Rami 2025-08-14  410  {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  411  	struct usb_device *dev = interface_to_usbdev(intf);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  412  	struct snd_card *card;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  413  	struct tascam_card *tascam;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  414  	int err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  415  	char *handshake_buf __free(kfree) = NULL;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  416  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  417  	if (dev->speed != USB_SPEED_HIGH)
dee1bcf28a3dd1 Šerif Rami 2025-08-14  418  		dev_info(
dee1bcf28a3dd1 Šerif Rami 2025-08-14  419  			&dev->dev,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  420  			"Device is connected to a USB 1.1 port, this is not supported.\n");
dee1bcf28a3dd1 Šerif Rami 2025-08-14  421  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  422  	/* The device has two interfaces; we drive both from this driver. */
dee1bcf28a3dd1 Šerif Rami 2025-08-14  423  	if (intf->cur_altsetting->desc.bInterfaceNumber == 1) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  424  		tascam = usb_get_intfdata(usb_ifnum_to_if(dev, 0));
dee1bcf28a3dd1 Šerif Rami 2025-08-14  425  		if (tascam) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  426  			usb_set_intfdata(intf, tascam);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  427  			tascam->iface1 = intf;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  428  		}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  429  		return 0; /* Let the core handle this interface */
dee1bcf28a3dd1 Šerif Rami 2025-08-14  430  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  431  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  432  	if (dev_idx >= SNDRV_CARDS) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  433  		dev_err(&dev->dev, "Too many TASCAM devices present");
dee1bcf28a3dd1 Šerif Rami 2025-08-14  434  		return -ENODEV;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  435  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  436  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  437  	if (!enable[dev_idx]) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  438  		dev_info(&dev->dev, "TASCAM US-144MKII device disabled");
dee1bcf28a3dd1 Šerif Rami 2025-08-14  439  		return -ENOENT;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  440  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  441  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  442  	handshake_buf = kmalloc(1, GFP_KERNEL);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  443  	if (!handshake_buf)
dee1bcf28a3dd1 Šerif Rami 2025-08-14  444  		return -ENOMEM;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  445  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  446  	/* Perform vendor-specific handshake */
dee1bcf28a3dd1 Šerif Rami 2025-08-14  447  	err = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
dee1bcf28a3dd1 Šerif Rami 2025-08-14  448  			      VENDOR_REQ_MODE_CONTROL, RT_D2H_VENDOR_DEV,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  449  			      MODE_VAL_HANDSHAKE_READ, 0x0000, handshake_buf, 1,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  450  			      USB_CTRL_TIMEOUT_MS);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  451  	if (err < 0) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  452  		dev_err(&dev->dev, "Handshake read failed with %d\n", err);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  453  		return err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  454  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  455  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  456  	if (handshake_buf[0] != 0x12 && handshake_buf[0] != 0x16 &&
dee1bcf28a3dd1 Šerif Rami 2025-08-14  457  	    handshake_buf[0] != 0x30) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  458  		dev_err(&dev->dev, "Unexpected handshake value: 0x%x\n",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  459  			handshake_buf[0]);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  460  		return -ENODEV;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  461  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  462  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  463  	/* Set alternate settings to enable audio/MIDI endpoints */
dee1bcf28a3dd1 Šerif Rami 2025-08-14  464  	err = usb_set_interface(dev, 0, 1);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  465  	if (err < 0) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  466  		dev_err(&dev->dev,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  467  			"Failed to set alt setting 1 on interface 0: %d\n",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  468  			err);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  469  		return err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  470  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  471  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  472  	err = usb_set_interface(dev, 1, 1);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  473  	if (err < 0) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  474  		dev_err(&dev->dev,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  475  			"Failed to set alt setting 1 on interface 1: %d\n",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  476  			err);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  477  		return err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  478  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  479  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  480  	err = snd_card_new(&dev->dev, index[dev_idx], id[dev_idx], THIS_MODULE,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  481  			   sizeof(struct tascam_card), &card);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  482  	if (err < 0) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  483  		dev_err(&dev->dev, "Failed to create sound card instance\n");
dee1bcf28a3dd1 Šerif Rami 2025-08-14  484  		return err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  485  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  486  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  487  	tascam = card->private_data;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  488  	card->private_free = tascam_card_private_free;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  489  	tascam->dev = usb_get_dev(dev);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  490  	tascam->card = card;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  491  	tascam->iface0 = intf;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  492  	tascam->digital_out_source = 1;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  493  	tascam->capture_34_source = 1;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  494  
5c8c10796e274d Šerif Rami 2025-08-14  495  	spin_lock_init(&tascam->lock);
67afec157fe63d Šerif Rami 2025-08-14  496  	spin_lock_init(&tascam->midi_in_lock);
67afec157fe63d Šerif Rami 2025-08-14  497  	spin_lock_init(&tascam->midi_out_lock);
a2a2210f2c2e65 Šerif Rami 2025-08-14  498  	init_usb_anchor(&tascam->playback_anchor);
c1bb0c13e43062 Šerif Rami 2025-08-14  499  	init_usb_anchor(&tascam->capture_anchor);
a2a2210f2c2e65 Šerif Rami 2025-08-14  500  	init_usb_anchor(&tascam->feedback_anchor);
67afec157fe63d Šerif Rami 2025-08-14  501  	init_usb_anchor(&tascam->midi_in_anchor);
67afec157fe63d Šerif Rami 2025-08-14  502  	init_usb_anchor(&tascam->midi_out_anchor);
67afec157fe63d Šerif Rami 2025-08-14  503  
67afec157fe63d Šerif Rami 2025-08-14  504  	timer_setup(&tascam->error_timer, tascam_error_timer, 0);
a2a2210f2c2e65 Šerif Rami 2025-08-14  505  
a2a2210f2c2e65 Šerif Rami 2025-08-14  506  	INIT_WORK(&tascam->stop_work, tascam_stop_work_handler);
a2a2210f2c2e65 Šerif Rami 2025-08-14  507  	INIT_WORK(&tascam->stop_pcm_work, tascam_stop_pcm_work_handler);
c1bb0c13e43062 Šerif Rami 2025-08-14  508  	INIT_WORK(&tascam->capture_work, tascam_capture_work_handler);
67afec157fe63d Šerif Rami 2025-08-14  509  	init_completion(&tascam->midi_out_drain_completion);
5c8c10796e274d Šerif Rami 2025-08-14  510  
67afec157fe63d Šerif Rami 2025-08-14  511  	if (kfifo_alloc(&tascam->midi_in_fifo, MIDI_IN_FIFO_SIZE, GFP_KERNEL)) {
67afec157fe63d Šerif Rami 2025-08-14  512  		snd_card_free(card);
67afec157fe63d Šerif Rami 2025-08-14  513  		return -ENOMEM;
67afec157fe63d Šerif Rami 2025-08-14  514  	}
a2a2210f2c2e65 Šerif Rami 2025-08-14  515  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  516  	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
dee1bcf28a3dd1 Šerif Rami 2025-08-14 @517  	if (dev->descriptor.idProduct == USB_PID_TASCAM_US144) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  518  		strscpy(card->shortname, "TASCAM US-144",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  519  			sizeof(card->shortname));
dee1bcf28a3dd1 Šerif Rami 2025-08-14  520  	} else if (dev->descriptor.idProduct == USB_PID_TASCAM_US144MKII) {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  521  		strscpy(card->shortname, "TASCAM US-144MKII",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  522  			sizeof(card->shortname));
dee1bcf28a3dd1 Šerif Rami 2025-08-14  523  	} else {
dee1bcf28a3dd1 Šerif Rami 2025-08-14  524  		strscpy(card->shortname, "TASCAM Unknown",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  525  			sizeof(card->shortname));
dee1bcf28a3dd1 Šerif Rami 2025-08-14  526  	}
dee1bcf28a3dd1 Šerif Rami 2025-08-14  527  	snprintf(card->longname, sizeof(card->longname), "%s (%04x:%04x) at %s",
dee1bcf28a3dd1 Šerif Rami 2025-08-14  528  		 card->shortname, USB_VID_TASCAM, dev->descriptor.idProduct,
dee1bcf28a3dd1 Šerif Rami 2025-08-14  529  		 dev_name(&dev->dev));
dee1bcf28a3dd1 Šerif Rami 2025-08-14  530  
67afec157fe63d Šerif Rami 2025-08-14  531  	err = snd_pcm_new(card, "US144MKII PCM", 0, 1, 1, &tascam->pcm);
67afec157fe63d Šerif Rami 2025-08-14  532  	if (err < 0)
67afec157fe63d Šerif Rami 2025-08-14  533  		goto free_card;
67afec157fe63d Šerif Rami 2025-08-14  534  	tascam->pcm->private_data = tascam;
67afec157fe63d Šerif Rami 2025-08-14  535  	strscpy(tascam->pcm->name, "US144MKII PCM", sizeof(tascam->pcm->name));
67afec157fe63d Šerif Rami 2025-08-14  536  
67afec157fe63d Šerif Rami 2025-08-14  537  	err = tascam_init_pcm(tascam->pcm);
67afec157fe63d Šerif Rami 2025-08-14  538  	if (err < 0)
67afec157fe63d Šerif Rami 2025-08-14  539  		goto free_card;
67afec157fe63d Šerif Rami 2025-08-14  540  
67afec157fe63d Šerif Rami 2025-08-14  541  	err = tascam_create_midi(tascam);
67afec157fe63d Šerif Rami 2025-08-14  542  	if (err < 0)
67afec157fe63d Šerif Rami 2025-08-14  543  		goto free_card;
67afec157fe63d Šerif Rami 2025-08-14  544  
67afec157fe63d Šerif Rami 2025-08-14  545  	err = tascam_create_controls(tascam);
67afec157fe63d Šerif Rami 2025-08-14  546  	if (err < 0)
67afec157fe63d Šerif Rami 2025-08-14  547  		goto free_card;
67afec157fe63d Šerif Rami 2025-08-14  548  
67afec157fe63d Šerif Rami 2025-08-14  549  	err = tascam_alloc_urbs(tascam);
67afec157fe63d Šerif Rami 2025-08-14  550  	if (err < 0)
67afec157fe63d Šerif Rami 2025-08-14  551  		goto free_card;
67afec157fe63d Šerif Rami 2025-08-14  552  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  553  	err = snd_card_register(card);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  554  	if (err < 0)
dee1bcf28a3dd1 Šerif Rami 2025-08-14  555  		goto free_card;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  556  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  557  	usb_set_intfdata(intf, tascam);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  558  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  559  	dev_idx++;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  560  	return 0;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  561  
dee1bcf28a3dd1 Šerif Rami 2025-08-14  562  free_card:
a2a2210f2c2e65 Šerif Rami 2025-08-14  563  	tascam_free_urbs(tascam);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  564  	snd_card_free(card);
dee1bcf28a3dd1 Šerif Rami 2025-08-14  565  	return err;
dee1bcf28a3dd1 Šerif Rami 2025-08-14  566  }
dee1bcf28a3dd1 Šerif Rami 2025-08-14  567  

:::::: The code at line 517 was first introduced by commit
:::::: dee1bcf28a3dd13ddb2e9200407864f73e9c4d63 ALSA: usb-audio: Add initial driver for TASCAM US-144MKII

:::::: TO: Šerif Rami <ramiserifpersia@gmail.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
