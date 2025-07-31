Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61194288CA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 23:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754005030; cv=none; b=dQ7IW0hUsDf5oHtA8dcBEfKDjGKxi4SKJwcjG3S/CfjIkd6eOellk0/aW9Erj/jTQI1DiD+z7o1y8Z5lZ087uBX6zswYF/yPyQrTBOHa2Ci6Zsntmbu9trjaKDfZ/RuTNBnLSORhnSRo/2BD187oYkJFuhD1dc0RstyVmAS2Zs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754005030; c=relaxed/simple;
	bh=Ei8iYKulso/bcxhW0MvUwL4iFv1UGJdMQ80Oi1B2nCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gLTWEJv5JdYjxanZFgtNY86Z/xK0smM4j/Be6kA+HFlb/C6bDTcuk96itTDWYux1dMRrhNjVa/qPhs1b0wb8mtHQ7JPhuinPEXgEkp+0ehPeVRcM81WpszifaVELZmJNnL0nwiLahAhLsTNJjHeLh2zGij4cfBaNrs0BvChT9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuNKf5gz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuNKf5gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754005029; x=1785541029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ei8iYKulso/bcxhW0MvUwL4iFv1UGJdMQ80Oi1B2nCQ=;
  b=nuNKf5gzOZilgCoNsbnA8RqDfO6QT96wuhNrV8bJhwqf5eQol+3lWVr6
   pkX/XGbnHIsqNrtiiq3CveM8cJU6xACbzb/YTp/p2LvVOQIydoNO5nHai
   won7eUmYZzn5xJJxwowQKrKusZxzZQhbRel6YricPRh0MBTx7lbjlQcdG
   uATgbIRs+bAyic+zTAmGAAj/cyY2FNeRNPgd2i73hcOwOs9PAvgll7brY
   9+kQv62Af4t01LqB4jZV1UX/ervwAMUHkYqDbtw2e+jC1NqS1f5YsU39P
   GniujNy176w+a1Km41gqcf41QuBUFnhpd7rNRkLHH2XYAofwYpFjCAk3k
   A==;
X-CSE-ConnectionGUID: LB0WzbFvS6WbHzATha9avA==
X-CSE-MsgGUID: pcR9i33kQzOly1GkFa2/rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56280034"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56280034"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:37:08 -0700
X-CSE-ConnectionGUID: LRMXRGGmQo6TQSa0kCHfLg==
X-CSE-MsgGUID: A3wYKkAuT4u3TgwILm/Mdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163769507"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 31 Jul 2025 16:37:07 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcpc-000179-36;
	Thu, 31 Jul 2025 23:37:04 +0000
Date: Fri, 1 Aug 2025 01:36:55 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: drivers/irqchip/Kconfig references a file that doesn't exist:
 Documentation/loongarch/irq-chip-model.rst
Message-ID: <202508010142.GoWv2X3W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: 5366c73be32b4b8715e98b5d1922009bc9ab5377 [0/1] irqchip: Add LoongArch CPU interrupt controller support
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010142.GoWv2X3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010142.GoWv2X3W-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
