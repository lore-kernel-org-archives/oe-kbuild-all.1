Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15023F9D5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 04:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726288243; cv=none; b=tVlDCJqETLRxYOoD8+QNJsW8SoTogoHvD3K2Lzj33umJNtrTnuQFWKsl2UqvWjh/sxy1jfEqDE5wnhYFbyZ5w7EemqzvIuZc5SNrJbXNW2rlkbhd4QcaVFagjt3FlBLAObbDL4VOlRZEixleyriy/Bp5a19XS5QGwKvxST8x2so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726288243; c=relaxed/simple;
	bh=uUlbvvy74K4ziNhVEd5pyh4tOVNFuHrs/HtXMOuk2W4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DNcOdr9iYEJqAQscvEsjNYctOXERa9I9NtvyVZ46ROpL8GMSB6lndLlq1WeYuGtWi+HJeB+wh9j2o9CWznIo9QG+1/642Ua9FV1Pcp+nfFXTNp92Kc3Zx8GX7d9FWHrObbTPAmqQsS+SiVVyrtiZaEDJuMOHin7wfRKcDz3w3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzjdnmJD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzjdnmJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726288241; x=1757824241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUlbvvy74K4ziNhVEd5pyh4tOVNFuHrs/HtXMOuk2W4=;
  b=XzjdnmJDlkJU/2hP+LZwcwBLW8EQTTjXEOl69AaVR3Fx6r+54Nxo2wni
   cJxkEDqwWtu0uL/Ze1PVhBHeRBUcF4c9xW/XbhhllkaKg2cSDXBVT6fjI
   1OM+nNwlj01EjT7+fD8wAKrBVoKxuFS/HedrCmcjTfrt+IGVpVjFxyhFU
   TVmfHt9jrzaNkCz+MYmU9HKKQw3mlI+siw3rctK/zXN/X9Rv7ZeKcwnte
   H7kDJ2AidM4b0M32PjCeOvEICuP9UrBdwDHjla/x2tiro+CS7yTzEBc6I
   BlRnqI27pXdBUzN0qgdD53r5HYPq4Bj9AQQQ5WLKVqMhcdVFQvGHE6iGK
   Q==;
X-CSE-ConnectionGUID: Wk7L9pE5ReelWIuVuUhy9w==
X-CSE-MsgGUID: JZvrirgzRwqrP51pbk/hYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25294100"
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="25294100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 21:30:40 -0700
X-CSE-ConnectionGUID: AX5mTf3jTeufUxHSv9ubCQ==
X-CSE-MsgGUID: XANZj5r/QrqEpPEIse03iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,228,1719903600"; 
   d="scan'208";a="67921265"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Sep 2024 21:30:39 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spKQf-0007Mc-0s;
	Sat, 14 Sep 2024 04:30:37 +0000
