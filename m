Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCE3FDBFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804096; cv=none; b=Rszv6AnqV6cEPLFTSJbyTA7hJ8kai4Gz92NtrhArWQF9Y892ML4aXuyImuKtd3qNlqVXWtuuu2mT3IZPWuaA1cKTk8jDuVhgR2k4CZUs2FqHyoSOYo2ds3jV+jnnRlLM+UIud3u7Z2jqcSOMuLc9PiCYp95SFNzEBZ9lImqKzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804096; c=relaxed/simple;
	bh=CvDJxARSPKSh1G1VYY/9ZxKPfP1mRfXu3y6lKw/7zl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=muBjNnzFqobnVWDpRVBcA3vNfcxze9Uc2OI8FYN2twPIusUP0CP0xymVhS8TC1SzZZLgLVPKIOB06Tw1jJJJVtbf5cpqE6d0NnowGoUcJtStorbU7wna0UqZI6yBQ2vdrwgih4PfQaJ0JiC3iqvsq5o2n5GpNH5MkM/hwNy1e44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+QEUlBF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+QEUlBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779804095; x=1811340095;
  h=date:from:to:cc:subject:message-id;
  bh=CvDJxARSPKSh1G1VYY/9ZxKPfP1mRfXu3y6lKw/7zl0=;
  b=J+QEUlBF6bLZWGtKCAKV6wOD6kGPXZ0sHPiK42oEA3WeuD/v6VRK2CTS
   Vl8QBCsrgp3/DtSvj2BgZqtujU+L8oHKp2HKcM1C4D476ZZMYPiG0HGL5
   gmB5MHzbWZjvgR00KSkgl5hjzdUbHXj19eeT8i+B2J/+x77hqAYQqzIvx
   8XxwyScl+fcDOHPwltfF+0Ms6aNbcsDKsU5YdAi3s+4OHrTzfT3tucsrK
   v3EKMPQz98mJws5sThVdd6u/6fltZAwj0krmLxW4Mit52KotHb25bIlT7
   evJFbuC17bwH6/5XQXTF4hzW9jJuNGCkkqYa//o57sRvdSKJKvMkCbOQE
   A==;
X-CSE-ConnectionGUID: BlCCi7+WRVq880Gx/AOElQ==
X-CSE-MsgGUID: abDPmNvXRs+QQ2Ltqxm3eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103292271"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="103292271"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 07:01:35 -0700
X-CSE-ConnectionGUID: u37ZyiNZTtaj0LMNtEgDZQ==
X-CSE-MsgGUID: KStGyTr9TgST6gSnptvuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="240880297"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 May 2026 07:01:33 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRsLa-00000000CQ1-2ad0;
	Tue, 26 May 2026 14:01:30 +0000
Date: Tue, 26 May 2026 16:00:33 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/x86/mm/pgtable.c:547:1: warning: control reaches end of
 non-void function
Message-ID: <202605261526.QsYpmEy1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260526-005817
head:   4987835e04403f7fe2e05edb0b15dec0794bd848
commit: 555a51fb32cba273aa509b7b09aae8fdc9727699 mm: Make /proc/pid/pagemap use the new generic pagewalk API
date:   21 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605261526.QsYpmEy1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261526.QsYpmEy1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261526.QsYpmEy1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pgtable.c: In function 'pudp_invalidate_ad':
   arch/x86/mm/pgtable.c:546:16: error: implicit declaration of function 'pudp_establish'; did you mean 'pmdp_establish'? [-Wimplicit-function-declaration]
     546 |         return pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                ^~~~~~~~~~~~~~
         |                pmdp_establish
   arch/x86/mm/pgtable.c:546:16: error: incompatible types when returning type 'int' but 'pud_t' was expected
     546 |         return pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/mm/pgtable.c: In function 'pudp_invalidate':
   arch/x86/mm/pgtable.c:553:21: error: invalid initializer
     553 |         pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                     ^~~~~~~~~~~~~~
   arch/x86/mm/pgtable.c: In function 'pudp_invalidate_ad':
>> arch/x86/mm/pgtable.c:547:1: warning: control reaches end of non-void function [-Wreturn-type]
     547 | }
         | ^


vim +547 arch/x86/mm/pgtable.c

   532	
   533	#if (defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
   534		defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)) || \
   535		defined CONFIG_HUGETLB_PAGE
   536	
   537	pud_t pudp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
   538				 pud_t *pudp)
   539	{
   540		VM_WARN_ON_ONCE(!pud_present(*pudp));
   541	
   542		/*
   543		 * No flush is necessary. Once an invalid PUD is established, the PUD's
   544		 * access and dirty bits cannot be updated.
   545		 */
   546		return pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
 > 547	}
   548	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
