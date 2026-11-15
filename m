Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747158;
	b=2cO8ImxA9ACWDLcONDQMfQD5LB4WJ0HoZ7BYyiT3jvxz8Kh5rZA2WDAzHIDK9bdVjYPL
	 BwLWpgqSANuTryt7BgKeMAsSb79T2U3VDClf51634sPMzr0hPx7AczhCG84tOOJH1Zr7j
	 P/eU7uCGvefgfi0GEZ9RLxsrKZ8X5O/0TQLgPkSBV1GdBqyZltJ+oNgrgYaNKDgtQB1qQ
	 fB7fJyEHfIiVsLaMdSeEySmTbXf2F7AyzmJw4OoPFtGdPUgGE630pqxB48piR4TpEDqwv
	 AIvBNLbLspNu525l+Nj+FaAbjdB8SJQeChwNRwJApMugyrDtx67b5x+eJHvEM/paWBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747158;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Yra+lHYTsldjzpdN6dAknH707z/56qr9G/nOAObReJM=;
	b=pcQRlVRCUxbl6oBH9jjDdPtuqguyNqphombSIidGcKf1KVRPI6tYwei+m4JXdo9JzuSk
	 6KZ+ObYlYxpXkBjenSlSzTvfPCGJeqZzqo5Qs1NUro/50G/Qr3VwfDn4DEfSU5yn9d9Ei
	 mdKN9Fo0aPn02mB7VCHdGpycZunbDHhuaxFNaP+lZ+irZTXCuGcnFDbOFT2yWqG6nj+C1
	 uoHjaoHM54deAjHKdWVp5xqLvuFfkVwc3wV66eNF48azirLDAuLrL9rkF+hAtAqvSNu/0
	 uRrNvkl/LeXKOEETEUHcGYixWzgt+c9jdyybT84R+ssdWogRMYbIJWvA+9+hI0Q4gAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IfxukFBI;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970B606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 12:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7970B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IfxukFBI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794747158; x=1826283158;
  h=date:from:to:cc:subject:message-id;
  bh=xpNLrHZJMACzpPQJdW2eGQJq8JUCv64RRjWU+8klhAM=;
  b=IfxukFBIqidyCwQNqLo9JRwSps6VdeqltgUN3rjZDUZEg2L0Gxvhi0OA
   sIsCvrgSzINgJ9oYeB2E3Loa070rfumfDwrccBbSxYW4jQ4n9OzRXcodw
   qKmUNX/z/+Qakng+i25D25JxinVeWaBXAN7CkG6WACHntud4klHmo9uyg
   fXWK+vw4UrLhk7LBIuVUuIhcOPMw/eFCWiDSwfOkUfEjlSVsRJbfIBSWv
   N+64L7T4hV5PbW3eqLZSgb+XvBikAWxteanej0GToqtosrBA1GHea5FGw
   ozwkTW7ILliP531vTmKJ19MdkNuxbuNVBEsYENJhYQKacwpec4eabP/2g
   A==;
X-CSE-ConnectionGUID: 6GkQD6FbQLC1+iHtaRSY1A==
X-CSE-MsgGUID: QkbXQQJ1RKuwY/I2vWSqEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3357387"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3357387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:52:37 -0800
X-CSE-ConnectionGUID: 0eIQDuUCTWWssySRkBEYAQ==
X-CSE-MsgGUID: bda8i8upQ5mCM8uizVCU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9468070"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Nov 2026 04:52:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZij-000000002BI-35v3;
	Sun, 15 Nov 2026 12:52:33 +0000
Date: Sun, 15 Nov 2026 13:52:32 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] kismet: WARNING: unmet
 direct dependencies detected for PHY_DW_DPHY when selected by
 VERISILICON_DW_MIPI_DSI
Message-ID: <202611151341.NN5S6LbK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   dc68b182b9f87e42548fb6ce886be612535b2116
commit: 500e70f6113ba8e3d77cbe6c36fb5a5d546e0557 [3/3] anolis: riscv: gpu/drm: add T-HEAD Light support
config: x86_64-kismet-CONFIG_PHY_DW_DPHY-CONFIG_VERISILICON_DW_MIPI_DSI-0-0 (https://download.01.org/0day-ci/archive/20261115/202611151341.NN5S6LbK-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20261115/202611151341.NN5S6LbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151341.NN5S6LbK-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PHY_DW_DPHY when selected by VERISILICON_DW_MIPI_DSI
   WARNING: unmet direct dependencies detected for RESCTRL_FS_PSEUDO_LOCK
     Depends on [n]: MISC_FILESYSTEMS [=n]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])
   
   WARNING: unmet direct dependencies detected for PHY_DW_DPHY
     Depends on [n]: HAS_IOMEM [=y] && OF [=n]
     Selected by [y]:
     - VERISILICON_DW_MIPI_DSI [=y] && HAS_IOMEM [=y] && DRM_VERISILICON [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - X86_CPU_RESCTRL [=y] && X86 [=y] && (CPU_SUP_INTEL [=y] || CPU_SUP_AMD [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
