Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588F134DCCD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292040; cv=none; b=UteupcyYMUDnfrpDRKP1UVNxHGx5RnQxIrhXgonV8lAhPBQjP5yInt3nac5TVEdYLfzawpgHd8rnTUgBHkyL0Zta39zBgat35szHPFDLKyskasHuwd0CHlg/EJ3oqv1DUp4uv0ODI98r307BaAHwArURNzBPJq1mzFIvCUE+O4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292040; c=relaxed/simple;
	bh=A9MniqxHcJAYW3pj3rMRCrSEk8ORybiCcEb3m/1yVUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLdpLKraWy4qDaelmyHakWNS8G14BQGz/vyr0SE0w/6XUvribcjotDmVzaMOfJyR5KV6FG0bTPzctZ0Kvg6PndSHBf6B6aCr8IkNk5JQAqTS+IIj78Qx8dLuuz982E0z8H3ortDZaxVBPZ8XxmIWeJkP/g98xX9M8p38waYITDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kiblxn29; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kiblxn29"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756292039; x=1787828039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A9MniqxHcJAYW3pj3rMRCrSEk8ORybiCcEb3m/1yVUQ=;
  b=Kiblxn29CP1AagR26jxkQje6ABOgm3EXhABFPX/X2uUdPcstwjmHdco9
   XEXdpu9SAF0z/lpx3G0ydpKqhu+mhjMH2KCYMH/iFxfDpLOBuvFe+9EOx
   T5Wmhu+mO5AmuqPf4zqUn1ehIfPYn609YJcZgPnIE1Auei46viCAmoyUJ
   HT5IJBOuY4qMSzk3JOBBe7D8hMme3zt7KArJ8Cnt4oeUSQyXwBo+Je8X4
   TRupOkHRSDLX1WskfvcjIciqoghKpBcrVMBuGrUx56SJoRSh7zA+v+b3c
   /CTuVFL5xMPOIN6Yab6WsqMmkpwT/f/cbdp0Q3waRavdZIgKvYltgaIYf
   A==;
X-CSE-ConnectionGUID: MEbR8/O9RwGbcIH9w3t1lA==
X-CSE-MsgGUID: BO4LlRnkRiOwiEl1QULNHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69254393"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69254393"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 03:53:59 -0700
X-CSE-ConnectionGUID: Ek07OUI6RwC80AkWbveJ4A==
X-CSE-MsgGUID: 47x5l2LFRMWvIz8Dw01ueA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169414333"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Aug 2025 03:53:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urDmX-000Ssh-1S;
	Wed, 27 Aug 2025 10:53:37 +0000
Date: Wed, 27 Aug 2025 18:53:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 8/34] ERROR: modpost: "__udivdi3"
 [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!
Message-ID: <202508271856.ixwxgh3g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   fbb816ad5a7780a27bde18e3090b30552b6068f9
commit: 9722034883c205c7cfc7e395cb9a44221f010fc3 [8/34] iommupt: Add map_pages op
config: i386-randconfig-r111-20250827 (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271856.ixwxgh3g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271856.ixwxgh3g-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/iommu/generic_pt/fmt/iommu_amdv1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
