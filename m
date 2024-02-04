Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CB02134F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707053215; cv=none; b=gna9s6aav7hbj9IiTt65oc7jcbOolIg5bYzGPczcmFnsXBJNk/3Iq8UYHAUGAKM/RvIxFhCiXkBlHvw2RuZx7sX77HqsHd2IQTi8Gz3N8cWuAb9210oY2b77V2bjJ5B8DxUQweRMRbeXjifz6MO2oYCzzDxQzR9YmZsdl7wjg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707053215; c=relaxed/simple;
	bh=2FlnSXlraAHUSEGbsmZmSsK1hwENTbK3yILVSbu2XZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpLIlxvO/Ie+vqu0vAzoHKEznisPc3l4o31oxPZXOz47PTrykA0umU8ESKhsH5OTwFTarolHFqr+P49wD0siU1nUW2ai3JO1DAPh1Ewa2RrpKpxH0cVXSKZKYDK/q8iJOjM0vkb+2cWdI6uEEPanJpvcMqgszGnPv/ktLzrVg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8Q9uBI1; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8Q9uBI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707053213; x=1738589213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FlnSXlraAHUSEGbsmZmSsK1hwENTbK3yILVSbu2XZo=;
  b=R8Q9uBI1AJM7IutSLhWYSgEuAO9tWIEcWzDqT60v+rb7p8WHfwtFq0/U
   uXxiCsvRvt77GVRW1s5vi9YLsbCnWTfQJ9Qma9+M3aIcgcB0lk+WxKJwz
   MX8he02qJPh8u6fmLVTDj7s4xrAk7R6ZuvesIdjMpedvYlhPydVrTl/cT
   d64FD7InYbZ04TvptcaO+fsVWyQX1uWE8MHVdRfcWG/LZqE5aGvdEnvO8
   x4WlRFGRk5TuOko4PlCu+ZrTg2LpqZMd8TvKtBIoBF8ZYRlQbtPGqtYsY
   7stq7rS/w2WqVnLGBjGPf4hndCwMSHN7J5ysWAkCRLaxCrPkMkmBJIA3y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="309707"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="309707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 05:26:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="782198"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Feb 2024 05:26:51 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWcWG-0006MK-1w;
	Sun, 04 Feb 2024 13:26:48 +0000
Date: Sun, 4 Feb 2024 21:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1]
 drivers/usb/gadget/configfs.c:1575: undefined reference to
 `acc_ctrlrequest_composite'
Message-ID: <202402042125.FKUOswxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   db57c320fa5ef4a3e402444e7e652f994eeba999
commit: e12e360999d84e5e56952c6c027803f662567d76 [1/1] ANDROID: usb: f_accessory: Check buffer size when initialised via composite
config: i386-randconfig-011-20240202 (https://download.01.org/0day-ci/archive/20240204/202402042125.FKUOswxH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402042125.FKUOswxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402042125.FKUOswxH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/gadget/configfs.o: in function `configfs_composite_disconnect':
   drivers/usb/gadget/configfs.c:1635: undefined reference to `acc_disconnect'
   ld: drivers/usb/gadget/configfs.o: in function `android_setup':
>> drivers/usb/gadget/configfs.c:1575: undefined reference to `acc_ctrlrequest_composite'


vim +1575 drivers/usb/gadget/configfs.c

  1538	
  1539	#ifdef CONFIG_USB_CONFIGFS_UEVENT
  1540	static int android_setup(struct usb_gadget *gadget,
  1541				const struct usb_ctrlrequest *c)
  1542	{
  1543		struct usb_composite_dev *cdev;
  1544		unsigned long flags;
  1545		struct gadget_info *gi;
  1546		int value = -EOPNOTSUPP;
  1547		struct usb_function_instance *fi;
  1548	
  1549		if (!android_device)
  1550			return 0;
  1551	
  1552		gi = dev_get_drvdata(android_device);
  1553		spin_lock_irqsave(&gi->spinlock, flags);
  1554		cdev = get_gadget_data(gadget);
  1555		if (!cdev || gi->unbind) {
  1556			spin_unlock_irqrestore(&gi->spinlock, flags);
  1557			return 0;
  1558		}
  1559	
  1560		if (!gi->connected) {
  1561			gi->connected = 1;
  1562			schedule_work(&gi->work);
  1563		}
  1564	
  1565		list_for_each_entry(fi, &gi->available_func, cfs_list) {
  1566			if (fi != NULL && fi->f != NULL && fi->f->setup != NULL) {
  1567				value = fi->f->setup(fi->f, c);
  1568				if (value >= 0)
  1569					break;
  1570			}
  1571		}
  1572	
  1573	#ifdef CONFIG_USB_CONFIGFS_F_ACC
  1574		if (value < 0)
> 1575			value = acc_ctrlrequest_composite(cdev, c);
  1576	#endif
  1577	
  1578		if (value < 0)
  1579			value = composite_setup(gadget, c);
  1580	
  1581		if (c->bRequest == USB_REQ_SET_CONFIGURATION &&
  1582							cdev->config) {
  1583			schedule_work(&gi->work);
  1584		}
  1585		spin_unlock_irqrestore(&gi->spinlock, flags);
  1586	
  1587		return value;
  1588	}
  1589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
