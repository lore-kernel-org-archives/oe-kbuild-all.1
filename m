Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A713AF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714233645; cv=none; b=dRCK975iTGn90hwSdid9+al/5YxDo1AgPdVaVHLgmJvceddWYIl0T9wshL4aXSQRbtidt8WwS9cBFqyUdzWFlp9oGFpUYaXFnN0L7W+DbvQNxiS2P/Dfmg7u2wz39VVTxF306W+xXutr94+1wDZPqV/wcV/cxDV4q03CUr1VPKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714233645; c=relaxed/simple;
	bh=wzg9SX1qG/Bj8V80BD9/Z4Xp/cu6AG89hLvqDw6oWlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+SrLhlqNcocOPa/hFJROrCGtQxX5y3EIKHNFqrvI1DT2f13HkVQhDRmgsNo29Yy0DAAgVPjWdJM7HA7539Jig3MdBA5MTp0ayUOywyAUWmHvUddcFJPpyckuAsEIISMHjydOn8fVmPGhWANs92ardISEMpVTRbziG5C5++WiVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtipoukW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtipoukW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714233644; x=1745769644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzg9SX1qG/Bj8V80BD9/Z4Xp/cu6AG89hLvqDw6oWlU=;
  b=OtipoukWULfRZG0yOnSVDpIpTTgZap4QdPBTgamSzYyebNGhTNv+Q8iJ
   iO9uOIHIAG6LB/auuu6bnG4bx/VSoskEu6Lvf4BCN0ZoMxXvkiLWUvmNe
   VTjZmoCGcVr2AjXzYj/YRDkAVQVIMSqfE2AdmwOfHP4Ev0fLEIQ4BTdzX
   WPEkH/swFcZff0pkrdy8oiXYMXhX753y/GBG1ZvtFNORq+JcUJ4pHtHeG
   39ZsSunrPCaY8UFBiAXVcYOWGneTBArhSbxhM9mkjxzMg1O6HANBwyswi
   n3T95a4ED0kZwxX6aj3Y40X8b3zG+sCoVOEo6TXC1tGM5m6OX0TGmaH1y
   w==;
X-CSE-ConnectionGUID: sqgPcCW+Q2ajpFOxBM2h/A==
X-CSE-MsgGUID: mP6m5S4MRbWrBMhlr/fZlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9802313"
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="9802313"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 09:00:43 -0700
X-CSE-ConnectionGUID: j424a0SDSeS0emBS8Vz6Gw==
X-CSE-MsgGUID: bWS73t53RmmfC6pKK7OVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,235,1708416000"; 
   d="scan'208";a="25577177"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2024 09:00:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0kTf-0005ER-1i;
	Sat, 27 Apr 2024 16:00:39 +0000
Date: Sat, 27 Apr 2024 23:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/22] mm/page_alloc.c:191:1: sparse:
 sparse: symbol 'restrict_cma_redirect' was not declared. Should it be
 static?
Message-ID: <202404272356.8EuFLuZa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e1c0fd4e4964db2eb14c56a62e1a9cdb9d67445e
commit: 50c9052328749b2f96f994fc83e0bfd5c2cacf19 [2/22] ANDROID: fix !CONFIG_CMA build
config: x86_64-randconfig-123-20240427 (https://download.01.org/0day-ci/archive/20240427/202404272356.8EuFLuZa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240427/202404272356.8EuFLuZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404272356.8EuFLuZa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:191:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:2490:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2617:17: sparse: sparse: context imbalance in 'free_unref_page_list' - unexpected unlock
   mm/page_alloc.c:2847:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4526:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block
   mm/page_alloc.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to true

vim +/restrict_cma_redirect +191 mm/page_alloc.c

7281201922a006 Lee Schermerhorn 2010-05-26  178  
4518085e127dff Kemi Wang        2017-11-15 @179  DEFINE_STATIC_KEY_TRUE(vm_numa_stat_key);
4518085e127dff Kemi Wang        2017-11-15  180  
1c8aebe4c072bf Heesub Shin      2024-02-12  181  /*
1c8aebe4c072bf Heesub Shin      2024-02-12  182   * By default, when restrict_cma_redirect is false, all movable allocations
1c8aebe4c072bf Heesub Shin      2024-02-12  183   * are eligible for redirection to CMA region (i.e movable allocations are
1c8aebe4c072bf Heesub Shin      2024-02-12  184   * not restricted from CMA region), when there is sufficient space there.
1c8aebe4c072bf Heesub Shin      2024-02-12  185   * (see __rmqueue()).
1c8aebe4c072bf Heesub Shin      2024-02-12  186   *
1c8aebe4c072bf Heesub Shin      2024-02-12  187   * If restrict_cma_redirect is set to true, only MOVABLE allocations marked
1c8aebe4c072bf Heesub Shin      2024-02-12  188   * __GFP_CMA are eligible to be redirected to CMA region. These allocations
1c8aebe4c072bf Heesub Shin      2024-02-12  189   * are redirected if *any* free space is available in the CMA region.
1c8aebe4c072bf Heesub Shin      2024-02-12  190   */
1c8aebe4c072bf Heesub Shin      2024-02-12 @191  DEFINE_STATIC_KEY_FALSE(restrict_cma_redirect);
1c8aebe4c072bf Heesub Shin      2024-02-12  192  

:::::: The code at line 191 was first introduced by commit
:::::: 1c8aebe4c072bf18409cc78fc84407e24a437302 ANDROID: cma: redirect page allocation to CMA

:::::: TO: Heesub Shin <heesub.shin@samsung.com>
:::::: CC: Carlos Llamas <cmllamas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
