Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2081AD7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 05:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733463471; cv=none; b=LNUsUVVumEkPDwe4X9VDlCcSld2c/1n9OnvnoDfIEUJMMdPVHn5K2Qffd5Azbflyz0hkXBfoNKa4t7zU/PKVqSH8zvoduMGnSyG6yBVZpU/d2+6DJ8C7cT4OOBADgYaw5gki38dEOCaPVYRH+z4BgflH5iSEPQO6y/P0BgHzvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733463471; c=relaxed/simple;
	bh=bbr41fMTCd++z2+ISf6quyH3EcJ74vs07S/HBBQXxm8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XScG+3ET4xTUrwawjiSgmMSxlZmiCK2NL8pBaCxlQhSWmNwtiPejQwsu7s0eVlrCYvc5T3/kE1/dZiQw4kjkf8PYa+EI43JSM3sV5tjkn5XYcwVpbT9XqlBRnIq3uoivX3qLa9CCnpG4JfTg6WMPpEfUcML4+/izsRcJDMsDOeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfXanXXz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfXanXXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733463470; x=1764999470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbr41fMTCd++z2+ISf6quyH3EcJ74vs07S/HBBQXxm8=;
  b=MfXanXXzDxcs4rsgkRwQ97bAw9cNqni5mzEGlBFprFxH2eAuLsNpmd3d
   I7GjFvk7KrwKaKi1Hqm22bsg1Ow/jr2kDZAXa0NvLaobnBYmPymXweNju
   Ws89p0eCFHweFfMk1x+PIlHuVGaR5l2BQKC9pmfvF0DhX/PHuFFtyNp3r
   ccmcfOfkOqNFF4nFsoacgoAHvbxnTWu5Ba1dSGpKiuODy5rrG/rd0x/4R
   hXHum0alVVodEzJOxODIFjhNhY4wxE9E4zWDyVu78eT40/vtfR1j2CeML
   VjXpHf5qxdqbawSZoVQ44Vfy8CUfTyEwyt4Q2C4bNkfo16X5J+pnkD59J
   w==;
X-CSE-ConnectionGUID: ZxhJJgwJTFKq85lWTjPdYg==
X-CSE-MsgGUID: Fvr5kZO+TrqhC6Fiqtqi9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37482243"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="37482243"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 21:37:50 -0800
X-CSE-ConnectionGUID: NuCgK6gYThSJEFGRgaz7Gw==
X-CSE-MsgGUID: wASj2Z3FS7iC0tm3XzHBpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="94506377"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Dec 2024 21:37:48 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJR2A-0000jb-1D;
	Fri, 06 Dec 2024 05:37:46 +0000
Date: Fri, 6 Dec 2024 13:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/usb.h:22:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412061309.YhBVAxJ6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d92a210e49a13fdc3fb2141d0dbc9f63bc642533
commit: 26f9f515d1b98fb93c8c797bdedacf05ada5a75a [1/1] ANDROID: usb: Add vendor hook for usb suspend and resume
config: x86_64-randconfig-122 (https://download.01.org/0day-ci/archive/20241206/202412061309.YhBVAxJ6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061309.YhBVAxJ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061309.YhBVAxJ6-lkp@intel.com/

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
