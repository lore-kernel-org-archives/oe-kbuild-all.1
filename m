Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA961B974
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 01:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946906; cv=none; b=dD265erc/Hc2aBl9bh38qkBPibWWIMCAnuaz56ggMY23nFpYB5eByaKApT9UFPddTH+We+fu4dMh6W3QCpO8MsQYagh8aQZP083BzgZWaBP9AcrdEBU54WvFAwBQx3O6woguaMTJqZwLZSUwm4wx6yCbNvGzNtOJBHZ/fVM712g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946906; c=relaxed/simple;
	bh=s4pdNj6aZurIES9lSOPBNbM9L7+pIgNl2N2vIPucOc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/oPJ43rg8uzdFnUUbRSt/9AMiQzlUNtzZMVqaTypFRgZFwFRe/gp+kn/lGlJw+KwRsZhS/JUkpMAcCwdYSFZsb5+kArQjT2pFWKMUluqpqrZcGLZWNrf8vo846PUMygyYUatkCtIq4gZb7OqdYNbAs4XwMnQXApnBjP2j/vlT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVnD4ZDG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVnD4ZDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716946905; x=1748482905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4pdNj6aZurIES9lSOPBNbM9L7+pIgNl2N2vIPucOc0=;
  b=nVnD4ZDGBHns5/9bFXL2nl/aK9dNYyvwKN89b6ol9Oune8KNkrPXhju9
   8a8bRMqD8UzOOgAxbWFNF3lxpVyBtXKctBmgt9rR1GCFsib0OAVe425f8
   bTEQXozrYB+lKdnCIQw/GXnIOlWNAlsouvejyqp89KkWike6so6IITrcK
   WlbQqC1UlFHw1bT0GDuIxwWuyVC4Bm8Wk/1FCrTl9S7l39I8yzBtjRM6Y
   Tz0gJEMLYmAKkgPvV2+VWMALxyaQwBvt9F1rB7jGM5NNkGb5pVGQ4jAm5
   u+KKJQ4SYga36ApXk0kJXTftLljoyKiLOqhRmk3MvHppO/JzIkG0yC7C/
   w==;
X-CSE-ConnectionGUID: +strrXEcQJikcPa0o5tPqg==
X-CSE-MsgGUID: ciL8yzsMSGiP4Cfjkx6GAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11740930"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="11740930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 18:41:45 -0700
X-CSE-ConnectionGUID: ICmjnX5yRVaNl/B1yIL64w==
X-CSE-MsgGUID: N/PYW19kQUqzB/HJbcqHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35241276"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 May 2024 18:41:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC8Jx-000Cz5-0t;
	Wed, 29 May 2024 01:41:41 +0000
Date: Wed, 29 May 2024 09:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Zong Li <zong.li@sifive.com>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full 24/54]
 drivers/iommu/riscv/iommu.c:792:26: sparse: sparse: dubious one-bit signed
 bitfield
Message-ID: <202405290940.m6lFLzls-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   0dea64cc13417fc07df1d97a05904896f59fb329
commit: 233eca2161c7836cf92bf250a33d68b01f98c01e [24/54] iommu/riscv: Paging domain support
config: riscv-randconfig-r131-20240529 (https://download.01.org/0day-ci/archive/20240529/202405290940.m6lFLzls-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce: (https://download.01.org/0day-ci/archive/20240529/202405290940.m6lFLzls-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290940.m6lFLzls-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/iommu/riscv/iommu.c:1596:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1596:13: sparse: sparse: too long token expansion
   drivers/iommu/riscv/iommu.c:1596:13: sparse: sparse: too long token expansion
>> drivers/iommu/riscv/iommu.c:792:26: sparse: sparse: dubious one-bit signed bitfield

vim +792 drivers/iommu/riscv/iommu.c

   785	
   786	/* This struct contains protection domain specific IOMMU driver data. */
   787	struct riscv_iommu_domain {
   788		struct iommu_domain domain;
   789		struct list_head bonds;
   790		spinlock_t lock;		/* protect bonds list updates. */
   791		int pscid;
 > 792		int amo_enabled:1;
   793		int numa_node;
   794		unsigned int pgd_mode;
   795		unsigned long *pgd_root;
   796	};
   797	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
