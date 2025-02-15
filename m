Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A687623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739624807; cv=none; b=HDEv5yI1/4lvvPvHAbtP7xc8E3A/c1LKybhMB27Oajk2flkKMLmNWRHkyiFDQONpBVR/iG2Mbx0YpwXLxx7BXxhUCszJWj8Lx99k1cI2GuRytj8X/cg4gtJl8fqBK7DWWH81d6R0CckL/M48tAWqmsATq4YWYGE8M0PpDO+0rhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739624807; c=relaxed/simple;
	bh=NOhLq2oZGFF7/KNA+VzH5clMY4CYWVO0LuyDHm1P2yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVWij1k6xGAwChAN1Tr4Wid0MTs62jwBFIlry1LkykKuGIEGce2WZ0Mdf3bzHTP7/WIg/RRZmmzjEZdusxAFB/XTcTp8EE0TTw+Qb59cmK59azW0xSheGzUYAlpyve5m0lygqUrpe4PARaGGfb8hms9FaJL5YXC6q+dQP0B87lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5KPhpJo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5KPhpJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739624805; x=1771160805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NOhLq2oZGFF7/KNA+VzH5clMY4CYWVO0LuyDHm1P2yE=;
  b=K5KPhpJoTZ49+4DFOP25m9EhYVytlO3BrblfPsdXnsrKCx7fWTYSnFQM
   mdzsINJBkYRgV7w5SJb3dMzbJRzUrqZsucfY+g635+FpNcRjz6EyDmLA6
   siJZGe5GgDb8K58s59D/YlPQtE8sxovhXH6Fs7wvTpMosfkJVbpd578i1
   73nnbvrBkCuWw5Zt+hmucJiOlAChhWXEljGkWkg/RezIVqSKP7iSYQYym
   2rNTrF4+ejZiTyycJL2ekuIKr1p9XYFrdPwboccOljkNcrMb/1+c6Tje2
   lBbTiwJSSZ5ohAdJmmT3axBCiInWjHeFcIvHh6jgGbsvxz3xNe8O1T6bx
   g==;
X-CSE-ConnectionGUID: CIWZPI4oRd2aSIO4Lok0kQ==
X-CSE-MsgGUID: lekdnfSjR3uY84kegJLnzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="51344968"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="51344968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 05:06:44 -0800
X-CSE-ConnectionGUID: hM42Xq3hQ3q/jgTmqRcp3Q==
X-CSE-MsgGUID: xLme6LqQQsizDtrLp44MIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144615711"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2025 05:06:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjHsW-001ApT-36;
	Sat, 15 Feb 2025 13:06:40 +0000
Date: Sat, 15 Feb 2025 21:05:50 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Kosina <jikos@kernel.org>
Subject: [linux-next:master 1810/4011] drivers/hid/hid-appletb-kbd.c:405
 appletb_kbd_probe() warn: inconsistent indenting
Message-ID: <202502152006.fBBCdEr3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0ae0fa3bf0b44c8611d114a9f69985bf451010c3
commit: 93a0fc48948107e0cc34e1de22c3cb363a8f2783 [1810/4011] HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar
config: parisc-randconfig-r072-20250215 (https://download.01.org/0day-ci/archive/20250215/202502152006.fBBCdEr3-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152006.fBBCdEr3-lkp@intel.com/

smatch warnings:
drivers/hid/hid-appletb-kbd.c:405 appletb_kbd_probe() warn: inconsistent indenting
drivers/hid/hid-appletb-kbd.c:406 appletb_kbd_probe() warn: passing zero to 'dev_err_probe'

vim +405 drivers/hid/hid-appletb-kbd.c

   371	
   372	static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id *id)
   373	{
   374		struct appletb_kbd *kbd;
   375		struct device *dev = &hdev->dev;
   376		struct hid_field *mode_field;
   377		int ret;
   378	
   379		ret = hid_parse(hdev);
   380		if (ret)
   381			return dev_err_probe(dev, ret, "HID parse failed\n");
   382	
   383		mode_field = hid_find_field(hdev, HID_OUTPUT_REPORT,
   384					    HID_GD_KEYBOARD, HID_USAGE_MODE);
   385		if (!mode_field)
   386			return -ENODEV;
   387	
   388		kbd = devm_kzalloc(dev, sizeof(*kbd), GFP_KERNEL);
   389		if (!kbd)
   390			return -ENOMEM;
   391	
   392		kbd->mode_field = mode_field;
   393	
   394		ret = hid_hw_start(hdev, HID_CONNECT_HIDINPUT);
   395		if (ret)
   396			return dev_err_probe(dev, ret, "HID hw start failed\n");
   397	
   398		ret = hid_hw_open(hdev);
   399		if (ret) {
   400			dev_err_probe(dev, ret, "HID hw open failed\n");
   401			goto stop_hw;
   402		}
   403	
   404		kbd->backlight_dev = backlight_device_get_by_name("appletb_backlight");
 > 405			if (!kbd->backlight_dev)
 > 406				dev_err_probe(dev, ret, "Failed to get backlight device\n");
   407			else {
   408				backlight_device_set_brightness(kbd->backlight_dev, 2);
   409				timer_setup(&kbd->inactivity_timer, appletb_inactivity_timer, 0);
   410				mod_timer(&kbd->inactivity_timer, jiffies + msecs_to_jiffies(appletb_tb_dim_timeout * 1000));
   411			}
   412	
   413		kbd->inp_handler.event = appletb_kbd_inp_event;
   414		kbd->inp_handler.connect = appletb_kbd_inp_connect;
   415		kbd->inp_handler.disconnect = appletb_kbd_inp_disconnect;
   416		kbd->inp_handler.name = "appletb";
   417		kbd->inp_handler.id_table = appletb_kbd_input_devices;
   418		kbd->inp_handler.match = appletb_kbd_match_internal_device;
   419		kbd->inp_handler.private = kbd;
   420	
   421		ret = input_register_handler(&kbd->inp_handler);
   422		if (ret) {
   423			dev_err_probe(dev, ret, "Unable to register keyboard handler\n");
   424			goto close_hw;
   425		}
   426	
   427		ret = appletb_kbd_set_mode(kbd, appletb_tb_def_mode);
   428		if (ret) {
   429			dev_err_probe(dev, ret, "Failed to set touchbar mode\n");
   430			goto close_hw;
   431		}
   432	
   433		hid_set_drvdata(hdev, kbd);
   434	
   435		return 0;
   436	
   437	close_hw:
   438		hid_hw_close(hdev);
   439	stop_hw:
   440		hid_hw_stop(hdev);
   441		return ret;
   442	}
   443	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
