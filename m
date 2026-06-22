Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA03126D6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 05:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782107634; cv=none; b=rmZHcTom5j+BckUUUaNBzSRiwdywf8uLmtLx6Nct0QJdCrqjqTCGKwQFe8+nRoYno8Hmlf7DuAqVz9+EtD89DzTEnJxnuFDXICkejALlJ+t17TMzuowcpyqfWEgI1Mr2rDbAQVD23tyrAjx+Hr6XJPN7O3ZRdsJUzu9KAM0Oids=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782107634; c=relaxed/simple;
	bh=+0gvnvWipZI4uBeCBzbIxs0mhiSbpcvWtejRdcW3TBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qA1g0JIzQBFH0DOl+NABBLTUNzsHTgdHAOK5lkGhEfQ+oTunp8FgEFUiJfhNZ6ZrVQEZ5zkBSAcG1ywe6Y1VQODg7cM4N2yufI6jCS3EOJ4/zKgRQW5AwgjxrQa37zuxQchRm/DfdXQFWu5T/7Pu1YTnmy4qLbdXSlXuTKxOzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=liNfZGBW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="liNfZGBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782107632; x=1813643632;
  h=date:from:to:cc:subject:message-id;
  bh=+0gvnvWipZI4uBeCBzbIxs0mhiSbpcvWtejRdcW3TBs=;
  b=liNfZGBWJYDCPBrJFunMC90vsAbQUhn0P20UXsKYfeDb0JlGt4NjvVQZ
   mR50sjyAHZtVXrOfDfdkHxCEq1lFDL2tTvumoDAzc4hWV5iK8L5tTh6Qz
   dVB2bx/aX7ROzdled/v+ON4OHcJmgiDqMkCrZ+qWA7Uwxl1K7gsUwU4MW
   K5dmMlhJT1CnVNdBnjbOaKDeQGOV0+V42veTQV9rh9xsYvpYd3sXU718d
   wLD+tiLxcN/t57thouTNIbexeTBiPTolfCD5mBi3qjsQ3xeeP3+sbIiAf
   T5dPvNYNYJ1Hmc2jFHOZa3S5I2a8UKV2g/bGwXH7yLyDcRV6sm5uLB0Ga
   Q==;
X-CSE-ConnectionGUID: hV4mLrIwRsu/B6tjJqtspQ==
X-CSE-MsgGUID: MJQ+BpvETX62XdTPDwVS1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="108377466"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="108377466"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 22:53:51 -0700
X-CSE-ConnectionGUID: VOJ9iuYuQbuPtYLoQGsBvA==
X-CSE-MsgGUID: GhAPKJVbSxyWuNyrmkbXeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="244782894"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jun 2026 22:53:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbXbP-0000000060P-2nzc;
	Mon, 22 Jun 2026 05:53:47 +0000
Date: Mon, 22 Jun 2026 07:53:34 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202606220745.4xbTUl9u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/27] anolis: spec: add script to generate kernel changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220745.4xbTUl9u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220745.4xbTUl9u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
>> Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
--
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
>> Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
