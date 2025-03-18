Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BCC20E01D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742307170; cv=none; b=M6QIVTqSUxkG8mjIRTNgwBdM1KBC5J93zzt05OpMZbcN1RwWXFTb2zXsfnIQqytZwGcI3sOMIAd1E0Ic7RYCg8qTk1SQdcS2Hnmt8z5TSARuAjGPR+knj1XXR22kCDyBtxriBE12IqxWSxA2ONsMcaKMCFmhgwhWKvaGyPBrOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742307170; c=relaxed/simple;
	bh=E5USZDfawcmguTRyVZ6MCZjaK5+iZLztjWlLLHCwt0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYPXgXOXetrfzX2DrC3QMvRkm6SISY+4ydgwSvwJX0IIsve4kc4DYprx6tmJov9dE421HFBpAGdpLWJFv6TVzILkG8WIR8C7X3m9Wu1k7tLS+fYvs411ZY40A6EExcFVPY6m7Ie3VQxtUWNDAz80NXDSxux/M5VMcBgzUugXvgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=er20bd4q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er20bd4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742307169; x=1773843169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E5USZDfawcmguTRyVZ6MCZjaK5+iZLztjWlLLHCwt0U=;
  b=er20bd4q8NzFofijJJmZ/V2oog9WDseJ5YXFCPHBVJgEBkJpdCOBSlAE
   1/PjxSDIl0zMPEIaWu6DzNGi/c2pZXieSUwZP2yryct9OqoHzsvUtmbN+
   ka2AANy/fnKZJQhI5vSWLWm1vgh56xJk7ZjGbxHnfgkv8wRjBET0lILNt
   ZZ+fR0l4Xb+yaMjI6R2aMGv2epKZNt8bY4dnFsXJ+1iNMIcBkybi1FDMo
   s2YXo+Xqe+vy2TFwzNNWIsW7LQGqriJCKNngqgQ8k+hTm+8uYocNcQaV0
   AJYJLUjAFWcvP5CNfhSAm1rKsENsXjnmq5y/kvnocFivLsqoI6Xzo0WmW
   g==;
X-CSE-ConnectionGUID: qGeZo+DWTM23IHYs4CoDfg==
X-CSE-MsgGUID: YohlCe22TwC8RTXUexl1MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="54826264"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="54826264"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 07:12:48 -0700
X-CSE-ConnectionGUID: 3BtTIngTQayk3bl5h+kRKw==
X-CSE-MsgGUID: 0sveFQzKTv+MGR5ZxwBrow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; 
   d="scan'208";a="145451717"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2025 07:12:47 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuXgO-000DqW-1F;
	Tue, 18 Mar 2025 14:12:41 +0000
Date: Tue, 18 Mar 2025 22:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linus.walleij@linaro.org>
Subject: [arm-integrator:kb-ctor-test 8/11] arch/arm64/mm/mmu.c:507:20:
 warning: 'pgd_pgtable_alloc_init_mm' defined but not used
Message-ID: <202503182238.e2ruMkIF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kevin,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kb-ctor-test
head:   fda06edbde15287b58c6ec923a98ccd654ae5dfa
commit: 987b4b85480e05bed8bf9283a9df2dffdba3c10c [8/11] arm64: mm: Always call PTE/PMD ctor in __create_pgd_mapping()
config: arm64-randconfig-r131-20250318 (https://download.01.org/0day-ci/archive/20250318/202503182238.e2ruMkIF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250318/202503182238.e2ruMkIF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503182238.e2ruMkIF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/mmu.c:507:20: warning: 'pgd_pgtable_alloc_init_mm' defined but not used [-Wunused-function]
     507 | static phys_addr_t pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pgd_pgtable_alloc_init_mm +507 arch/arm64/mm/mmu.c

   506	
 > 507	static phys_addr_t pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
   508	{
   509		return __pgd_pgtable_alloc(&init_mm, pgtable_type);
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
