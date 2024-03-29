Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4AAB647
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 01:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711676253; cv=none; b=enDsHAMpM3UgoldHuMLIvvkMZZ4Y7ej7221padYvByqP7sqZgSu1GHLBMPYGC47JEA1gxwjM2vyc/HNh9LXHNqR7Fcky2R8A5QYxjU9fFYKhGaK6RJYvRA8bftmAXHvsLGP1AtnGNrzKAXFWBaAD4oatpXxgsg4HjUuPw70ZuRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711676253; c=relaxed/simple;
	bh=6xWSHrUoZx7dIO6Zf1ZWMOy0RZdmkEgC/vhxJIW0yak=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BSQmAVTY5wNcKePxv6MsCfTykzD1TDz6h9ih7byJxdhsFBsBLDpYbYNpomzknEbNpb70B/OI5uPJ59bvNwl+Ika43BDE5zqcgTidE6SY2M01X5VqH+3PZazXGl1dsyMBCTOHx2xn5VtQBBUcY1pWvMOdIcsJILIE6omrAH3dZg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWGaMydA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWGaMydA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711676252; x=1743212252;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6xWSHrUoZx7dIO6Zf1ZWMOy0RZdmkEgC/vhxJIW0yak=;
  b=EWGaMydAb3mhSU4kpUBr1bqpToeV7Y2ZHBmADKPXlCYGPbPI+x7l5gwe
   8haqPjJser0uEvdopP+vFIuKCuD8k/YMUzVb5KlVpqVtJP+kvw2xlsrx9
   BIfHOzq8L0VraFb74aekkwTyNM0eQa86k2Kb6qGykuQc0sWJvERIbas53
   wGR/IfABHAG6r2jto+Roql4IqIKLS53pwhIytpGwDH9RKEo8c/yhIPbPS
   hE9b3CnVjgoh17L/Lxxr8C+ua5nFiHvAmapm9gmExkOpY5pdh2lK/S9GW
   xrlX5l8U64YD2tTriKYIyr1+3Px7wd2npFHuIxbytHFKBWIAOuTi9ibd9
   g==;
X-CSE-ConnectionGUID: nPw9xcosRQKRahF5ZfouVA==
X-CSE-MsgGUID: 3AV+Gr+LT8mgM/wB6yXOwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17493123"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17493123"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 18:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16870718"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 18:37:30 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq1BQ-0002iy-0V;
	Fri, 29 Mar 2024 01:37:28 +0000
Date: Fri, 29 Mar 2024 09:37:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-android-linux-6.1.y 2/4]
 drivers/android/android_debug_symbols.c:13:10: fatal error:
 asm/stacktrace.h: No such file or directory
Message-ID: <202403290928.04PjDMV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xuewen,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common ti-android-linux-6.1.y
head:   bbf722b1059a245fffdd90e1e763281a6d205dd3
commit: dfabd2e38be31725210d182c5648b8c24157cef8 [2/4] ANDROID: android: Create debug_symbols driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403290928.04PjDMV8-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290928.04PjDMV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290928.04PjDMV8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/android/android_debug_symbols.c:13:10: fatal error: asm/stacktrace.h: No such file or directory
      13 | #include <asm/stacktrace.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/android/android_debug_symbols.c

     2	
     3	/*
     4	 * Copyright (c) 2021, The Linux Foundation. All rights reserved.
     5	 * Copyright (c) 2023, Unisoc (Shanghai) Technologies Co., Ltd
     6	 */
     7	
     8	#include <linux/types.h>
     9	#include <linux/kernel.h>
    10	#include <linux/module.h>
    11	#include <linux/android_debug_symbols.h>
    12	#include <asm/sections.h>
  > 13	#include <asm/stacktrace.h>
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
