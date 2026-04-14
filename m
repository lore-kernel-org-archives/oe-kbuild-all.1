Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8B73DD524
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 18:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189605; cv=none; b=AJWVQ4qdGBKZDh5urMzaIHeQuRqrllauAyR/YW37JLadclgS8DjLXTtOeGYuqssL3NBfrt5aM3/iFB+MQfOgBPCG0j4ics8ZY8ejqmL6yprppPG/j7TnW7UjJOyEbTJbRtlMGlJGLnhASAHVztcULlDSgRfztfErA5jErKDhySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189605; c=relaxed/simple;
	bh=z/W2Uv1t8N320yB5PAO8T7DIkrwZhmKqDUtvYDxfxr8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XA+hgnK38MteoNX1d+YMv3YWnBq2DklMFSVRh2mraD7ODzLJ/RZGwjgYNBuqgHNya9xWr4UgsAi+sH21nVwE49XzlhpNhhC6pPfrnLnBIBGUFEr0mzHgnlDMkU+pTqxGkZrj5DnaSlVN8dOkJcRlJizVReJi+8V3ZonKF8ybeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlYsWVPQ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlYsWVPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776189604; x=1807725604;
  h=date:from:to:cc:subject:message-id;
  bh=z/W2Uv1t8N320yB5PAO8T7DIkrwZhmKqDUtvYDxfxr8=;
  b=mlYsWVPQmnjOwwWWZskq3cxOq6kjFh0ycFAoSzEuzASieJglo7qwoNaE
   b4GakveW1JOoizGxhfbuLkVjao3zzgF6kjdTcAykSgErDpYzuGSSDHYC8
   yB+Ue2zbrGB5XFGRJDTn0A1mbuCE8Yi2Plz8fUVXflpd9m5DuhHqLLqJL
   L6g5Fq/iy0RENuW0nhNetvJUIh+uAXCm4EXanfuj/hWAxPhnN1go/a2Hy
   XEeqJGqCFWw9EshX/fh/YTd+a1HgT8Hwx9n8UOXUVdgDKVTVeniIT1vxi
   q9Ez/FymQRsSkNkF8mc1svk45ATxIDD5llZRuD/yn7tH4Uiaau8wvWWvQ
   w==;
X-CSE-ConnectionGUID: 4d1E3WFFTiKrwxAgdDnYgg==
X-CSE-MsgGUID: yiFKMH3eRfiFALfHE3yIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77338270"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77338270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 11:00:04 -0700
X-CSE-ConnectionGUID: Q52GFbIRRi2f1o70ppAOow==
X-CSE-MsgGUID: Ear+h0ShRpOgQq7Mfo/YEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225448852"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 11:00:02 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCi3L-000000001jV-2bh5;
	Tue, 14 Apr 2026 17:59:59 +0000
Date: Wed, 15 Apr 2026 01:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25]
 thermal_sysfs.c:(.text+0xadc): multiple definition of
 `devm_thermal_of_cooling_device_register';
 drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined
 here
Message-ID: <202604150121.MXYHi4G8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: arm-randconfig-002-20260414 (https://download.01.org/0day-ci/archive/20260415/202604150121.MXYHi4G8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150121.MXYHi4G8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150121.MXYHi4G8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/thermal/thermal_sysfs.o: in function `devm_thermal_of_cooling_device_register':
>> thermal_sysfs.c:(.text+0xadc): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_trip.o: in function `devm_thermal_of_cooling_device_register':
   thermal_trip.c:(.text+0x6c): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_helpers.o: in function `devm_thermal_of_cooling_device_register':
   thermal_helpers.c:(.text+0x7c): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_thresholds.o: in function `devm_thermal_of_cooling_device_register':
   thermal_thresholds.c:(.text+0x38): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_netlink.o: in function `devm_thermal_of_cooling_device_register':
   thermal_netlink.c:(.text+0xa54): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_debugfs.o: in function `devm_thermal_of_cooling_device_register':
   thermal_debugfs.c:(.text+0x546): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/gov_fair_share.o: in function `devm_thermal_of_cooling_device_register':
   gov_fair_share.c:(.text+0x144): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/gov_step_wise.o: in function `devm_thermal_of_cooling_device_register':
   gov_step_wise.c:(.text+0x224): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/thermal_mmio.o: in function `devm_thermal_of_cooling_device_register':
   thermal_mmio.c:(.text+0x8c): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/imx_thermal.o: in function `devm_thermal_of_cooling_device_register':
   imx_thermal.c:(.text+0x80e): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/thermal/testing/zone.o: in function `devm_thermal_of_cooling_device_register':
   zone.c:(.text+0x3de): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here
   arm-linux-gnueabi-ld: drivers/devfreq/devfreq.o: in function `devm_thermal_of_cooling_device_register':
   devfreq.c:(.text+0x1cf4): multiple definition of `devm_thermal_of_cooling_device_register'; drivers/thermal/thermal_core.o:thermal_core.c:(.text+0x526): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
