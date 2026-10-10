Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA42820A5C4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 20:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791663906; cv=none; b=dVVECNnab6TWUuKYQ3a2WUbRSurldKBONacom0v0gYaESRwrY4zopR1H62EyO3aGE5hVn8cuz0jKpI/EPdLak16WqKtIHT2mkbi/AX9jqulgNWgCgUhyAboTH8gcTt6FKcTD0PPF3c//imTJ6hMvekgs8i7A8zovYWSJGQ9vU+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791663906; c=relaxed/simple;
	bh=Lemh8KWdOK8GJ/CeRJHJM18Oxh+yvA0o3l+b+VsjVJY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JzjPt4YKcaPeX1ZO9C8fq75b3Q8Icg/6AfsjMIqPBqIL6mBXoi/Pqyd+HZDQtPYmrmv7xgRY3jL5AjdK3bgqQkupmYcF/gU044gpxYY6Pa/Ut6IDtDvOsj2AUV3u2UlIQ5F1hqE4AY+TKNZq077dv+2hOeFT3f0EJYcutZxNQRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTokDmhg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTokDmhg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791663905; x=1823199905;
  h=date:from:to:cc:subject:message-id;
  bh=Lemh8KWdOK8GJ/CeRJHJM18Oxh+yvA0o3l+b+VsjVJY=;
  b=YTokDmhg/QRHe+0YEdC+vszy2u3VPMz7G/wTrMzInJAkz3uuu8xGpq2u
   jfiGipM9Gctu9H0ZKwNp8Bj2xW2ys+PdXGoLVeMxJk6VKIfn6A9FPHQ4o
   86LvYMe973qxqegH6/PZamcrrr3g2dahEfqOmxh0AVjlQzjO25f12DxwA
   DZPbyJlVD4vy977C06DXRTnd/tTiSPA0k185D/XyZSY5L1m2eemeaDG15
   O8ZWWTlJvKThfGU0wFmGmM8JlE2aovPwaKtZXn6plEDdDHyO6hRMaQ/MD
   aFeYzR1VDjmWsGbDlRxtgp/349JxA6vqEjogrbhibgl1FdnQvqwK7pmNG
   w==;
X-CSE-ConnectionGUID: 5o1s32TxQQGC4SvXGAxYdQ==
X-CSE-MsgGUID: H0tLGWpCTLa114Rxnw9jLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="524139"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="524139"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 13:25:05 -0700
X-CSE-ConnectionGUID: 4z1XsgNBT4acThn22tbUkw==
X-CSE-MsgGUID: 9FfCpw57RkKz+gYCv/IEnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="551244"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2026 13:25:03 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFdcq-000000009D9-1aqm;
	Sat, 10 Oct 2026 20:25:00 +0000
Date: Sat, 10 Oct 2026 22:24:46 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 file:Documentation/arch/x86/buslock.rst
Message-ID: <202610102242.SPb7lQVT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi leoliu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: a5b6787ab3e6b6798c078c619aa1958ffd718f93 [0/14] x86/split_lock: Move Split and Bus lock code to a dedicated file
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610102242.SPb7lQVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610102242.SPb7lQVT-lkp@intel.com/

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
