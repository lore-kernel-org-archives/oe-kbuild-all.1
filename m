Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F1319995E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 02:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782267260; cv=none; b=No7h8W0wWvxxlwDJLoteCV89wGlRjjaqvAdk4GvXCTdG5AX4ITpjV+YRsk4YUFm24xIgEz5hYDgqiIESZv0/IE3vDoTfNhGajpDlOk3mUWRgM8XRJQ4gR73Dy9BcwNrRKm91alz0woHTZszVVT8GqEZFVYghhLSQ7iVZGDBRZlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782267260; c=relaxed/simple;
	bh=3txMXZZJU48gw5dsEb68GSapeIZ4cE+qVTDDPiTalBA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nWb18hgJrmieob8z+MRz1pyzM/bNnLlKKpvL8JEVD7LJW+DZ5TksjP3wUWcWwmzDMnO+IuDZ7j/IzERU06dj7+u7XyeFHbjWYVd2XbuN2dqZR/DZzpaJFlLtAUDnUK+HSOjbSjFVYXcYTGjZspv9kIVl12u7SlV5dx4vQf8q7v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaHhwcFN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaHhwcFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782267258; x=1813803258;
  h=date:from:to:cc:subject:message-id;
  bh=3txMXZZJU48gw5dsEb68GSapeIZ4cE+qVTDDPiTalBA=;
  b=OaHhwcFNE48y5XuChuBFg3GMChBqwY6bBrM/pcLrUQWHMFOjFtBkZHXi
   N2wGWOu9whGxppGfSCUv7+zcPEqkZwUFvRWah89oQk5gNEvG0JEXMM2Fl
   z68XNNYTUVjpYDoYcHbH0awR5Omp0LMViywhq03Hm1l/UcQvTEYKcBv2c
   Vc27/8slbENyhTuYMARR+MRFjWrhlovstRVs3vbZDRhuqNM6GUb30OJ9d
   aBuidoZCKFnD49jmhopYBA/ZRyCbIVKEPM/n7m4cu4H04C6ucXDhAWrhX
   UBGzSYCIMZhl+rUuhtUaa9zsJHooXTZMUTbDoQZjd3IXjh5hiEReUC8v/
   g==;
X-CSE-ConnectionGUID: 01Z4PDeERnmgD/vlAhsbwA==
X-CSE-MsgGUID: 88TDtsxfQpuhl6a/9Wap9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86923006"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="86923006"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:14:18 -0700
X-CSE-ConnectionGUID: Ccf4bUNOSGuBV3qIKHiWbA==
X-CSE-MsgGUID: RqRXXpdZRCawnVrwbTyciQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249708802"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2026 19:14:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcD81-0000000033p-1UKC;
	Wed, 24 Jun 2026 02:14:13 +0000
Date: Wed, 24 Jun 2026 10:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Joerg Roedel <joerg.roedel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasant Hegde <vasant.hegde@amd.com>
Subject: include/linux/bitops.h:273:19: sparse: sparse: cast
 truncates bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202606241040.SJ0O1Qs9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bade58eb0651c84b9b2a074fe4c04f2bba6b933f
commit: 879ced2bab1ba95e98fac56c9503791183bc7cbb iommupt: Add the AMD IOMMU v1 page table format
date:   8 months ago
config: i386-randconfig-062-20260624 (https://download.01.org/0day-ci/archive/20260624/202606241040.SJ0O1Qs9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606241040.SJ0O1Qs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 879ced2bab1b ("iommupt: Add the AMD IOMMU v1 page table format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606241040.SJ0O1Qs9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/generic_pt/fmt/iommu_amdv1.c: note: in included file (through drivers/iommu/generic_pt/fmt/../pt_log2.h, drivers/iommu/generic_pt/fmt/../pt_defs.h, drivers/iommu/generic_pt/fmt/iommu_template.h):
>> include/linux/bitops.h:273:19: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   include/linux/bitops.h:278:16: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)

vim +273 include/linux/bitops.h

c320592f3f2a1e Wolfram Sang       2025-01-07  261  
952043ac12a117 Steven Whitehouse  2009-04-23  262  /**
952043ac12a117 Steven Whitehouse  2009-04-23  263   * __ffs64 - find first set bit in a 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  264   * @word: The 64 bit word
952043ac12a117 Steven Whitehouse  2009-04-23  265   *
4945cca232ce8b Geert Uytterhoeven 2021-02-25  266   * On 64 bit arches this is a synonym for __ffs
952043ac12a117 Steven Whitehouse  2009-04-23  267   * The result is not defined if no bits are set, so check that @word
952043ac12a117 Steven Whitehouse  2009-04-23  268   * is non-zero before calling this.
952043ac12a117 Steven Whitehouse  2009-04-23  269   */
6606c8c7e81886 Kees Cook          2025-08-04  270  static inline __attribute_const__ unsigned int __ffs64(u64 word)
952043ac12a117 Steven Whitehouse  2009-04-23  271  {
952043ac12a117 Steven Whitehouse  2009-04-23  272  #if BITS_PER_LONG == 32
952043ac12a117 Steven Whitehouse  2009-04-23 @273  	if (((u32)word) == 0UL)
952043ac12a117 Steven Whitehouse  2009-04-23  274  		return __ffs((u32)(word >> 32)) + 32;
952043ac12a117 Steven Whitehouse  2009-04-23  275  #elif BITS_PER_LONG != 64
952043ac12a117 Steven Whitehouse  2009-04-23  276  #error BITS_PER_LONG not 32 or 64
952043ac12a117 Steven Whitehouse  2009-04-23  277  #endif
952043ac12a117 Steven Whitehouse  2009-04-23  278  	return __ffs((unsigned long)word);
952043ac12a117 Steven Whitehouse  2009-04-23  279  }
952043ac12a117 Steven Whitehouse  2009-04-23  280  

:::::: The code at line 273 was first introduced by commit
:::::: 952043ac12a117d8e94bddd9088338d7ad20ca7d bitops: Add __ffs64 bitop

:::::: TO: Steven Whitehouse <swhiteho@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
