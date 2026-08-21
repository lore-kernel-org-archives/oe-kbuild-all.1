Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F244503E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787302765; cv=none; b=MwkHW62Y3jVs07Y67IDRblV6R75d70VxdT5mg5YS1iB+BZwrYzKSULIMaOSquzkDaSlMN8KRsbLIIshDUG1gAFd866rj34Du/juaUyvqO7G96/z0QyMFaqHSAlIleDO96qhphBb6GZqO3BM8vVDSB0mu/RqP0sF8LZIaNkZ7Do4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787302765; c=relaxed/simple;
	bh=7gXJ6nB/2MtU93N8Tovm5joAXj5MvJ+Q4plJo5ur6T4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W9lCjfbESsz8gzC160SRLFkmsy53LE04QGIctArgvb9T4iD8OPVAS+js4MCrcQYMkP74OB1nFooKghiXgMHAJwyXIGzh/pqx9t6VhGof4VXACTV6/pzO9iiifMp6qpF061wafkzWVWR+nf93ul1Q8eSl795eLRYOk/voJpPwOJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNJZt4yM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNJZt4yM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787302762; x=1818838762;
  h=date:from:to:cc:subject:message-id;
  bh=7gXJ6nB/2MtU93N8Tovm5joAXj5MvJ+Q4plJo5ur6T4=;
  b=PNJZt4yM66RFGIotSUKd6WqXCaHNYq777vtoFmocRhTfHJg7B/8l6fes
   rQN5d34uvrX+fnE3UDsHEZ0IcVRP5Ng3MNQOkJQVd+1ti0Ply7w07MsIG
   O0itk7eclZdNORTunHaT7oiPTnGiuHGVksPqJ3HmAcKVqm6FKYGshRmwU
   IF99CCDojCfF58KH6KXd9YkY0ctoQu2+rTqveeu5ffDfxG4LIheQNz1J8
   S9axYO8F5fGFue+Xq81quZgEDXy5ERHZoZQ78ZfcbEkCdUBncvH7IXlrs
   ysT88SOun2V+xVO/CnPkt1KBj7D5M+dL0B62PN/YEawRLXHFEC13IKMjH
   Q==;
X-CSE-ConnectionGUID: V09sZ+vyQ1SePit++ZRSFA==
X-CSE-MsgGUID: Cqq9BkPfTQKsotHWMsNhKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="75384350"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="75384350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 01:59:21 -0700
X-CSE-ConnectionGUID: K5eOmTIwR1GHukPHkP2BoQ==
X-CSE-MsgGUID: 3BfBkYyOR1OFuN+2NwGvww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="304476178"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2026 01:59:19 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxL5o-00000000pdR-3dQo;
	Fri, 21 Aug 2026 08:59:16 +0000
Date: Fri, 21 Aug 2026 16:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 86/108]
 include/asm-generic/memory_model.h:56:14: error: implicit declaration of
 function 'memdesc_section'
Message-ID: <202608211609.BQbIh963-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   e58ea3f194d326370813c549a76ecdfa211a4768
commit: a81b95aa56abb5c8e32d24bcdd6d51cc998f1fcf [86/108] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-randconfig-001-20260821 (https://download.01.org/0day-ci/archive/20260821/202608211609.BQbIh963-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211609.BQbIh963-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211609.BQbIh963-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/sbi_mpxy.c:16:
   arch/riscv/kernel/sbi_mpxy.c: In function 'mpxy_setup_shmem':
>> include/asm-generic/memory_model.h:56:14: error: implicit declaration of function 'memdesc_section' [-Werror=implicit-function-declaration]
      56 |  int __sec = memdesc_section(__pg->flags);  \
         |              ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/sbi.h:634:15: note: in definition of macro 'sbi_ecall'
     634 |   __sbi_ecall(a0, a1, a2, a3, a4, a5, f, e)
         |               ^~
   include/asm-generic/memory_model.h:73:21: note: in expansion of macro '__page_to_pfn'
      73 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:79:24: note: in expansion of macro 'page_to_pfn'
      79 |  unsigned long __pfn = page_to_pfn(page);   \
         |                        ^~~~~~~~~~~
   arch/riscv/kernel/sbi_mpxy.c:287:5: note: in expansion of macro 'page_to_phys'
     287 |     page_to_phys(shmem_page), 0, 0, 0, 0, 0);
         |     ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/memdesc_section +56 include/asm-generic/memory_model.h

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
