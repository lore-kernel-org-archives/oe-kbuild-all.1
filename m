Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33AA1624E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Feb 2025 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739714900; cv=none; b=kngB98o66UfUdYUTyRgHJQAKAtupIPk46DkWkoCqvCOBv0OocowZUVYY0qWEl1kIojDlkz/vWlVta+aHmBktNtvooRbNB2DHpB+zQh5LkMbrzg+GUBscmhHXl31LcQwlDQoJVeKZT33i94hCsppZpkYtGnK44IFFMZWxgojTqLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739714900; c=relaxed/simple;
	bh=WhFI8f00ob4U2j/TwdFI/5/XQBGAHOJl+xNJuLtmSFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHw5ZS5hwMdvcZDlXvZJT7yrxvxP4hPNWrJQDjRklQ4fV9u4/80wqdxmUjSHnhEvMpOhkISpoobVqHyLUpTVqJAywR+9lZpvKc44tLcqxbSU0lcWKJmHfU9usEBWmA0NEliagIMUccnUS8WliKtruAt5ly76dVNghMVCGcR53hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz5g0IFy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz5g0IFy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739714897; x=1771250897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WhFI8f00ob4U2j/TwdFI/5/XQBGAHOJl+xNJuLtmSFQ=;
  b=Bz5g0IFyUIyeFH3UZ6Wsr2E2Z+64fVnpXpbn/1nGWGH4Fz+S9J6rZzfq
   AtmnHrsL/zxzx+gq+oYjS7yxAxwQCTZnYckPch0+xJetZeFOqPV2D7//g
   qR8aR3OqJsGhY6Zh/IOGT4uZnFOAV5tqM9YtEbGjzRrRrdnNDqXocxDh3
   cXptpW2HQl4iFkgvTfcR3W7Hg6XZGItz1Nhbra0205uWR2EhDeNB4Mcsd
   4ui5jHExf2LzSv3RLcmsMXRfKsp9dKiH+eiWnsVnWZDketYKFd8MPThk0
   3dg894A4CdUefvUeNPrMUhHGnPLbL5eO5Zg1Bqne3Vy7rjcgZ6AXswURW
   A==;
X-CSE-ConnectionGUID: KmkRn/2yQqC6Bc629NQi3w==
X-CSE-MsgGUID: CwWigY2cQEqSOeznh/GGfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51833083"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51833083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 06:08:15 -0800
X-CSE-ConnectionGUID: dmoPGr+qQwmbERvVnpPniA==
X-CSE-MsgGUID: WQb/Sy2HTLGBU6yfxNyXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="113766254"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2025 06:08:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjfJc-001ByZ-0O;
	Sun, 16 Feb 2025 14:08:12 +0000
Date: Sun, 16 Feb 2025 22:08:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 48/77]
 include/linux/acpi_rimt.h:9:80: warning: declaration of 'struct iommu_ops'
 will not be visible outside of this function
Message-ID: <202502162138.1gOcZu7h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   a810219b42d39c2a9055150c3d3fc0677bc73e28
commit: fec6ffbe9378bcc0ef97766d2943cc26ed0173fc [48/77] IOMMU: RISC-V: ACPI: Register IOMMU
config: riscv-randconfig-r111-20250216 (https://download.01.org/0day-ci/archive/20250216/202502162138.1gOcZu7h-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250216/202502162138.1gOcZu7h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502162138.1gOcZu7h-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/riscv/iommu.c:16:
>> include/linux/acpi_rimt.h:9:80: warning: declaration of 'struct iommu_ops' will not be visible outside of this function [-Wvisibility]
   int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops);
                                                                                  ^
   1 warning generated.


vim +9 include/linux/acpi_rimt.h

c881ca2cde51db Sunil V L 2024-08-16 @9  int rimt_iommu_configure_id(struct device *dev, const u32 *id_in, const struct iommu_ops *ops);

:::::: The code at line 9 was first introduced by commit
:::::: c881ca2cde51db063c4f3ccec6c8ed1ba3acd4ba RISC-V: IOMMU: Add ACPI support using RIMT

:::::: TO: Sunil V L <sunilvl@ventanamicro.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
