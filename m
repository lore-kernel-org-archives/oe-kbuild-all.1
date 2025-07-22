Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19F3238C1F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753219847; cv=none; b=Zi7Jspsc+XqZWKdHTtKiERt8R8h0bvpHddNOmsUvfGpA9NEBzqWV68Lf1mWYVAD95Tr5bd+4pyKLqt1sgCP52qkN1Y1bKZqRuvMxxiomWYUqaHsJVtdXdkD9Tq8VDaYlTtYE6qwQoiK16qaZAd8C4A5vv4dljw6eykMVw9Hkoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753219847; c=relaxed/simple;
	bh=M5+Zj9n17yyz0OHeAQv2mHpMzaAvyxSt0SOuXeta3NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hN7Dn9YY2MlsNdvpsiqTmPwd90gF6xU0olfdK3/jULLC+Nu3zeJO9XUkXG6jaiGeN+UVtqaesEdfDxm15Um8hNV+lTM1NkZ0UBuu5gZi//Q63l7y/Qx9qXP8sNnBGmIQ3pq1Kxndfl8mL7o5r7YcYHyM0yRm7FLaIV23vPegtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4QDs15N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4QDs15N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753219846; x=1784755846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M5+Zj9n17yyz0OHeAQv2mHpMzaAvyxSt0SOuXeta3NA=;
  b=b4QDs15NNhh7k3SCQeYR8ZO1FwUAa3foFDHpTHKMuqzKAGDWCoYdA7yF
   j12XoLLQL/vXwVu/Lq0MGmpVoqf08eHjk/dfj/hEVL7EwEcJVt6K5Urrm
   s75uscg5xQQeEjeONd1XCxQQ0ibxLFaCI4iDRG3617kAfdqvrTMi9jiZ/
   WucCerOJVFYGNX5q3RUN+HuuTF8YLLYRZRxiTg1YYroKaNSiTM11+RtzC
   H2esY0mQCgzuqBP7CK08aZIspo4bq+hPQM2suq1EHu5xGmHWDdmjX8JU8
   /e145C6olGhRcB5IfBYAXvHEN9lUfJp9q8CdPhf4W6tvWBo/pM9Ns/W0S
   g==;
X-CSE-ConnectionGUID: 5YqTWPFjTiOWgNGXZEVbYQ==
X-CSE-MsgGUID: S8RY0YYATASyVvkISU7fWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55335787"
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="55335787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 14:30:46 -0700
X-CSE-ConnectionGUID: M377sfYoQFib7m6NWqqeow==
X-CSE-MsgGUID: GkA3+WLJRH+MhoNEIvzC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,332,1744095600"; 
   d="scan'208";a="163520596"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jul 2025 14:30:44 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueKZO-000Iit-0e;
	Tue, 22 Jul 2025 21:30:42 +0000
Date: Wed, 23 Jul 2025 05:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: ckkim <changkon12@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.16.y 19/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to
 match any schema with compatible: ['odroid,reboot']
Message-ID: <202507230505.ZMfmyC4D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: 03d860d837c215500c150163bd3904ce12323f4c [19/44] ODROID-N2/C4: arm64:dts: reboot/power off support for ODROID-N2/N2Plus/C4
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250723/202507230505.ZMfmyC4D-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507230505.ZMfmyC4D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507230505.ZMfmyC4D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /odroid-reboot: failed to match any schema with compatible: ['odroid,reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
