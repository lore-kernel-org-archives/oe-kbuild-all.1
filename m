Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B198376484
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913644; cv=none; b=pYTv74n0rbfhTe8hqu2iLXuj2Kr8TymrEZS/kfjhI5d2SbMY/7izrTofbhzaay4RIZ9XUZkdjCdjfCPEKBekGQSbPEKyzvdvYXiJkELlTNzuBSxQkVBautXeaYhYTuZZQIwkPAqNp3iGStT56nrKpdV26KxY5d24nVl+jY0OKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913644; c=relaxed/simple;
	bh=dq8trdGg6pCyHB520vOmPYLrhoNxiP8HhIERHBrycx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVt67pBjg/cgd5lPHWN9YNV/a659JLFugm4Aht+3A01YGo+HSFhVKTvRn7GXxJGRqOG+feRO63H3i6eedJBg2mMEepTiggQWEs7r0e7FnuP5o9iXlt/72YiL4ytbKq+eTMIRpqyHgnFLKY/POwM0YmAUzsHMzDnyxHLYnPr74o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByHm6t4S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByHm6t4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773913641; x=1805449641;
  h=date:from:to:cc:subject:message-id;
  bh=dq8trdGg6pCyHB520vOmPYLrhoNxiP8HhIERHBrycx8=;
  b=ByHm6t4SlIIE+sm/ORPzEguLwU2yhmgECjdB1wSyrtgbv2wkvW3g4U0I
   CxBVDIPPDl07GiZ36hujQB+KZWmnFJtc+LVIjV1ooUv33FDE7igWyv+bb
   5t/AHMcw3CiV57j41ygOfD2ZYn+77/aQx3dhH5SQ/23fEBzyRjoevSsHx
   CcKWQ0XYqnRXkgPJ4Ba66T+IEA/4CLphqnxGBU/zja5iuSW6CLloRXisl
   bZJBPi4LCScxzZd4QZQMgXDviU+e03PWqyYAxjcbcC8QBRqgO+HngbVdU
   AZv2xQWUmAg+nmqMvqxOlRpVlElDGpML9Hzu0iLJ4gKW32qv3VkqGKs51
   Q==;
X-CSE-ConnectionGUID: U9/YH4cFRf6PnAKEjGEVSQ==
X-CSE-MsgGUID: 19z4W8UbRvGsZXcwNEPQ9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74678265"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74678265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 02:47:20 -0700
X-CSE-ConnectionGUID: dixs03Q3Sd205pQZQzbSoA==
X-CSE-MsgGUID: 9rcqfuOCSsKOLaryq/AEJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222150401"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 19 Mar 2026 02:47:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w39yG-000000004oD-1VzE;
	Thu, 19 Mar 2026 09:47:16 +0000
Date: Thu, 19 Mar 2026 10:47:12 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202603191001.xIa0FPsy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/4] anolis: spec: add script to generate kernel changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191001.xIa0FPsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191001.xIa0FPsy-lkp@intel.com/

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
