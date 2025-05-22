Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257419F11B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 04:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747889282; cv=none; b=b9Cn/f6BNHTnLEC/hw3IKW4E9V4K98PGd5GsHx1K4nYIMn5izxvrL0yS7z+sWCXCdfbEj9nXDEh54eeowyGjV9Xa77SsHWURW1mTEKzzKP0L/+Dyh3lESlZYUrRi28rgjDEnLQti/u3w9OfwYLSET0aULRCpHeqqPAnMvBS3iks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747889282; c=relaxed/simple;
	bh=blBQo6x299eF3bzE+hOzeuBJRVmrpLEHHtOcw3J/1qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i6/SNcKsQ4yayAHh9uq8FpEjVOsZ9VbW1piP61wb8Fot8pWCx6yPqbHjNIWCZaCa/DJBoYV63G2sMSK/ttEcKFUlM5CAOU+DqoJO1KBxgaPOFUj79o7EuqhQrei6B4NDy/b7Gu7k3sqGvtYFEhE+NC4sdLrdSJa1Sz6PG2ZVi48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtHHCN8L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtHHCN8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747889281; x=1779425281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=blBQo6x299eF3bzE+hOzeuBJRVmrpLEHHtOcw3J/1qw=;
  b=OtHHCN8LNOYUmenL+GzjuIEKnMf1lPr7C/W7xha693WRIIs3aWgWwIlP
   37NnRFq45/e0zQJ7RsKboQ4WzQjFAQ8ZTxMwRmjnS28QEkFiEw5zw/jCM
   WzWWLuHbi1qj9T/5f6Wz1rZtVRHmm+dZs/Cpo5C0p3hnFBgvzixXNuc7E
   TOOjxxj5vr4ltM8hNXvYxDxwJBTLryuC86u8GJiTWmcvd86DEu7+uLg/K
   Z7nXcfA77/3I+Hxp/iODnlJI9vbrfpGxptBRixaIcfba5yJUm39dsNEgG
   Rk9Y9oXbO26iRQ+QjUekty47AfoMqK4BOZVfUPFhBK439PuW04+iRiKvf
   w==;
X-CSE-ConnectionGUID: WLrDdrBATQCL6rr8dTDpQw==
X-CSE-MsgGUID: l7JrGocSTu65uazkrr5Yqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61240635"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="61240635"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:48:00 -0700
X-CSE-ConnectionGUID: XEDq0BAIQKONVlH5WhhGyw==
X-CSE-MsgGUID: OpB+VcYLQbCgu+aB1uXTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141466587"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 21:47:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxqX-000OvE-0r;
	Thu, 22 May 2025 04:47:57 +0000
Date: Thu, 22 May 2025 12:47:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 0/137]
 drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of
 function 'acc_disconnect'
Message-ID: <202505221217.CTR5aOZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f4449cd8a773d9c0a82b899bfcef19858463d9ad
commit: 80fef39de7e9dbe706d0cbc820a09b5c05dc366f [0/137] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: x86_64-randconfig-123-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221217.CTR5aOZL-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221217.CTR5aOZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221217.CTR5aOZL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function 'acc_disconnect' [-Werror,-Wimplicit-function-declaration]
    1620 |         acc_disconnect();
         |         ^
   1 error generated.

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
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +/acc_disconnect +1620 drivers/usb/gadget/configfs.c

  1603	
  1604	static void configfs_composite_disconnect(struct usb_gadget *gadget)
  1605	{
  1606		struct usb_composite_dev *cdev;
  1607		struct gadget_info *gi;
  1608		unsigned long flags;
  1609	
  1610		cdev = get_gadget_data(gadget);
  1611		if (!cdev)
  1612			return;
  1613	
  1614	#ifdef CONFIG_USB_CONFIGFS_F_ACC
  1615		/*
  1616		 * accessory HID support can be active while the
  1617		 * accessory function is not actually enabled,
  1618		 * so we need to inform it when we are disconnected.
  1619		 */
> 1620		acc_disconnect();
  1621	#endif
  1622		gi = container_of(cdev, struct gadget_info, cdev);
  1623		spin_lock_irqsave(&gi->spinlock, flags);
  1624		cdev = get_gadget_data(gadget);
  1625		if (!cdev || gi->unbind) {
  1626			spin_unlock_irqrestore(&gi->spinlock, flags);
  1627			return;
  1628		}
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
