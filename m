Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A2422C6C3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 21:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733522066; cv=none; b=lEmsd1ReHhWYW6HtylKoRRT5u8JiUrnvnxEQ7oqmH6+3w2vZGflCd+kILZwWU4AMIvNdvO/OJ8C7Xdqwbr5AvoieG6PczCBtxzRrdfiTeZhjqLcAAO2jaNPTp+WnH4kLzh7r8FWx4Oh2y4a88xqbnhaf8niyR4SmzP7dRlhmo6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733522066; c=relaxed/simple;
	bh=A9WaURGMZaK9AFHBx2oL5vxX0v5fk8SnUBedRf8TbFo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r61qjx7pwPVhtCbSBBGBpTduWoBTex0RM0z9w0tAq8SziSb0HNsiZKwehOIu3M6dsu/wUwADa6pjU1//9Y6DHxM6jR8pfkqZYavPL8PENOsJ9um6NQdKQ6PSc8RyyTazK6VJdhEZn7CbtcnZhr3qNfO42UEMnJletRfnmKZs/SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G54Lw1J/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G54Lw1J/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733522064; x=1765058064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9WaURGMZaK9AFHBx2oL5vxX0v5fk8SnUBedRf8TbFo=;
  b=G54Lw1J/mqZ6lZQd6ud7RDgmOCKH8Ze4oUBA4vrJ9mEZffQYunAqc2Hx
   HIuXNEwIud0usdzP3v9h4SoFWIwV3NzMFSSIxpofSojBv7KGIoMXjXItS
   DJxo/kjWPvgClBlFPgpP6DCKkNutN+UX15e5we1UP3OTAo8i52NlT+XLw
   0Lp17aqh7s44lfTlNvFxAsBkt971oPbs2Go2WIOaAdb5OZL7ZCZXZfFJ/
   00kP8Nh5toqs8GQucdI0muS/JuFU4Zr/mge+xKLGaH8alhGx+c1tFemWq
   xw+idh/hVgeA+Nuy68NV0GJrYyCJoZ8gGmxkijCQcRdf0T/nU+11J24EP
   Q==;
X-CSE-ConnectionGUID: cY8b1HcCSiu6rdWnjDqO1Q==
X-CSE-MsgGUID: povcHixnShOOfTDnNHWEtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="59287510"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="59287510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 13:54:24 -0800
X-CSE-ConnectionGUID: jnR+YfqlRgmOgTbK1DTiog==
X-CSE-MsgGUID: EzY9K8zkTNuX037acxjJcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="125353863"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2024 13:54:23 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJgHE-0002HV-1x;
	Fri, 06 Dec 2024 21:54:20 +0000
Date: Sat, 7 Dec 2024 05:53:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/usb.h:22:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412070534.cvMtHiFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   74c0232c5b36765c11b577e9b81df9cfc95c2432
commit: 26f9f515d1b98fb93c8c797bdedacf05ada5a75a [1/1] ANDROID: usb: Add vendor hook for usb suspend and resume
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/20241207/202412070534.cvMtHiFv-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070534.cvMtHiFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070534.cvMtHiFv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/core/driver.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   drivers/usb/core/driver.c: note: in included file:
>> include/trace/hooks/usb.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/usb.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/usb.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +22 include/trace/hooks/usb.h

    13	
    14	DECLARE_HOOK(android_vh_configfs_uevent_work,
    15			TP_PROTO(bool connected, bool disconnected, bool configured, bool uevent_sent),
    16			TP_ARGS(connected, disconnected, configured, uevent_sent));
    17	
    18	/*
    19	 * Following tracepoints are not exported in tracefs and provide a
    20	 * mechanism for vendor modules to hook and extend functionality
    21	 */
  > 22	DECLARE_RESTRICTED_HOOK(android_rvh_usb_dev_suspend,
    23		TP_PROTO(struct usb_device *udev, pm_message_t msg, int *bypass),
    24		TP_ARGS(udev, msg, bypass), 1);
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
