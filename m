Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F54281530
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785595018; cv=none; b=X2fF3EgdvWlEqgzoNPf6oV8BrtUgA4SJfW/eSDuRidiRpiZq4c/Ah0khK9v02U43GmJ7/tNIS27MKe09HxPS5ywgdm6uF7ZH+PntjoZyhKVp2ktXG30UtAIqlgEtFt+VMl5hQw1FTBFpFCLTS1GxX5toLVRXlOQ3lgWjWke14W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785595018; c=relaxed/simple;
	bh=3x/3iaXsZxakWHnCyJfjc/8ksfjKUCCgQ+3VOMiTfXM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xlh4ieG+M19EJSyhrlwDsCkaq1LjUg8W175abV4nuvkxn4KqUx2+bqXNNuEwIijXERfTG5pqZHboK54k2lZEpUTn0A08FXt5LmLGLYB3KgqT//5n+qlXpSSdUbtprM+GhJ9pFzrWHAeV8GJOG0STc7/Kklb4mIwsiItUStFStaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts97T6AA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts97T6AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785595010; x=1817131010;
  h=date:from:to:cc:subject:message-id;
  bh=3x/3iaXsZxakWHnCyJfjc/8ksfjKUCCgQ+3VOMiTfXM=;
  b=Ts97T6AA0s82X2nc+P6x66NaSv699Wd8X3NUVH1QAjth9Xlg6AQ9TJ0T
   xLXYltznJ5NZ8BBgUSLlbvQi9Qaqlw1+VjIlaJfdFgGAcnd2ZX6rIAXVO
   g2mAOaSDhPnEB2tk+EVRwZ/DKc6GuTCdR4/XzCf1EaxbQhVL1X08rvnIZ
   f0DL/EpAIgky+s4Xy/ZLbJER7Gpq63Yoz3/kV8fpVheQDc+nXaM8kBGi+
   HGsCd7Qe9OpSsBOY93moKPmsNO04G85Jg7Dtv8Y5O/t0o+e511TwwCcyb
   HcrmcN16LDPUm/vnPJxdEKzbHmUm1iWBzn5N3GjcJNeDSiPFGMs0wAqrj
   w==;
X-CSE-ConnectionGUID: Pm5Aig63RUSOV3ia3GBd9g==
X-CSE-MsgGUID: 8yUC3zbqT76AOg8B1hnHKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="88732760"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="88732760"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 07:36:46 -0700
X-CSE-ConnectionGUID: gO0GYls7QpSc06eUszLsLQ==
X-CSE-MsgGUID: EZSj2+8UQ2yUZ54PYrjJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="265884334"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 01 Aug 2026 07:36:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqApO-000000003UE-27uH;
	Sat, 01 Aug 2026 14:36:42 +0000
Date: Sat, 01 Aug 2026 16:36:24 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 drivers/irqchip/Kconfig references a file that doesn't exist:
 Documentation/loongarch/irq-chip-model.rst
Message-ID: <202608011623.HaDkGe36-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: 5366c73be32b4b8715e98b5d1922009bc9ab5377 [0/159] irqchip: Add LoongArch CPU interrupt controller support
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011623.HaDkGe36-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011623.HaDkGe36-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:398  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4
--
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:398  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
