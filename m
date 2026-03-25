Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481863264ED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 18:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463068; cv=none; b=mRpZZETBN8YEiBGKfZBJAY0SVCkxQqhgSLBjurVxWYMTC+usseBjaJHeFPyl/1ITG4wrN6mYXmT6azG6iYS83moWhnd1yx0iIFjcCoxxvb223h8Yd4PgqjLBObSwv9at3/J7G5DFHPVasd18Dg9YOpd0XoVlrTH/gfq1w11mRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463068; c=relaxed/simple;
	bh=Hj/6sgYJrP8x3nBFA9QPr3ORaz6rBNL24TP89czKAlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kPa2IvZugcZtESvlbwUn46Xjz37uyL6K3zOltk0kUIZI4RwkjNUy7l2/3ABEzS0c6YAhZ30+VGqmtVqUGcpCZluRuYYh4RYFNYyn/jBRpV8IikfHoZWoATOWP3DguROfRVip2XXBrX83ohHm0LC81SSQP4B92dIh4yfnlHhD49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMoXaOSY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMoXaOSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774463066; x=1805999066;
  h=date:from:to:cc:subject:message-id;
  bh=Hj/6sgYJrP8x3nBFA9QPr3ORaz6rBNL24TP89czKAlc=;
  b=AMoXaOSYBewPIjodUbmWkSXdfgyvQQrFk/gogEuG6rvt3mdFcA/TQOp0
   SVKdy9lt666qx+klbDSqQeVfyGkQWhUGFp2BULDElzAI34qccNVWXNRsZ
   mwyGdlS2oDVBNNeqrK9ksb+5LewUD7IWp6n+p8T9zHgo5mNCKpDXelxCs
   7TooN4KRvquFkv+RcImXjF8Sww9zkWqFtsu05h22zsJGhM6vhL1ha8c54
   T3RN78X8rGIN0kBQTVidgnK62dTLKD25Tw4aI0WRRJC/ttQ8EgsfXj9Rz
   HbIlYNuRB2ZfVkA+OWXwR4JqsOcjLNWSDFvzkZwhStdXRGeOOPzpsJuPp
   g==;
X-CSE-ConnectionGUID: TF+NMKInRZm4UB/Z/wBV0w==
X-CSE-MsgGUID: r3WCntxdQ9GBI2BWRpdexQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86887644"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86887644"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 11:24:23 -0700
X-CSE-ConnectionGUID: TapLfVJ/SCmeLhS9bXKLLQ==
X-CSE-MsgGUID: quw4hleRRTeiOFvhI9fUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="224712729"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2026 11:24:22 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Stu-000000007Sx-3AVW;
	Wed, 25 Mar 2026 18:24:18 +0000
Date: Thu, 26 Mar 2026 02:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for function '__acc_req_match'
Message-ID: <202603260227.Ke3b8mh6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Neill,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ff78c78d65d3b2e46c6cd4c1b59e8e0e6150cdae
commit: d718cad4b605a726d93e9d6fc032fed768a7fcdb [0/1] ANDROID: usb: gadget: Add Android Accessory Function
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260326/202603260227.Ke3b8mh6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260227.Ke3b8mh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260227.Ke3b8mh6-lkp@intel.com/

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
