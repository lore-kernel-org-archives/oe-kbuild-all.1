Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5651FB3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735315119; cv=none; b=WiJkUS9es24fZuFWmfI7kRF0F8OHCh2oWJM7WuHnpui8lcmpVJeZQQuSSDzmW1Q8uHlPNDTmL1eMdInx3/pZaM10dVpxJwrYlQQMWoEkddZ2rE+OQUe11C7qoNI5sBHOKMVaLO5rXtxpbEPa6GyTmcWLsqsAOGisw/wNjvsFRBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735315119; c=relaxed/simple;
	bh=gh7dsMLWlD/GTNoeu0PqXj8v1DzvjAbN/Tq2wjFaJjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9K1sZ8Y7ttUNdHLuHBmYe9JhCw34qTTlLyUl+CUinzVuEEXzsf2FvJz1IL4HQ6k5k3tQPq7MpvNFFOiBhV+B8pUQiqXcGy9Pi7qZJdjm1/rBFjYT1h+g9lMQMY354Hd2rzzo6juVT2hW5gIIU9cgEjRze3q2KilFzVLjRqYaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evkMPffF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evkMPffF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735315116; x=1766851116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gh7dsMLWlD/GTNoeu0PqXj8v1DzvjAbN/Tq2wjFaJjI=;
  b=evkMPffFGtkSU8WjuFE3EiuNsQ6FG2cNSKr/5vryuZMKPMRllRs0/tIB
   RzRaJMTdNlPoK6UgppP6iI3W37iZ7OZiAOi1Kcq3yjTXv74t89XkvBGNB
   qH1ChmUqtMg9DvXvz0O0HWQM15yGtDiVFVWhEqAApDWErWUstA26L2MFH
   MV1Zzo2zhwahmcCO5lEk5oKZNnLn5igmUH9ag1ERnvoIeTLg4BI4n9fR3
   lCV0e7+6cgzs1ryG2qVwUmMRj6+JxL2NcNrYRny8ZXGZ5qD0WblP22VD7
   iTEND7yFboa1MiQIWPkKB0DLlfmOf0PZJp1zKmWNPsU8tVwHPdkJlYHdT
   Q==;
X-CSE-ConnectionGUID: DPG8q1EMT+iaKbxGx8GTcQ==
X-CSE-MsgGUID: W3YnwUGYSomDMyc+dRcNxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35025945"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35025945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 07:58:36 -0800
X-CSE-ConnectionGUID: 7TNoVjgwTOSxM3IPk7Kbfw==
X-CSE-MsgGUID: nyQDZk5PRAuyRW4cSPFPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131158840"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 07:58:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRCjQ-0003J3-1J;
	Fri, 27 Dec 2024 15:58:32 +0000
Date: Fri, 27 Dec 2024 23:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355]
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1175:23: sparse: sparse: incorrect
 type in assignment (different address spaces)
Message-ID: <202412272355.CAWxIepM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a8a9daf97ebc8e303e039402fe784e7bd4e5a9bb
commit: 4b565ca5a2cbbbb6345e8789da89c193b6b00e5a [1355/1355] drm/msm: Add A6XX device support
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272355.CAWxIepM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241227/202412272355.CAWxIepM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272355.CAWxIepM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:601:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:603:9: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:713:23: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1083:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1083:31: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1083:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1089:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1089:31: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1089:31: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1172:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1172:19: sparse:     expected void *[noderef] mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1172:19: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1175:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] pdc_mmio @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1175:23: sparse:     expected void *[noderef] pdc_mmio
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1175:23: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c: note: in included file (through drivers/gpu/drm/msm/adreno/a6xx_gpu.h):
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:124:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:143:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:183:15: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:36: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:84:26: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:34: sparse: sparse: dereference of noderef expression
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/msm/adreno/a6xx_gmu.h:89:44: sparse:     got void *

vim +1175 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

  1131	
  1132	int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
  1133	{
  1134		struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
  1135		struct platform_device *pdev = of_find_device_by_node(node);
  1136		int ret;
  1137	
  1138		if (!pdev)
  1139			return -ENODEV;
  1140	
  1141		gmu->dev = &pdev->dev;
  1142	
  1143		of_dma_configure(gmu->dev, node, false);
  1144	
  1145		/* Fow now, don't do anything fancy until we get our feet under us */
  1146		gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
  1147	
  1148		pm_runtime_enable(gmu->dev);
  1149		gmu->gx = devm_regulator_get(gmu->dev, "vdd");
  1150	
  1151		/* Get the list of clocks */
  1152		ret = a6xx_gmu_clocks_probe(gmu);
  1153		if (ret)
  1154			return ret;
  1155	
  1156		/* Set up the IOMMU context bank */
  1157		ret = a6xx_gmu_memory_probe(gmu);
  1158		if (ret)
  1159			return ret;
  1160	
  1161		/* Allocate memory for for the HFI queues */
  1162		gmu->hfi = a6xx_gmu_memory_alloc(gmu, SZ_16K);
  1163		if (IS_ERR(gmu->hfi))
  1164			goto err;
  1165	
  1166		/* Allocate memory for the GMU debug region */
  1167		gmu->debug = a6xx_gmu_memory_alloc(gmu, SZ_16K);
  1168		if (IS_ERR(gmu->debug))
  1169			goto err;
  1170	
  1171		/* Map the GMU registers */
  1172		gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
  1173	
  1174		/* Map the GPU power domain controller registers */
> 1175		gmu->pdc_mmio = a6xx_gmu_get_mmio(pdev, "gmu_pdc");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
