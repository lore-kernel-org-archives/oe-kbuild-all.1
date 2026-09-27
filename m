Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8003C0A0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790541603; cv=none; b=cMo84AhlHImpz+T4JR4P76bJy4XQ8Krw/Z9wb6pjIWb/kJ/kghyNMNB70Z55svVWb3YTvTJZ3Nx0BEJPTVgmLbfJg/f4X7WGnD/Baez8pfUqUhFx3LQUG59T1K9qHfBX6DicgCUeWR05BMpFGsy/6Z+5V/XAYmv+t5jzsrqo7A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790541603; c=relaxed/simple;
	bh=la518Qvr78gT2znYib6GW/ke2RGjQNnjEghVI32HFFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PFboOoOjg58ZFAH3WSLqNER7PJH89e3FCHLR1JvcHrN+rpYxgLJhsxHu5nLVfRS8cBRcBJl03zJwCwDVv3m7Jri1NAxvMKlEqio2wue/cgnkUe0Iq3QAGclOWPOMVm2t+V89iUkoTS7kPqk7fMFXhZbQBXZaTQOU9bDqwfnJxIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmsWAOSc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmsWAOSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790541600; x=1822077600;
  h=date:from:to:cc:subject:message-id;
  bh=la518Qvr78gT2znYib6GW/ke2RGjQNnjEghVI32HFFc=;
  b=TmsWAOScluI7mSbmc+MFO8YxspNrN1kEDjSYW2WWWz42D5Y5SYaAtI0e
   bMdS5g8cJjfBSyyDAtR/Ehh7N/5w8BCkB42ez/Sq3EQucIbhkwNf2G4ZI
   fiYf5PE4sqxdvG/01UjtEgaZT19sS8cXCQV2w/s2DMUoU6v9etRrsgRos
   FV1zAqTpwKq3duRMs6s8Dj1D7IKUm8DZ8f0TW4/vsD7kUabsE1tUsQMTB
   JJr1tyM9/wpJS0K8UCuJwovKxHE8wZ7NmrN3+YU9CrmO+r5/Itkz+qufv
   2W0ysX4Kk73SgqdWk/9p//beR2stSOLlW7tsvee8PaffwKdDkLfqDI/cg
   g==;
X-CSE-ConnectionGUID: xLm1hiG/QXe2qtjpN1L6Hg==
X-CSE-MsgGUID: TeREuvC2Qx2Ywidx0TcHNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="93959589"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="93959589"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 13:40:00 -0700
X-CSE-ConnectionGUID: xopbeywNQdWWe+RCoA3rCw==
X-CSE-MsgGUID: IaUWIrQkQ/qdx3agA+HsIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="271351312"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Sep 2026 13:39:58 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAvfA-000000000gV-0acH;
	Sun, 27 Sep 2026 20:39:56 +0000
Date: Sun, 27 Sep 2026 22:39:00 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for SHMEM when selected by DRM_XE
Message-ID: <202609272234.F8tROOdL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_SHMEM-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20260927/202609272234.F8tROOdL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609272234.F8tROOdL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609272234.F8tROOdL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SHMEM when selected by DRM_XE
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=y] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=y] || BROKEN [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
