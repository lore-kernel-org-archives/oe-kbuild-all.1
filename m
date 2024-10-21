Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68F1D07B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 11:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729511125; cv=none; b=kBqSzEGDjN8asYXVr3M2ErVPiKXhMntCs9R/1hlmkOt4cZbcmtpDTskxaFEzoPtyVlgiRJ9o5VYd2XSA/Ac5zf11hgZNljYMSis9ZYULBrpPYJrjY2Al2UqvB762fQOoceMfjwaHXyVyYwgUNT6cfsNV7NizUPtTmu/j1Qii8EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729511125; c=relaxed/simple;
	bh=dEI3vABU7VHKGTFnVJ5c74OqWG3sCcq+in/03xSEw7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YEhajekgDgEy5HxqoHvULdxtDGKxL9b+DNetMyBt6oI5gH8sJzjCAAZISHU3HL97AV5pnb1ngG05y5/N4tqjdBhtDiUuvsiFJu2rHHUXITj61a2+NQS/XwRl5bJE+E1IxGT/jEmuwnqpvfGlN3xfYsdxLM+V7NCFCn98OogOEXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SI+kCMYT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SI+kCMYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729511122; x=1761047122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEI3vABU7VHKGTFnVJ5c74OqWG3sCcq+in/03xSEw7c=;
  b=SI+kCMYTPwoMgepNBH4U9aF0QuUhQR1/K99V7krta6kcKl0MQ4mH+c9+
   WEAYdWV0smWDmADf16gZEL0Hk/13Wd63zLUOnaeO5SNx/3t7dIWdzLe/G
   1hw1umqnj96M165nuMZuaunJa6I7JnP2XZsl0EHneh3k+uhjUxuRx+UNC
   9mBiue7rv20sPMrneyQ/ydd83/+CRy+WvjFocNLha54z2lm3etUz7Kd7y
   PX4TMJCziZIkf5XTS+VvRp6n3OwtExQGTCj5ncrJIL18fKJiPolAMwkbD
   UzBASBzmVUC8QmiZad1HOkWGvXlbHG4tp1E+apsGxugzWlkmzE1sBFHYz
   A==;
X-CSE-ConnectionGUID: 5Uk3vPURTG+beN2ZIR0i7Q==
X-CSE-MsgGUID: pkDZ6BmZRRSkxmDdQU1+zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="46481771"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="46481771"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 04:45:14 -0700
X-CSE-ConnectionGUID: L/aLkgZtSVamWHe2HlDNjA==
X-CSE-MsgGUID: 2w0qUk2LTReeoIHJDUC3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79445882"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2024 04:45:11 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2qqT-000S54-1P;
	Mon, 21 Oct 2024 11:45:09 +0000
Date: Mon, 21 Oct 2024 19:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1217/2444] htmldocs:
 Warning: drivers/acpi/pfru/Kconfig references a file that doesn't exist:
 file:Documentation/x86/pfru_update.rst
Message-ID: <202410211908.gtPX400a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chen,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: e8903d73b4653bdb70ac265d9d13d997f0421a8c [1217/2444] drivers/acpi: Introduce Platform Firmware Runtime Update device driver
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410211908.gtPX400a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211908.gtPX400a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
>> Warning: drivers/acpi/pfru/Kconfig references a file that doesn't exist: file:Documentation/x86/pfru_update.rst
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
