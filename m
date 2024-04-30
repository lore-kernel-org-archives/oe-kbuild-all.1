Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22878801
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714475618; cv=none; b=ixOKX2g4UmStj+h4GzH4b9I88MNkTiVv6WY+j/pPH4Z0VtQhqyal/SsSuTic0UjniAipW40wmw1MdO6Ihfc1tjdu/nVu7OZoP397cH2SA1bLbNmpE6W1dAvbUyhoWp/q086tqgl3zkWVnRyX21+4pNS+buw/67LrrWoj5hOM58o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714475618; c=relaxed/simple;
	bh=mwO/ug9iZNN7axsKN6+VAf+3Q4WiA9YorTe0ZNjKn/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpLNhjVEaiA8mNbEAiJKmV10gQKXGXFaOekUnOfGxhOq5UB8Cl7BjCfr1KHA3lHxwZ7dRzfj1DgNDjezAVwAXxMmrLGerODU9+R2QPYewY+jt5NPZ8U168qZisXMw7WcLjUhOXXVnJ7xURMid69QtbY6YyrxLhZG6hROBRPHfQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCy6Aq3k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCy6Aq3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714475616; x=1746011616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mwO/ug9iZNN7axsKN6+VAf+3Q4WiA9YorTe0ZNjKn/c=;
  b=UCy6Aq3kcKPo1W49tzz7bIb0YpAnoD37tQD4hur057tOPeSsd1KmNt3m
   55Woc/jv4+O1/NlWo9xD9spe6tC0J3sdeY0NGI0YChimh7btBqiRYDljU
   1juZak1rlK/QrOJnW/3RFyN+l2ilQvIzD6MsBiBxhaCMeFLeZi55vmHhe
   axvHXgh5KuvXLUnoeiK87wcgiXLm7fcLUIRe/Rc7h0y8YcXUPSvrL9KX2
   2qegBDmz4oRz2rvlOFO9r3j+VsDBgrEnXoFsY2lmE3fZtR/aEe0Qw9qRk
   0YXX3fWVJJsAHmW5Ht9nBYvwqu2G19uVueM5+UmFmj5rGp+Yy9uUxfIg0
   w==;
X-CSE-ConnectionGUID: /zPVL6TuTgafxgGMgwHFNA==
X-CSE-MsgGUID: 6r0C+1qaRfClG2+r91f0zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10026701"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10026701"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 04:13:35 -0700
X-CSE-ConnectionGUID: cmK2xbCyTiGAdX01wH81QA==
X-CSE-MsgGUID: NgL4QgGkQam0YyT/mUbtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31050263"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2024 04:13:35 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1lQS-00084N-2l;
	Tue, 30 Apr 2024 11:13:32 +0000
Date: Tue, 30 Apr 2024 19:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29977/30000] htmldocs: Warning:
 openEuler/MAINTAINERS references a file that doesn't exist:
 Documentation/networking/hinic3.rst
Message-ID: <202404301948.EL7XVbul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ae52f9c522ddf14090fc55bfe6f466c29c68bc95
commit: 0378ac5f333ca75e4fae5a8a8ed499ed374f3bdd [29977/30000] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
reproduce: (https://download.01.org/0day-ci/archive/20240430/202404301948.EL7XVbul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301948.EL7XVbul-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
>> Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/networking/hinic3.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:397  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:398  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
