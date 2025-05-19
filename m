Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2196243364
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635661; cv=none; b=bKGezBBFtILPRMpRhuXaVfZj8fev9R1w+PgGceSje9KFqlS6BVDL8OTI3QnBvROwHCfkvmZGT2v08vAFrLQLPQ5I7HWMQLJLebOJ7SqCJ/aQRAKAUFBedgS07nnpk2MAnrOYbSOVU+R8zYd5RFUCpFyT51ZWmxwQxpvTEj6bJW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635661; c=relaxed/simple;
	bh=Ut/6x9dkOAvOT+DLGgLlMpGTFrNRZUZAx3YNK4uh1Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRCqcXryvSXMj2wERFBfrA8Si3Qx2eQIRZGuXOq3YruJh9i/Jl8w4Rth4kGrXdsL585L2uBGAuAtIpO+q9km5GuW7Kby0ADLZIQ/XurtL6HS+wZHbk/jhTGxZFt7yrGPc0hw+wmltRAVl5javP30z2/AN8Zng9raLI+/o5/3umU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTrsvdPe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTrsvdPe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747635660; x=1779171660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ut/6x9dkOAvOT+DLGgLlMpGTFrNRZUZAx3YNK4uh1Tg=;
  b=LTrsvdPegv9dFVm6AbDYw6BCw1Z+oVxlRcys0ZijzRHg7A3oKTcDBn2C
   r1dzbnkHN5Rwbs1JDsQVahu5O44qoYeTQxGXSOhsyaJJZenfbCgSk1Wwl
   juwTN6WnZjIat/n61z+9kiOlSwIR9/pB0nveZpKwzZdKerWlCpERXZuse
   3zyfv6AUm76XQJefJet9kBNAmRd3ZUOabcekhCf/jn9x5wOKkssw/tPRy
   PKL62smfABt6RGx3vLuvjbya7v2hX/N1TZP9CrXv4nXIqCgOLGSEaD+yZ
   BGXCuZKacrvxsQxm5qU8D+tDzkjUkmVi7+ry2LWUoz+nLoF+hfTdV410U
   g==;
X-CSE-ConnectionGUID: D00HBcw9SGq/CCxNunlwXQ==
X-CSE-MsgGUID: AdqctNzfTy2DborRh9Bo4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49421643"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49421643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:20:53 -0700
X-CSE-ConnectionGUID: BW8jNPHzR1eqKoxx2U1Wog==
X-CSE-MsgGUID: cfTTzdgmRdmez49U6pN0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139690523"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 May 2025 23:20:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGtrl-000LCa-2P;
	Mon, 19 May 2025 06:20:49 +0000
Date: Mon, 19 May 2025 14:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:ackerley-1g-master 59/75] include/linux/huge_mm.h:569:19:
 error: static declaration of 'split_folio_to_list' follows non-static
 declaration
Message-ID: <202505191458.rs6BblHs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git ackerley-1g-master
head:   773f26b5bef6e4d3094a33605165a5c6ab9aa0f0
commit: e1139d8ef61aa230e11a999af27531740e3503ae [59/75] mm: Convert split_folio() macro to function
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20250519/202505191458.rs6BblHs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250519/202505191458.rs6BblHs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505191458.rs6BblHs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm.h:1238,
                    from arch/arm/kernel/asm-offsets.c:12:
>> include/linux/huge_mm.h:569:19: error: static declaration of 'split_folio_to_list' follows non-static declaration
     569 | static inline int split_folio_to_list(struct folio *folio, struct list_head *list)
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:102:5: note: previous declaration of 'split_folio_to_list' with type 'int(struct folio *, struct list_head *)'
     102 | int split_folio_to_list(struct folio *folio, struct list_head *list);
         |     ^~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1274: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/split_folio_to_list +569 include/linux/huge_mm.h

e220917fa50774f Luis Chamberlain 2024-08-22  568  
e220917fa50774f Luis Chamberlain 2024-08-22 @569  static inline int split_folio_to_list(struct folio *folio, struct list_head *list)
e220917fa50774f Luis Chamberlain 2024-08-22  570  {
e220917fa50774f Luis Chamberlain 2024-08-22  571  	return 0;
e220917fa50774f Luis Chamberlain 2024-08-22  572  }
e220917fa50774f Luis Chamberlain 2024-08-22  573  

:::::: The code at line 569 was first introduced by commit
:::::: e220917fa50774fedb27c075df2261fd664e8ca3 mm: split a folio in minimum folio order chunks

:::::: TO: Luis Chamberlain <mcgrof@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
