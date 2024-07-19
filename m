Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0F8286A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721390001; cv=none; b=VtAufKKjVfONAW9xkB/1xBzv2bslXnFa7VVfGSu0FQvQF0GM0LuB/n7n625evEPcxeCb36x4bj5Go0/uGz0KveIYbtqqeua3h03AfqgXnHvA16phV4ibOKTE7l5xiPZwrLKwsfl4kdwUHziikwtKb0S7Oet27EPeqaPxnf+y3/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721390001; c=relaxed/simple;
	bh=AUt9Nm0uEAC3wBl4ILmUunv3duNfXK82/gjC0D4ZHQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WJy5DVFVD0nWfYzXvO7FBDpeJoFOFJjjaEreLV77+zrA4gNqImfArER2SacwgXyGbrX21l/PczljwLGW2r2QAM+LOINJ2rbEtbpzjbNYQt7yzH6amBf9SBFNdquojEYWf54qzTdexkRQnfeHCeZWh3T9cTmboVMWUGt2zmknLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K39NDb/5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K39NDb/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721390000; x=1752926000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AUt9Nm0uEAC3wBl4ILmUunv3duNfXK82/gjC0D4ZHQI=;
  b=K39NDb/5WaMCMu8/tKc54M5aUXi5q7GB8LHLnPArd39+IwSrUdRX2ZH6
   6IVGlwK33C2xKq/Voqee4Pmz/E+krCAb/1YeTBHJH30XB5rspObA1c5d8
   uTegwSP3lM3mpeo65J8J/o5x3xM9nHeuU6q5RrjXi6LfZofWdGk904Wkq
   QErtHDDnBV28ODv5Zc1YDiDCoBdqgBmqmM+v4rK5mg6WNA/c+idoqnpP7
   gfzCZFfzz44guY9iUx6nZ/3dFeGbdPTISHGSj8M24q5ZwIwpSBwNjmCBU
   JcGOnWDaEDsjYjrkOzUh3l8gD6WB6JeHIu9P65vSP5rXX2GIa+F0jAn1B
   w==;
X-CSE-ConnectionGUID: K3wj+2DBSZWMKeH+8Gw4QA==
X-CSE-MsgGUID: cWnAEytxQ9imXuHkkoy9EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19178485"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="19178485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 04:53:18 -0700
X-CSE-ConnectionGUID: w2ieVd5tR7GDAfP0xyimew==
X-CSE-MsgGUID: SbODMxQSRaGSIteePK6i/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="51805481"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jul 2024 04:53:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUmAk-000i6g-0T;
	Fri, 19 Jul 2024 11:53:14 +0000
Date: Fri, 19 Jul 2024 19:52:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 25/25] include/linux/alloc_tag.h:212:1: error:
 initialization of 'pgtable_t' {aka 'struct page *'} from incompatible
 pointer type 'struct ptdesc *'
Message-ID: <202407191955.zb1UWGda-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   0cbc69cf7dfd23eaec0cd316463493ac0dbdbbb9
commit: 0cbc69cf7dfd23eaec0cd316463493ac0dbdbbb9 [25/25] pgtable: return ptdesc in pte_alloc_one series functions
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240719/202407191955.zb1UWGda-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240719/202407191955.zb1UWGda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407191955.zb1UWGda-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/kernel_stat.h:7,
                    from mm/memory.c:43:
   mm/memory.c: In function '__pte_alloc':
>> include/linux/alloc_tag.h:212:1: error: initialization of 'pgtable_t' {aka 'struct page *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
     212 | ({                                                                      \
         | ^
   include/asm-generic/pgalloc.h:95:33: note: in expansion of macro 'alloc_hooks'
      95 | #define pte_alloc_one(...)      alloc_hooks(pte_alloc_one_noprof(__VA_ARGS__))
         |                                 ^~~~~~~~~~~
   mm/memory.c:448:25: note: in expansion of macro 'pte_alloc_one'
     448 |         pgtable_t new = pte_alloc_one(mm);
         |                         ^~~~~~~~~~~~~
   mm/memory.c: In function '__do_fault':
>> mm/memory.c:4650:35: error: assignment to 'pgtable_t' {aka 'struct page *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
    4650 |                 vmf->prealloc_pte = pte_alloc_one(vma->vm_mm);
         |                                   ^
   mm/memory.c: In function 'do_fault_around':
   mm/memory.c:5013:35: error: assignment to 'pgtable_t' {aka 'struct page *'} from incompatible pointer type 'struct ptdesc *' [-Wincompatible-pointer-types]
    5013 |                 vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
         |                                   ^


vim +212 include/linux/alloc_tag.h

b951aaff503502 Suren Baghdasaryan 2024-03-21  210  
b951aaff503502 Suren Baghdasaryan 2024-03-21  211  #define alloc_hooks(_do_alloc)						\
b951aaff503502 Suren Baghdasaryan 2024-03-21 @212  ({									\
b951aaff503502 Suren Baghdasaryan 2024-03-21  213  	DEFINE_ALLOC_TAG(_alloc_tag);					\
b951aaff503502 Suren Baghdasaryan 2024-03-21  214  	alloc_hooks_tag(&_alloc_tag, _do_alloc);			\
b951aaff503502 Suren Baghdasaryan 2024-03-21  215  })
b951aaff503502 Suren Baghdasaryan 2024-03-21  216  

:::::: The code at line 212 was first introduced by commit
:::::: b951aaff503502a7fe066eeed2744ba8a6413c89 mm: enable page allocation tagging

:::::: TO: Suren Baghdasaryan <surenb@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
