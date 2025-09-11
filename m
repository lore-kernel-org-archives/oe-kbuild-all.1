Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8EB2E0400
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 22:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757628290; cv=none; b=pa2JBlzt3CiEZqSfLlErTxaHrrIfIhZO9F26cPzUcs1lQTLt6Ja5Q1GR/RLfuZkguin9e8vMQXh33k57DXUW+pm2crDsMXb0Mq0QJqvyWJ7jhumZSv40nYKwuWwQIHF0RnAJMD9PYpcS9bVdc3A8LqaGAR6bO21RHnI99LOXYXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757628290; c=relaxed/simple;
	bh=oQPPXco+jFT9WyxzhmIkmfnzcqYogRZTYyzvQyks5lA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flrW4Ynv3jDCIsZ0EQt7b0RQXxGzwhcRD5tWs0aexmNNDUi6clXmoN3u2qI+tWB2S/hNDBckl7e/Mu39GkQxTLFc747Gkhud/2BKWKSNYX4ZReo7HIUzD0m574Iq7Uq1nCQQy4Wgv021vBi6zlpF0SIAqPnNjtzmN3FoaOnXGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ir9+5fn3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ir9+5fn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757628288; x=1789164288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQPPXco+jFT9WyxzhmIkmfnzcqYogRZTYyzvQyks5lA=;
  b=Ir9+5fn3cfMz2v8/KsJi/AMK+MyD1LaKzWwhhh+DJ8f59ROuq3Gq4TyF
   rimMDmooQ8jlub//MECExksyv5Kg7S5VKEe+ObmigWfZtGc8RwUGTrzaV
   GCRU8/TfQbQ8Vng5WtcxGl+dtpGlPK5zd/74ei4/9pvu6AAqxODfm/996
   JlQ6GNGucmBVPx4QIEdwwW9KDoXcTOYqh7P4BgEiMeHKLev/Lc7REGTqF
   O3NtRU8QuQ4u8aTgYnB3qXqp5j6DJiD+4O7UoJ8CQo1NByfalr0pRqX0d
   75nZn/Bpi5H5VmR7YvDEjLqSuG/RaoaEYA7u8YsA2fnaVBmdfxTONQNOb
   A==;
X-CSE-ConnectionGUID: 3Y5ZBVZ1QsaH7ctp2CZiqQ==
X-CSE-MsgGUID: n52Hvya/Tz69/3y1xzgzAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59910280"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="59910280"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 15:04:47 -0700
X-CSE-ConnectionGUID: HZdXRXlVTaiTT4J7/lsFHA==
X-CSE-MsgGUID: RnQ/MUw0TbuIvYEex13tew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; 
   d="scan'208";a="172983123"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Sep 2025 15:04:45 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwpPH-0000fS-1C;
	Thu, 11 Sep 2025 22:04:43 +0000
Date: Fri, 12 Sep 2025 06:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 422/440] arch/sparc/include/asm/pgtable_32.h:423:9:
 error: implicit declaration of function 'remap_pfn_range_prepare'; did you
 mean 'io_remap_pfn_range_prepare'?
Message-ID: <202509120538.KccGKzFg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   31690ac95cb30fd036eeda36844c6e2820685e7c
commit: 04ff8d62985b8be5f5fc8547a828fbb051c2f927 [422/440] mm: introduce io_remap_pfn_range_[prepare, complete]()
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250912/202509120538.KccGKzFg-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120538.KccGKzFg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509120538.KccGKzFg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable.h:7,
                    from arch/sparc/include/asm/viking.h:13,
                    from arch/sparc/include/asm/mbus.h:12,
                    from arch/sparc/include/asm/elf_32.h:94,
                    from arch/sparc/include/asm/elf.h:7,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from init/main.c:18:
   arch/sparc/include/asm/pgtable_32.h: In function 'io_remap_pfn_range_prepare':
>> arch/sparc/include/asm/pgtable_32.h:423:9: error: implicit declaration of function 'remap_pfn_range_prepare'; did you mean 'io_remap_pfn_range_prepare'? [-Wimplicit-function-declaration]
     423 |         remap_pfn_range_prepare(desc, calc_io_remap_pfn(pfn));
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         io_remap_pfn_range_prepare
   arch/sparc/include/asm/pgtable_32.h: In function 'io_remap_pfn_range_complete':
>> arch/sparc/include/asm/pgtable_32.h:431:16: error: implicit declaration of function 'remap_pfn_range_complete'; did you mean 'io_remap_pfn_range_complete'? [-Wimplicit-function-declaration]
     431 |         return remap_pfn_range_complete(vma, addr, calc_io_remap_pfn(pfn),
         |                ^~~~~~~~~~~~~~~~~~~~~~~~
         |                io_remap_pfn_range_complete
   In file included from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from init/main.c:22:
   include/linux/mm.h: At top level:
   include/linux/mm.h:3643:6: warning: conflicting types for 'remap_pfn_range_prepare'; have 'void(struct vm_area_desc *, long unsigned int)'
    3643 | void remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pfn);
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/pgtable_32.h:423:9: note: previous implicit declaration of 'remap_pfn_range_prepare' with type 'void(struct vm_area_desc *, long unsigned int)'
     423 |         remap_pfn_range_prepare(desc, calc_io_remap_pfn(pfn));
         |         ^~~~~~~~~~~~~~~~~~~~~~~


vim +423 arch/sparc/include/asm/pgtable_32.h

   419	
   420	static inline void io_remap_pfn_range_prepare(struct vm_area_desc *desc, unsigned long pfn,
   421			unsigned long size)
   422	{
 > 423		remap_pfn_range_prepare(desc, calc_io_remap_pfn(pfn));
   424	}
   425	#define io_remap_pfn_range_prepare io_remap_pfn_range_prepare
   426	
   427	static inline int io_remap_pfn_range_complete(struct vm_area_struct *vma,
   428			unsigned long addr, unsigned long pfn, unsigned long size,
   429			pgprot_t prot)
   430	{
 > 431		return remap_pfn_range_complete(vma, addr, calc_io_remap_pfn(pfn),
   432				size, prot);
   433	}
   434	#define io_remap_pfn_range_complete io_remap_pfn_range_complete
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
