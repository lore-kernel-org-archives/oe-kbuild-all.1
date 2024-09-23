Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698C4194C6E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 10:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727085613; cv=none; b=TqT2ZN4EwEqgZKAxdZiAcbkQq0MgHHZCRGTX53mvHiohKG5jLypKeU5HvA0k8tXAXAE9EJnyrJ9a3Iuj0l87BF7Okl0ztYiaGGTx/JoqtIKiFsHmCwwYx0W9uvktZLBR6BQsGXArUq2GAbb07NP4Z+SDrbVRHoMCDMjg0Ula5cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727085613; c=relaxed/simple;
	bh=OaN6Z2LFO28UlZChxX8Te2k9bgQedqtJ4mdP5Yd0n0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZXQl3MAT7b1vlfYsUKb5bJ+4voW7co9BmoDtLUjiJsroJUNOR8lvEyJWiGduHBCy2QHvDkcsm1yt+btfYa0B+btXsT9ArHBAGRvlNi2EC00ESwTdfCdz9dxb+29crGAkKcjFbhX3nje3ftWKmXIvvUsV5X89J36k1bCnfBwZy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVQ/cKCY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVQ/cKCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727085611; x=1758621611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OaN6Z2LFO28UlZChxX8Te2k9bgQedqtJ4mdP5Yd0n0k=;
  b=DVQ/cKCYQ4Ru7uW+1nEJTrs5cv6Ot4ydq732X7Tji+Xp2C45GwYYKugG
   bOOBCy3DphnhXH/TQqg+D49VDlgqTDjdJgU2rRMhPtQ/3sFyJMM+ZF7bQ
   UOFWzd3xQQigkAyS/uMd1n37p0+QWfUWlYvM1d4mtfpilfnEhJvrZTsz1
   1yUwDKVJnGZLjKBYsbdGEtQLFnuKu1yvrWyl9XNqtdR59X/uHNdU5nE9y
   polNhOg0nMPux+R+AqVljFCLtTEzv+OQBAi0EE+r74qARAyNqVeWAem58
   BKFAszZB1i7vdksha8FuYd3+Fs3FqiuXuEz+CuHBqWbVue/34or+QavIN
   w==;
X-CSE-ConnectionGUID: bxwwO15fTEW4uM6VasrF3Q==
X-CSE-MsgGUID: 0IRYrx49QaexpXLJqBSvdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29811299"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="29811299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 03:00:10 -0700
X-CSE-ConnectionGUID: gpKqVIkfRv+GAKvayWrjIg==
X-CSE-MsgGUID: oW0bsmG8QaWj/pawtj8j2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="75782380"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 03:00:08 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssfrR-000H6w-2N;
	Mon, 23 Sep 2024 10:00:05 +0000
Date: Mon, 23 Sep 2024 18:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1217/2441] htmldocs:
 Warning: drivers/acpi/pfru/Kconfig references a file that doesn't exist:
 file:Documentation/x86/pfru_update.rst
Message-ID: <202409231726.hVKnLbIM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: e8903d73b4653bdb70ac265d9d13d997f0421a8c [1217/2441] drivers/acpi: Introduce Platform Firmware Runtime Update device driver
reproduce: (https://download.01.org/0day-ci/archive/20240923/202409231726.hVKnLbIM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409231726.hVKnLbIM-lkp@intel.com/

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
