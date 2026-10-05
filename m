Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBBB137923
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 02:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791168716; cv=none; b=jlVcHBTsHztRU6O92Jg7CDJk2Wxzfa+9QPnwbhxvbtwPe3yenmKv8HwQ86cWzNRimJAADkYO/ltNbOotY+UWwfXtwGcjgvFsWsXjEODGS6aSlzBY6kZ6HJwnULTY/CHuhEQ0gVJCHdmjfSqUmf+jP9WQEgvNLrkLLIXSqcwldpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791168716; c=relaxed/simple;
	bh=Q51+3lANjXc82F+bEkhgCB8T7mkRXR8PuB4+Qm5Xtes=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T3lc5aj+aujwViIaXDkJbbmr5p2B+ee2OT9/9vNx3NjnKWqt/2KTkLd0UvBhIVyVwFH8b/npfjdA/SEdfRMezMucy5TSAMJb755xT5JoC1e2G+/e3jILcLd5iYjpR4gtcFE0bGZrT27gn37Bo9NMOYARVtcAV8QskFYqWhI8ze8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBNTgJxP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBNTgJxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791168714; x=1822704714;
  h=date:from:to:cc:subject:message-id;
  bh=Q51+3lANjXc82F+bEkhgCB8T7mkRXR8PuB4+Qm5Xtes=;
  b=hBNTgJxPXki8GHMbOPZmGX7zqBHehMDZDRwH0qoEVifDnmiKnvCG1bt5
   4azVg+JNtaSOeS1aAtnQDW0yMyLLlZPtJg90jhvEHbBpL+ArUlkTC9nAt
   4DWS/WC50FsUE3vwhp4Jlg5o7TApHHu0gZOM+tHqX/btr2wvWBiVTUSCU
   8cHPGFy0ZIhm5ZHLx+OIquVvObzViemjOeZFqPnP7xhYU8ao//AAGVzkx
   +INmYJDLyr1B3FgGCnhCtA/EXJ/EO410g7wEMJ1jUhuH7idBvjyC/lkz0
   GtBa5aix5n0266hLCj/A6BB7I6sCBOGGb158zqdO21POIy09XN0DMmvz6
   A==;
X-CSE-ConnectionGUID: rXGo9gGvTPiklaBOIv6FBw==
X-CSE-MsgGUID: cFBCFEMYR9uBWLSSUEB+HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91939869"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91939869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 19:51:53 -0700
X-CSE-ConnectionGUID: 0PKbAYhTSwSTT4I+FXEkTw==
X-CSE-MsgGUID: ykUS4gt5SG6Uu1aIaKwfXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="302948331"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Oct 2026 19:51:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDYnt-00000000VGX-3Q80;
	Mon, 05 Oct 2026 02:51:49 +0000
Date: Mon, 05 Oct 2026 10:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 15/23]
 drivers/pps/clients/pps-gpio-spin.c:52:10: fatal error: asm/clock_inlined.h:
 No such file or directory
Message-ID: <202610051056.LIWweKR8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: eb57681e2ecf93179ad3e658a98646183bfb9fdf [15/23] [TEST HACKS] mode-3 differential capture instrumentation
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20261005/202610051056.LIWweKR8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051056.LIWweKR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051056.LIWweKR8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pps/clients/pps-gpio-spin.c:52:10: fatal error: asm/clock_inlined.h: No such file or directory
      52 | #include <asm/clock_inlined.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +52 drivers/pps/clients/pps-gpio-spin.c

    42	
    43	#include <linux/kernel.h>
    44	#include <linux/module.h>
    45	#include <linux/platform_device.h>
    46	#include <linux/hrtimer.h>
    47	#include <linux/gpio/consumer.h>
    48	#include <linux/pps_kernel.h>
    49	#include <linux/timekeeping.h>
    50	#include <linux/io.h>
    51	#include <clocksource/arm_arch_timer.h>
  > 52	#include <asm/clock_inlined.h>
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
