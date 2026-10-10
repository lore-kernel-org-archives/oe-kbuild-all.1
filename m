Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A256A3955C6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652379; cv=none; b=H0FN87aTqO5pWPFLPYiKa6F+SCbC4Ii1a1dxJY/o+VtF0sa+0oqLtqoz4G0ojctIOZVHtzEG+670IcH+Km2jxL7oyAIAE7Gugj4DLFnhBeBIBdU7Lz7lF1LokUQ1IPakZqZqR98ssSlLs3EZJJFk4LV826+QP3mlQ8a7BsPZyxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652379; c=relaxed/simple;
	bh=/nBQNOwnTtBOtICcr+qfX5pUBrfu8VYQ3lgXVgY17RE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QGeQj3JbTM3ZEU3yyp+pprZn88Y/NEpWjJSIxy54QORfLOlhT7Oep2/Os9ZMQ38kNRYlV2GEvAfWXjmDv1ALT0VJtSbyJ4dm6vjv0SrKKaspCXMT/8ZaCvdKIhqShJ26ZcXpprn5yn6UC1qlUUXgo7VE9JS3ExPGgkKf+LHcdM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy6H912m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy6H912m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791652377; x=1823188377;
  h=date:from:to:cc:subject:message-id;
  bh=/nBQNOwnTtBOtICcr+qfX5pUBrfu8VYQ3lgXVgY17RE=;
  b=Zy6H912m2dhcCf7qil2JGNHoBm1pEEu/laA2LRDALjKQydC8+71Ypj0J
   jYD52Od11cb7xeWM2fDMHaF4r7V003oTVTCqI4QF6ZIu/oY9aYwDn6alO
   Je5rOfoMteEwDdVql+frtsebN79/CQYrfWS5+WCfKLu2MpvqTxGBRMO/o
   cFLxvCt9VPfnMsBptUCPA/JsAxjtBvGN4snmEwZJhdZcpopREyc1iEhBs
   7lrD09rMwufJ+gOUEkSIGA6VVUDkJzxAplgOUI2wTLbOrepCR3JsvcoZi
   iwZf81PRc1mCgtO135kcmceAUGx9RS/5iwAjnN/RQ5IJYGbgKC/6MYDPf
   Q==;
X-CSE-ConnectionGUID: 9zdkTAt1Q36FMPOPRPPmMQ==
X-CSE-MsgGUID: qdOxFXngTISKAZVgj50f3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="323030"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="323030"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 10:12:57 -0700
X-CSE-ConnectionGUID: Xpy0WdpwQDqNg3nJyBYnsw==
X-CSE-MsgGUID: yo72BvCYSNiTlxOyU/iXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="522170"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2026 10:12:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFacv-0000000098l-29sG;
	Sat, 10 Oct 2026 17:12:53 +0000
Date: Sat, 10 Oct 2026 19:12:07 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/14] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202610101919.1ijJJeoF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   4cc4dc28488d3d8e3b3cea5f637c38c42ea1a826
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/14] anolis: sync changelog from release branch.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20261010/202610101919.1ijJJeoF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101919.1ijJJeoF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
>> Warning: anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
--
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
>> Warning: anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
