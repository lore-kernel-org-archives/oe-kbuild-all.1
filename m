Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D22433A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 21:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726264471; cv=none; b=Ivm+MdZ6+VtYF6Dv/JNMGTX13GZZIcruMFjA9BmUL8L1D7KOhLjBKbf3M98+5cnkMGJ4YqeZLBElvl9ShtJFW8kj6cOqnf2bQRpm/kSYXbNibJSYM6GRQo6Yrm2uSu37dWDuUvqk5PUdOW4ta1jJ3i20yyUVplCuwQc2D1Z0miY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726264471; c=relaxed/simple;
	bh=jG3ucSuHTvFCwqkKufkPC8BvReAqrZfUN0Smx7EgfSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYH2OnCGnl/gCWoJCkTA0HKIVO9dCN3dbeMah38yK8mTOxBSHf1Tls7kFEpCQ+lNQLLU+bXof/s6QmrXlsOdgmmHLFZUJB18Z3sO7pMBQTZ4lICl3nyI19eVxfmzGCoapuAHNXj7mmDrnJj4yEA7+EXJ0BvFvCvdursJ2hzlYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFnaqVAy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFnaqVAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726264470; x=1757800470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jG3ucSuHTvFCwqkKufkPC8BvReAqrZfUN0Smx7EgfSQ=;
  b=ZFnaqVAyJ4nidS39vy4H9tRl6jCubzt+gK6ooBxzewQBkTqGzTFus8tq
   0IpCSghlls+jJIIEngC86Z2rYsTtWXf0Mn8gwJwrzDExtxx06qfTh8sxG
   Jn+8b9JXB41kBPhZOedT4dnYWuFMtW1IOvQq7/8C2t7fznl7So0vzfUjt
   lJhEgHfcqAsyzzuRMMMGuwaSGBtI4BL0ZU+kIOV0KVsGNUhEQbsXdPOEf
   5gHwGCwfAR3CI+X63WASMbQZ3qjcbwUG9Y8jVpMYBHzGwWl+01dzbalDb
   HKNf2cGYtPFzl0STugPGrk1InlYh4v4nIIj0D9cSkR+l2L/0mum89QCNH
   A==;
X-CSE-ConnectionGUID: 4nxykbg2T8Gz8xHze6+k2Q==
X-CSE-MsgGUID: YHm2iJlTSkChjGxaOmihJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="28964269"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="28964269"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 14:54:30 -0700
X-CSE-ConnectionGUID: KgJ6MwLIT5q7CP1OCKuBhA==
X-CSE-MsgGUID: mLlpzvzXRpO4L8WJ87MOVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="105657722"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Sep 2024 14:54:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spEFF-00074c-20;
	Fri, 13 Sep 2024 21:54:25 +0000
Date: Sat, 14 Sep 2024 05:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Meng Wei <wei.meng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Chang Ying <ying.chang@intel.com>
Subject: [intel-lts:4.19/android_s 688/30000] kismet: WARNING: unmet direct
 dependencies detected for IOMMU_IOVA when selected by VIDEO_INTEL_IPU
Message-ID: <202409140522.3JkTxOII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: 123826108e51794c3922a0f8eba95e0375ffa36b [688/30000] media: pci: add IPU driver for BXT platform
config: i386-kismet-CONFIG_IOMMU_IOVA-CONFIG_VIDEO_INTEL_IPU-0-0 (https://download.01.org/0day-ci/archive/20240914/202409140522.3JkTxOII-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409140522.3JkTxOII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140522.3JkTxOII-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for IOMMU_IOVA when selected by VIDEO_INTEL_IPU
   WARNING: unmet direct dependencies detected for X86_DEV_DMA_OPS
     Depends on [n]: X86_64 [=n] || STA2X11 [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_IOVA
     Depends on [n]: IOMMU_SUPPORT [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for X86_DEV_DMA_OPS
     Depends on [n]: X86_64 [=n] || STA2X11 [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for IOMMU_IOVA
     Depends on [n]: IOMMU_SUPPORT [=n]
     Selected by [y]:
     - VIDEO_INTEL_IPU [=y] && PCI [=y] && MEDIA_SUPPORT [=y] && MEDIA_PCI_SUPPORT [=y] && MEDIA_CAMERA_SUPPORT [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
