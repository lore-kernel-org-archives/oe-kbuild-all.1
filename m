Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678C302163
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785612052; cv=none; b=gM0F4USp1hyvyTo5caJ0PpUBzFVDZJCQQkJycbzdTOIXhlOA3vzMdzveAU6xCIBqwXqdCY3EEK2ewW586z81P0/lUCZNAgfIMboZd9ybQEfxssxzV0rcDmxuCxdwceSDSk4U7lsUarpzo/KQaCXe3O96EKh8NBSX393bsCsahHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785612052; c=relaxed/simple;
	bh=Myh7QGhzJgAXflcEjLM2RgZ5NdJnPa6Q7sHUQNZXGxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tEnHN7TQQwPPJ/Xy3EgnXMY97DYvFezpje+hI0Q5Q+oow4EkeScchyacEOXspDUl3V4GagBqg+zpJ2ToqYYqBLY+5nvcn6vHvb0Yflo1hhINfZl3Va1yJcvuUda6BFgZrPChcCILh9e+dwtbZlmBkJOq+Jl/o1gsZOGVuzdgiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdECMiMe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdECMiMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785612051; x=1817148051;
  h=date:from:to:cc:subject:message-id;
  bh=Myh7QGhzJgAXflcEjLM2RgZ5NdJnPa6Q7sHUQNZXGxE=;
  b=RdECMiMeHWiCEm3Nnt/PPbgGiewKQMefXxw+B8nQAN4mfUToxCdjsJfb
   q2uQlp9Zx+zZJ5Y5PdPQPj6R6hY2PfN2b2vf0wdWtHvXLgwgWZtJ/Sy+S
   AL4LwMP6SJlGO0d4QZRZWbAyuPsFITe4mkalMCpGIesuy+yaY+ugFeFSO
   TEuLo200UD32G+hPVM9cxtAUPYf5lmaIxftW58Vzi6JUEkrrSrtjmTxg5
   w/w05eMJlJTaVeoskRQoOBZuwE6eGeVdhO4lw9RNaXTTPAnMmN+PxMn9a
   5McN6r1yysTd76Q6kdI7bC8akusFbyZWtqset5oI29cT/GKkDm4t6Dcqd
   Q==;
X-CSE-ConnectionGUID: +yRbC8IwSpGJ3YGlvADsoA==
X-CSE-MsgGUID: 5LyF8y8fStmzteuGFkyfGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="89884674"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="89884674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 12:20:50 -0700
X-CSE-ConnectionGUID: 1iudLOTWQ4Suc8axNKL+3w==
X-CSE-MsgGUID: po1ylIfvQSyLNsEdpUOMUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="257501867"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2026 12:20:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqFGI-000000003VW-2mjL;
	Sat, 01 Aug 2026 19:20:46 +0000
Date: Sat, 01 Aug 2026 21:19:57 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 file:Documentation/arch/x86/buslock.rst
Message-ID: <202608012108.Ykg1VznZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: a5b6787ab3e6b6798c078c619aa1958ffd718f93 [0/159] x86/split_lock: Move Split and Bus lock code to a dedicated file
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608012108.Ykg1VznZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608012108.Ykg1VznZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: anolis/changelog/005-changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: arch/x86/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/buslock.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
--
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: anolis/changelog/005-changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: arch/x86/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/buslock.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
