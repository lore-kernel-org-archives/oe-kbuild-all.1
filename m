Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDDE3C09F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646896; cv=none; b=oy+GpuUhLk90d/kcJH6PZWdNkDL3+BqY4gccjOFnFEMkX3MhRVcfBxl4QwdxZsUS+PSg780NtyrNAuHW0Kg0O9gsSWjOlY5L5fV5OxPM4kxwZEDmYUY4YdordkYWEUGQoaEtOWNBiyXVC5GxVVrjtA4wEQ4j0yb62tNhYRuLk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646896; c=relaxed/simple;
	bh=u2E+nOh7qmMFMugID045S9UcpNaKEMr+d6eT1cBZ4ac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gM5AZYwd1mP8fDloPs8qkFFxUMTZ0HrETjytkaQ+FK6K/NjZtAJq8dgYJEzFCutMyx6EALXdmVIVnSZG/VpkMmREgNg4W1bV08IYXzEvL8gxJjTY/fW+fIj2xfcBY9j8n0SZiQqaGvJr4vAIgLqn9NHfJmreUB2T/nnMYYQ9lBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWEY0bcj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWEY0bcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791646892; x=1823182892;
  h=date:from:to:cc:subject:message-id;
  bh=u2E+nOh7qmMFMugID045S9UcpNaKEMr+d6eT1cBZ4ac=;
  b=FWEY0bcjlhr6Up/1krn2clxvejwkCtvDcyHVRilJ5IQmVFVbRikA9C4x
   /vXgpmLCAbMWeT81z4MNxty37C3qwpdS49K/ElHKYb1TuSbwZcw1CSU54
   WxMGPezv+4rZLJd3KsIopH233NWg14xDTJ/aHshFp56gBM/Fq1jJnPccE
   FW6IgFxnidi9lSgd+SKKgx+HP3L1ah5FwLEZ2/ec5AXUjzCgvYKe+OmoL
   34aWYKM/3dB3R8d+4m38n/zLkIQSKixO9Zv0ltt3IACNpxgVsux5Q2eOo
   kScF6+kU3O1mEr/T+uMHUCyG9NSk0VCa5wc1NVA7pIi95+SUvH2icFqeb
   w==;
X-CSE-ConnectionGUID: DASdqCbIRaSbuvn6yhN5bw==
X-CSE-MsgGUID: YbZBGNnMQ+O3CBZGpMn8Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="299061"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="299061"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:41:31 -0700
X-CSE-ConnectionGUID: ey3qemb7SM23j3qwQ7PKmQ==
X-CSE-MsgGUID: L6Uc0cOGR7G1Wr8JZdtPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="899194"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2026 08:41:31 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFZCS-0000000092x-0xjB;
	Sat, 10 Oct 2026 15:41:28 +0000
Date: Sat, 10 Oct 2026 17:40:54 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202610101744.wjYlOKTH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/14] anolis: spec: add script to generate kernel changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101744.wjYlOKTH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101744.wjYlOKTH-lkp@intel.com/

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
