Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8656279903
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766635774; cv=none; b=Cyue9hJN7uQOafe6USEnHKLJ1mRUoHh5v4N0Y3sGunFLurtvhdzZ9tlp8ZkiZnSpMG48Afo4e9/dcflKZDl4laN696LVjix4KtoePjW+V9J19hsf3I3Bm1bzjNVA7/n+vbJaAkMGMXt1uX3liFzwliIu1gT1wDyTZ3o4+Yzhngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766635774; c=relaxed/simple;
	bh=MsJNb/jV7hM+HlUQxhucjM8Xi5hcGcjBcicb8gpnKWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G8uSiOmunVy5/eYR9IH+V/+LSg3er+dmcpAoRDNQ4m+JcFyQxXt1NEmrns40jpJa21oJsO9bbrVd8ga5uTe3KulOPbulfGv/HzAgJzzjPrpij4wf8T6jS78xLP/iaf95QYsGlu6KK9SKsbu1IiXkYVSMN8aJHslhT2iEn0cgjl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1h4SW35; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1h4SW35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766635772; x=1798171772;
  h=date:from:to:cc:subject:message-id;
  bh=MsJNb/jV7hM+HlUQxhucjM8Xi5hcGcjBcicb8gpnKWo=;
  b=d1h4SW35h1IroVYaLOxMpKzVArPyX0KjDFSKxk2zaNxeZY47teeuXM+6
   hbaDG1Co8V8vi67Q6rSxJJpvaJJRuAwQnAcho5Lsalu7ZC0Sm0qJ2YeRY
   SJWw34CL6ljrSEwC/WKBCZb6yeU1d4f+qCFAvj2qrajfbaq1yUAVhI1fH
   3tl/JmzGFjvAL3+nniaLOA7xLHWN3yY0gGr49UyPiOqoaJR2v+2Wi4NEy
   W8G/RJpJgEiMPFR94sdIoNxidSndeTF4qur+NMIRXLuSbqNUIDrxRXYcN
   6TyW+rVvFDAWjBoVZIVdYRTeftUFOQEhhOXo7S3U1MB6NiYF427t/k5vi
   w==;
X-CSE-ConnectionGUID: Gft1HguhR+yNFCPAps/jfw==
X-CSE-MsgGUID: asGVnaghR0SavJ0U+M2VpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="78758158"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="78758158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 20:09:30 -0800
X-CSE-ConnectionGUID: Ng647ew/Rx+f3e4QMJBmrA==
X-CSE-MsgGUID: L1qEKf1sSg6XZauF5ZSUgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="200634048"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Dec 2025 20:09:28 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYcfG-000000003io-29yN;
	Thu, 25 Dec 2025 04:09:26 +0000
Date: Thu, 25 Dec 2025 12:08:43 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hugetlb_unshare 4/4] Warning:
 mm/mmu_gather.c:480 expecting prototype for tlb_gather_mmu(). Prototype was
 for tlb_gather_mmu_vma() instead
Message-ID: <202512251139.j2kRiSdx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux hugetlb_unshare
head:   3c9bcd381c26bdfabdadb22c0a26629430439996
commit: 3c9bcd381c26bdfabdadb22c0a26629430439996 [4/4] mm/hugetlb: fix excessive IPI broadcasts when unsharing PMD tables using mmu_gather
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251225/202512251139.j2kRiSdx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512251139.j2kRiSdx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512251139.j2kRiSdx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/mmu_gather.c:480 expecting prototype for tlb_gather_mmu(). Prototype was for tlb_gather_mmu_vma() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
