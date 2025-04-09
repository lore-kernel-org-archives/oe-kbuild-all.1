Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ECA2116F1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744234804; cv=none; b=Xb+vyjZFkcYC/7n9PFF6v0R/+7/AeLEoGh1BIIZK7CQOx2y1qeDAetAdjQsh9eFjqIOW9caLr4+9E6++m4iJQSyLzRy0N+9EXOup4/67JCs8Ew944YRsqjxd9OffQ2aEMLf1QiFIpApIkTMRgF06D/jsnaMi3+V0L3c6KoNNsnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744234804; c=relaxed/simple;
	bh=4SoU2+NBuQb6bKJporD5w4wAc9Foq5YRpI0ID2q7INc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mWXt49OYMjQzUR8JJEcHKTc+WPuCAhKCtpsuiaI1XFJwwfzV+WPUDM7xW3IYskjcSgLU8hiiGaKkvgB7IveOq1MK4O33+3jvyn2w7RKL4Ehg8merzB8fBn1yLUooWSL5fHGFZtFcu0eZAyVA9dwGKcaXB8dk4+kwgTS3WGGbSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itrt7enM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itrt7enM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744234801; x=1775770801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SoU2+NBuQb6bKJporD5w4wAc9Foq5YRpI0ID2q7INc=;
  b=itrt7enM94xcDkm1p344+KQftRA5kLDq1Sgy+sqmnYsNs0wUKj1LsJag
   lOnLd/Rfaet3U6oWCh1bUV+tckHIBMSPZXRPzkYV696yw5ntyMwCU/xxi
   gnHKdkami++tGBm3H6WuiAFP21OvE9gbQCysyTVt5CS725QMcYvZLfyYq
   JYs0cvX+WeuknuJjmTKPwDrYYoLo54Pa06NBk5o8Q8udHpUzOaEnMx20O
   ztfs4yaQut08BTu5PveTtTqGmXhurlVmQBu2iEcBcvfEXZy5Ihavodld7
   G4qXbSLZ47gHNoA75lO54W1g9dbK5+5RKiizw2qobsEBLE3zRQfRnpRfJ
   Q==;
X-CSE-ConnectionGUID: fTRoYJZvQYCCRCc5HGbPDQ==
X-CSE-MsgGUID: JUExxbPKQmSy3KJjSIVrWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45855812"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45855812"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 14:40:01 -0700
X-CSE-ConnectionGUID: 8Hn+Anl9S/yaNSiaDFALeg==
X-CSE-MsgGUID: oy2YX5kiT2GDmF5p+JkIbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="129234887"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2025 14:40:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2d9K-0009Ln-0X;
	Wed, 09 Apr 2025 21:39:58 +0000
Date: Thu, 10 Apr 2025 05:39:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] arch/arm64/kvm/mmu.c:2012:5:
 sparse: sparse: symbol 'pkvm_mem_abort_prefault' was not declared. Should it
 be static?
Message-ID: <202504100541.VRmd6tIQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   234a951b246d8500f6b621fe23c238bdc2afcef5
commit: 3fc1e219027721249a621d54449e0f3db624b655 [1/1] ANDROID: KVM: arm64: Introduce kvm-arm.protected_prefault parameter
config: arm64-randconfig-r131-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100541.VRmd6tIQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce: (https://download.01.org/0day-ci/archive/20250410/202504100541.VRmd6tIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100541.VRmd6tIQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/mmu.c:313:1: sparse: sparse: symbol 'kvm_pinned_pages_insert' was not declared. Should it be static?
>> arch/arm64/kvm/mmu.c:2012:5: sparse: sparse: symbol 'pkvm_mem_abort_prefault' was not declared. Should it be static?

vim +/pkvm_mem_abort_prefault +2012 arch/arm64/kvm/mmu.c

  2011	
> 2012	int pkvm_mem_abort_prefault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  2013				    struct kvm_memory_slot *memslot)
  2014	{
  2015		phys_addr_t memslot_start = memslot->base_gfn << PAGE_SHIFT;
  2016		size_t size = (1 << pkvm_prefault) << PAGE_SHIFT;
  2017	
  2018		fault_ipa = ALIGN_DOWN(fault_ipa, size);
  2019		if (fault_ipa < memslot_start) {
  2020			size -= memslot_start - fault_ipa;
  2021			fault_ipa = memslot_start;
  2022		}
  2023	
  2024		return pkvm_mem_abort(vcpu, fault_ipa, size, memslot);
  2025	}
  2026	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
