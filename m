Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD225C614
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400704; cv=none; b=Y6UwpxQ4+W84L5zCiAV5LperKMJKMlbPzkOOE8SQ4yBl6XhJ9cKKlkl7FHzjpFKmh4AU5ArHo+vwc0zMxCg0iF8Lq2UyZ7SdfMjT8kEzjPZtmRRxy/gSm/7Mq76ChzZfkYave4pvQw2BAH8yvvJQWhC7z6b2Ux42xQdVrA4KTfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400704; c=relaxed/simple;
	bh=m0YoRjKUpZS9+UnOGj5zMNnxHZg46LAA1z/bDbN7qxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lRuUWFbK4SnOUbEnq+SArgiFzkAGdnDDgpHb1YjxQDvU6z9fCRwItKk+BgGLHnAwkJ2i137Xn1iBafwgGeAHurIrKWcPpdAUik0LLEw3oR+ptekcxJcGQlTtMbQlA0hKGNrzkMkErSHR336HOXEajIdS96G/DLYkEmPeA/ORPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T58TBj1I; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T58TBj1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710400702; x=1741936702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0YoRjKUpZS9+UnOGj5zMNnxHZg46LAA1z/bDbN7qxI=;
  b=T58TBj1IayJVsW+57AmyOCN52x52ZkYvRzKlNdCm9TJqBQ4ZQlZOuRiZ
   oDDEqKR/3vRiTA3gd9NSADp0SZSVjKfBAcqdOZW/H0JgmCYXD7fYwnhHN
   kgg4iReUoyYla0IhyEnaV8InY+yC+D6IWTduwM0svw+h8fJd7DoFCWJIN
   Pljo/kYuvTRqFVicIqd0UrT8hXpD8U3fRmLWQunoHEW5hmewnV5UAwRzr
   UK3LxQ5Dw5R7Y5tk/jeZe3lVh6OWQPNK8yCjqeTYHR9iWRzc/pluEmTgk
   Y/udmUFrhEEpB4guPzH3fRycXL5gdOK6TjZYDbrvu1NLZd7Aok55Bqw79
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5330852"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5330852"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 00:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12263438"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Mar 2024 00:18:20 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkfM2-000DCm-1G;
	Thu, 14 Mar 2024 07:18:18 +0000
Date: Thu, 14 Mar 2024 15:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 29/30]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for function '__acc_req_match'
Message-ID: <202403141531.dXxeOHdP-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240314/202403141531.dXxeOHdP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141531.dXxeOHdP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141531.dXxeOHdP-lkp@intel.com/

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
