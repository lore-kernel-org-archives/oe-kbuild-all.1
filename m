Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E0014B08A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 18:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765650134; cv=none; b=tImSMBzhi8juFOFA4sgCU6NUT/l042KLq3YumyjtIUsqbtihdk1Br3VTwlvKqDTZ/m/tdST8zvPKi9hTPg7ocBPxEF2cseAIGZJ1kl3VVRl3qqz1D9bXn26RoOBdcrEbno3ADnnn5YcYh/DkD3rMcs+Aj+AOCehiQo1IIOI3/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765650134; c=relaxed/simple;
	bh=20cmcx0wVxBbQbBjV6xkVAWur8BNC9yDGwUjnUuPhCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+iETCa+A08qZ8K2us5zqRWXNu4es9mD+fMPiIjAU6IxK41UkzNVhCS4Pn85lzt9+Aa8SbuxVUknPVbg9wSS3YVr5r+UhadCg9sNKaFYNpAzjjJhVTJL/LrT2YrEOPVcw9HEzjatpOK4qtExXOZcKWchhEjwIhIQn6+JbsTEQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q36picwh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q36picwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765650133; x=1797186133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20cmcx0wVxBbQbBjV6xkVAWur8BNC9yDGwUjnUuPhCA=;
  b=Q36picwhocX7zVOUbgvacKRgJ60gljjt4RfhRN2DK4t9jfu7jcxE8BVX
   SM0X8mPj2oXLZi3rVloiSDia9BwPTrv2Iw3KOMc3nIySAZgvY3Nl6yGpm
   xC90qYtEz84MoZaLQ85NDbSSVDieRiVqUCkVcM3kNXc1ZfgH5EvT5YRxJ
   C+rYfN14SbyE7VC3Zbl7TqjbdMy2MKoh+5j19EHFUN7jZATXtVJvJoaZv
   U3kIslhuEezJ/UmZ8MQ179ltPUnrj1Ytml4oIcaodP1CEx2EW5SWtQ6fU
   feDRT1GXUVRN680ktB88l7ZB715TykwMsLFvNyECNb8moR76lvQfLAkeY
   Q==;
X-CSE-ConnectionGUID: p9+vlmGyQWO5K0nYjt6yaQ==
X-CSE-MsgGUID: P08AknUZSLOfXU9xLXJC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67579200"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67579200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 10:22:12 -0800
X-CSE-ConnectionGUID: PEBUZg6kSsa7CY56mp0fug==
X-CSE-MsgGUID: L/2QoxtIQw+ka+686C3NDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="202263610"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Dec 2025 10:22:11 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUUFs-00000000839-48IT;
	Sat, 13 Dec 2025 18:22:08 +0000
Date: Sun, 14 Dec 2025 02:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for '__acc_req_match'
Message-ID: <202512140247.4IRg52kj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: d718cad4b605a726d93e9d6fc032fed768a7fcdb [3/3] ANDROID: usb: gadget: Add Android Accessory Function
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251214/202512140247.4IRg52kj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140247.4IRg52kj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140247.4IRg52kj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no previous prototype for '__acc_req_match' [-Wmissing-prototypes]
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         |      ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [y]:
   - INTEL_MEI_HDCP [=y] && (DRM_I915 [=n] || DRM_XE [=y])
   - INTEL_MEI_PXP [=y] && (DRM_I915 [=n] || DRM_XE [=y])


vim +/__acc_req_match +1392 drivers/usb/gadget/function/android_f_accessory.c

  1391	
> 1392	bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
  1393	{
  1394		struct acc_dev *dev = get_acc_dev();
  1395		u8 bRequestType = ctrl->bRequestType;
  1396		u8 bRequest = ctrl->bRequest;
  1397		bool ret = false;
  1398	
  1399		/*
  1400		 * If instance is not created which is the case in power off charging
  1401		 * mode, dev will be NULL. Hence return error if it is the case.
  1402		 */
  1403		if (!dev)
  1404			return false;
  1405	
  1406		if (bRequestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
  1407			switch (bRequest) {
  1408			case ACCESSORY_START:
  1409			case ACCESSORY_SEND_STRING:
  1410			case ACCESSORY_SET_AUDIO_MODE:
  1411			case ACCESSORY_REGISTER_HID:
  1412			case ACCESSORY_UNREGISTER_HID:
  1413			case ACCESSORY_SET_HID_REPORT_DESC:
  1414			case ACCESSORY_SEND_HID_EVENT:
  1415				ret = true;
  1416				break;
  1417			default:
  1418				ret = false;
  1419			}
  1420		} else if ((bRequestType == (USB_DIR_IN | USB_TYPE_VENDOR)) &&
  1421				(bRequest == ACCESSORY_GET_PROTOCOL))
  1422			ret = true;
  1423	
  1424		put_acc_dev(dev);
  1425		return ret;
  1426	}
  1427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
