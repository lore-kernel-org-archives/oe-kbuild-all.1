Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD741509AB
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725792490; cv=none; b=BMIvy0ZIJYnNfa+OYxUHDpAbxmQF1/VIhUSvUqABQsNlPVpih5MIp/17R642Vy9GQuHRqEJIgXeNR5+PCJFunD096u2ODTPa/N3w1JMS5le/Icy0mMQN80nX9t7QqK36o1enRCiTtGoA9fsrZ8bM0o7+WL/fLd9/nURfN1m8XFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725792490; c=relaxed/simple;
	bh=nqrsWv9yPPcObIiXvuPWnyY/H9c3H+/3qTUcKV+uBIM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BkqKmP59CDOW9VDoY3TM4+jBRmBJRb/YRohD5VU/AQUHUkrpwDwWMhm3JM9W/r/vN3tHChf8cYFSA8DeXqMNMU8OnOVqHxS9sOPmt7U7HyKwc4Fcp7vzUEjMfAzTNM/r+H1hQhGOhajlIVgxjSloncaunPm62Hz6qvE0q8dAgyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INcf2m2e; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INcf2m2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725792489; x=1757328489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nqrsWv9yPPcObIiXvuPWnyY/H9c3H+/3qTUcKV+uBIM=;
  b=INcf2m2eLwcp0hXhxQQY8H3xHTUBMUrJQPtvAeUMBvZhfgTOv7wf3jQH
   fDSUd+BZ23gMgCQKT1iy/VXehaseQqAUB4l2SqmVJQPt+amcMw3f0LvFM
   VtUCib3E/gJ3vSKWqcztdl23WpGMHe9jKFZJvl+d/tjg8ReEjmYzKD66t
   IXF/LIMX+g2odeq3laXEFJcwL0XTRnvD/C0skiHmHPUAwbgPf7JDduC19
   Vk/48v5e9FTKU4klOPGdR1US8SjIzev2MNtrN2Lkj6HEeEp5idbx/Fx+x
   L7sn3IkI1tGgXpZp4jcA6wEWWuJTfoReNapLUySb6yjYsfIszXJ1vH9OS
   g==;
X-CSE-ConnectionGUID: vj5MeN91RtiPk+bZUNh6iQ==
X-CSE-MsgGUID: uN6MDpDCT+aIWPio/o5wig==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="28234353"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="28234353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 03:48:08 -0700
X-CSE-ConnectionGUID: JwO57FYOQbKh43D8dGP/IA==
X-CSE-MsgGUID: egT1uURWTkGeZyXVrODS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66184980"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2024 03:48:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snFSe-000DSF-0n;
	Sun, 08 Sep 2024 10:48:04 +0000
Date: Sun, 8 Sep 2024 18:47:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Amit Sunil Dhamne <amitsd@google.com>
Subject: [bvanassche:usb 3/3] drivers/usb/roles/class.c:39:31: error:
 duplicate member 'key'
Message-ID: <202409081825.OlP6X3uN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux usb
head:   fe1d1701ee563aeac375b3d2a2f95cde7a5ab904
commit: fe1d1701ee563aeac375b3d2a2f95cde7a5ab904 [3/3] usb: roles: Fix a false positive recursive locking complaint
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409081825.OlP6X3uN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081825.OlP6X3uN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409081825.OlP6X3uN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/roles/class.c:39:31: error: duplicate member 'key'
      39 |         struct lock_class_key key;
         |                               ^~~


vim +/key +39 drivers/usb/roles/class.c

fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  22  
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  23  struct usb_role_switch {
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  24  	struct device dev;
fe1d1701ee563a drivers/usb/roles/class.c  Bart Van Assche   2024-09-04  25  	struct lock_class_key key;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  26  	struct mutex lock; /* device lock*/
1c9be13846c0b2 drivers/usb/roles/class.c  Xu Yang           2024-01-29  27  	struct module *module; /* the module this device depends on */
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  28  	enum usb_role role;
b787a3e7817590 drivers/usb/roles/class.c  Xu Yang           2024-01-29  29  	bool registered;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  30  
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  31  	/* From descriptor */
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  32  	struct device *usb2_port;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  33  	struct device *usb3_port;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  34  	struct device *udc;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  35  	usb_role_switch_set_t set;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  36  	usb_role_switch_get_t get;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  37  	bool allow_userspace_control;
fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22  38  
fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22 @39  	struct lock_class_key key;
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  40  };
fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  41  

:::::: The code at line 39 was first introduced by commit
:::::: fc88bb11617978fb3fcfcc697fd5c9d2dae9c4a3 usb: roles: add lockdep class key to struct usb_role_switch

:::::: TO: Amit Sunil Dhamne <amitsd@google.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
