Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D91DA4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715343551; cv=none; b=VcaYeyqC6zvZ0NyNyql8rHG7YDPc55IsR7uQUfwtryYgwqfRaY83LjggHpxhngQyjgMEI+owJ8OC1jjiwdxqUGq1Xp594mdCXaFnlkfwOShOI6SRcjueaHAyxIc4XhwaXsxrqaoXsydmFUyGFdipFH0Yz4EeIKfYvQuYCZajqMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715343551; c=relaxed/simple;
	bh=4191olldBnq9DmYWWVA0YBDyx1/967DbCsmOxnKl0gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/ot4gyKtfjB3VsSnjPBSV9UV4xlpOY4fXcFzU87UmUbfK/L71jlm0PeuF6O6zu0pfxX55zzUlCZSLoZuyOekXOZGJT30b1CW93a73NKofs9ZyImSv+tCOXIUhiKsSz3JuldZ0k71M9Rh6eI5BIT0yXXevNqm3UqOw2KaGnj6QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFMSg0aD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFMSg0aD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715343549; x=1746879549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4191olldBnq9DmYWWVA0YBDyx1/967DbCsmOxnKl0gQ=;
  b=SFMSg0aDqmGwoyDPNNg8H6a/N5ykQ1kGdoKAIlB6PKLEtJsuRZ38PI8f
   dqXZkF+CubV6yqG3o41M5oo8ct7DUlgHLPT9K9VWfEI0/cq5XGSw5fbLb
   jDDJaaM+UbKv6GAJlfv4mZbc+NXJWKWWKY1zmgE3n9aBG/fuswbJ83WoL
   fV+j/GOrH5w/XZ/YUFibHKDWk0stikzfIMkb2FEF1GA50O1wc0fLxEjjn
   gZ4iFQowexDOmhn8Q1kl2MszOTOr4fxhRPUlknJ5BdopdIusQbWRkHRra
   3eX028VKtxcfOgfNELp2S48cI5ezyci40kf3VQ1gIPuLEr2vGayf/7qZy
   g==;
X-CSE-ConnectionGUID: KRo2agV/S5iLckA1n/w8cw==
X-CSE-MsgGUID: PkFafN/hS4iMSLyRbCSiOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15155343"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="15155343"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 05:19:08 -0700
X-CSE-ConnectionGUID: W9QREFv0QBmNn/BUgf5LEQ==
X-CSE-MsgGUID: Ry6hToj5Q6ajT9TZdDGyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="52807958"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2024 05:19:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5PDM-00067T-0s;
	Fri, 10 May 2024 12:19:04 +0000
Date: Fri, 10 May 2024 20:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 23/78] drivers/hid/hid-himax.c:1494:26:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202405102036.8oOEhnI8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   cd87d14c5c4cc74e7c89677acb4aa9c804165fc7
commit: 50c4d6f26836b63f8f5fe713f49aef462e05399f [23/78] CHROMIUM: HID: hid-himax: Implement hidraw debug functions
config: arm64-randconfig-r113-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102036.8oOEhnI8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240510/202405102036.8oOEhnI8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102036.8oOEhnI8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/hid/hid-himax.c:402:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:402:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:402:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:469:35: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:469:35: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:469:35: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:645:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:645:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:645:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:653:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:685:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:685:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:685:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:687:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:687:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:687:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:737:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:737:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:737:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:785:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:785:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:785:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:802:36: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:802:36: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:802:36: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:839:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:839:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:839:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:855:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:855:30: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:855:30: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:911:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1247:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1247:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1247:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1261:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1261:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1261:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1268:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1268:20: sparse:     expected unsigned int [addressable] [usertype] dword
   drivers/hid/hid-himax.c:1268:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1290:21: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1372:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1372:20: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1372:20: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1379:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1379:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1379:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1380:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __le16 [usertype] @@
   drivers/hid/hid-himax.c:1380:22: sparse:     expected unsigned short
   drivers/hid/hid-himax.c:1380:22: sparse:     got restricted __le16 [usertype]
   drivers/hid/hid-himax.c:1393:13: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:1405:30: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1413:39: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:1449:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1449:37: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1449:37: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1451:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1451:37: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1451:37: sparse:     got restricted __le32 [usertype]
>> drivers/hid/hid-himax.c:1494:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] vid @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1494:26: sparse:     expected unsigned short [usertype] vid
   drivers/hid/hid-himax.c:1494:26: sparse:     got restricted __be16 [usertype]
>> drivers/hid/hid-himax.c:1495:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] pid @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1495:26: sparse:     expected unsigned short [usertype] pid
   drivers/hid/hid-himax.c:1495:26: sparse:     got restricted __be16 [usertype]
>> drivers/hid/hid-himax.c:1500:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] y_res @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1500:28: sparse:     expected unsigned short [usertype] y_res
   drivers/hid/hid-himax.c:1500:28: sparse:     got restricted __be16 [usertype]
