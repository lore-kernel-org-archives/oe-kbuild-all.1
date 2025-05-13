Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2818EAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 05:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114695; cv=none; b=KYH4VbzrwfXPpjFVLe5jSAaj4G48A9qy0TpA1NNXxg55GPnqdtNm/vdQNykAI6GV/RHmEXFdqZSTAjuZpVRC0tfEH6EZ1kLyw+XFgWG03yzbvyirNy+/zpseo4OtiQPN8/Zm2NsxoOl5iegWTBn824m75Yk2M8idZcOn1492WGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114695; c=relaxed/simple;
	bh=yEkamu2r37XHzwppCPVpn9or+Gls4RWK6LaAku37z2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GW5n7pPZjFwqVm4DkDXJVIGvJymK2eDvaymjFlWLuXFK1yc6Xim4aH77zEALJPOen2r4vQrVgjttyAxECSv8wS1GRQm55CfZWfxffgSSX7RnBbEUvGYyi4E5amWx3ibIsekQ9x4sVKGLddor/HtBaApv6iWCCZOTi5J4EBGsus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+wKY1Nj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+wKY1Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747114693; x=1778650693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yEkamu2r37XHzwppCPVpn9or+Gls4RWK6LaAku37z2o=;
  b=W+wKY1Nj4mkJ1LKJoGMulvq/1FYeWZkCURqfbReuxQ3kSMv+qvfhMkkJ
   hg356Hdtq+NBtDGMWK5Y00tvEOk6uto2Q//bV9+7Emf+Cisq3AAuD/ljx
   F8nHTw0NkncJgHcqQ/9fqBHmRn33E+dIInFr8RHNKyc5NYbIHXu0rW/Wc
   gEyvgz4Q/Miqr9iyq4MkjYo+KhvUNGY1t4ADFLp3Jn5aIoMb3ouFuDYEB
   U4qRVDDeIVuWN+4Pc3hVS1Vi+cXPs1IiH0p/KnGqugoAJNsqJv1jXUV0F
   +VtAOPujClW19dKK4R2I49wlpe54WSAcx04tFAHIRzqkfugJzZt6s4QWa
   A==;
X-CSE-ConnectionGUID: MsRLCLuiSyaMjDMq0YQjnw==
X-CSE-MsgGUID: uTwi4Vb/TQ+rl8Oik3m54Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="71450814"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="71450814"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:38:13 -0700
X-CSE-ConnectionGUID: 0Uq3R4r6T5K/wwECb9yN8w==
X-CSE-MsgGUID: Qc4HiiZGQ3uDWbDbIwa4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137625485"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 22:38:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiLB-000FkF-1Z;
	Tue, 13 May 2025 05:38:09 +0000
Date: Tue, 13 May 2025 13:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 2/2] kismet: WARNING: unmet
 direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
Message-ID: <202505131327.VekS4CEc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   fc57f0cc9c0336bdc0b25e1e5c0482d1ee9d0ba8
commit: d31eda960d587e7797f948cb91d5cc9cf951e9b2 [2/2] Merge 4cece7649650 ("Linux 6.9-rc1") into android-mainline
config: arm64-kismet-CONFIG_INTEL_MEI_ME-CONFIG_INTEL_MEI_PXP-0-0 (https://download.01.org/0day-ci/archive/20250513/202505131327.VekS4CEc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131327.VekS4CEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131327.VekS4CEc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_MEI_ME when selected by INTEL_MEI_PXP
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
     Depends on [n]: X86 && PCI [=y]
     Selected by [m]:
     - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
