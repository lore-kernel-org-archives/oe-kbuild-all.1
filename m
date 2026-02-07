Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3892BD5BF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770447758; cv=none; b=N7jTBqqII3aCN2+rjYiKx4+DAX2XLuEZmIqQqXNbtYKgX0KwYV2/vTUtBycVuMyN1z193VSdQpCRz+8ERi9yc3g6jksgigjORmIUMObZeBwZc4/LwV4kXJ9Aup5L6r/tueej7PHPV+BVH+hxvwevbyEjzfDjWauunLBM7yN3kvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770447758; c=relaxed/simple;
	bh=GHrqm+LDofjl8B3E7VcnKoG9ntCGBlm07lheqWfGh+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCcdNjlM8SWq+vCelhOhEEBe+cbPf6zgFpOjbGKzpn2tkHpVm+QTSAMq0LEyQwNQ1iBWFYcjUXwfs42KYwtZdqfmcAPQjNPWOS3ws/aAaj4z9JsoyAKSZnBG576vrAlNVmQx2EON17R5Adz1iMfNiocUbRs48RR+EUsu0fS0bV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxPK+qgM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxPK+qgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770447758; x=1801983758;
  h=date:from:to:cc:subject:message-id;
  bh=GHrqm+LDofjl8B3E7VcnKoG9ntCGBlm07lheqWfGh+o=;
  b=OxPK+qgMFIoE1OOmbMj4jG+oyoAO1kizWtNBIbDW/eWMUupqMd/WIPCX
   F9SsoxJfb+gPCZcEjUoGOZ8cl3fI8rgARoYixSVtfBejt4MMKWdn3jdu9
   SHUyFBKu/RjoyN8uXEXtmbdY05XYbhnchgdodF2SpI2x0XJPYAdcw+3ud
   4ANIBIXQirT/szMI5ifSZ9Y7YokitDC/cwjD3WTl6yVprWq4mUxhyJysy
   maEaSUDPwvT0Ddsbm/NtqFyN4eVuReWJxAQJ0pa8chfXnARAZC3vE4GLG
   6Mja5v7lCI23BFFsKFpNg5QZPThB5cD9sAfDaAI57tGGcxNv18+vtqEWT
   A==;
X-CSE-ConnectionGUID: zpJxTQxuRbGMXVoSJQwngg==
X-CSE-MsgGUID: b5FB4CCgQUWR2xH5mfXKcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71539455"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71539455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:02:37 -0800
X-CSE-ConnectionGUID: QyejbDOGSIquoDt/c1vY6A==
X-CSE-MsgGUID: bnoWnRYcR4GmE4n92/pdpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210870759"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Feb 2026 23:02:35 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocKu-00000000lTE-1TIK;
	Sat, 07 Feb 2026 07:02:32 +0000
Date: Sat, 07 Feb 2026 15:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/6]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse:
 symbol '__acc_req_match' was not declared. Should it be static?
Message-ID: <202602071403.v4sr9B3F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: d718cad4b605a726d93e9d6fc032fed768a7fcdb [0/6] ANDROID: usb: gadget: Add Android Accessory Function
config: i386-randconfig-062-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071403.v4sr9B3F-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071403.v4sr9B3F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071403.v4sr9B3F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:786:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:798:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:840:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse: symbol '__acc_req_match' was not declared. Should it be static?

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
