Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58A35E949
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Apr 2026 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720879; cv=none; b=aHefvunySwb4g/enn/kOmsKMwjc1CekDQkIH/z9IHMmXG/3edgNNHLxcOcGFsZen76c8mFyjv8PWG7t0UrgvDXWrsTt6ZQvVlkPT7O0MbVgTsJ1Wu8MVGrK5I+MCumcQNMu3doemMOsB+YrQDm/p4RLKhX8kS62891tfhhbuYp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720879; c=relaxed/simple;
	bh=eTeNnnFYKdZwJ41m7+C29mJxCjUW/n+w8w1I6Ztvsjc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRKr5FTl8CUEm58IlUnBYsqg/SWmiIsT+8xoSTptJFn/QdD1ZqlNiUoa/jTLL7PF9pF83Ooov2G/C24U/Vi9ifD3Cjy91T4cdSoRLujqxsdFSJyZ3+sghd2obLFecwDymvCZ8NgXBBirtM6M/+iMvj6sx5JtshEwgLiMuQz0VEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaDxJUyN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaDxJUyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775720878; x=1807256878;
  h=date:from:to:cc:subject:message-id;
  bh=eTeNnnFYKdZwJ41m7+C29mJxCjUW/n+w8w1I6Ztvsjc=;
  b=DaDxJUyNgoIur6QtGixDP5AXM2txDLDSYWoIKh4k2lzPEBi7RuTAXQNj
   Gn6voHJ1qpHyjueS3zP/VEogNrSUDJML08cizfoqmA8Mw8tDTwiosMnwB
   wkdzTfrBX9hBnnG9jGoV9Mf2NaMcJFilrOghmeigGSVnJ1tVjkhMunecO
   HSYtXvNY7RHlcp4o5StJKZSJylVobB8NeoKbVMNDy+H9MHFlbyDf15yia
   AZt58E/+wqj+A+zdSANM5tErSTHc2fkrupuWOi9RrY+jpcqcK+mpeiQCe
   ey0Xlrd29V4gEsqj32Wg8aEZ8JS4VVmzwhO6+reuWMcu+0qjMNCTHpSZJ
   g==;
X-CSE-ConnectionGUID: 6J4ilujdT6itz1BEoIVLQQ==
X-CSE-MsgGUID: 6aizp6+fRa+mUaBu5JnrEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="88105614"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="88105614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 00:47:57 -0700
X-CSE-ConnectionGUID: C4Dtq+Z6TFu83A2zs1f+8A==
X-CSE-MsgGUID: FwHhucV7R5i5g6WYm1ls9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
   d="scan'208";a="222200409"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 09 Apr 2026 00:47:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAk7F-00000000AdR-1veM;
	Thu, 09 Apr 2026 07:47:53 +0000
Date: Thu, 09 Apr 2026 09:47:04 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/28] htmldocs: Warning:
 drivers/irqchip/Kconfig references a file that doesn't exist:
 Documentation/loongarch/irq-chip-model.rst
Message-ID: <202604090955.GfDDnWfb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dfac5db76de6d94870bf21cf230a936e1b84ed07
commit: 5366c73be32b4b8715e98b5d1922009bc9ab5377 [0/28] irqchip: Add LoongArch CPU interrupt controller support
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260409/202604090955.GfDDnWfb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604090955.GfDDnWfb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398
--
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
