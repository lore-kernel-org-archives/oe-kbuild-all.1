Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B1D41A55D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 22:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352738; cv=none; b=lEpJqy9Hh2jzMVn0wi6LVYFu8Kx/8lvnVsCLbZB/8so6yZGi6FBhhiJsJZxQd170BfyAlsgN1BoZHHBIcxXwCmqyNSBEHyY2cKnoJOSuWizXouiTGgKa/LayUSIvB6p4EqYh2IC8vHIWQYPsiJ6rtTLL+J27vY7BaI5buhuZXys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352738; c=relaxed/simple;
	bh=xtd+/m1W2G4/cDp49HmRYG1ThLH6ozbJUl1dfZuGwq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TRUq5qQ7h7CCMloPP43IJb0ZMh/r75BnUD8YBGUMb9SKX4CJ2vHXfkoguqJZP6wddDLKahOaQs5vE6iBsV1XctRUShwLr+ZLuxpX5pw2edzWOGnVchM9Lcb8FgC9jZlRmkDWUv4DyrAEQY2fZMkumn6TfDNizg6ffmf2Hvh+60s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSuGjyR6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSuGjyR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787352736; x=1818888736;
  h=date:from:to:cc:subject:message-id;
  bh=xtd+/m1W2G4/cDp49HmRYG1ThLH6ozbJUl1dfZuGwq4=;
  b=LSuGjyR6ju9EzoUuKoVK03hzFfBOzkaIgnNdDBs6OlBmmxYRQlW5qUmI
   sNIHScK4H3bXuFp+imh108JZMBoW37GP5RMr0gOYDOdsz2L37QQIMXF0f
   m9ZhZsPR6Mnv49J3AP37VCqmi1Lqpks3hjYJRS3XenvvGChi+9psdGfvt
   uRKmBijo5HLTjxczxo/zOq//IGzCEU63gBiA3jY8zOnnBu0eSJAR4Y694
   6J4cguaB0R/nHD2dYOxz+hysls0tuZUM/AhyYjjOHsN8e/1aPsMefsyPg
   5e6lH1ntcC7+GXJh+PZjHQzAKyuhHccZBrQyq0tyK2CfydpUjyhxomJ6Y
   w==;
X-CSE-ConnectionGUID: PtT2DAiHQoCFCuk5cHpW7A==
X-CSE-MsgGUID: MwtDb08rQyKa+yxNGHAeSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="91779920"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="91779920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 15:52:15 -0700
X-CSE-ConnectionGUID: Pq/ffM7/R66N2Nru5swPRg==
X-CSE-MsgGUID: IgWd3PeLSj+/yHM3tWc0Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="264699597"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 15:52:14 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxY5r-00000000qXj-1pGx;
	Fri, 21 Aug 2026 22:52:11 +0000
Date: Sat, 22 Aug 2026 06:51:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/2]
 drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function
 'acc_disconnect'
Message-ID: <202608220616.rehAmLWe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ronak,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   233907fd00d20cb913bac974697845f18998af64
commit: 80fef39de7e9dbe706d0cbc820a09b5c05dc366f [0/2] ANDROID: usb: gadget: Resolve NULL pointer dereference in composite_disconnect
config: i386-randconfig-015-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220616.rehAmLWe-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220616.rehAmLWe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220616.rehAmLWe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:1620:2: error: implicit declaration of function 'acc_disconnect' [-Werror,-Wimplicit-function-declaration]
    1620 |         acc_disconnect();
         |         ^
   1 error generated.


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
