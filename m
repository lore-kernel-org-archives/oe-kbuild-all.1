Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BC917C96
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732726374; cv=none; b=nB5SYE8fCSs8QI1OaD2X82iFvspqED1HRJLmRQCi0ef9zt9t/rXStZtEyQt6wYvfnN4SGfFVQ4fSHfIBW2hJB67D/NZeSg83yLThrcBHPyLdwWxIQ0+53sQJfx6eCAQzCviZSAJe7+BuStxGjVw//mr3AUblH9XAxvWz77f89vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732726374; c=relaxed/simple;
	bh=jP2/N4Qhhi9/w7VuGZui3mp2k8OKnVAiahyOlWk7lFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ldy1VcbMBf18vBSI/TrFPbq8ZyXcGzIDoBj+sYPXaQTZoi4Eycid7s8bUrMuc6O4xWRcBWS8rif28osTO51wQlIDVYBQhlPWh+Nhd58kxl3e6EqdnjksJ26c/Jc2yyw0A5G31CAkdpf6K1IpuJm7OBW/tEu6qyADoQSgDDlqpw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5dmPTTq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5dmPTTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732726371; x=1764262371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jP2/N4Qhhi9/w7VuGZui3mp2k8OKnVAiahyOlWk7lFk=;
  b=R5dmPTTqd57Dnzf9Q4Ifck5GqxiWN83Y7KRD6keHLGiZ0Rlygen6uFqv
   I5E0xIJNpmKOUzcEWS3oYjlJX1zpAAqslHn6crq1Rlf7VNj6EpeeaxFZy
   CBai3GEhKZcZMr6UCA0rfKuSmsr9qzVsEpvIj4MH7gjkFr/1+2/AIsKfJ
   wofarYBw6Xe03Snh4/Yeob2Sbxig7fN+0k6f0Zf8eAZVFMoCwyg154riX
   icYjvxd4wsTFxv7U0EGknO/uDaxZJZtf8KFl5yQde1yUuUIEUTPhZko1T
   abfP6Xr2VKKyqE1RFGhTNze2UcE2MmykZlX71y4Q7BhYLid71hiqdyXKW
   Q==;
X-CSE-ConnectionGUID: F9dVshfKRd2UeuEA4dLGjg==
X-CSE-MsgGUID: HqXPJ7EQRYOR9yNpbAG+GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43430739"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="43430739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:52:50 -0800
X-CSE-ConnectionGUID: SnOX3mHUSFKUIt0Txt+Ptg==
X-CSE-MsgGUID: opyTuhxDQd6AIbH/8ay60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="92827240"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 08:52:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGLHT-0008An-17;
	Wed, 27 Nov 2024 16:52:47 +0000
Date: Thu, 28 Nov 2024 00:52:41 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] mm/share_pool.c:1226:14: error: call
 to undeclared function 'huge_ptep_get'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411280023.QYDiEv46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [1540/1540] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280023.QYDiEv46-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280023.QYDiEv46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280023.QYDiEv46-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/share_pool.c:21:
   In file included from include/linux/share_pool.h:5:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/share_pool.c:1226:14: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^
>> mm/share_pool.c:1226:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |               ^     ~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


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
