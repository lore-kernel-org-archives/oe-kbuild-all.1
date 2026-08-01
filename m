Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091630CD89
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785598669; cv=none; b=sXypAW8DWgPXJo6w/jJF4+9yzfGCCeUAind7XXE09eQm+WMRXvyW0EM48XYiUk4PV8tpqnpPjgY4VvTvmarnSFW+vqor8lk6EJ68mSK/h+Z/tqQrzhiIema5zPxQppqlu6hMqNog2o+951LcMK+3ASUUzMnEuswXymO3mOY6Frs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785598669; c=relaxed/simple;
	bh=Tueu1G8AZFhQkr9B8k/bwh5Nco7N5q6bFEfcY3FOUX8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iv+Gcr3m7NzBxaFbA2Ae7uC01O/ibqdAT5DPgmo4/eAALoVqhfsnR9AU5uN17UZviPHGDemrZKYtl5duUTsGpAuIy/RFFGBLibNGEp1lbnnMwkY5J2CnOikqxjp+NwSHf6Uf52G864vKOK9Vf7zs9aID5PmO1u7OnsI9+RDfRVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KPIxOSBj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KPIxOSBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785598667; x=1817134667;
  h=date:from:to:cc:subject:message-id;
  bh=Tueu1G8AZFhQkr9B8k/bwh5Nco7N5q6bFEfcY3FOUX8=;
  b=KPIxOSBjGDS+Jc6DdYN+Q9zHqvQrgE69TZobPWbLkhb+OPuGlavQMnYC
   RB0z1UMNOK+huLbkPEd5ug0sa5qiWai2RF0NpBN/M/SewaEmhic35Jm4r
   ArvMc88UwsWJKHP2O30OZ+m2wyy9/vOzT68oUwq9KX7jac7LfuwSfSppi
   rz6dAtWpiGxgqRVDw+lrPOLTdFouNFi72wgFhc2mnHBOfyjoYr5yYhD0Q
   PNre9oq+yo4KBx1D+tfTLSytq0iLyhgJ+9RJ0cz1FrlHT2fukAsrdXsAe
   WyhQVRscB6r1i7CalyeHBj4ViuJvsZ3X6I4w+NhmbLbMFum4S2F9DyCtX
   w==;
X-CSE-ConnectionGUID: EJk9SE5hRAWobpKq2zgskQ==
X-CSE-MsgGUID: Enbn95l4TL2v66UN6YfxQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="85970540"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="85970540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 08:37:46 -0700
X-CSE-ConnectionGUID: Mr50Gr2AQwGWQET06Gsg8Q==
X-CSE-MsgGUID: 59Hflgn9R9a0IatA9I65Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284197820"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2026 08:37:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqBmQ-000000003UQ-2rh2;
	Sat, 01 Aug 2026 15:37:42 +0000
Date: Sat, 01 Aug 2026 17:37:20 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202608011719.ZSUJGCWn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/159] anolis: spec: add script to generate kernel changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011719.ZSUJGCWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011719.ZSUJGCWn-lkp@intel.com/

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
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
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
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
