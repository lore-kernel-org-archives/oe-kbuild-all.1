Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FFE183CB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955742; cv=none; b=rWPyLi5CO5NhCSzg6S9gHRPBaSaPpsSWZnrytlGRQdp/OUe1kcKMA0MQNoQthT/cJjr1EeDGmQAkAfCvR5Egec1ZgSI8kkJmS7zinpG76ecdgTtiHb90QuCjTXyG5skI4zRxFVCpguswTat5/+Shzt4sP39XvzgXWdI5HLtEwSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955742; c=relaxed/simple;
	bh=vaqcpV2CDvSvBQIU5kHwP78DD3xRn/wK7FfvDyxCW5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pllaW0Rgi6CcJnMkh4ya4FKWNpdTBX5+eu4svHYf4vSRzDSu47TgYWS3IS3mORYNBl1WV5k3CS7yP4HPPnQpTSs2ZqsC5b+3s/YvxUct0JsDvFqhHBRUjnlEfteihIyM+sIcv/HF8eKC3Lzp+cKXE5A5gdQj1f9Vsrne/pTqoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZehO39zY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZehO39zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725955740; x=1757491740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaqcpV2CDvSvBQIU5kHwP78DD3xRn/wK7FfvDyxCW5s=;
  b=ZehO39zYsi+QDCMWHaPYk8MeasG1Jof5ivJrhTN4S3gFl/NU90LOQiGP
   MW8XD6JlyUJdxZjJBJAe+1eup+Fan6kMyumYR3EQQDqfD0KE5nO0Xg+Ip
   qdxcV1li5ZEBZU7y51rwaWINwi1/LnqnLeq1PEAI/Gv60iMpKcUIyr54W
   kpfWpI0eacDTXCsXijVlQzlBgL5AkP7V5xrFqIEZsMKUQgHussCvOZGIF
   7Mx03QCeymXn5kqAN9gvLqjoNddN1yDPzCt6OC5BdrzcUAn3naik8XTb+
   WIwj/4wMUXzyATeAYOmMk4LXyuknNAhT96STrSEzlG3rNDwfMw2Aa2vxU
   A==;
X-CSE-ConnectionGUID: wYnH14K5RaeEfd0/Fksd4g==
X-CSE-MsgGUID: Td0+h4Z4STKqPcXhPaaDag==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="28466378"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="28466378"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 01:08:59 -0700
X-CSE-ConnectionGUID: SSG7/k3DQYikGPcuR8rjNQ==
X-CSE-MsgGUID: +pPW1O8ZSZ+Xv08u0mhUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="71069792"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Sep 2024 01:08:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snvvk-0000GM-2g;
	Tue, 10 Sep 2024 08:08:56 +0000
Date: Tue, 10 Sep 2024 16:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 3577/30000]
 drivers/usb/dwc3/drd.c:534: undefined reference to
 `usb_role_switch_register'
Message-ID: <202409101635.3qVo8Zdh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   b41e3369a8f2bf2fc08e19da3d8c061981f4db89
commit: a768fd231472e3b763c30c1df5876c5b70a8a4bd [3577/30000] FROMGIT: usb: dwc3: Registering a role switch in the DRD code.
config: i386-randconfig-002-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101635.3qVo8Zdh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101635.3qVo8Zdh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409101635.3qVo8Zdh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/usb/dwc3/drd.o: in function `dwc3_setup_role_switch':
>> drivers/usb/dwc3/drd.c:534: undefined reference to `usb_role_switch_register'
   ld: drivers/usb/dwc3/drd.o: in function `dwc3_drd_exit':
>> drivers/usb/dwc3/drd.c:607: undefined reference to `usb_role_switch_unregister'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +534 drivers/usb/dwc3/drd.c

   526	
   527	static int dwc3_setup_role_switch(struct dwc3 *dwc)
   528	{
   529		struct usb_role_switch_desc dwc3_role_switch = {NULL};
   530	
   531		dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
   532		dwc3_role_switch.set = dwc3_usb_role_switch_set;
   533		dwc3_role_switch.get = dwc3_usb_role_switch_get;
 > 534		dwc->role_sw = usb_role_switch_register(dwc->dev, &dwc3_role_switch);
   535		if (IS_ERR(dwc->role_sw))
   536			return PTR_ERR(dwc->role_sw);
   537	
   538		dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_DEVICE);
   539		return 0;
   540	}
   541	#else
   542	#define ROLE_SWITCH 0
   543	#define dwc3_setup_role_switch(x) 0
   544	#endif
   545	
   546	int dwc3_drd_init(struct dwc3 *dwc)
   547	{
   548		int ret, irq;
   549	
   550		dwc->edev = dwc3_get_extcon(dwc);
   551		if (IS_ERR(dwc->edev))
   552			return PTR_ERR(dwc->edev);
   553	
   554		if (ROLE_SWITCH &&
   555		    device_property_read_bool(dwc->dev, "usb-role-switch")) {
   556			ret = dwc3_setup_role_switch(dwc);
   557			if (ret < 0)
   558				return ret;
   559		} else if (dwc->edev) {
   560			dwc->edev_nb.notifier_call = dwc3_drd_notifier;
   561			ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
   562						       &dwc->edev_nb);
   563			if (ret < 0) {
   564				dev_err(dwc->dev, "couldn't register cable notifier\n");
   565				return ret;
   566			}
   567	
   568			dwc3_drd_update(dwc);
   569		} else {
   570			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_OTG);
   571			dwc->current_dr_role = DWC3_GCTL_PRTCAP_OTG;
   572	
   573			/* use OTG block to get ID event */
   574			irq = dwc3_otg_get_irq(dwc);
   575			if (irq < 0)
   576				return irq;
   577	
   578			dwc->otg_irq = irq;
   579	
   580			/* disable all OTG IRQs */
   581			dwc3_otg_disable_events(dwc, DWC3_OTG_ALL_EVENTS);
   582			/* clear all events */
   583			dwc3_otg_clear_events(dwc);
   584	
   585			ret = request_threaded_irq(dwc->otg_irq, dwc3_otg_irq,
   586						   dwc3_otg_thread_irq,
   587						   IRQF_SHARED, "dwc3-otg", dwc);
   588			if (ret) {
   589				dev_err(dwc->dev, "failed to request irq #%d --> %d\n",
   590					dwc->otg_irq, ret);
   591				ret = -ENODEV;
   592				return ret;
   593			}
   594	
   595			dwc3_otg_init(dwc);
   596			dwc3_set_mode(dwc, DWC3_GCTL_PRTCAP_OTG);
   597		}
   598	
   599		return 0;
   600	}
   601	
   602	void dwc3_drd_exit(struct dwc3 *dwc)
   603	{
   604		unsigned long flags;
   605	
   606		if (dwc->role_sw)
 > 607			usb_role_switch_unregister(dwc->role_sw);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
