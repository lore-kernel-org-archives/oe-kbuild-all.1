Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2D7D2E5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710395062; cv=none; b=VML03C9KIvcP0YZYXxfUwSSf2S6OoIAr50cc/z5kkO+Op04xf0F14zcO1C2K0DISSQi+FrlZ8ecRJjdWDhLavaihXwZS+GoZ/KqTFZ5y+zAwmewUCqONiOMD/GB2H7E5a/GQwYwP4oQOvM1Gg7gUITf93LlAhSGVvn1pYwH4CtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710395062; c=relaxed/simple;
	bh=LZZDYKkMAfJWNDLgN+GTcVA6zkoX78xYZoAYvk2y4tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ty73jIxpAi1khEbf7x2cvxSn040GWtjoSu4/NsslaLIxazQMtsB05zavp8JvwGMaUHyAJSIo4gpFHTMH9aGvMhpyhFVV31dBShm8CzHn4lDNL9wCt6TVaH9rqt/OlRv9izNK5DWtEPE/aJgsCKPKlZB//XiPqZ5pUGVPpoxLOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIDab5a/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIDab5a/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710395060; x=1741931060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LZZDYKkMAfJWNDLgN+GTcVA6zkoX78xYZoAYvk2y4tw=;
  b=TIDab5a/Vswr7CM/ccyM6xZeEdZBh191HUcBuLD59t9/qevZfSF/P6sK
   rTblE726UuExkzvVi9l/UABI+J+glZWbTpzkkS7esPVz+Ddi5W6z+t5Cd
   zLJvaPOamR/vFvmZ3fKv0zlquIIO3t1oBDFhGKvLt0m0rFmBwfjwXKza3
   gmg4DP7HpJ1/iqA3K0/2lfpBjBtadU5u9y0LTrcC+O2NNVkqFdylv8btM
   gANjE7ri4ut/TtVJ5mHTNb3p2ujeTBxMc+8tEj3rMV3WOZU6BV8dl2AYW
   3frMoEjVtDqhv70WNs5opSNzh33H2SVxlN6EpCTUFh2UU5WH3RVD34CRj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5050944"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5050944"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 22:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12110852"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Mar 2024 22:44:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkdt2-000D9g-2K;
	Thu, 14 Mar 2024 05:44:16 +0000
Date: Thu, 14 Mar 2024 13:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 29/30]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for '__acc_req_match'
Message-ID: <202403141308.Mt3B1mOK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   31de4c08caf04886df7ee001c8b8af82824daab6
commit: 9b03ed2feb9c4cc3f15d44eda080caabb3a6b843 [29/30] ANDROID: usb: gadget: Add Android Accessory Function
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403141308.Mt3B1mOK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141308.Mt3B1mOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141308.Mt3B1mOK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no previous prototype for '__acc_req_match' [-Wmissing-prototypes]
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         |      ^~~~~~~~~~~~~~~


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