>> drivers/hid/hid-himax.c:1501:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] x_res @@     got restricted __be16 [usertype] @@
   drivers/hid/hid-himax.c:1501:28: sparse:     expected unsigned short [usertype] x_res
   drivers/hid/hid-himax.c:1501:28: sparse:     got restricted __be16 [usertype]
   drivers/hid/hid-himax.c:1622:57: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1622:57: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1622:57: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:1624:61: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] *[assigned] word @@
   drivers/hid/hid-himax.c:1624:61: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1624:61: sparse:     got unsigned int [usertype] *[assigned] word
   drivers/hid/hid-himax.c:1758:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:1758:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:1758:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:1759:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be16 const [usertype] *p @@     got unsigned short [usertype] * @@
   drivers/hid/hid-himax.c:1759:31: sparse:     expected restricted __be16 const [usertype] *p
   drivers/hid/hid-himax.c:1759:31: sparse:     got unsigned short [usertype] *
   drivers/hid/hid-himax.c:1860:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:1860:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:1860:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:1971:44: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1971:44: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1971:44: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1972:41: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1972:41: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1972:41: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1979:52: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1979:52: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1979:52: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1980:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1980:49: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1980:49: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:1981:50: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:1981:50: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:1981:50: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2035:60: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2035:60: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2035:60: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2108:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2108:26: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2108:26: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:2491:35: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2491:35: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2491:35: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2496:47: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int [usertype] * @@
   drivers/hid/hid-himax.c:2496:47: sparse:     expected restricted __le32 const [usertype] *p
   drivers/hid/hid-himax.c:2496:47: sparse:     got unsigned int [usertype] *
   drivers/hid/hid-himax.c:2502:46: sparse: sparse: cast to restricted __le32
   drivers/hid/hid-himax.c:2692:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:2692:41: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:2692:41: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:3524:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3526:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3528:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3530:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3532:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3534:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3536:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3538:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3540:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3542:17: sparse: sparse: cast to restricted __le16
   drivers/hid/hid-himax.c:3686:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:3686:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:3686:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c:3688:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dword @@     got restricted __le32 [usertype] @@
   drivers/hid/hid-himax.c:3688:28: sparse:     expected unsigned int [usertype] dword
   drivers/hid/hid-himax.c:3688:28: sparse:     got restricted __le32 [usertype]
   drivers/hid/hid-himax.c: note: in included file (through include/drm/drm_panel.h, drivers/hid/hid-himax.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +1494 drivers/hid/hid-himax.c

  1476	
  1477	/**
  1478	 * himax_hid_update_info() - Update hid info
  1479	 * @ts: Himax touch screen data
  1480	 *
  1481	 * This function is used to update the hid info from firmware image and IC data
  1482	 * for hidraw ioctl to get the hid info. Which tell user space tool the touch
  1483	 * information and how to update the firmware at runtime.The firmware update
  1484	 * mapping tells user space tool how to update the firmware, it separates into
  1485	 * bl part and main part. The bl part is used to update the bootloader, and runs
  1486	 * only once. Which suits the need to update firmware through SPI. So we give
  1487	 * bin_start_offset 0, and unit_sz as the size of firmware image in KB.
  1488	 *
  1489	 * Return: None
  1490	 */
  1491	static void himax_hid_update_info(struct himax_ts_data *ts)
  1492	{
  1493		memcpy(&ts->hid_info.fw_bin_desc, &ts->fw_bin_desc, sizeof(struct himax_bin_desc));
> 1494		ts->hid_info.vid = cpu_to_be16(ts->hid_desc.vendor_id);
> 1495		ts->hid_info.pid = cpu_to_be16(ts->hid_desc.product_id);
  1496		ts->hid_info.cfg_version = ts->ic_data.vendor_touch_cfg_ver;
  1497		ts->hid_info.disp_version = ts->ic_data.vendor_display_cfg_ver;
  1498		ts->hid_info.rx = ts->ic_data.rx_num;
  1499		ts->hid_info.tx = ts->ic_data.tx_num;
> 1500		ts->hid_info.y_res = cpu_to_be16(ts->ic_data.y_res);
> 1501		ts->hid_info.x_res = cpu_to_be16(ts->ic_data.x_res);
  1502		ts->hid_info.pt_num = ts->ic_data.max_point;
  1503		ts->hid_info.mkey_num = ts->ic_data.button_num;
  1504		/* firmware table parameters, use only bl part. */
  1505		ts->hid_info.bl_mapping.cmd = HIMAX_HID_FW_UPDATE_BL_CMD;
  1506		ts->hid_info.bl_mapping.bin_start_offset = 0;
  1507		ts->hid_info.bl_mapping.unit_sz = ts->ic_data.bl_size / 1024;
  1508	}
  1509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
