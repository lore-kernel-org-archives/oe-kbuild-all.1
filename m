Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12F915575D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738365402; cv=none; b=CQAhM2o2ppthhcefrSgP5LfE/uQ9pgEQCSh4BvMOEGMpM8LXnVMjWiJh/Hk2Su+6i/5TEixwnhfLZ4JxJJDr3qT3u2+uhkXy5imtM4AGyLtU/fS4m1saO6i2hwdzeJTwgKINubcEpCjvrAPTQjHCsmflGuD9u0xDfS4cSEtOI/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738365402; c=relaxed/simple;
	bh=YiSEASy1Fx9cgoMO1KGocUIFUwIasgY9X8lhTxd0rjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbqA5JuyeNhHJa45uMyimxerfG5LoFMTM6QKQ3ACRJre+zzL5Fbp6g/TdJANNn4L+3+Jp6RhIBZD/Iy+5y3jBshtpfi2Say7/p5v33hQaIpIFEocfO5OHzJ2xGX/DoMj5z40T26VFM0ENS6BrlUR/B6rtbvPsUer8wFb/g2N/p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NGSJB2J8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NGSJB2J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738365401; x=1769901401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YiSEASy1Fx9cgoMO1KGocUIFUwIasgY9X8lhTxd0rjo=;
  b=NGSJB2J8ODJFpsEaqY+BAA90iuJJWhoYjpUiytOm7lP9+g0G95f2HGWn
   KoZTNbMEEwd+p/x1Ek0XrtHkOi+zEH1qYdBB6bS9rfnjb1+d0xVJ6FWGN
   0tkNbwxwheyJChl+6n+f2rXUFSWg9pPEkBFP8STD73xuAIUgsJABbK/aV
   U8whVYALZyjZtZwcAONv3IsJQbO+Su1ARaT310ERqmZaMOlLq8MuXkowp
   0ekNnPZq4IlCc9RRm3SalYPJUmtBOY5dFrFJfdVnQkvhw+2nAixO/2+/2
   k82tnbCxWQM3RwN2qzzOKzltk6qaX7Y5L1fzYyPLsG7dQVTf5Zef8VCvS
   w==;
X-CSE-ConnectionGUID: COMcfH1pRe+Wvq4m6HmyEg==
X-CSE-MsgGUID: C5n7jRWVSjSuXCcjg1WcsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38151759"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="38151759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:16:35 -0800
X-CSE-ConnectionGUID: Z7HsY5x+R8u3euZpYWcTaA==
X-CSE-MsgGUID: JGxN1sg7Q+Oide9anHeN1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="109530078"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jan 2025 15:16:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0FS-000nNx-2M;
	Fri, 31 Jan 2025 23:16:30 +0000
Date: Sat, 1 Feb 2025 07:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 78/111] mm/hugetlb.c:66:26: sparse: sparse:
 symbol 'hstate_boot_nrinvalid' was not declared. Should it be static?
Message-ID: <202502010728.A5WFMTpS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f5604ad70091eabe663ea7106ced99449d653320
commit: d1feef9effa479261c600b78dd0e1a83e730c0d8 [78/111] mm/hugetlb: check bootmem pages for zone intersections
config: x86_64-randconfig-122-20250201 (https://download.01.org/0day-ci/archive/20250201/202502010728.A5WFMTpS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010728.A5WFMTpS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010728.A5WFMTpS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/hugetlb.c:66:26: sparse: sparse: symbol 'hstate_boot_nrinvalid' was not declared. Should it be static?
   mm/hugetlb.c:672:12: sparse: sparse: context imbalance in 'allocate_file_region_entries' - wrong count at exit
   mm/hugetlb.c:743:13: sparse: sparse: context imbalance in 'region_add' - wrong count at exit
   mm/hugetlb.c:810:13: sparse: sparse: context imbalance in 'region_chg' - wrong count at exit
   mm/hugetlb.c:5606:24: sparse: sparse: self-comparison always evaluates to false
   mm/hugetlb.c:6051:9: sparse: sparse: context imbalance in 'hugetlb_wp' - unexpected unlock

vim +/hstate_boot_nrinvalid +66 mm/hugetlb.c

    64	
    65	__initdata struct list_head huge_boot_pages[MAX_NUMNODES];
  > 66	__initdata unsigned long hstate_boot_nrinvalid[HUGE_MAX_HSTATE];
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
