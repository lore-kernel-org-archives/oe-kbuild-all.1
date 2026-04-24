Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E23DC4AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 14:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777040407; cv=none; b=KiTuDD6UBLmWSUiyPKGTX9hZHJ0Eg5LW7beWClmDioMtKaCsKs1cuCqpQEMJboWyJOcCSDY2uXhj8Mz4AVvca0UQ6t51WiTHwSq7x577kZlbfQHPK8eRHKbhIdp9Nq6YLR5YhYQJd82Lgo/9unap54SSQ6cEh+o0OzaSNWzeSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777040407; c=relaxed/simple;
	bh=VuYlmromZqd1ZK3bw0r0pp2oytqOBwn1UYmIP/qhOIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jy17t6vtJu4a92rm7WPrjliioFF0ZOYZqN3BHrlDndu9haAflRP9SqN3ZcoCNN+odH7HXZz96mGkM4QUxR5SEq36YzmHDNZkGV0JBE/EiZRCm2FAUPEEhkVwNUn+hAzHKR2MTvEzg5EgPMTwGPBujrjNCfauRQFNnwn6PMkcGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmhMfZHX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmhMfZHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777040405; x=1808576405;
  h=date:from:to:cc:subject:message-id;
  bh=VuYlmromZqd1ZK3bw0r0pp2oytqOBwn1UYmIP/qhOIA=;
  b=dmhMfZHXrOUEc2MZkzS8WROW4sxDxPGhhgAcS/9bLxVwNlELlqu6VVVq
   f7PfPeqnlUUNoorAAB3evptE/uffD2Y2nstteEX8Vl2886yOtWENnGfaj
   5uSIa4K7yJaJmU4b67DxPmGoDRL66RYiLgcRDvAllEocNaCfIadSRQHmd
   FR1uYUbN8oto+ICP9d5aW1/arKXn0QM2dIbh/KgCwJDg4MxRMrmGasOBj
   w//Q6ygcyZCQGq4hPOL3piuKwmFRpe/bP8YIC2ZJJ8Kf7A5J2s0erhnuF
   n2zqPgVJ+bOJKadOUo7Ov9G5d0XGyVCpE/qOux9gpdldCt0B6H7PxbIjK
   g==;
X-CSE-ConnectionGUID: zH9XVsD+Si2EFOJPTY/Q/Q==
X-CSE-MsgGUID: 0BtUx4mRQ9OcynhUHflEBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="89103806"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89103806"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 07:20:04 -0700
X-CSE-ConnectionGUID: jdSgbTpVR2+BmRTuo/bEgg==
X-CSE-MsgGUID: ijSy1aR/QmOQivDYssy6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="226435129"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Apr 2026 07:20:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGHNw-000000003Gb-2H3q;
	Fri, 24 Apr 2026 14:20:00 +0000
Date: Fri, 24 Apr 2026 16:19:50 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 file:Documentation/arch/x86/buslock.rst
Message-ID: <202604241654.DFSXiQZj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: a5b6787ab3e6b6798c078c619aa1958ffd718f93 [0/2] x86/split_lock: Move Split and Bus lock code to a dedicated file
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241654.DFSXiQZj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241654.DFSXiQZj-lkp@intel.com/

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
