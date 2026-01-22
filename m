Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A7930F549
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 00:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043088; cv=none; b=B4JibYBQwMEbfLDSsFP7lCrDCDLDYltzvRN3n5fsa1Obg8/VHXstu0MgYEvch9aeqWrb4/xr0b2Z33SJ9izZ0A4ZGNBOuUwzab2vHJoPx5gmNbdFc+xFakVfj9VAwmtHC1H+LsgWAMHfJjgm+sMAsh4av2BTovzc2xKcfzOx8Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043088; c=relaxed/simple;
	bh=U2b+NOAZeI0yjteidk/5wPo/Bt5vrrz0hiB/2J/u5k8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dbi1G4kYhXYdqW56blkuzxzj5hRKPfjhhzgn3WzBB9JDzXnFj9lwQE5pyqfkfmWJnY2zyR+/mVaU4x00Mk4SicvUk1vgI1jwRjmQQ1tZyFITwIcd+iKKql1Zj3/HCqIlRbzHNnhYaWH3xBOTSZhH/AHu87VXwq3dCimQADUwycU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJkEWQlr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJkEWQlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769043087; x=1800579087;
  h=date:from:to:cc:subject:message-id;
  bh=U2b+NOAZeI0yjteidk/5wPo/Bt5vrrz0hiB/2J/u5k8=;
  b=bJkEWQlrF9ia0XYUdoqZBITRBNUIsJ4mRK8gf81qXuwvcz91MrL9w+sJ
   bI5mLofTGz6dTtDD66uE6Xdl4gdIpHGf1LdiYYLl7axfthxpquXGwvgI6
   jakXd1LSnYbzJxpECISLMty8jCOZ2GWfTso454YJSFoj996Bg2TFAXDcG
   n1xwkPqQ/guEbtVNwhLpS1l/tG1o2oDWGFMuIh6m6BQZoidQ5FTLgJ5Wl
   PfbPUneC8zURBHQShTMNsLeMsObAm+nJ6+FIBUPmNDye9iR2Ov0UxysKN
   4cXMT/95/VZodgB1CdinkXKpofe3ZvHeXkEravHwa+0ABWGAh8ShJKnDz
   A==;
X-CSE-ConnectionGUID: ECTRc/gBTI+xEzpEY69big==
X-CSE-MsgGUID: rrdSdoszQVaApZNeemGdyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70195032"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70195032"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 16:51:24 -0800
X-CSE-ConnectionGUID: 3eoRNN9/QHW/dUktzTMluA==
X-CSE-MsgGUID: K6Y6Wvr2QCCZpipk3WVelg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2026 16:51:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viiut-00000000SDV-2zw9;
	Thu, 22 Jan 2026 00:51:19 +0000
Date: Thu, 22 Jan 2026 08:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 18/18]
 drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202601220812.XPXO6Y2X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   65d443800b21b6e87b8a3d9b81cae549d2102db9
