Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96F1DEFDD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946789; cv=none; b=ebuuguGi77cL0TzE4y3gtu/TA/wY1j97tWivakCKpasyLTf36xo7v/JthCqyCFEVZVj7QwRs6KZ2BhJe1lWCzxqtv8/Tsj7PeZ+TNhGBF+l2H0Hs2uI2RmmWcZNlUlaDTZVbzJ88nCo/3sQy1/5L0tvpVe4Ea9bmVOirbz2Vxa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946789; c=relaxed/simple;
	bh=2ypJL/UJekkZDY6KkaD5R5L4F9u5TZNwDBi1CQfcerQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YUK8s/Nx2XTW5edHaC66Afl05W5/a09dt2SpD4fvMo2fT+b1Ih04y8hXmx6Vf2QoB7XLAy3DQ6C2NVgtZXt9l20n5DrFgVH2sg+Y07cXXAuAq//9diSxGaukRXqZEaRLhza8Jf5fYNZFU3u+Rq+rEjArd0IDZpHirPYSAM4wafQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry4r3aFV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry4r3aFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747946788; x=1779482788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ypJL/UJekkZDY6KkaD5R5L4F9u5TZNwDBi1CQfcerQ=;
  b=Ry4r3aFVmtLv3XyXuBwJkzOr761PgkfCZfxUdmnHKlCVv7UrokBzJRux
   VIVOodzyx6GNytGYTd6zLn75cLXXA4ui9nv0rr7ffTluJZLisc2srmLoW
   ZIDyCjGd8Q0/s27pCjHOsFANF8pP+n7JGeL8tfNjMdF0zjiwj85CpXMiW
   iFEdviX168I4wqCL+aYYLCyO3mf/jfmTXv/xttbHusQEqWI7c4DHStgcr
   M4cJ/NmNiTBK2IDPjDLDGfF2qQAcZ82y2SduXZf3prBAffdwchQZbL/ot
   RomyRzBZDzbACT/zuQBeYJ2WbHb8TYj/jdoVK8iToRqviWo1o8E0yiqYC
   Q==;
X-CSE-ConnectionGUID: xjnqxavhQzWDmzC5VDQqZQ==
X-CSE-MsgGUID: ng/qDfBMR3yl4ahoodB9DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67554416"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="67554416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:46:27 -0700
X-CSE-ConnectionGUID: kYyPpPRmQlKFpEoJcNUZwQ==
X-CSE-MsgGUID: Ork1XhjIQOaj/9BNJycbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140646631"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 13:46:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uICo4-000Ph9-0P;
	Thu, 22 May 2025 20:46:24 +0000
Date: Fri, 23 May 2025 04:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 12614/12895] sound/pci/hda/hda_acpi.c:299:17:
 sparse: sparse: symbol 'nvidia_hda_data' was not declared. Should it be
 static?
Message-ID: <202505230426.k8ruTgnr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   460178e842c7a1e48a06df684c66eb5fd630bcf7
commit: 4b214c9bbe26b2d86fd20a5548ac3733fcf36f21 [12614/12895] ALSA: hda - Add new driver for HDA controllers listed via ACPI
config: x86_64-randconfig-123-20250523 (https://download.01.org/0day-ci/archive/20250523/202505230426.k8ruTgnr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505230426.k8ruTgnr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505230426.k8ruTgnr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/hda_acpi.c:299:17: sparse: sparse: symbol 'nvidia_hda_data' was not declared. Should it be static?

vim +/nvidia_hda_data +299 sound/pci/hda/hda_acpi.c

   298	
 > 299	struct hda_data nvidia_hda_data = {
   300		.short_name = "NVIDIA",
   301		.long_name = "NVIDIA HDA Controller",
   302		.flags = AZX_DCAPS_CORBRP_SELF_CLEAR,
   303	};
   304	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
