Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7855085C5E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738426655; cv=none; b=h62QhLjbKFaJtGI4TEGO8nAzLOStYBkJnEEmlA7eNeSpZ2Ak/x6wSuwUEHVutx4rOxKT9yS6+NWauH4RnEOI6+mqUb7lIEXX8rbxzZ5oWkeHZNKLnYYctulnbF/Qn5O4o3q2ZYQfwEfTpMm4McKEspsfmsO2dqrZZ29w/2VAUYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738426655; c=relaxed/simple;
	bh=g075cmlAK0h6Qe6Qx5uu3du9CKhmUBD8llkCr9SHv8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DtXcmpW+A9u6loHvMyEczZgeKT9lQYl9ps4qgtzzkQjGamMfj6F5KpeMbiz/0XvCD87eq6oIqY31D/vSLX2K6u1+BekvuuqJMPfLEgLQyl4yUPvvbqXHQxP890SA36t8gHf6vb7370g7JLka+Ypq3nk3J0pMxNxbpcJphfMHCPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y79F0kOw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y79F0kOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738426652; x=1769962652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g075cmlAK0h6Qe6Qx5uu3du9CKhmUBD8llkCr9SHv8M=;
  b=Y79F0kOwjXsiBEPL3yL1Uu10TP6FlJb1IgFaNxL8TreoV+mbldvnhZOy
   5Yr2KGYbGfmTSDFJk/tnN2fMdpdyNXlUQk7jJYncndvqbwSBH5e45bsCc
   pxmGp5x7lbGj+tzpB1xoCoBzbE71+qukkh67/qdGK9ILkpV/Zjq781cET
   jT/zvKj2TDW3nC4EAVbmS2fWB3UqZdCh3ON4pRT+iBGU0js8nyOv2qO9M
   sGWq2A1i5gU7/HLKZgB1to8nkgiJ2EGCpaBdUzXlBTZ6pIIFTe3UD3a+1
   IVB1VPdk+kGinQU/x+GFW1204gMi3aPTDKEzibwytx2rzyXqn5iI6NIaL
   g==;
X-CSE-ConnectionGUID: RKQcSBsTRGyGhdsTpOc0Aw==
X-CSE-MsgGUID: pWSpz/kaSM+5Sm3VAMut3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="42723594"
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="42723594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 08:17:32 -0800
X-CSE-ConnectionGUID: iMSwR5jlTAqMofwLLE+CoQ==
X-CSE-MsgGUID: RCw3sXf6QE+k8rM9WjPGLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,252,1732608000"; 
   d="scan'208";a="110460083"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 01 Feb 2025 08:17:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teGBU-000oKn-2R;
	Sat, 01 Feb 2025 16:17:28 +0000
Date: Sun, 2 Feb 2025 00:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1] fs/proc/task_mmu.c:1858:8:
 sparse: sparse: symbol '__pagemap_lseek' was not declared. Should it be
 static?
Message-ID: <202502020007.RjeLVkFe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   807ce3b4f02f37ed863053f05604ba866e8847a9
commit: 0715c0e2078d5e9bf1b2da50fae4a738cd346016 [0/1] ANDROID: 16K: Emulate /proc/pid/pagemap
config: x86_64-randconfig-122-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020007.RjeLVkFe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020007.RjeLVkFe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502020007.RjeLVkFe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/proc/task_mmu.c:1858:8: sparse: sparse: symbol '__pagemap_lseek' was not declared. Should it be static?
   fs/proc/task_mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'smaps_pte_range' - unexpected unlock
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'clear_refs_pte_range' - unexpected unlock
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'pagemap_pmd_range' - unexpected unlock

vim +/__pagemap_lseek +1858 fs/proc/task_mmu.c

  1857	
> 1858	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  1859	{
  1860		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  1861		loff_t ret;
  1862	
  1863		/*
  1864		 * Userspace thinks the pages are larger than they actually are, so adjust the
  1865		 * offset to compensate.
  1866		 */
  1867		offset *= nr_subpages;
  1868	
  1869		ret = mem_lseek(file, offset, orig);  /* borrow this */
  1870		if (ret < 0)
  1871			return offset;
  1872	
  1873		/* Re-adjust the offset to reflect the larger userspace page size. */
  1874		return ret / nr_subpages;
  1875	}
  1876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