commit: 65d443800b21b6e87b8a3d9b81cae549d2102db9 [18/18] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: arm-randconfig-r111-20260122 (https://download.01.org/0day-ci/archive/20260122/202601220812.XPXO6Y2X-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220812.XPXO6Y2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220812.XPXO6Y2X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firmware/efi/test/efi_test.c:157:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *register __p @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     expected unsigned long [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:157:13: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:160:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:160:61: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:167:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:167:60: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:187:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:187:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:194:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:194:35: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:209:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *[addressable] data @@
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:209:45: sparse:     got void *[addressable] data
   drivers/firmware/efi/test/efi_test.c:215:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__pu_ptr @@     got unsigned int [usertype] *[addressable] attributes @@
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     expected unsigned int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:215:19: sparse:     got unsigned int [usertype] *[addressable] attributes
   drivers/firmware/efi/test/efi_test.c:220:19: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] data_size @@
   drivers/firmware/efi/test/efi_test.c:220:19: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:220:19: sparse:     got unsigned long *[addressable] data_size
   drivers/firmware/efi/test/efi_test.c:243:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:243:53: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:243:53: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:248:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:248:60: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:248:60: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:253:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void *[addressable] data @@
   drivers/firmware/efi/test/efi_test.c:253:39: sparse:     expected void const [noderef] __user *
   drivers/firmware/efi/test/efi_test.c:253:39: sparse:     got void *[addressable] data
   drivers/firmware/efi/test/efi_test.c:263:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:263:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:292:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:292:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:292:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:301:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct efi_time_cap_t [noderef] [usertype] __user *cap_local @@     got struct efi_time_cap_t [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:301:27: sparse:     expected struct efi_time_cap_t [noderef] [usertype] __user *cap_local
   drivers/firmware/efi/test/efi_test.c:301:27: sparse:     got struct efi_time_cap_t [usertype] *
   drivers/firmware/efi/test/efi_test.c:308:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:308:41: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:308:41: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:325:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:325:46: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:325:46: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:330:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:330:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:354:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:354:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:360:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const [noderef] __user *__pu_ptr @@     got unsigned char [usertype] *[addressable] enabled @@
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     expected unsigned char const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:360:38: sparse:     got unsigned char [usertype] *[addressable] enabled
>> drivers/firmware/efi/test/efi_test.c:364:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char const [noderef] __user *__pu_ptr @@     got unsigned char [usertype] *[addressable] pending @@
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     expected unsigned char const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:364:38: sparse:     got unsigned char [usertype] *[addressable] pending
   drivers/firmware/efi/test/efi_test.c:369:47: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:369:47: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:393:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_time_t [usertype] *[addressable] time @@
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:393:60: sparse:     got struct efi_time_t [usertype] *[addressable] time
   drivers/firmware/efi/test/efi_test.c:401:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:401:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:425:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __user *register __p @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:425:21: sparse:     expected unsigned long [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:425:21: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:433:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:433:52: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:433:52: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:443:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:443:52: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:443:52: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:456:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *src @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:456:52: sparse:     expected unsigned short [noderef] [usertype] __user *src
   drivers/firmware/efi/test/efi_test.c:456:52: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:465:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:465:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:472:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:472:35: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:483:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short [noderef] [usertype] __user *dst @@     got unsigned short [usertype] *[addressable] variable_name @@
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     expected unsigned short [noderef] [usertype] __user *dst
   drivers/firmware/efi/test/efi_test.c:483:62: sparse:     got unsigned short [usertype] *[addressable] variable_name
   drivers/firmware/efi/test/efi_test.c:491:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long *[addressable] variable_name_size @@
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:491:21: sparse:     got unsigned long *[addressable] variable_name_size
   drivers/firmware/efi/test/efi_test.c:498:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct guid_t [usertype] *[addressable] vendor_guid @@
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     expected void [noderef] __user *to
   drivers/firmware/efi/test/efi_test.c:498:53: sparse:     got struct guid_t [usertype] *[addressable] vendor_guid
   drivers/firmware/efi/test/efi_test.c:526:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:526:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:533:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int const [noderef] __user *__pu_ptr @@     got unsigned int [usertype] *[addressable] high_count @@
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     expected unsigned int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:533:13: sparse:     got unsigned int [usertype] *[addressable] high_count
   drivers/firmware/efi/test/efi_test.c:550:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user * @@     got void * @@
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     expected void const [noderef] __user *
   drivers/firmware/efi/test/efi_test.c:550:37: sparse:     got void *
   drivers/firmware/efi/test/efi_test.c:579:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] status @@
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:579:13: sparse:     got unsigned long [usertype] *[addressable] status
   drivers/firmware/efi/test/efi_test.c:585:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:585:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:589:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size @@
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:589:13: sparse:     got unsigned long long [usertype] *[addressable] remaining_variable_storage_size
   drivers/firmware/efi/test/efi_test.c:593:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] maximum_variable_size @@
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:593:13: sparse:     got unsigned long long [usertype] *[addressable] maximum_variable_size
   drivers/firmware/efi/test/efi_test.c:629:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct efi_capsule_header_t [usertype] *[noderef] __user *register __p @@     got struct efi_capsule_header_t [usertype] ** @@
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     expected struct efi_capsule_header_t [usertype] *[noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:629:21: sparse:     got struct efi_capsule_header_t [usertype] **
   drivers/firmware/efi/test/efi_test.c:633:50: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct efi_capsule_header_t [usertype] *[assigned] c @@
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     expected void const [noderef] __user *from
   drivers/firmware/efi/test/efi_test.c:633:50: sparse:     got struct efi_capsule_header_t [usertype] *[assigned] c
   drivers/firmware/efi/test/efi_test.c:647:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long const [noderef] __user *__pu_ptr @@     got unsigned long [usertype] *[addressable] [assigned] status @@
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     expected unsigned long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:647:13: sparse:     got unsigned long [usertype] *[addressable] [assigned] status
   drivers/firmware/efi/test/efi_test.c:657:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long long const [noderef] __user *__pu_ptr @@     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size @@
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     expected unsigned long long const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:657:13: sparse:     got unsigned long long [usertype] *[addressable] [assigned] maximum_capsule_size
   drivers/firmware/efi/test/efi_test.c:662:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int const [noderef] __user *__pu_ptr @@     got int *[addressable] [assigned] reset_type @@
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     expected int const [noderef] __user *__pu_ptr
   drivers/firmware/efi/test/efi_test.c:662:13: sparse:     got int *[addressable] [assigned] reset_type
   drivers/firmware/efi/test/efi_test.c:675:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [noderef] __user *supported_mask @@     got unsigned int * @@
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     expected unsigned int [noderef] __user *supported_mask
   drivers/firmware/efi/test/efi_test.c:675:24: sparse:     got unsigned int *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:50:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     expected unsigned short [noderef] __user *register __p
   drivers/firmware/efi/test/efi_test.c:50:21: sparse:     got unsigned short [usertype] *
   drivers/firmware/efi/test/efi_test.c:35:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [usertype] *[assigned] s @@     got unsigned short [noderef] [usertype] __user *str @@
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     expected unsigned short [usertype] *[assigned] s
   drivers/firmware/efi/test/efi_test.c:35:27: sparse:     got unsigned short [noderef] [usertype] __user *str
   drivers/firmware/efi/test/efi_test.c:44:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned short [noderef] __user *register __p @@     got unsigned short [usertype] * @@
   drivers/firmware/efi/test/efi_test.c:44:13: sparse:     expected unsigned short [noderef] __user *register __p

vim +364 drivers/firmware/efi/test/efi_test.c

ff6301dabc3ca2 Ivan Hu 2016-08-25  335  
ff6301dabc3ca2 Ivan Hu 2016-08-25  336  static long efi_runtime_get_waketime(unsigned long arg)
ff6301dabc3ca2 Ivan Hu 2016-08-25  337  {
ff6301dabc3ca2 Ivan Hu 2016-08-25  338  	struct efi_getwakeuptime __user *getwakeuptime_user;
ff6301dabc3ca2 Ivan Hu 2016-08-25  339  	struct efi_getwakeuptime getwakeuptime;
ff6301dabc3ca2 Ivan Hu 2016-08-25  340  	efi_bool_t enabled, pending;
ff6301dabc3ca2 Ivan Hu 2016-08-25  341  	efi_status_t status;
ff6301dabc3ca2 Ivan Hu 2016-08-25  342  	efi_time_t efi_time;
ff6301dabc3ca2 Ivan Hu 2016-08-25  343  
ff6301dabc3ca2 Ivan Hu 2016-08-25  344  	getwakeuptime_user = (struct efi_getwakeuptime __user *)arg;
ff6301dabc3ca2 Ivan Hu 2016-08-25  345  	if (copy_from_user(&getwakeuptime, getwakeuptime_user,
ff6301dabc3ca2 Ivan Hu 2016-08-25  346  				sizeof(getwakeuptime)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  347  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  348  
ff6301dabc3ca2 Ivan Hu 2016-08-25  349  	status = efi.get_wakeup_time(
ff6301dabc3ca2 Ivan Hu 2016-08-25  350  		getwakeuptime.enabled ? (efi_bool_t *)&enabled : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  351  		getwakeuptime.pending ? (efi_bool_t *)&pending : NULL,
ff6301dabc3ca2 Ivan Hu 2016-08-25  352  		getwakeuptime.time ? &efi_time : NULL);
ff6301dabc3ca2 Ivan Hu 2016-08-25  353  
ff6301dabc3ca2 Ivan Hu 2016-08-25  354  	if (put_user(status, getwakeuptime.status))
ff6301dabc3ca2 Ivan Hu 2016-08-25  355  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  356  
ff6301dabc3ca2 Ivan Hu 2016-08-25  357  	if (status != EFI_SUCCESS)
ff6301dabc3ca2 Ivan Hu 2016-08-25  358  		return -EINVAL;
ff6301dabc3ca2 Ivan Hu 2016-08-25  359  
ff6301dabc3ca2 Ivan Hu 2016-08-25  360  	if (getwakeuptime.enabled && put_user(enabled,
ff6301dabc3ca2 Ivan Hu 2016-08-25  361  						getwakeuptime.enabled))
ff6301dabc3ca2 Ivan Hu 2016-08-25  362  		return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  363  
3dcb524d785373 Ivan Hu 2025-03-31 @364  	if (getwakeuptime.pending && put_user(pending,
3dcb524d785373 Ivan Hu 2025-03-31  365  						getwakeuptime.pending))
3dcb524d785373 Ivan Hu 2025-03-31  366  		return -EFAULT;
3dcb524d785373 Ivan Hu 2025-03-31  367  
ff6301dabc3ca2 Ivan Hu 2016-08-25  368  	if (getwakeuptime.time) {
ff6301dabc3ca2 Ivan Hu 2016-08-25  369  		if (copy_to_user(getwakeuptime.time, &efi_time,
ff6301dabc3ca2 Ivan Hu 2016-08-25  370  				sizeof(efi_time_t)))
ff6301dabc3ca2 Ivan Hu 2016-08-25  371  			return -EFAULT;
ff6301dabc3ca2 Ivan Hu 2016-08-25  372  	}
ff6301dabc3ca2 Ivan Hu 2016-08-25  373  
ff6301dabc3ca2 Ivan Hu 2016-08-25  374  	return 0;
ff6301dabc3ca2 Ivan Hu 2016-08-25  375  }
ff6301dabc3ca2 Ivan Hu 2016-08-25  376  

:::::: The code at line 364 was first introduced by commit
:::::: 3dcb524d785373fd43b129f01f32bd394fe167e0 efi/efi_test: Fix missing pending status update in getwakeuptime

:::::: TO: Ivan Hu <ivan.hu@canonical.com>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
