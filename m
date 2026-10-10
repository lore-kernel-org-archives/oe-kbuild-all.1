Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE4626FDAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 07:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619143; cv=none; b=AtYJbuxxt7CKwmhgjBSnb/LvvNz2N1phiv2bp+OpdzmHHVUzw4lrBcmpacrloBFqgZxTXGSiH+kKWkMDDPho0F7chvoIsDsBP8+82ZxDgUbbsbokCYlWbH/ncG/iP3xpT4FvEydz4YT4uY5cmSUlZ4DcDRAz9xMvDxLURSPacA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619143; c=relaxed/simple;
	bh=a5nlKIaZvX8gafNJQuLGSoQmuK5B+mk0nrHpY7nvsqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nCkhs/NNzLOtNV6rPBbTOVq1HLKz9dCjGGxEJmzI9FAhVFTGB9T4dioqqOKypfncGhXSUadBJvpKukPstx2hi9XPrqUq2VaTEG8GXvSdflVksmZizFXXkY5ktt60FrGg+1l3MT3XcpMfV789be97ZusaZlFxd9yGrR67Low4hto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvNJScZD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvNJScZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791619140; x=1823155140;
  h=date:from:to:cc:subject:message-id;
  bh=a5nlKIaZvX8gafNJQuLGSoQmuK5B+mk0nrHpY7nvsqE=;
  b=cvNJScZDaMBjPPCpy6nmk03CTAugwnpxl+6og9wpLe5dB6P3n5IkiivN
   BHgjPhPBfogHYGxcIGTJ19cJcadHHxJX76I8S/pzlplcVlWEO7mFRDq6k
   MC99xcWJdGKQPXMk6kQhRzq5RvyqwjsNl7tTHN5jv76LRiXLci7yZAbKx
   2BZdRFN1Uh9GHKJZAzSL8QaHN6rRs1v4ZkkwNS1d7dYsY2jj5cv++2LOO
   tP6+03rCANbu9Gr6jZfbPUCLvzRHQo62wDiTl0kkc8ALg8JGkBeJNoi/4
   6CQqmBXNySrZqhf5RwGofK1OMtahM1MeErbt0Zs/9C6b9gN6Erlbr0k1w
   w==;
X-CSE-ConnectionGUID: DAIETA9jQfu8xQAu2AdoqA==
X-CSE-MsgGUID: R0VXo60ITYCPblZbb7187Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="298246"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="298246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 00:58:59 -0700
X-CSE-ConnectionGUID: RuI8JnAoRemSsDPM7gFgsA==
X-CSE-MsgGUID: E94LKHFERLy8zCOIMe8fHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="949070"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2026 00:58:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFRyp-000000007vH-0dvb;
	Sat, 10 Oct 2026 07:58:55 +0000
Date: Sat, 10 Oct 2026 09:58:27 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 Documentation/x86/user-interrupts.rst
Message-ID: <202610100932.dIQdPt4V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sohil,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: d194d7311815d728c2b9f10c3f103edc141906ef [0/14] x86/cpu: Enumerate User Interrupts support
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610100932.dIQdPt4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100932.dIQdPt4V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:398  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4
--
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:398  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
