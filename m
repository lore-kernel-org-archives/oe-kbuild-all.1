Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A733A312816
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763531710; cv=none; b=cJBA8ZHgZpnIiiK1dFjrn5UntgRGiFaXjDADFBrJZGCJk9QPOJgqeZMrPe4xaQVUsfCIRfDVkXFLfVElT7KkyX9BtGRD41/mnos42+sm3ReoY6WPmoYYVtYqtpdxc7VHLAwlANXBuV5YeGd22f8x577ypAXve8kV3X1ZS+MMbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763531710; c=relaxed/simple;
	bh=/360DQcTmQ5VFrep0Dz7dzmDkboPZrmffaP+ATeSNqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RiiZyGIPQPCRsL9LMt6XW+sI7aey81WONM5hwWIaYH4IRxw4Fq2pgfLPFamIJYb63h+i8Oc0F2rHkjp+qBMiaQjyxk1WgHk4F3Co9ayD5sd5QI99xdUAFZgHxbT5yL2rlaoxa/XwsHmTvnVVN9VriT2M7b2rkYuMEzyOwG7b1Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiPJYehJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiPJYehJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763531709; x=1795067709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/360DQcTmQ5VFrep0Dz7dzmDkboPZrmffaP+ATeSNqc=;
  b=PiPJYehJf3wX0W1Pvfop54lharap608bk4HiZ6onPHWIDbUEwG5nxFUP
   UFzBSdLqUJlBn8Os3w46MKYPVEk6SYEiy2vzpP0BTK/usSrYqI/y91irk
   8+HpfVaNCtcaUsXF46IaBHZAUI0NNLEdhoytmyz3sc/nojZjQl/YEYG+c
   jZSFSVNRdgAzGpmklxB6HacfgTnQQCjGCxkbiY97nW7hRJsdCDLjYvw1o
   KHM5UGvcyVlOfXtM56DFLf6ws4IPH4zznw45eiWDpLBtl2+Bx+r7nJrLR
   qSq6piavysvUSSdXm3rpscBt46yCzztR1DbTXP1dH93lLws4z7UzTklOZ
   Q==;
X-CSE-ConnectionGUID: 1LC6LslKQu2Y0sNhv94+cA==
X-CSE-MsgGUID: CcCF2CerQCmS69v7bOBIZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="53136923"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="53136923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 21:55:05 -0800
X-CSE-ConnectionGUID: eoJiprnZQdGiLVXQrAEVew==
X-CSE-MsgGUID: aFjiZpuxRguCQCQDh20R5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190616935"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2025 21:55:04 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLb9h-0002VX-2c;
	Wed, 19 Nov 2025 05:55:01 +0000
Date: Wed, 19 Nov 2025 13:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-05 1/1] mm/page_alloc.c:327:15:
 sparse: sparse: symbol 'nr_free_highatomic' was not declared. Should it be
 static?
Message-ID: <202511191325.dCvS1BeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-05
head:   25ff4cf0c2dccb65a61af6270a261d4eca12b62e
commit: 7b1f522c80c811c59e056b899b26c684780442fd [1/1] ANDROID: GKI: deferred split queue corruption - ABI fixup
config: arm-randconfig-r121-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191325.dCvS1BeJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191325.dCvS1BeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191325.dCvS1BeJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:195:1: sparse: sparse: symbol 'restrict_cma_redirect' was not declared. Should it be static?
   mm/page_alloc.c:1384:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1384:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1384:25: sparse:     got restricted fpi_t [usertype] fpi_flags
   mm/page_alloc.c:1392:25: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted int flags @@     got restricted fpi_t [usertype] fpi_flags @@
   mm/page_alloc.c:1392:25: sparse:     expected restricted int flags
   mm/page_alloc.c:1392:25: sparse:     got restricted fpi_t [usertype] fpi_flags
>> mm/page_alloc.c:327:15: sparse: sparse: symbol 'nr_free_highatomic' was not declared. Should it be static?
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:2738:6: sparse: sparse: context imbalance in 'free_unref_page' - different lock contexts for basic block
   mm/page_alloc.c:2835:33: sparse: sparse: context imbalance in 'free_unref_folios' - unexpected unlock
   mm/page_alloc.c:915:31: sparse: sparse: cast from restricted fpi_t
   mm/page_alloc.c:3137:20: sparse: sparse: context imbalance in 'rmqueue_pcplist' - different lock contexts for basic block
   mm/page_alloc.c:4890:9: sparse: sparse: context imbalance in '__alloc_pages_bulk' - different lock contexts for basic block

vim +/nr_free_highatomic +327 mm/page_alloc.c

60f30350fd69a3 Vlastimil Babka 2016-03-15  326  
d5ace9d4dd020b Kalesh Singh    2025-05-28 @327  unsigned long nr_free_highatomic[MAX_NR_ZONES] = {0};
d5ace9d4dd020b Kalesh Singh    2025-05-28  328  

:::::: The code at line 327 was first introduced by commit
:::::: d5ace9d4dd020b31be684cfd095e876fe59ae65f ANDROID: GKI: page_alloc ABI fixup

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Kalesh Singh <kaleshsingh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
