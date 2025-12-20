Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44BC2FAC14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 17:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766252918; cv=none; b=Tjwi84xUHrieET06pMmZMP07UhQe6vTC5maXuEWRDB3iCSByKm6SOm+OhsK/Gq1fwrS3K6vUFSS11Vlu4cw8/lJUEhMEdr+1QjwJKf+hvVNbbXJmWXS0sbmlU1d6FQZVDUkfjZZJ2rogBIoO4WnSiPl3glgiiVp8IHRaKpS26+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766252918; c=relaxed/simple;
	bh=tlytxZDTb5oB8+tQ59YKCYBLUfee15qOuI6/43d0zmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zs6z6OzDuYCIDxPmsXTnsPlGPoXK8VNuz+CNllTgGbE+gtyLlMxqPhn87HgYZ5UYG8OW9Dg3FYmF3xxd799LXOIrdQKxgGWHQF/jTLoD5B8P3927tb6hndBBgVLjnGfYosxx7lEaXmKFhiFAC/U9/3tNg5jeAi4q5oE5UR+SCSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwUi2x/k; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwUi2x/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766252916; x=1797788916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tlytxZDTb5oB8+tQ59YKCYBLUfee15qOuI6/43d0zmA=;
  b=ZwUi2x/kdmTNmVI2ghQc/TmSUo2WYTUonhC/Sd8EX51mZuIPJsEYkE5u
   t607etEiWQly7rICv/PfjCqSLJsPxdNfadRgqwslSw04Cgz8IHM/bu3cO
   j6+zHWbnCZr2RPW1X580tgD0bhauKAFEUGorNxjx2Fs1N5/skeRr9f7Jm
   hDAGgttX6Dzm9PjUfTZXDF2+QQaj0bQyMnugGiY9CNtv1GGeUsuP9bmAK
   iiEv8mpz5Uw0JySH5/YKJLo7fIeSqt0xibEfhvcQuEPLlJ/Nxx7yCPV3m
   6ATZZ3e4BLwrCZpApPTqKxcShmJbWB+JSRWupdeqSGhg1EioDFUafps/u
   Q==;
X-CSE-ConnectionGUID: A79P7ulbQYyCxbGHJueGPQ==
X-CSE-MsgGUID: zrczmMS0QtWNQH8wxvYdgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="70751776"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="70751776"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 09:48:35 -0800
X-CSE-ConnectionGUID: yIBNtOj5QMC3M4soy3R60Q==
X-CSE-MsgGUID: Im7adVw/TuqIr49cd1IHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198894027"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 09:48:34 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX14B-000000004yI-2rVr;
	Sat, 20 Dec 2025 17:48:31 +0000
Date: Sun, 21 Dec 2025 01:47:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: selftest.c:undefined reference to `pt_iommu_amdv1_init'
Message-ID: <202512210135.freQWpxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: bc5233c0904eb116a4bd94e10cd3666733216063 iommupt: Add a kunit test for the IOMMU implementation
date:   6 weeks ago
config: x86_64-buildonly-randconfig-003-20251220 (https://download.01.org/0day-ci/archive/20251221/202512210135.freQWpxa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210135.freQWpxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210135.freQWpxa-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `mock_domain_alloc_pgtable.isra.0':
>> selftest.c:(.text+0x12e8ad3): undefined reference to `pt_iommu_amdv1_init'
   ld: vmlinux.o: in function `BSWAP_SHUFB_CTL':
>> sha1-avx2-asm.o:(.rodata+0xaa36a8): undefined reference to `pt_iommu_amdv1_read_and_clear_dirty'
>> ld: sha1-avx2-asm.o:(.rodata+0xaa36f0): undefined reference to `pt_iommu_amdv1_map_pages'
>> ld: sha1-avx2-asm.o:(.rodata+0xaa36f8): undefined reference to `pt_iommu_amdv1_unmap_pages'
>> ld: sha1-avx2-asm.o:(.rodata+0xaa3720): undefined reference to `pt_iommu_amdv1_iova_to_phys'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
