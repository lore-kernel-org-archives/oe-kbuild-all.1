Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36FB469D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 00:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754008274; cv=none; b=aL9u3ueYJ9f0mJa48cpvoeJ31bFKTt1fO/pOitefmbLFFmSAWcMOzmaNJS3cMQqv7R2tP49p6Kyf41KiCfbB4TcmjIctLxu/fpzBYyrM444iMWt/G/9MMwdIiDVBAifvzl1x5l3mbNstqATOgMn5YdfxY3wyUYM5VZbG4WJUFKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754008274; c=relaxed/simple;
	bh=YAHK4zCP2VDX3TDmW4EJBnxVjQiVeA3KJcdG1uLTdjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss3PGioaTcf/t5pqWs8IeCa1fgAC2jQPCMmWuNxuaJDoPmk01kAZfZI9gkXWbDzrEbLo1PkZH+NK/EdaEn+A1ARIKSh8OHHtbgpHXTcbuHySTJ92KwHWzRgaAJIRiLDaBvp1oFaGUrzxZurnAoEm9XzuluGuGMOwu3O9iJKm0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/XcsAKb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/XcsAKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754008272; x=1785544272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAHK4zCP2VDX3TDmW4EJBnxVjQiVeA3KJcdG1uLTdjY=;
  b=B/XcsAKbl5o8zZ7CYz/cicLjNGDYkrTiXFXkQm3aDvsfDLbkX5UGF+3p
   YK5Xk2zIavIs32tHlGmhe0+mQ/izOS0Be0+avgmHe5XWtZQpVjrYNEonJ
   k/p2f7tG+/CdYmjNFjSm9CPFbo5jtFA6szt2MYozMwI2hnJPc4HMNc/J2
   JwErwEhJjo9kLy7fiN5Qnp6yYTO7r7SRupokuLf17Nj+GNpJIVSvXAso/
   kPEVJ/KgI7khCjuwjD/Zqmd3uxALE3264EBUdSzblnYyQliD6IHoAhTfe
   neg+YFVyVLH1N0kby8WYPn089P9pezPHFfqZXx1426H/QHvS60ysWwmuf
   w==;
X-CSE-ConnectionGUID: AggSir9KQE6hD78ds2df5w==
X-CSE-MsgGUID: qJh29FpvR0azznS7sxXJkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56046289"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56046289"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:31:11 -0700
X-CSE-ConnectionGUID: AaFmLQLDRreTTeaJH5bVOg==
X-CSE-MsgGUID: u5VUSGcyT3WBHTJr55bhvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167884972"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2025 17:31:10 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhdfw-00017f-0L;
	Fri, 01 Aug 2025 00:31:08 +0000
Date: Fri, 1 Aug 2025 02:30:53 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: anolis/changelog/changelog.5.10.134-17 references a file that
 doesn't exist: Documentation/dax
Message-ID: <202508010236.KycLB9xQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/1] anolis: sync changelog from release branch.
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010236.KycLB9xQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010236.KycLB9xQ-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
