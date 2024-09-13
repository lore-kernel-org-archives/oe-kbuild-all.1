Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFF1323D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726206639; cv=none; b=IRBJCozWttA+XMPKINtUMhz4QP0mlLJsghBl1beILLTGxHdPqyR4aMC+2OM3px3BYHF/+1z10+y/XNJNP16OiocV0SRY9KhaoVpGPhunHwZAaIuWDyriPj5Zml/EJ2pUqglgVzGXreU2CoSpmcmjxXaOtPLcGOCTDo5RSpod674=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726206639; c=relaxed/simple;
	bh=64vD2Wu5msi1CfcxlhLu7a+kH9zjMyC91cbN9ZF7yh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fmN7OztYtc9tjs81fOrQGTS9b0AKI3l0nJ80yYi+RByQC756ZylsJzrEctNTlMZByjbOaj2bNG5nayyrVsvEYSfxYbIponoqwHwjNyuCllnbddKpi3QFirEu12+x1clya/apTcKLBeg14shS+RIBkXZLnp5gIo0bzOEg0IE8mAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhOaYQ46; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhOaYQ46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726206637; x=1757742637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=64vD2Wu5msi1CfcxlhLu7a+kH9zjMyC91cbN9ZF7yh8=;
  b=UhOaYQ46LOA/o/KRLq5SoWJb7HC+ljHStqf7pBcz6KJE8MZzlqpdPCWs
   TL/e9cg6IWhS+iS39sa2RXri/zwHJK3t52r2Zvfu/ckJQ+2TgcfEccRJA
   8Sfl1LFt5gxbqv5ZL27sGf6LyUM4hzLI/ooPx5jFSkBevPAoz0vmitnO2
   ntcoHGYwpIV8EspsicBgkaXeLpIpl3v2v69D9RsNVVHtisJLXby4LVt7B
   RcLDArmWMJihc05hKbp11bquZ7OpwV3ABuT2C7jCMk/yfU/cpXup4TcuS
   TUTnGRB10IzyofsRdzKhFaicC4BLrJk1Jp1Gzlx4E8wF3Wc5w7hXsnCO/
   A==;
X-CSE-ConnectionGUID: DvMxUMc3QMSRES21sfmhug==
X-CSE-MsgGUID: bwmb1k3bRYGzX/4Wc0F8Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="13506994"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="13506994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 22:50:37 -0700
X-CSE-ConnectionGUID: Pzyj0eobSvyxtUQ4JcRXvA==
X-CSE-MsgGUID: zfoobIWKRjW4ufFGecD+ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="72049994"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2024 22:50:35 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sozCT-000640-20;
	Fri, 13 Sep 2024 05:50:33 +0000
Date: Fri, 13 Sep 2024 13:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1359/13930] mm/share_pool.c:1226:14: error: call
 to undeclared function 'huge_ptep_get'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202409131346.fyTGKf2l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   13706c950ff941dc015e16f76812077f9861e378
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [1359/13930] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131346.fyTGKf2l-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131346.fyTGKf2l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131346.fyTGKf2l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/share_pool.c:1226:14: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           pte_t pte = huge_ptep_get(ptep);
                       ^
>> mm/share_pool.c:1226:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
           pte_t pte = huge_ptep_get(ptep);
                 ^     ~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/huge_ptep_get +1226 mm/share_pool.c

  1221	
  1222	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1223				    unsigned long addr, unsigned long next,
  1224				    struct mm_walk *walk)
  1225	{
> 1226		pte_t pte = huge_ptep_get(ptep);
  1227		struct page *page = pte_page(pte);
  1228		struct sp_walk_data *sp_walk_data;
  1229	
  1230		if (unlikely(!pte_present(pte))) {
  1231			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
  1232			return -EFAULT;
  1233		}
  1234	
  1235		sp_walk_data = walk->private;
  1236		get_page(page);
  1237		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1238		return 0;
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
