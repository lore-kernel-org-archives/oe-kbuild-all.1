Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB813254AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781206392; cv=none; b=Mqf6YJSC555EK9qAFhoWOEu8CTcSzo6odTDwjLQHqYce5S/aS+bocf8PCQnpuzr4SU80Te/bEgb5+fQmCkRGNq3K7jq1UCNDdiXJ6l99xDXq8XjDAkgu+KG9ejAQpFgrCeGfWiEvynnOi4Ye7gJ0KBHvDnuR1hnMvh3OX6aB/PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781206392; c=relaxed/simple;
	bh=M9yahQMQ7jN0WC/fzddjfep3cEYYdEKrP+IfflEN0k8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VPg+wk03uGwsbSrm/v7xCw1lHIVBchrzoxq5dbmr6P8CKENa9EMuIltclOZkCBzOQlOVgOFHssBDI6pkyQsFuWfUwEsbIXxlBNsr/zlmHxuxGLMs2Xlf6aApqKsNQOXc1eaFnGRLcyZ/mw4lD6jpiNOpTdMxrhdAVJ97K9JT/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YL7rmrqV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YL7rmrqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781206391; x=1812742391;
  h=date:from:to:cc:subject:message-id;
  bh=M9yahQMQ7jN0WC/fzddjfep3cEYYdEKrP+IfflEN0k8=;
  b=YL7rmrqVQsSFewYiDl41zV+9L0nLFmjMYE9f7zGwKi1xCMQ+QLPq75M/
   LnX+lyIzaq6R988Omhs1CFW4kvPb8IHytzM9dRMN57bI4Wkko1NVfSfwu
   FZRfmupCZsOd5k6EQcqjzVYacLO2bQtcahKMfTY8188v+9dL+jd7YYjQP
   YGcQzzS/T0hHuF1GSqoq9VsExyUTOQeacDrChdkCfZ++oeqCKuD4G6ABa
   jlJzvUuyYsDbSg743r2dqR5Ka+Fs559W+4iX6kGk0WxP73fO763iMIPky
   EKiEVSSFoxFcIhZr4p8wkCA+oSuC60IG4o6LMn/jrx81B9Qdrd6vnLKJK
   g==;
X-CSE-ConnectionGUID: u/phYr20RNShVATL6SiSrA==
X-CSE-MsgGUID: Mvhq5twVSp6IxlJOpoQAGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81939512"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81939512"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:32:57 -0700
X-CSE-ConnectionGUID: F89atqAqSpmyDpbF44tLNg==
X-CSE-MsgGUID: p8DVV+I7R5uCCpFDWpAbdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="248474509"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jun 2026 12:32:55 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXl93-00000000457-18XD;
	Thu, 11 Jun 2026 19:32:53 +0000
Date: Thu, 11 Jun 2026 21:32:27 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/6] htmldocs: Warning:
 scripts/checkpatch.pl references a file that doesn't exist:
 D/../Documentation/dev-tools/checkpatch.rst
Message-ID: <202606112156.iEiRYcDP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   59b601d8e7e9c247164feffca889a7285dae430d
commit: db3222032804c5665eac308946da474c1421c450 [0/6] ANDROID: Snapshot Mainline's version of checkpatch.pl
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260611/202606112156.iEiRYcDP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606112156.iEiRYcDP-lkp@intel.com/

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
