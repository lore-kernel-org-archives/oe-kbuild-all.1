Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE62848AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765613118; cv=none; b=U1fBYat6wlUYb3PbkfKmFCzx0qLbYSM/uiElYZ0SEgba9IzoT2c4l5FLoBO2HkmdvaTTi6zGkzHGVYMNxTMyrmqOn3xzIdgomEzb99j10bnaY5sVXROCU+lpiU2iuLnFXaLDzhZKT2iaTu0sWaxbS6jKCrpJKfYjuyh7CffFrKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765613118; c=relaxed/simple;
	bh=fled/hMsGcePxBCSU+WTVO/hBBU59kRF88J16JDL9g4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qd+lQR/jl67EDqdF0xZFYd8GH6WjlIdo9Sutb/+ZjHWxy7PqqlXxOGFm3hui6oxJzngmjijupyQmIWttzLHNgdsccd6V6f1s184u3qrm2iRiL1W1fT4huLTqjm5tyFXROLJsJEHdeJjl0tjEqZOpEII9D95ScEY3KC7sNeO8qwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApVa1c6+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApVa1c6+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765613116; x=1797149116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fled/hMsGcePxBCSU+WTVO/hBBU59kRF88J16JDL9g4=;
  b=ApVa1c6+3i5BHWPxEhgBUduXIOQcxz5rBwgKVAMYKF/7RVP4bYtMKh2Q
   cgfqY/sWIry5KaHp+O4z3xs4Vmte9GuSWNGOcx7LgbqugKn/n/9UgO/LJ
   mABjHRKUErwzJx7SzY1+itNSjVMPffLdJgUDZ7jEzY+2dEktx5Uai3h40
   +5Y1N4CYjAZ5Qj5yv7LhoGNILoR2yXd18h3AEAdM69kmCcCt15I1qkxCT
   m8cnPNwMB7lOqdE0sl6R7BJyV7JPoXKHKLHaBRsn0Ysnw6AqQ+P0hOvSe
   ZnQysVAnIJtZm+6mxldBWcvzVAGbcjcd73h4Bkn28/IZoc3wVg+tn6+CQ
   Q==;
X-CSE-ConnectionGUID: yfBG4W4NTh6VW4pxd1Cyug==
X-CSE-MsgGUID: /lRSxIGxQ3y45b31zxiPZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77919216"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="77919216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 00:05:16 -0800
X-CSE-ConnectionGUID: mHGhi/x2THielt0+BrvGKg==
X-CSE-MsgGUID: oRlBQ00xRXG0vh8dZlc2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201695634"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 00:05:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKcr-000000007HE-05Pe;
	Sat, 13 Dec 2025 08:05:13 +0000
Date: Sat, 13 Dec 2025 16:04:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for function '__acc_req_match'
Message-ID: <202512131508.ua5yPrkZ-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251213/202512131508.ua5yPrkZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131508.ua5yPrkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131508.ua5yPrkZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no previous prototype for function '__acc_req_match' [-Wmissing-prototypes]
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         |      ^
   drivers/usb/gadget/function/android_f_accessory.c:1392:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         | ^
         | static 
   1 warning generated.


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
