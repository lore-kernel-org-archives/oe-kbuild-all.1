Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD73DD85F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230943; cv=none; b=UrHxR4F1/louXqkEbRzggHPeFPl8fBEbHyLJYcIQFjEg+TDz47UXF8hub6hsZX4EAI+3GcLvmp2/063jerjBa3L+vZdQXxTcfeyVZPDRg5rH2XrJ8VIxrJzit4f0qOhmHmCenTZmgQgovxF/TPE6kQPi45kCMFpJ/43dmgkffEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230943; c=relaxed/simple;
	bh=V7u5ENxOs9gAIyk3+Ck9jnfJHyyiarEhaPCVfQQMqfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=b27nJpsPGrYEMfuFxXJ1+SbymoId9xX66KpGBgqVF/gkL0m+b/LDSQ/jMY4fHOz+JMHSKvEbwPJDJW+CVkh/IvVAcr0GJjxGo4M8ifVZ4lr78LUG7WfnIfi6a0sRDgKbPG/pzXeRRYxT9a9LUOR9d1Tp5HMhQJ1Y/VdcFVddcn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B44afr0a; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B44afr0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785230941; x=1816766941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V7u5ENxOs9gAIyk3+Ck9jnfJHyyiarEhaPCVfQQMqfE=;
  b=B44afr0adv7uukiZdcbW/QXFOKwKyPMRonfPQ/Tp+rLFV6xT0RTKr0Og
   wx+Xl8yrv+WAAq+rlInGeCisdtJtUtvA062H86WVtOleRATmxYR/r10eN
   XY8SF7z0HkOV4yV1GSAcubAEC3QDjq+9y2aChJzjaUbBaMu1hBlYi0x6u
   mf1ByD/PHxs1S5Qvcw397gRsWc+aADevWlZNC0VPR0rLrv33fZk9517FY
   R1PcJeScdDz+Ycf1vzyfX+AaUFf3D8i36sT5M9Ev2/CNAF+o+RHz3q/Jl
   XKnKyRL/laQJTbTC9QVYBNslGjRIU7kmX+naB4zOm5+SbdbrTD8E/Z/BQ
   w==;
X-CSE-ConnectionGUID: fRVkkHRKSb6tj9u37+y4nQ==
X-CSE-MsgGUID: edh8gtT6ShCSZIWZCUY92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="97323374"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="97323374"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:29:01 -0700
X-CSE-ConnectionGUID: jjsijZhFQNm5LT/2f1irUQ==
X-CSE-MsgGUID: xhhpstCATyqbYGcWmXnmHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="255717215"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jul 2026 02:28:59 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woe7M-00000000eCG-44Lx;
	Tue, 28 Jul 2026 09:28:56 +0000
Date: Tue, 28 Jul 2026 17:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 70/130]
 drivers/spi/spi-zx.c:477:24: warning: conversion from 'long unsigned int' to
 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to
 '4294967294'
Message-ID: <202607281709.3gzTccrn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: b3c8f8b4509d1bf92e5421480bedd0ade293d382 [70/130] zx29 qspi driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260728/202607281709.3gzTccrn-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281709.3gzTccrn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281709.3gzTccrn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/spi/spi-zx.c: In function 'zx_qspi_remove':
>> drivers/spi/spi-zx.c:477:24: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
     477 |         writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);


vim +477 drivers/spi/spi-zx.c

   473	
   474	static void zx_qspi_remove(struct platform_device *pdev)
   475	{
   476		struct zx_qspi *qspi = platform_get_drvdata(pdev);
 > 477		writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
   478	}
   479	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
