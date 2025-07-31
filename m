Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790972550CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 21:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996862; cv=none; b=WZpXlTj5KF9tYhY7JwzADoPMolN0I5sSPXZ8FlbbjyOps4XwtrfFTED2pT9hyRne3xMxXm4SaEy8VzDG43+pnXmbeqTnMc9F4DEvoI89u3S5/mpM0pi5TSIGadi6mNvWcxQbpFimToGCcRzcT4oRffPLT5kQEr8zsOY5EOHrfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996862; c=relaxed/simple;
	bh=0CWNpCIL9o8DKeZVfesbpbPYf2L6D188T9Kn8f61/mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDmJJFtMzVHKrlUFVaorLX49O3tKHKnSJ42i3V4P5xoEsTDpUSC63NFR5UxlNi7ReFljnu1mJkmQZtkOpmMYsRjbsA8gGT4Sl9gFswRY9CWwRBf8QSfKS9tlnd/pzsD8YhsZ+UWdCUdmMrP+8eDrwWpLz1v41rR1KIEIft9EG1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ShwlvopG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ShwlvopG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753996860; x=1785532860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0CWNpCIL9o8DKeZVfesbpbPYf2L6D188T9Kn8f61/mw=;
  b=ShwlvopGrkV9wno7CiXZCV/YNvDmMCc0JlOMpSNkEak1+saM7cMaFExx
   jM8cpIEYgtbiWHXZHK832KKZBbKHCE7a/ps3YVo4g1s5rxTqqcUzdytdC
   hR61Jm7mWQTguJ3PDQgKZHP5MkLRswFXHvgmL962pUNGeWO5/W1PeyiOD
   0bBJnyjVRUhQCSt6P9pHeek1zOwFIPobA8dMVi8fJMMQs4GU2Bfq3MBfG
   yg0+LlawoQQG+2xt1txRTjwJTTQTsVgPYi6pZqr9Oe+8VSkYFAi5/iYT5
   pYTFAGqn7+G/R/S7eLG9t62HhL0jKvRZL9VBsdreOGwcyJE0LhXZRHCNE
   A==;
X-CSE-ConnectionGUID: +Asi/w0vRSS0VQN8AMRxvQ==
X-CSE-MsgGUID: GUa3q8mJSpqO+m1vnqGy8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55538769"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="55538769"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 14:21:00 -0700
X-CSE-ConnectionGUID: cOrWByQmT6u0ADEoPe2npg==
X-CSE-MsgGUID: RgUy9+DrSGOAeR4Fj8Q5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167543964"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 14:20:59 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhahs-00015L-2u;
	Thu, 31 Jul 2025 21:20:56 +0000
Date: Thu, 31 Jul 2025 23:20:01 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: arch/x86/Kconfig references a file that doesn't exist:
 Documentation/x86/user-interrupts.rst
Message-ID: <202507312346.RqbxKAPE-lkp@intel.com>
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
commit: d194d7311815d728c2b9f10c3f103edc141906ef [0/1] x86/cpu: Enumerate User Interrupts support
reproduce: (https://download.01.org/0day-ci/archive/20250731/202507312346.RqbxKAPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312346.RqbxKAPE-lkp@intel.com/

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
