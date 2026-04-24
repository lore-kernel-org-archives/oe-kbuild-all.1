Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118927FB2E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031824; cv=none; b=kY1PIycq4m0U75E40/tW+tz5synLivQ77uOI1lhsFDJPZT6t31c13jOyYNPWWq0TSMJ9YFht0JmKCBv6MFzodAJ1UruZdH+x3p87D40l+4fCSQVIktZRK21Uy90NhTxSVswnm58sGcFCOrY18BE37hBfCtSRN1wAaAn6ndLhX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031824; c=relaxed/simple;
	bh=izrAX/JkalAyYkvUD/OtWIxMNLMBrs1/2STE4leVGQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NECPO51jeqNrOaDAXpr3WMhv/zaBAxNtbjBXbFsCug5wocQ5Y/UOo5FzhRSDazxIpAs50aqKdGUpdugof7XSKHB8wHWDdW1StzcXZcMVro5U1nm6wdocY6tjCEvInATZ1f27wbRE130tBOI7mjjaXnPm6Bf2h6yDKC47V/qNXMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdBPRGmj; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdBPRGmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777031823; x=1808567823;
  h=date:from:to:cc:subject:message-id;
  bh=izrAX/JkalAyYkvUD/OtWIxMNLMBrs1/2STE4leVGQs=;
  b=MdBPRGmjlJwZsXR7hElV0kuVxybJZ2LrlSvDxe+E+P6zV1yemfbwYWAz
   Nm0ffe3IeIJP//tcgfDpgbDEackDYbFf5ETyZXkXjsSL/wQApGlqnbQSP
   kB7pIdAP11Lr3dE4hByYiLIWXz5Klvp1873i8c2HVzlDozmbQpwsfrQ/3
   oHBtunm2hbcpWOwPSqSnhJr6USeQE8tqUBwuN//9HEg+A7vBOsPFPCQDe
   PXQek8NNROuhsB7YpisU4cBxoypSjTdZO8VAIkvyhvRGZNnMj54hdHInZ
   lvqZmzRBqOuT1pxrT6/DYkp5RzY8j0f5fwYcs67hJeCnED5vhIO/HN3JJ
   w==;
X-CSE-ConnectionGUID: vKtWwuLsRLiyCOBykyRF4w==
X-CSE-MsgGUID: FrMv8M5LSkmRrCyxyhTLqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="89393881"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="89393881"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:57:02 -0700
X-CSE-ConnectionGUID: xOXxLJAYSYetdh4WvaTqEg==
X-CSE-MsgGUID: AA4IOQIyRi+AYU/TH5Rh9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234726879"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 04:57:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGF9X-000000003FN-1gEb;
	Fri, 24 Apr 2026 11:56:59 +0000
Date: Fri, 24 Apr 2026 13:56:54 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202604241342.oKcrcZJR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/2] anolis: spec: add script to generate kernel changelogs
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241342.oKcrcZJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241342.oKcrcZJR-lkp@intel.com/

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
