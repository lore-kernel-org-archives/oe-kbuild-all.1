Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8272BE625
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Oct 2025 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177226; cv=none; b=l68DthUvCofl4iOLyc48PBhE4sEV8L5ocqazmIEdHGxUDf+vbzYeIWBw2Msct8iJWFTv+a26RID5PP+Ff8rm+V+1RuduOoH4sfO9QNdsUzqJqNANbR4tZzwTlas0RcZd0gaWM7rJiSAED1wLaxy2Zbsgop5eOjLcNx+J2JHHMtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177226; c=relaxed/simple;
	bh=ViMqYd6dENw/v8COUUvI6c3QEIUmfXMLuXl188YWhgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPoe7oZLabNZIKlPp6i3cKSA73IT6cMJFwNa5VxOCY59uB4bGBxJ757iNnsYdYs/HZHIWF6tu1ErTbZ2cqdOLCK04nxwdzwXwo3COw20PBxr4Ga4f2xQwxlXDkRxsnHqZgFl2MdoHui9TQergmGnGG8/eRHw7icGIC1SRQr1+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYJrv+6M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYJrv+6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761177225; x=1792713225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ViMqYd6dENw/v8COUUvI6c3QEIUmfXMLuXl188YWhgc=;
  b=KYJrv+6MWOm4IhlAg7PmzmCIC3DyCvPy4uxmzT4BO36pDhU6GmlltMFR
   wqcgNCWCQbinoTz75KnuGOvVh+i9Q1iZ02Vayprz9tam/T+QaMQt6v2jQ
   U9xjQKfRos1KvQKsbBN4xrOlgFGMIA9o8ulL7YGtjhT7Y74q60XZC4OPh
   CZtNG033serc//ceirb+x7hrMo5EN/8JgSc8fzJtlP1O01Os9vgf07+vt
   56APdmJJl/OB/4/vSbWzkhlQp2Gql1oFRJTiGj19hxwDDIlSS40XvmcEP
   JfAnrAhI5kaOWeH3f8Xte2c541qVGhGY9s6udQNTYBA/EKDvHP3zEFiZm
   w==;
X-CSE-ConnectionGUID: 9nDcRLzLQiuBseNDjTVZtQ==
X-CSE-MsgGUID: XdEsBPRGQoSK5oQCNyBiWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74685139"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="74685139"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 16:53:44 -0700
X-CSE-ConnectionGUID: EXfrpqmQRHSqkMF6IXNyFw==
X-CSE-MsgGUID: R88SEilQR1e9yzUZ5ng5kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; 
   d="scan'208";a="183903309"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 16:53:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBieC-000Cq5-1v;
	Wed, 22 Oct 2025 23:53:40 +0000
Date: Thu, 23 Oct 2025 07:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 1181/3483] ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
Message-ID: <202510230749.0FuAVuUT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aaa9c3550b60d6259d6ea8b1175ade8d1242444e
commit: ace232eff50e8c898103c56b3b5303e776616274 [1181/3483] drm/amdgpu: Add ras module files into amdgpu
config: arm-randconfig-003-20251023 (https://download.01.org/0day-ci/archive/20251023/202510230749.0FuAVuUT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510230749.0FuAVuUT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510230749.0FuAVuUT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/probes/kprobes/test-kprobes.o
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
