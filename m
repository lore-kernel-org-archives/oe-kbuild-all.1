Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBA9377566
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777833833; cv=none; b=jZaGJJxcLtEJYXsCizXjA1M3pUVfR+PmOsoEFKTnKzPeAhBc8lGnmwbvvTVQHOYklYMa8FsDnuVevIw244oT9vmP40V1pFVBNm51GUFU/LG3gC/d27W/ls//efFWsnj49r+ll8JTaKBEPPuY8yvCTqnihictiFfjcO7lMZm+nDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777833833; c=relaxed/simple;
	bh=YRX7m1Pr1MEb0ok0RKHUXDvPVVQJ+KhUlBV8YdyLN18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wlfq5Fsr2QuOxxBf8Qk0a2lYZ94tU968d5LViamH9IheUqrOphApneUmnyzCoa7mbH6BFV214BwPWTm9/suLGPEtJcpRiVabBVXUOOxHxAfDt2UJ8GZiITAodbAd6xGvyx4/oNoWlYnRLyfbT0N0n/NLYMpcYt6Q50qt3t94je8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mM5xj66Q; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mM5xj66Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777833831; x=1809369831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YRX7m1Pr1MEb0ok0RKHUXDvPVVQJ+KhUlBV8YdyLN18=;
  b=mM5xj66Q9/VrR/0wJLLDcssJNkvgbY4XkcYIA4hHHTXYEv5uKZhtpAzI
   wqBwbPsXTk+LIxif46yj4Uo8DGxyMT5spYVxPyTGtsMOCvmmtF8ZQJ+bv
   E0HdgWgjAKm2VnW/QSnzPOGzpTjwnk9ISg0B0K6GMIxWD7V3he6mWaOQP
   ShhW07AvQgLkRzavHZhtDDpUaNEiuRz+YpSpqu8UAbH4vzU683jndyynD
   3x5t8e4aHXJ3WPMbHqg5C/aDtuiK3RR6Ea7+nzCnhjifC/ilWLi8cfxPV
   yxQSRv+K1tiAFZ+iZrtYPawyQ35LK0KM56hGP5w3atehkJF7bAPlGJwz2
   w==;
X-CSE-ConnectionGUID: /BbKw3vHTjCOSIGpc7x4Lg==
X-CSE-MsgGUID: cQu0yzsRSCOLLejQR9ONhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78415025"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78415025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 11:43:50 -0700
X-CSE-ConnectionGUID: KzMvGdaDRC2ebxT1wpAm2w==
X-CSE-MsgGUID: XYsMttXUTCyBiIlBrQKzjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="237110320"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 11:43:48 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJbmu-000000002sn-0t6v;
	Sun, 03 May 2026 18:43:35 +0000
Date: Mon, 04 May 2026 02:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Subject: 
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: warning:
 conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned
 int'} changes value from '14940110848' to '2055208960'
Message-ID: <202605040220.RFTn9KJ0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Michal,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: cbe29da6f7c0d0541ec135e7292b35b97f8ca402 drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
date:   2 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260504/202605040220.RFTn9KJ0-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040220.RFTn9KJ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cbe29da6f7c0 ("drm/xe/tests: Add KUnit tests for new VRAM fair provisioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040220.RFTn9KJ0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3271:
   drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c: In function 'pf_gt_config_test_init':
>> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:25: warning: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '14940110848' to '2055208960' [-Woverflow]
      14 | #define TEST_VRAM       0x37a800000ull
         |                         ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:29: note: in expansion of macro 'TEST_VRAM'
      71 |         vram->usable_size = TEST_VRAM;
         |                             ^~~~~~~~~
--
   arch/mips/kernel/head.o: in function `__kernel_entry':
>> (.head.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
>> (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x10): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x18): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x50): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x90): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x98): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0xd0): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xd8): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x108): additional relocation overflows omitted from the output


vim +14 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c

    12	
    13	#define TEST_MAX_VFS	63
  > 14	#define TEST_VRAM	0x37a800000ull
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
