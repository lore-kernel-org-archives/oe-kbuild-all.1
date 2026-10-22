Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792694507;
	b=xNHcNIbGx800K8XzrD2yFliqCWwn0bON3uBA1dLgMYPaysCITvZDqKhCdNqvn65eWFiw
	 Zb+UCwt1UywgYRP4FNE/BKW0F+Xnke3eXLK7Vg9asv60Op3UoN+8ojOyu9QZHS8YSmKCf
	 bKHP2TS4ComKldJqvrjK+g2yCqkcpRPiFy1ukTnNeQsoEB+gdj5GfrjIzVNzh39OmBKRj
	 sqmNHr006Iy1jQO6lPDSyS+EFnbuHA82YeCXuDrdsT0VZ704uh+xRl6XMNV8fz/GYh/RC
	 gCbkjU5ChU/SrVidjbLAmy6vPzqNeBeYrmX1l3QSprr5HQ+vm7zK6EPHDjhV1swlQmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792694507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=oZzrMQjTf95Md4r2rDm2vVzxM7S5N3qByPb6xjDJ0hg=;
	b=vVIpj2c0EDGP+q5QXRZQ790puObRIKdPgjcrYp+eDhLO/3M8bczau9wTY2k6pfxhf/Li
	 lCOZ8ej2vMQrdSjpyjZHtVKcZ2mbmDXzr8br8fRR/XLMZEM7DcvDrKL7yapgjx0FqOJ6c
	 rf0ECd+SxH0Vn/9CdEF3mpOHfvmVpg29ENvWXEcxsdBYHxIzMJcW5PsDYFPwIfBuFkn3H
	 gVJfbvQ1qpg6YU2vFG3LfwGQk+whsPu2pfp8ECq3Sq56I7ycGVvU6l8hCa5PtLdnoMJe7
	 qjhphsmc5gyX1XzGKHEwAH1BfiVBV25sAPuuPrCmAf3epItO680sJi0825YDNWGjlCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dWjmzvRn;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AC9606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 18:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AC9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dWjmzvRn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792694505; x=1824230505;
  h=date:from:to:cc:subject:message-id;
  bh=YZLaMd+8ExfO8/Q8avwZ92HW24XVIXCW697VoCc1ifQ=;
  b=dWjmzvRnEV3OZ/j5HKHZ/jpsBZmGK5GcT38WrW9FiONZ9aWCC2BhxgwF
   XCDv/immBVfQWJwbggVprK6++YUO5Igwnara+7Golq7NdwSSmXKorgmS3
   cHoyj8w88+BurwTGlpmg08ctDS9cWnWSJTbnDR3I8IjEKGCC2Ha46gleQ
   ZNLqc6LElnfmnf2AX1QiICru1vdyuKDNIU39oBfjoTMCDGPlLUfyowaJX
   FBDAHA5nv6YYXM8TNziYufiK+ezS8BuVwvOzIcgjwWn2jw2X+yUo7ttjc
   Za3lra3j1cDh73VHnSBgihAravbMWGcVvWHESJFgZqBpD18lxVq7boFDm
   Q==;
X-CSE-ConnectionGUID: RSfmCPSnTBaAu1IN6zZysw==
X-CSE-MsgGUID: Hg3ZnbEPR9aQrpthrLuoZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1347721"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1347721"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 11:41:44 -0700
X-CSE-ConnectionGUID: QZYAZxdQSAOLShxpBvn7TA==
X-CSE-MsgGUID: XTS/rtdET3eEfI1Xr5GouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3528189"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2026 11:41:44 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJxjR-00000000RUw-0Spn;
	Thu, 22 Oct 2026 18:41:41 +0000
Date: Fri, 23 Oct 2026 02:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-10 3/3]
 drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no
 previous prototype for function '__acc_req_match'
Message-ID: <202610230226.pAk48ped-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-10
head:   c188dac82b97f76b0b0ad1cce72676701ebc53cf
commit: 8851a623b7a1a9456fc1e66855ad369c3f7f6483 [3/3] ANDROID: usb: gadget: Add Android Accessory Function
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261023/202610230226.pAk48ped-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230226.pAk48ped-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230226.pAk48ped-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:42:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      42 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_THREAD__ 1
         |         ^
   In file included from drivers/usb/gadget/function/android_f_accessory.c:9:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: warning: no previous prototype for function '__acc_req_match' [-Wmissing-prototypes]
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         |      ^
   drivers/usb/gadget/function/android_f_accessory.c:1392:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1392 | bool __acc_req_match(const struct usb_ctrlrequest *ctrl)
         | ^
         | static 
   7 warnings generated.


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