Date: Sat, 14 Sep 2024 12:30:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 3584/30000]
 drivers/misc/hisi_hikey_usb.c:151: undefined reference to
 `usb_role_switch_unregister'
Message-ID: <202409141247.8c4zhS4D-lkp@intel.com>
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
commit: df2bbf3f35122d1d879aef65254ac09ede18e6f9 [3584/30000] ANDROID: misc: hisi_hikey_usb: Driver to support usb functionality of Hikey960
config: i386-randconfig-063-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141247.8c4zhS4D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409141247.8c4zhS4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141247.8c4zhS4D-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/retpoline.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_remove':
>> drivers/misc/hisi_hikey_usb.c:151: undefined reference to `usb_role_switch_unregister'
>> ld: drivers/misc/hisi_hikey_usb.c:154: undefined reference to `usb_role_switch_put'
   ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_get':
>> drivers/misc/hisi_hikey_usb.c:95: undefined reference to `usb_role_switch_get_role'
   ld: drivers/misc/hisi_hikey_usb.o: in function `hub_usb_role_switch_set':
>> drivers/misc/hisi_hikey_usb.c:85: undefined reference to `usb_role_switch_set_role'
   ld: drivers/misc/hisi_hikey_usb.o: in function `hisi_hikey_usb_probe':
>> drivers/misc/hisi_hikey_usb.c:124: undefined reference to `usb_role_switch_get'
>> ld: drivers/misc/hisi_hikey_usb.c:133: undefined reference to `usb_role_switch_register'
   ld: drivers/misc/hisi_hikey_usb.c:137: undefined reference to `usb_role_switch_put'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +151 drivers/misc/hisi_hikey_usb.c

    57	
    58	static int hub_usb_role_switch_set(struct device *dev, enum usb_role role)
    59	{
    60		struct hisi_hikey_usb *hisi_hikey_usb = dev_get_drvdata(dev);
    61	
    62		if (!hisi_hikey_usb || !hisi_hikey_usb->dev_role_sw)
    63			return -EINVAL;
    64	
    65		switch (role) {
    66		case USB_ROLE_NONE:
    67			usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
    68			usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_HUB);
    69			hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_ON);
    70			break;
    71		case USB_ROLE_HOST:
    72			hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_OFF);
    73			usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
    74			usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_ON);
    75			break;
    76		case USB_ROLE_DEVICE:
    77			hub_power_ctrl(hisi_hikey_usb, HUB_VBUS_POWER_OFF);
    78			usb_typec_power_ctrl(hisi_hikey_usb, TYPEC_VBUS_POWER_OFF);
    79			usb_switch_ctrl(hisi_hikey_usb, USB_SWITCH_TO_TYPEC);
    80			break;
    81		default:
    82			break;
    83		}
    84	
  > 85		return usb_role_switch_set_role(hisi_hikey_usb->dev_role_sw, role);
    86	}
    87	
    88	static enum usb_role hub_usb_role_switch_get(struct device *dev)
    89	{
    90		struct hisi_hikey_usb *hisi_hikey_usb = dev_get_drvdata(dev);
    91	
    92		if (!hisi_hikey_usb || !hisi_hikey_usb->dev_role_sw)
    93			return -EINVAL;
    94	
  > 95		return usb_role_switch_get_role(hisi_hikey_usb->dev_role_sw);
    96	}
    97	
    98	static int hisi_hikey_usb_probe(struct platform_device *pdev)
    99	{
   100		struct device *dev = &pdev->dev;
   101		struct hisi_hikey_usb *hisi_hikey_usb;
   102		struct usb_role_switch_desc hub_role_switch = {NULL};
   103	
   104		hisi_hikey_usb = devm_kzalloc(dev, sizeof(*hisi_hikey_usb), GFP_KERNEL);
   105		if (!hisi_hikey_usb)
   106			return -ENOMEM;
   107	
   108		hisi_hikey_usb->typec_vbus = devm_gpiod_get(dev, "typec-vbus",
   109							    GPIOD_OUT_LOW);
   110		if (IS_ERR(hisi_hikey_usb->typec_vbus))
   111			return PTR_ERR(hisi_hikey_usb->typec_vbus);
   112	
   113		hisi_hikey_usb->otg_switch = devm_gpiod_get(dev, "otg-switch",
   114							    GPIOD_OUT_HIGH);
   115		if (IS_ERR(hisi_hikey_usb->otg_switch))
   116			return PTR_ERR(hisi_hikey_usb->otg_switch);
   117	
   118		/* hub-vdd33-en is optional */
   119		hisi_hikey_usb->hub_vbus = devm_gpiod_get_optional(dev, "hub-vdd33-en",
   120								   GPIOD_OUT_HIGH);
   121		if (IS_ERR(hisi_hikey_usb->hub_vbus))
   122			return PTR_ERR(hisi_hikey_usb->hub_vbus);
   123	
 > 124		hisi_hikey_usb->dev_role_sw = usb_role_switch_get(dev);
   125		if (!hisi_hikey_usb->dev_role_sw)
   126			return -EPROBE_DEFER;
   127		if (IS_ERR(hisi_hikey_usb->dev_role_sw))
   128			return PTR_ERR(hisi_hikey_usb->dev_role_sw);
   129	
   130		hub_role_switch.fwnode = dev_fwnode(dev);
   131		hub_role_switch.set = hub_usb_role_switch_set;
   132		hub_role_switch.get = hub_usb_role_switch_get;
 > 133		hisi_hikey_usb->hub_role_sw = usb_role_switch_register(dev,
   134								&hub_role_switch);
   135	
   136		if (IS_ERR(hisi_hikey_usb->hub_role_sw)) {
   137			usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
   138			return PTR_ERR(hisi_hikey_usb->hub_role_sw);
   139		}
   140	
   141		platform_set_drvdata(pdev, hisi_hikey_usb);
   142	
   143		return 0;
   144	}
   145	
   146	static int  hisi_hikey_usb_remove(struct platform_device *pdev)
   147	{
   148		struct hisi_hikey_usb *hisi_hikey_usb = platform_get_drvdata(pdev);
   149	
   150		if (hisi_hikey_usb->hub_role_sw)
 > 151			usb_role_switch_unregister(hisi_hikey_usb->hub_role_sw);
   152	
   153		if (hisi_hikey_usb->dev_role_sw)
 > 154			usb_role_switch_put(hisi_hikey_usb->dev_role_sw);
   155	
   156		return 0;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
