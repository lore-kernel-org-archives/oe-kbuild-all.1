Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF017BB4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721789585; cv=none; b=me4dYPzkshahrYqmf0898d0RIoLBy96fM0pnNqteLwbHXXaYC2f6NiBPxcbqeyhl8ieY39R7mPkP/wZVPt6Fx9dSic10M6MFhkaGudjhidCzcsa9n34bXcYSfogsihKNtnjoUeHNCZTimaGQzc1bU1ziAVhWACEKQxhe1TYR2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721789585; c=relaxed/simple;
	bh=zdFtMUahi3CnZMlA4Z165QTM9tKCe3fznAgHdhqlGFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3A9fCKZAf/Wn26OeSEcsgaJB1sveW4TodEmp1ghbR1V5DT5ycD0tK+TlIJDxIZ0zZlgpJn76NhPEa6mel/dLN5/L6udODLFk6R2OZaK0AM3DddiHF6aO/B8O3d+I3uJz3kojfypzt5/0YvCPxsJCKqaAqJAOHjocm11JLGJ4Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCSmd83n; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCSmd83n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721789584; x=1753325584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zdFtMUahi3CnZMlA4Z165QTM9tKCe3fznAgHdhqlGFs=;
  b=PCSmd83nGTaUpstu3tX6NeJlOqQQOhzj+82f5HcqxbjnDjqzmGTuZRAf
   efREzdY1zeXhVE0J1tIpMYYeB8yi4QBTnFj/DwezqRiS5ipwA21EhPhMc
   7W1+rfpSNOQTBtSRMqjP1jUeALPqt4jA3w+MQo4mvqr8KScqG+Xv4HnjO
   DIyjr9E4vth1+yCQkE+e0wmn7QnWvICEB3zZrUZoej1/ds0jVaHVyD5dr
   X4KoE62EgfBe32Eb11NMVClT2oD3MKElXp/uj3NpGR6vxGE4baB+LsFeQ
   wNd5V+2rJgW0qNEG7/xQ4Nqk7PrBsPIeqZPzcK2DbX36wQzKU3inTWCEm
   w==;
X-CSE-ConnectionGUID: FgdanpvvTvOAvW7+AfzPjw==
X-CSE-MsgGUID: rOb2aiIGQT6SGVfx1K0J7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19592959"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19592959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 19:53:03 -0700
X-CSE-ConnectionGUID: m+mNxMKfSKKDyhGnGLmiaw==
X-CSE-MsgGUID: PaPNTPpZQaK6bHWGGnrAvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52498936"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jul 2024 19:53:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWS7g-000mai-1J;
	Wed, 24 Jul 2024 02:53:00 +0000
Date: Wed, 24 Jul 2024 10:52:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:kfence-fix-wip6 10/10]
 arch/powerpc/mm/book3s64/hash_utils.c:1077:44: error: 'kfence_early_init'
 undeclared; did you mean 'kasan_early_init'?
Message-ID: <202407241001.2SxZAa2h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux kfence-fix-wip6
head:   28d73773290c65f55d22e038b4f13c5c4941a561
commit: 28d73773290c65f55d22e038b4f13c5c4941a561 [10/10] kfence: disable if not early init
config: powerpc64-randconfig-002-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241001.2SxZAa2h-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241001.2SxZAa2h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241001.2SxZAa2h-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/mm/book3s64/hash_utils.c: In function 'htab_init_page_sizes':
>> arch/powerpc/mm/book3s64/hash_utils.c:1077:44: error: 'kfence_early_init' undeclared (first use in this function); did you mean 'kasan_early_init'?
    1077 |             !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
         |                                            ^~~~~~~~~~~~~~~~~
         |                                            kasan_early_init
   arch/powerpc/mm/book3s64/hash_utils.c:1077:44: note: each undeclared identifier is reported only once for each function it appears in


vim +1077 arch/powerpc/mm/book3s64/hash_utils.c

  1070	
  1071	static void __init htab_init_page_sizes(void)
  1072	{
  1073		bool aligned = true;
  1074		init_hpte_page_sizes();
  1075	
  1076		if (!debug_pagealloc_enabled() &&
> 1077		    !(IS_ENABLED(CONFIG_KFENCE) && kfence_early_init)) {
  1078			/*
  1079			 * Pick a size for the linear mapping. Currently, we only
  1080			 * support 16M, 1M and 4K which is the default
  1081			 */
  1082			if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) &&
  1083			    (unsigned long)_stext % 0x1000000) {
  1084				if (mmu_psize_defs[MMU_PAGE_16M].shift)
  1085					pr_warn("Kernel not 16M aligned, disabling 16M linear map alignment\n");
  1086				aligned = false;
  1087			}
  1088	
  1089			if (mmu_psize_defs[MMU_PAGE_16M].shift && aligned)
  1090				mmu_linear_psize = MMU_PAGE_16M;
  1091			else if (mmu_psize_defs[MMU_PAGE_1M].shift)
  1092				mmu_linear_psize = MMU_PAGE_1M;
  1093		}
  1094	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
