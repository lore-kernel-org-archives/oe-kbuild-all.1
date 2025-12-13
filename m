Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AA930BF59
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765668931; cv=none; b=Cjl17cBV7usd72nmkW86MTQEpmIZzC2OLLiYJ98ZBQUnugD0cF95JpZXwxVv0zxxgnUYMqlasDnChEi+B5V5kLgTfY9PsETkcNrKL9eOzh50q7UJqIAnN5us0GIAT0Sh3ry6wnPbw4k3x4z8y23cR0xtPi9tHt7rdt6BUKxpj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765668931; c=relaxed/simple;
	bh=m0gvKPi7exSmd830rtBtPhFEbw05IkTw2utEq2oeeUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SP9dusa9jWPUxXvr98McVKOuMV9iHfdgODabGxaiZpDmtPhTn1sa00z1SJ1GFWDzOolaKCaqVobV5Sl43glBtBigKDyVjsYEkzYmmvffHvmT9zAX/Ohq5gD9EcUJwmvaan/XO61W57ZVDphf1HpPfV37X9fteXXwC3zTpUaNG2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GO0SvD6v; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GO0SvD6v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765668930; x=1797204930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0gvKPi7exSmd830rtBtPhFEbw05IkTw2utEq2oeeUs=;
  b=GO0SvD6vD17GAKZU7qw90wQ09uaWH24OyNC+vhYKbdaKjxROWg6T9v8v
   7NRs0I6P/6GRAMDkwnsbIJAjluL29dKTqj/uT4ELhIS/obc0ck6xCavsT
   c052ZurnPLy9V64mDcPmf//sBIyrCKxN6M3K0e7Oj3UyNfCXHGWO8EcCr
   0lY+4NYkXdfKFAGDWi0gKptyHld5VOk0sPSw+V5ssPrGt0Vh6B+WBrHU8
   59I3HkA5j0xK606LxENDGGeVwJJIfpKUi8G3DXND3X5vRybt7jEfwnwee
   S0HSW7dMEhMUIeWpt1Hec2V6V8mLW7HtzWAfuQmZyEz32iMjUdCq0n390
   Q==;
X-CSE-ConnectionGUID: hjx7YXMrQJ6CRQ+O4tOxgQ==
X-CSE-MsgGUID: BrlXB6cYRdSt+IJQFHxkvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67782363"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67782363"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 15:35:30 -0800
X-CSE-ConnectionGUID: tPha8hsqT+WCNWpNxzb9tA==
X-CSE-MsgGUID: IXYZwh5PSPGy9RsvLChpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="198226916"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 15:35:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZ93-000000008Jq-3Hsl;
	Sat, 13 Dec 2025 23:35:25 +0000
Date: Sun, 14 Dec 2025 07:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.c:32:9: sparse:
 sparse: cast truncates bits from constant value (100000000 becomes 0)
Message-ID: <202512140713.HUSp33rF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: b8c9c3b822fe8e033b9802516f6466099d915488 um: stop using PCI port I/O
date:   7 months ago
config: um-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140713.HUSp33rF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140713.HUSp33rF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140713.HUSp33rF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.c:32:9: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.c:57:9: sparse: sparse: cast truncates bits from constant value (800000000 becomes 0)

vim +32 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm200.c

5f300fed645597 Ben Skeggs 2017-11-01  26  
e12cf6ad43888c Ben Skeggs 2017-11-01  27  static void
e12cf6ad43888c Ben Skeggs 2017-11-01  28  gm200_vmm_pgt_sparse(struct nvkm_vmm *vmm,
e12cf6ad43888c Ben Skeggs 2017-11-01  29  		     struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
e12cf6ad43888c Ben Skeggs 2017-11-01  30  {
e12cf6ad43888c Ben Skeggs 2017-11-01  31  	/* VALID_FALSE + VOL tells the MMU to treat the PTE as sparse. */
e12cf6ad43888c Ben Skeggs 2017-11-01 @32  	VMM_FO064(pt, vmm, ptei * 8, BIT_ULL(32) /* VOL. */, ptes);
e12cf6ad43888c Ben Skeggs 2017-11-01  33  }
e12cf6ad43888c Ben Skeggs 2017-11-01  34  

:::::: The code at line 32 was first introduced by commit
:::::: e12cf6ad43888c152c3b2edb59525587cd98a227 drm/nouveau/mmu/gm200,gm20b: implement new vmm backend

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
