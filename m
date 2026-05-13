Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017123043CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 00:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633851; cv=none; b=BY22poM2Ybn8WgdvzOC8CWmPzEccGWLe7dNTkEjQjMEDvbUsxed7Hy3HdI4xUXbUGOtMLlVOL3+cAlQYAldJW8gfQPYwvwxg2U1pyMklBv4ikJlQZ9Y+i2QFmJmxSICeySIMGQbqA0KXQNf0I+0MD/uKMqCJRaB0Ym/imZSZHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633851; c=relaxed/simple;
	bh=c3kmt4nLgMkvqzlRRve9VGmi4ipXt5eK1cvlsrW+Kqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=exucQ3LT+s4TMRgUI3Pg2XP+1FUBeO+Hz0mhSqEhKa7JYqXfNNPQQu3N6ovr1L2MHjcZXccxWCDEpLlCiFx5hv/9BPg5QmGGPQAe2l4J0RCSiCoxzz+6YD5HOrJnbFUUhCyfxvx4gigdPsm2jNr784xH+hq0aOiD8Jt9HgyWCrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBM6Ns9e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBM6Ns9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778633848; x=1810169848;
  h=date:from:to:cc:subject:message-id;
  bh=c3kmt4nLgMkvqzlRRve9VGmi4ipXt5eK1cvlsrW+Kqs=;
  b=SBM6Ns9eoltzRtKZC7Hg7evxiuFOYJ3AWOzXP+3d75EzrI57I/+Rg8jN
   QUEB5eP7iuPpOKC9VWeFoC7PMksDecXn/Tm/8epUXj+bPS4iLCjgKg6hv
   m/hczuxatwDzDhgK8oYXfPi1ZriidMML3ealgN56XmWCAan9TCZh0HaJI
   qxWmB/q6YLcoZPVJYWZh46HMTOKf/VTXnpCU2vpK7C+DsiDUGMpStj9Nz
   IXCrwASx/llpY2VhubGCTsMjv8d39R1OSnZyR7DROE3df/4iXby6ByQ8I
   hf70rEEwAWvUFc1iUV9IDeOEQEaSiskr9NZFDt9fg8aPuwvxxgXLltm/T
   g==;
X-CSE-ConnectionGUID: 244jXeW2ToOlEbysOeIwDw==
X-CSE-MsgGUID: c5uRSk1nTee1RcNyRMF4ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90134085"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90134085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 17:57:23 -0700
X-CSE-ConnectionGUID: 1LD4g1CWS0mvUJLt83FEvw==
X-CSE-MsgGUID: wAlFUrHWRIK4C3JotADgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="236948884"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2026 17:57:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMxua-00000000355-00CX;
	Wed, 13 May 2026 00:57:20 +0000
Date: Wed, 13 May 2026 08:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/2]
 drivers/usb/gadget/configfs.c:1614:2: error: implicit declaration of function
 'acc_disconnect'
Message-ID: <202605130854.WSVBxhbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ronak,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   25bd3a7bef99d59de780f21dcc9caeabb57b47bc
commit: 36cfd6f81afc6d2eab297f686f00eafd5a807cec [0/2] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: i386-randconfig-016-20260513 (https://download.01.org/0day-ci/archive/20260513/202605130854.WSVBxhbP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130854.WSVBxhbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130854.WSVBxhbP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:1614:2: error: implicit declaration of function 'acc_disconnect' [-Werror,-Wimplicit-function-declaration]
    1614 |         acc_disconnect();
         |         ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
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
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/acc_disconnect +1614 drivers/usb/gadget/configfs.c

  1597	
  1598	static void configfs_composite_disconnect(struct usb_gadget *gadget)
  1599	{
  1600		struct usb_composite_dev *cdev;
  1601		struct gadget_info *gi;
  1602		unsigned long flags;
  1603	
  1604		cdev = get_gadget_data(gadget);
  1605		if (!cdev)
  1606			return;
  1607	
  1608	#ifdef CONFIG_USB_CONFIGFS_F_ACC
  1609		/*
  1610		 * accessory HID support can be active while the
  1611		 * accessory function is not actually enabled,
  1612		 * so we need to inform it when we are disconnected.
  1613		 */
> 1614		acc_disconnect();
  1615	#endif
  1616		gi = container_of(cdev, struct gadget_info, cdev);
  1617		spin_lock_irqsave(&gi->spinlock, flags);
  1618		cdev = get_gadget_data(gadget);
  1619		if (!cdev || gi->unbind) {
  1620			spin_unlock_irqrestore(&gi->spinlock, flags);
  1621			return;
  1622		}
  1623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
