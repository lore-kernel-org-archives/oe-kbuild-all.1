Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48926CE32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 00:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772153786; cv=none; b=La7laePeqv3lMwmi5n1jYHsq1jILZ68p/93oLgmI2CDasAM++nk07IpR1GYYRZobOR6SBJ0M/f4J4V68cVl8wZk2NXxWcBKfMHh/4NjD9su0aVeuFdGHXlVCxEXpXk5TMCnQh6cQWKKTxAaq/A4qskP2AxlUDIPUIBrJaCg9uLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772153786; c=relaxed/simple;
	bh=NBMR1KdUoL368L1TRey+7Gj1TWDgmbmiYPhwxGzDdf4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lBovm34caJUIn0TRLUbS5yYOuCkC2k64dxWWBUqUlP+2ga030aYE7PnE6A63TLi/72DDXrF9Dk2BM+b33YPNjaFKPmnE6EIwxmU3lUvXUflIRToJJ6GgZ6ByHYsaCvT+7YnsSPkf9Ewj2UoCgRNDz4lKwp5rHG0R+VtvAQ30PEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN0jlpSS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN0jlpSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772153786; x=1803689786;
  h=date:from:to:cc:subject:message-id;
  bh=NBMR1KdUoL368L1TRey+7Gj1TWDgmbmiYPhwxGzDdf4=;
  b=MN0jlpSSaI4sCHq+eXuYdir4U9O7nU22uslb1kCyRdn3gbJfnmc5VMgT
   6i6Yuh0xoC5qAiEuiDFuDVbqHNWyt6IkI/nuQy3eoGdnJMbYsIXChm32M
   fs8tGosTuWz8O+rwy2Hw86go74szkqhfcmVZARHuTSswErvmjmnZBUEfn
   JN3176wapJknZAVxBT9N3UdtT4Zdvko1yyDDOmz3mxrdcDHyZ5UQwArg7
   +h6D0E/b3qfDGzZMZJz6aJlC0i0JCQosKqBjtXA6tzRx/fcxhIbR5LyYO
   slWLQwQ/SF0BfZgMVAmM9oJUDZtFV8Ki39MJbfZRbmAzWtbO9sL61o7YO
   w==;
X-CSE-ConnectionGUID: bJNZUt3NTGqF06OPmI4ZOA==
X-CSE-MsgGUID: UCXUgTt6RDOLRXYzStR5HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="76842598"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="76842598"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 16:56:25 -0800
X-CSE-ConnectionGUID: xF5KeVI4QjufN5A3Hiv+Ng==
X-CSE-MsgGUID: WHMAnUEbScC74hmBu2BqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="215968716"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Feb 2026 16:56:23 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvm9U-000000000PV-23jf;
	Fri, 27 Feb 2026 00:56:20 +0000
Date: Fri, 27 Feb 2026 01:56:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 205/205] htmldocs:
 Warning: scripts/checkpatch.pl references a file that doesn't exist:
 D/../Documentation/dev-tools/checkpatch.rst
Message-ID: <202602270114.aoiW67Lf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35f57154fdf571b6197d177d629776af701f38a7
commit: 5144c1c2e3cc7f1297c6a152cdb23a539baa66e0 [205/205] ANDROID: Snapshot Mainline's version of checkpatch.pl
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270114.aoiW67Lf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270114.aoiW67Lf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: D/../Documentation/dev-tools/checkpatch.rst
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/devicetree/bindings/writing-schema.rst
   Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/core-api/asm-annotations.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
--
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: D/../Documentation/dev-tools/checkpatch.rst
>> Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/devicetree/bindings/writing-schema.rst
   Warning: scripts/checkpatch.pl references a file that doesn't exist: Documentation/core-api/asm-annotations.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
