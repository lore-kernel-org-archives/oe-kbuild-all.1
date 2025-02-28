Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1132580F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 10:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738745; cv=none; b=Th8s88YR04Md3Xf1Hnolc1rsVeQLJPNh3qC+1lvCcz9KmkPhuqGpdGBzVS9CkU5EeAYqJYyflz6Ffmu1BGfMSeRRrv0UoIWGJHeClMzIbG0IWhdickhmUlNcRmMJhcf2e0OMnvMP+pDuqZ4nSBqmGZrih+jyqXyYPaCC+0UVro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738745; c=relaxed/simple;
	bh=pNQQ8dr+iIuhU+TC01gE1kHICBwGg4nDQiE9rKlNDuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nz+9PSXwZgTkv+3MV/1PfHMBIBO7M2q+/VsQN/QLCWk8xfwKQtd9utkVi1XUCujWBogKaclF8gSDUZS9otesEav5Gkrvx97Y9HcZqtH+QjAomdx59LBTP75TuMMJzVutfmXIHrhuCs3OOafP6eo8z21AMS5FHQ0embjF6gciLr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9ajKcgJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9ajKcgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740738743; x=1772274743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pNQQ8dr+iIuhU+TC01gE1kHICBwGg4nDQiE9rKlNDuc=;
  b=P9ajKcgJCVdDr9jWt6RQEV+XKbFA6r+dyC8xAjxrnPgDqql5PMtEHBi1
   z+W+bzq2jAYmZtAL3Zi7ZH97DdIme0JVzV/mRrX93cIhlrViTNGEyD4JI
   sxJPbx07FL+D/1Z7YsfrsUxiKSbxZh92NkkdZU2UbbI5YED/YDC16dFy+
   yRm2jRxOXMqC1JRP6Ui5ULCrmnfazXTRdGUtkCF//Stw2uAzT/yrbOkyI
   G8NFZLeCLvvqKu7hj7s3B/kJrEwfZoZrhrWDX3r5QXxPkKUdNGV34eTnJ
   tHns4OQWRTVCH5VZrqW/fF17endNC4f/BIxyayAA7gRXg5BfZyU5/aly/
   Q==;
X-CSE-ConnectionGUID: Z4Ur40qLSouJRRJsrHhZ+A==
X-CSE-MsgGUID: Ss/PuBT6TzO+VDwZGfGq4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44478823"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="44478823"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 02:32:23 -0800
X-CSE-ConnectionGUID: RrL+MYMHS/+YfbeOxuJrcA==
X-CSE-MsgGUID: eST01O2NTCSw2gLoWBxjdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117482187"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Feb 2025 02:32:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnxfF-000Ekw-2R;
	Fri, 28 Feb 2025 10:32:18 +0000
Date: Fri, 28 Feb 2025 18:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/1] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 Documentation/x86/user-interrupts.rst
Message-ID: <202502281840.LJBCVQni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   33e283448f335063aab245460a2d3b85ac627b9d
commit: d194d7311815d728c2b9f10c3f103edc141906ef [0/1] x86/cpu: Enumerate User Interrupts support
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502281840.LJBCVQni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281840.LJBCVQni-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
