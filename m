Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0182772D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128319; cv=none; b=Sp+EudAw2UyQsKb/lN20h8acc5W2sIJl6r3++QteWexyUTnywZL6qmMX6VZLOObW1JjMq67tbj3kiKl+CETS0iD8N8lzaqyxYSn2XcvUfBb77F5yaebAFhtL9aM2hjNZtTnOTRwgmeOa5oYZzs+wCYOyOQkaNC0V2zLIR2ibhNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128319; c=relaxed/simple;
	bh=FbXsnD0QgBxahfNbPsvYq6rRHe6raviCoAvJe+PgjtY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPcSgKAjx+F+K9bpq9ebE0WD+poEyyIzjibftYhwlbsBlHaAqRaicf6OnTejaSpQjD5SOdYV5pzbhcyliwHxG7CN0DN/PTakGSizmZc89tprfYaLcoMoWh8uykinhLIjjJr2yQtmjoErbaYItGcgvvc84X9aLVOl7+7g4jek99c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VutVJhXN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VutVJhXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781128317; x=1812664317;
  h=date:from:to:cc:subject:message-id;
  bh=FbXsnD0QgBxahfNbPsvYq6rRHe6raviCoAvJe+PgjtY=;
  b=VutVJhXN2LRRa2nyAevKFwyB49HG0B6nD9ca4JhWhZr4UnjHkrhuDeb4
   WLkkQ+wIxasHht/e+tlKLUDuIC9YTCqSkDeGN7whRq+dXmbT707/JFYdL
   xRbcADHieDv2U2Um0WOwzZaoF9IhWL7W6smsK2tAOMjYQS924Qf2pGbiH
   9TPx2h5WLRqwMXDTIR4srFRLTcDKVOloH09tArOXtOsRsQhRNClT4a2Fp
   QpgP4LhHelWpdOUQnku0zMGfu4qGg8taZtOFk8NfaJ+e0aPBhoYDy7nN7
   EKkX/xlwOrmgPy4ZtS15KHqFU8y5o/k2mUPg9vc1ZSBoS0+uDP69ajD/M
   g==;
X-CSE-ConnectionGUID: 2SJfan6rTlSD9spBtC2jCA==
X-CSE-MsgGUID: b/Z+cfieSmiPZYnjBSOX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82126654"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82126654"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 14:51:57 -0700
X-CSE-ConnectionGUID: qymIBP7UQ6uR0aIw/3HxJQ==
X-CSE-MsgGUID: LzRKoNGpQ0epi7lQz9e7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="245419218"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jun 2026 14:51:55 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXQq0-00000000LwG-1Wq7;
	Wed, 10 Jun 2026 21:51:52 +0000
Date: Thu, 11 Jun 2026 05:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v4 66/81]
 include/asm-generic/memory_model.h:56:14: error: implicit declaration of
 function 'memdesc_section'; did you mean 'find_section'?
Message-ID: <202606110557.IxQOYWqN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   79783024b7bd12897e21fecfaf6ac7dad02a8f0e
commit: 853576b22385941e4e89cde2cf72e4d5384c2554 [66/81] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-001-20260611 (https://download.01.org/0day-ci/archive/20260611/202606110557.IxQOYWqN-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110557.IxQOYWqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110557.IxQOYWqN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/sbi_mpxy.c:16:
   arch/riscv/kernel/sbi_mpxy.c: In function 'mpxy_setup_shmem':
>> include/asm-generic/memory_model.h:56:14: error: implicit declaration of function 'memdesc_section'; did you mean 'find_section'? [-Werror=implicit-function-declaration]
     int __sec = memdesc_section(__pg->flags);  \
                 ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:634:15: note: in definition of macro 'sbi_ecall'
      __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
                  ^~
   include/asm-generic/memory_model.h:85:28: note: in expansion of macro 'PFN_PHYS'
    #define page_to_phys(page) PFN_PHYS(page_to_pfn(page))
                               ^~~~~~~~
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:85:37: note: in expansion of macro 'page_to_pfn'
    #define page_to_phys(page) PFN_PHYS(page_to_pfn(page))
                                        ^~~~~~~~~~~
   arch/riscv/kernel/sbi_mpxy.c:287:5: note: in expansion of macro 'page_to_phys'
        page_to_phys(shmem_page), 0, 0, 0, 0, 0);
        ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +56 include/asm-generic/memory_model.h

8f6aac419bd590 Christoph Lameter       2007-10-16  48  
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  49  #elif defined(CONFIG_SPARSEMEM)
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  50  /*
1a49123b343461 Zhang Yanfei            2013-10-03  51   * Note: section's mem_map is encoded to reflect its start_pfn.
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  52   * section[i].section_mem_map == mem_map's address - start_pfn;
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  53   */
67de648211fa04 Andy Whitcroft          2006-06-23  54  #define __page_to_pfn(pg)					\
aa462abe8aaf21 Ian Campbell            2011-08-17  55  ({	const struct page *__pg = (pg);				\
56d578c1300f7e Matthew Wilcox (Oracle  2025-08-05 @56) 	int __sec = memdesc_section(__pg->flags);		\
f05b6284ee5d3b Randy Dunlap            2007-02-10  57  	(unsigned long)(__pg - __section_mem_map_addr(__nr_to_section(__sec)));	\
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  58  })
a117e66ed45ac0 KAMEZAWA Hiroyuki       2006-03-27  59  

:::::: The code at line 56 was first introduced by commit
:::::: 56d578c1300f7efe9605b75714173dd3fda16fe2 mm: convert page_to_section() to memdesc_section()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
