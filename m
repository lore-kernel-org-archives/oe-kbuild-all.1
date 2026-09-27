Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D141A574
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531083; cv=none; b=aYn8e8agevwEkbmed4wrq8rwNna7d6VT9P3I+xP8z3fDMYfkuoGKlxA7LeIalK3YVM2xqLzlsim+lPj4XEe5yCltceMPBWroBnHZgACxZ/6xmrCbop6+iE/4/aGXSGYneYFtmTj623N1mj11Rwz+i/PMRPp2WXiN1Gx8qkf8ius=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531083; c=relaxed/simple;
	bh=8y8KwKYrSDcpOjZ03PcOXgJD2WDvsy1QfDnHi/4XQ/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=St12SowYO5l+FmYu06DKA1OrP5a68TtOn7LTglY7QK8kCqFjKtdhzrEFkS3EQBF1ILe+H4Nwlb0ZOACY6oHilhg3WYdxfsc8xDbnlKoVDK92pRNWY4vQVG50lJRaa4RCVbcR3Tz4JZSZX9NqIyf+Mp2B/o3J/IGF1oAy3Mvz2EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgEbrIIE; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgEbrIIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790531081; x=1822067081;
  h=date:from:to:cc:subject:message-id;
  bh=8y8KwKYrSDcpOjZ03PcOXgJD2WDvsy1QfDnHi/4XQ/0=;
  b=bgEbrIIEbPz1oAAodFkNP0WYt9VzKlH6+GdfO9iBieADk99T452aG4Ch
   /7RfGMBe37Ud3WkJHeBeKsPURQcbdCFOxtMkhkoN8gc88pW9tPfGiZHUc
   2UA4eBl43HQ8tQOIJ2EBF4zRPLdhoOAdIXAxhnpuZxOZ5HWV1XNcxq2Ra
   AMsexWwO1ksaiSjQ1BNpOGWk0mMqpT/ErA3DSbxD6dTgjshEBvrkSBXb1
   wUDhBrXI/ekC4GpwYpbarxnN7xNSA+G6biMJNCnlUOKubqtFQFm+3JYd3
   t0PIUcZ/8NEup0JBiHboz+AUctuHt2gPO5VHBsyctGr09htEf+X6Fzsqe
   w==;
X-CSE-ConnectionGUID: Gc44qr98QWORoFxNEeCBmg==
X-CSE-MsgGUID: Bq1RhU9hQ/iROd85DL/c+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="95056756"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="95056756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 10:44:40 -0700
X-CSE-ConnectionGUID: /GC5JyFTTfCXVGoVWulYIQ==
X-CSE-MsgGUID: vJt2khHmRda1RrYYhAUG6g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2026 10:44:39 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAsvU-000000000e7-2HVa;
	Sun, 27 Sep 2026 17:44:36 +0000
Date: Sun, 27 Sep 2026 19:43:41 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for HMM_MIRROR when selected by HSA_AMD
Message-ID: <202609271940.FhRl0cBi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_HMM_MIRROR-CONFIG_HSA_AMD-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271940.FhRl0cBi-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271940.FhRl0cBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271940.FhRl0cBi-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HMM_MIRROR when selected by HSA_AMD
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_AMDGPU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
     - DRM_NOUVEAU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
     - DRM_RADEON [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (AGP [=n] || !AGP [=n])
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=n] || !KUNIT [=n]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=n] || !KUNIT [=n]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for HMM_MIRROR
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_AMDGPU_USERPTR [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_AMDGPU [=y]
     - HSA_AMD [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_AMDGPU [=y] && (X86_64 [=y] || ARM64 || PPC64 || RISCV && 64BIT [=y] || LOONGARCH && 64BIT [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
