Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A91AA1D5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 04:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481685; cv=none; b=gxMXguT/DNcsOGc/eh70MDR26AiMSU/gpr8+FYrVM/dEuxiAQiINgB9LPFshypq5HF78YiLzIbkSWtP9NH55NLD78LZphrnkW++EXUKcdli1reU09goAl6w+2ulI8B3TrOCs+Uh7AFr5HlX6wc4bhCFJLYGncWCfBK8gjsQyBSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481685; c=relaxed/simple;
	bh=hLVjxayq+3CdMaWxnxNi11s/cIIk4gVi+xqPnaGAduI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CV0KMGui51NfhUHTJC5TMaGyJkdvNGZFIWOfGzdwwVy/2kE0WFvfZWTep08G73C1DU3zBW6hd8ffPWDA6+7P3gTIs4pDuxb20nr/G++pg2cWhq8VvdmUwePYnWh28V57oq6NvmDu3ou5IZ20msIfexkEYygjhv0s3OGKrUH2yHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwfb1iLb; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwfb1iLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790481684; x=1822017684;
  h=date:from:to:cc:subject:message-id;
  bh=hLVjxayq+3CdMaWxnxNi11s/cIIk4gVi+xqPnaGAduI=;
  b=jwfb1iLbhar0vzCO9uVLA5WU+WHBuN1/PFPeAQQcnYf0twsnfqqhQFC9
   Iqu4LccL7jVvdVdRa2a/95tG7BhURcVd+rie8OULz8b3S8A5bzTOiOQ0L
   RTQYxoY3BjqAImPwm9pDbs8qZJM5DsdpGXYI1B0G1k2kqxjVib5wOaX5Z
   nsz/sUoGVJKM9K6iLqF1sdcmbdAW6MBuSZF1F3+dD/ssQKnqDFl9SZsHN
   bbShZ83V8gUXoOH3VVGMmYNPtdijydc6NTdizndT+7oXtD6abFagm89TP
   tu0c4Rxul60e/Rnqh1oLmA009vaLNcQEiDcfv+j+qiULgLC3UhLPVLejE
   g==;
X-CSE-ConnectionGUID: 9WwcJIxiRJOwhQacP1SIvQ==
X-CSE-MsgGUID: bUBCRolhRTmhk4cSeQvFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="78777818"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="78777818"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 21:01:23 -0700
X-CSE-ConnectionGUID: MrX2P/n8QJumrcAqqqRfbQ==
X-CSE-MsgGUID: 50drLADVRt+GpuMRS24tpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="273829487"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2026 21:01:21 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAg4k-000000000Qc-354k;
	Sun, 27 Sep 2026 04:01:18 +0000
Date: Sun, 27 Sep 2026 06:01:05 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_GEM_SHMEM_HELPER when selected by
 DRM_CIRRUS_QEMU
Message-ID: <202609270538.mV3NDkLu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_CIRRUS_QEMU-0-0 (https://download.01.org/0day-ci/archive/20260927/202609270538.mV3NDkLu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609270538.mV3NDkLu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609270538.mV3NDkLu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_CIRRUS_QEMU
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_CIRRUS_QEMU [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for UIO
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - CNIC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_BROADCOM [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=y] || !KUNIT [=y]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
