Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE440D59E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 00:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782087531; cv=none; b=lpIv0AYwwksln4ACMq0+1HuQlRNGEPiwU2l3c1aK+oS2IIXD+c9J0TmERDkOnZzOwc9snMm8EscS1iZtrPh2bI0TWPAMOhH1aY8JFywnAhwBYb7QHY3H0QvPuOX5UHN/BUnkmyTefpZgcgZb937VZMUZ7k3fnfYQaAmfhZS8ELw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782087531; c=relaxed/simple;
	bh=D2OMYhzggVGJoZrCjIOgu+gtACUSK0V7/BG/VBNsvW0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c5FZTDxjXHOcBIlhHsN+QqxVmawZ06V7/5HuDneT8cOtXmqgdnRvzmX55YkDZaYEauk7mBHZjuBu1KMW5l4Wa3uJq29GcCBwVp2PaWDwQZQIaCwZ8qB4ITRWaQCrW/bO7TzB+7VZK/eR3xL4CtXegDF5pLlIhAHUON0vDW3nxSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XaXuSulr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XaXuSulr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782087530; x=1813623530;
  h=date:from:to:cc:subject:message-id;
  bh=D2OMYhzggVGJoZrCjIOgu+gtACUSK0V7/BG/VBNsvW0=;
  b=XaXuSulrVYQT0xrSuuDRFWttlx2pOIz1wBPr1NMW5v8ONe0ekOjYgE9p
   y0L0l0nlfKs0Cv/gG0of/Sj+csPBxRewvfwf8r3OQPPHcH/YyxfCUiabn
   uI3/EKGm2cSPQqfSMTtwvH2C2U8S0Mh4m0C1zzCcID/5oIBM+0h2AOuiA
   JSw8vIxmeIfZtHJuCIcx6+MvGjlV3eIi9o2TzYYiDTJmvciWNqM4YkL9u
   bK9xxhXLj82jBV3WZHo6Y+N9puKPyVVrQCT2adjdzwr3Jp0bdSQxz7oBn
   1BoxyJflTvlv5H6gfZQMwzqr2PwkxfUnRAGaaZGtoC6PTzu7ql2T5Xrg7
   g==;
X-CSE-ConnectionGUID: 0/Hp5OK/QyGD6t00GsT3rw==
X-CSE-MsgGUID: Q/lNOTVYRUumEFBexGw8qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82704224"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="82704224"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2026 17:18:49 -0700
X-CSE-ConnectionGUID: Nm4zPb33S8SQaZWth/PoQw==
X-CSE-MsgGUID: QWc7dgJ1QcK/pscvxcOXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; 
   d="scan'208";a="251008718"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jun 2026 17:18:48 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbSNB-000000005yb-39cj;
	Mon, 22 Jun 2026 00:18:45 +0000
Date: Mon, 22 Jun 2026 02:18:42 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 Documentation/x86/user-interrupts.rst
Message-ID: <202606220243.z5oCMOuq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sohil,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: d194d7311815d728c2b9f10c3f103edc141906ef [0/27] x86/cpu: Enumerate User Interrupts support
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220243.z5oCMOuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220243.z5oCMOuq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398
--
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
