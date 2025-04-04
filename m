Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E12117A305
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755765; cv=none; b=RODaHecizv5DSkznHDsaGKoHy/UaMT9K1sULF27mRveWRBlUwZ9O/4DFwdXQnNkue5A5TLRKfwyxOjis0w+rVplWS9yTJOa4z8cHqlMdcl76GjKAvLHRMkhYPmPPprTnBnJm4Oml2y5kkWb6Cf4HeTCWYDONQIsMwArnXE+z5kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755765; c=relaxed/simple;
	bh=1NOVPT45p0ESeXjMNdgGRc6+XJJNl3cL2NcayYX/Vms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RrrLPtfNV6zbq0SBmbJYX0+uaDEyqD1A4au4A94UMxGoHw6kmH0C8OpaAoKCmncEESUWcp11GZOgADNk69I3Url2XNstf54MCkXyChx1mDiABvbJwXzVvfPAhd9ED3edgpU8CZ0+ON2vK9bJmdeq2w9Qt3UGAKyAgNP0FlhWXA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nqnhqbcs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nqnhqbcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743755763; x=1775291763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1NOVPT45p0ESeXjMNdgGRc6+XJJNl3cL2NcayYX/Vms=;
  b=nqnhqbcszMP2w2c1bJDDyY1lQt89jVb7WhCKyscsUWOZQEtELhaBoc50
   JnPzJhRe3qqOzszma/j9RJmwmBzxcR4n81pCQfOwdVLxMDLeTqXOFrMDh
   YT35smYYrN07SRwskcmdbkWhnzcSQHUrdPnSs+1NPdQBDCWknvS37hg09
   ZnW3/Jy1NkA3HCdZvZ20O+mcYiaMiJU/+/iFKGfD9bm5BOo85TOJkuizz
   FbBp6ds4wFqKhDTBkFR0iI5DQdlhAOrH4tcGbGnOb114xCnmQaA+SPXj4
   0E+jh84WCd44NjTcaVlWX1LCRduxLwYYeTOETCHNzEOgp3E1DVe3CusfN
   Q==;
X-CSE-ConnectionGUID: tjDEFJZZSjmLQuDZ5lo6cw==
X-CSE-MsgGUID: nysAxZfFQ8m9YLnPBc7ROw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="62589090"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="62589090"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:36:03 -0700
X-CSE-ConnectionGUID: JVFv/yFbS1SBuFLIwxWnng==
X-CSE-MsgGUID: lVsmJzBxRFqeY0Aim1Zhfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="127149086"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Apr 2025 01:36:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0cWt-00015r-0x;
	Fri, 04 Apr 2025 08:35:59 +0000
Date: Fri, 4 Apr 2025 16:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:main-16k-gs-shusky-5.15 17/17]
 drivers/usb/gadget/configfs.c:1614:9: error: implicit declaration of
 function 'acc_disconnect'
Message-ID: <202504041620.NdMtDy8I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ronak,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common main-16k-gs-shusky-5.15
head:   f344ab3d86fe50dc56c87b7a96c07b8210635ec5
commit: 36cfd6f81afc6d2eab297f686f00eafd5a807cec [17/17] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: i386-randconfig-062-20250404 (https://download.01.org/0day-ci/archive/20250404/202504041620.NdMtDy8I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504041620.NdMtDy8I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504041620.NdMtDy8I-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/gadget/configfs.c: In function 'configfs_composite_disconnect':
>> drivers/usb/gadget/configfs.c:1614:9: error: implicit declaration of function 'acc_disconnect' [-Werror=implicit-function-declaration]
    1614 |         acc_disconnect();
         |         ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

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
