Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685001C1F15
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Dec 2024 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734645241; cv=none; b=uCwH0Ib45RxpFYPkRqaptOT30UTimcqHr6asQFd34EMJMvM9aVb8JFccpuVQSiZiLorUv8IU05lCpJn1fmAlURDqRKfhCbRo7ZtjMLFQE0gOAK/MmM3nhh2Uw3swlXOTKnDsyml9KHiPiJ1Lk7TgFkKNG5NQXoNmFAFcDfXjFuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734645241; c=relaxed/simple;
	bh=uwRJhKzJGSrFJR8Jo01G2TZZ2j9Z8wTJSMMDYL5ufyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSdJKqLa4PmRS2+F/+/vTMsw54R7b/tKCQGtKMPLXJ4zsOKA1Aj3UmuBT+cjzkdUM+JzBPgpi6IZV9zSu7dZAo/n5Y/w8UP66wotxyGfGu/+ZUmjHNsUURQzG+F9B6o7aqvyyDqeYMRrz2qXHVhuhOLZrqPlJEe0v6lVcMjCkzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SQpzJDuY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SQpzJDuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734645239; x=1766181239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uwRJhKzJGSrFJR8Jo01G2TZZ2j9Z8wTJSMMDYL5ufyg=;
  b=SQpzJDuYgePo7kN0PmoSpTVpVtL1B/LX+GiCkP8XY8V6qbjpXmzeOdW2
   GC834syzkIfisf6NZL8+NhUawU+bnV2zJavZA04roPpZNxEzIIZCMAia8
   tZ+TZxl3bQK8oPoWYcqV/Hmazdy586fPfFVRB6Q0iCKSORU+GWVJImH8k
   n9P7ZppzO0PaT7Yjy1FIcCP2ecOmyMmM2xISRIHYcHUOUdIBKaPLXlEGc
   5xtwEyM+EXMeCTebBdbEom/WR29Eqydc3D76ptGBhqXTomBJ1EhcDKBhv
   6yVhLpiJNJzTMrZmHuTLZYWkVNjBjlboviH2CmCcTxVau7ATcTniUvy5I
   g==;
X-CSE-ConnectionGUID: pkGw1o+WQWeUe4803pgV0A==
X-CSE-MsgGUID: AeCTI70UTQqqfJAPBwTgpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="60566893"
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="60566893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 13:53:59 -0800
X-CSE-ConnectionGUID: Ya4Z8mp7TSmpkG0KoOai3w==
X-CSE-MsgGUID: hJ/KS38tSmyfaizFZelFBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,248,1728975600"; 
   d="scan'208";a="98853154"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Dec 2024 13:53:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOOSx-0000ZT-1D;
	Thu, 19 Dec 2024 21:53:55 +0000
Date: Fri, 20 Dec 2024 05:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: drivers/hid/hid-logitech-hidpp.c:156: warning: Excess struct member
 'dev' description in 'hidpp_scroll_counter'
Message-ID: <202412200537.jBsOPSSY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 0610430e3dea51c9a00565af685745898048fa2b HID: logitech-hidpp: add input_device ptr to struct hidpp_device
date:   6 years ago
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241220/202412200537.jBsOPSSY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412200537.jBsOPSSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412200537.jBsOPSSY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/hid-logitech-hidpp.c:156: warning: Excess struct member 'dev' description in 'hidpp_scroll_counter'
   drivers/hid/hid-logitech-hidpp.c:242: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * hidpp_send_message_sync() returns 0 in case of success, and something else
   drivers/hid/hid-logitech-hidpp.c:396: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * hidpp_prefix_name() prefixes the current given name with "Logitech ".
   drivers/hid/hid-logitech-hidpp.c:439: warning: Function parameter or struct member 'input_dev' not described in 'hidpp_scroll_counter_handle_scroll'
   drivers/hid/hid-logitech-hidpp.c:502: warning: Function parameter or struct member 'bit' not described in 'hidpp10_set_register_bit'
   drivers/hid/hid-logitech-hidpp.c:1468: warning: Function parameter or struct member 'hidpp' not described in 'hidpp_touchpad_fw_items_set'
   drivers/hid/hid-logitech-hidpp.c:1468: warning: Function parameter or struct member 'feature_index' not described in 'hidpp_touchpad_fw_items_set'
   drivers/hid/hid-logitech-hidpp.c:1468: warning: Function parameter or struct member 'items' not described in 'hidpp_touchpad_fw_items_set'
   drivers/hid/hid-logitech-hidpp.c:1468: warning: expecting prototype for send a set state command to the device by reading the current items(). Prototype was for hidpp_touchpad_fw_items_set() instead


vim +156 drivers/hid/hid-logitech-hidpp.c

5a2b190cddb9aa Peter Hutterer 2016-06-29  139  
4435ff2f09a2fc Harry Cutts    2018-12-05  140  /**
4435ff2f09a2fc Harry Cutts    2018-12-05  141   * struct hidpp_scroll_counter - Utility class for processing high-resolution
4435ff2f09a2fc Harry Cutts    2018-12-05  142   *                             scroll events.
4435ff2f09a2fc Harry Cutts    2018-12-05  143   * @dev: the input device for which events should be reported.
4435ff2f09a2fc Harry Cutts    2018-12-05  144   * @wheel_multiplier: the scalar multiplier to be applied to each wheel event
4435ff2f09a2fc Harry Cutts    2018-12-05  145   * @remainder: counts the number of high-resolution units moved since the last
4435ff2f09a2fc Harry Cutts    2018-12-05  146   *             low-resolution event (REL_WHEEL or REL_HWHEEL) was sent. Should
4435ff2f09a2fc Harry Cutts    2018-12-05  147   *             only be used by class methods.
4435ff2f09a2fc Harry Cutts    2018-12-05  148   * @direction: direction of last movement (1 or -1)
4435ff2f09a2fc Harry Cutts    2018-12-05  149   * @last_time: last event time, used to reset remainder after inactivity
4435ff2f09a2fc Harry Cutts    2018-12-05  150   */
4435ff2f09a2fc Harry Cutts    2018-12-05  151  struct hidpp_scroll_counter {
4435ff2f09a2fc Harry Cutts    2018-12-05  152  	int wheel_multiplier;
4435ff2f09a2fc Harry Cutts    2018-12-05  153  	int remainder;
4435ff2f09a2fc Harry Cutts    2018-12-05  154  	int direction;
4435ff2f09a2fc Harry Cutts    2018-12-05  155  	unsigned long long last_time;
4435ff2f09a2fc Harry Cutts    2018-12-05 @156  };
4435ff2f09a2fc Harry Cutts    2018-12-05  157  

:::::: The code at line 156 was first introduced by commit
:::::: 4435ff2f09a2fc43d1201d732e6e606b4d4b1ad5 HID: logitech: Enable high-resolution scrolling on Logitech mice

:::::: TO: Harry Cutts <hcutts@chromium.org>
:::::: CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
