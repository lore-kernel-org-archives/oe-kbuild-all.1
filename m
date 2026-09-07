Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D670C3559E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813661; cv=none; b=GOpXfhOUMMZdBjg/WdRXpyLCf34AowwiozyzVuTDUWI+NqTSP1ZlEM0aK5/Xwj5M4CdI6osXvCWyVwGKZSyiUxkxwYeymCgDXgOOARmjOqbCtjt3cGzUZ4vuVkucCoo5OcSpYJXWhiNrVATVHHmdpNJxIVIJ8Fi+hgrC2z7pSgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813661; c=relaxed/simple;
	bh=o2dZvq2Uy1EvmNeAwH9vVp3xsxd30jgYDocdTwOtGDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BdyerqdsOLRHKt909sKDjhLnYTb203CSA9FDhlifGsLYMoywMFMSI0TZ6UW2WIMXL3AH7yYUXbTTwllVrAqxJVmpysx2z6Mekv5xThMP8Aiq3J3oVAS1u8dW0hFCSRdfcs5tDWKEdEuUpEJpwVhh0kbwJ2XQK/K5l1K9DWSZIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfW16cl6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfW16cl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788813658; x=1820349658;
  h=date:from:to:cc:subject:message-id;
  bh=o2dZvq2Uy1EvmNeAwH9vVp3xsxd30jgYDocdTwOtGDU=;
  b=TfW16cl6YRfQNHHOHqgIl4RRobMWnQBuGKG4qzP71An9zdVK58uyEP2k
   U62OUcEF2z/nmE3zLl4S1+yX3XN/icAnocRko9Ep9FSw2qUBV75TjAxgm
   B/EwJP4+gpuZcPimZEOYA4h55E3Tz383+qkUKM4/imcvRNX7islm3/dIP
   woRZpaSqEJJWMeLZ78J2xMliaYJA559gcdzTv2gRdk3f1QG069kgcS/to
   J3NEovZxnSR9eBKa8nZvvrHo3SPyauv+OGMaLs3CTQ64Jlbfd97vQzy9g
   K3dCiyehkmNropEzra5oK0Ew0YcBo43H/8cTAVNo1mWyHdq9d37v3FdTD
   A==;
X-CSE-ConnectionGUID: 0M5IsyAvTIGiNgKYzus5QA==
X-CSE-MsgGUID: 72DGX6kfThuYA23wDLfh6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114757231"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114757231"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 13:40:57 -0700
X-CSE-ConnectionGUID: T97rcIbhRgSbAHFNe0sknw==
X-CSE-MsgGUID: u2z7eeYYRCCsdjLPhdVPSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269480960"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2026 13:40:56 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3g98-000000000NW-00cg;
	Mon, 07 Sep 2026 20:40:54 +0000
Date: Mon, 07 Sep 2026 22:40:27 +0200
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/block/deadline-iosched.rst:89:
 WARNING: Title underline too short.
Message-ID: <202609072237.PTJwx6U4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ye-Bin/block-mq-deadline-reject-zero-prio_aging_expire/20260831-190141
head:   243f0bf03d19d8dac85f52966d0c268aa925fda5
commit: 243f0bf03d19d8dac85f52966d0c268aa925fda5 docs: block: document prio_enable and prio_aging_expire in deadline-iosched
date:   7 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260907/202609072237.PTJwx6U4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609072237.PTJwx6U4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Using alabaster theme
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
   WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261
>> Documentation/block/deadline-iosched.rst:89: WARNING: Title underline too short.


vim +89 Documentation/block/deadline-iosched.rst

    86	
    87	
    88	prio_aging_expire	(in ms)
  > 89	------------------------------
    90	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
