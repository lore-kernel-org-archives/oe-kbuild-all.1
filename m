Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D980126FA62
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363171; cv=none; b=iRnvH9iCfHqnPtqRBy7qEN4v2mwUOSTCWz4BWTdGbXUB0mrL2QT9D3jjueHtlFa2RXmWtOnMy5lD10AQDnqEweonwgssgMogmqCi6YE10wNonNZnW2NHOUYn4vkItOltSm9zk8LN1WtqmslPvZpWglaWMQq47Tq0iXOxiYQwek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363171; c=relaxed/simple;
	bh=j17YAtHKER+YOnY2027p4TAksXzqhC0bsWkLo6x/H/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ud3JBeEd7n5wQD1L8dEH4jb4YYz9a6579KKHRAjtmWZ2SG6pdpcdrgyljuNVP4y8mvjHUah+XgNoI9OoA15V5C3hexh8YgJMj/C17pfvcGrUlNP5ITQ/FLD+EoR3TxykRfRTtXOG0z5VGMfEY3kPjtRXwqTwPdpelTeWsUrAXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYGMRY3Q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYGMRY3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751363168; x=1782899168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j17YAtHKER+YOnY2027p4TAksXzqhC0bsWkLo6x/H/w=;
  b=FYGMRY3QEOoe2tZiNJZixxpL4n4Sbb/SzEn6JQ+9pbUrkiM0dSQ+uuRq
   F3f69RHIeyutU0onrHi0LRCKI7Kc4XvcABrTK8jWEAJT7BKpNlNI69EXg
   p0zVXPYxmc3MteheCAWV609ndR1vVTv7atIxiHRHfRceaWW9gutNEgFV5
   sZ9IDf/HDck+Vsf6GtcBCpht9yJAhjPLsAkqjCVbgl9l/m4XnHZL8UrSL
   XwLQYJqTxAZlXwyK5C0T7Q/9gf+rxw2DoS7I5FQDlhwZiGYxRJzbmNAto
   lca++461v567Wb3LElb/YKfsLO2jX/CXkxWCaRb2hwVmQebZU7+GGV7dj
   A==;
X-CSE-ConnectionGUID: CnbOPSt1Sxexyl1k02x8Lg==
X-CSE-MsgGUID: nFYnrZSeS6CmAym2xCNlZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64971910"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="64971910"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 02:46:07 -0700
X-CSE-ConnectionGUID: IcefsN+uRD2FR1Gmyq6mrA==
X-CSE-MsgGUID: SfYcxiQUQ6edx/hzV9k62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="158115804"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 01 Jul 2025 02:46:06 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWXYx-00002v-2H;
	Tue, 01 Jul 2025 09:46:03 +0000
Date: Tue, 1 Jul 2025 11:45:24 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 arch/x86/mm/pageattr.c:1787:5: warning: no previous prototype for function
 'set_memory_global'
Message-ID: <202507011110.QFxtjmpf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   890108d01fde2c3b6dde4d169b695ce64362f135
commit: eac7073aa69aa1cac819aa712146284f53f642b1 [1605/1605] x86/mm/pti: Clear Global bit more aggressively
config: x86_64-buildonly-randconfig-2001-20250501 (https://download.01.org/0day-ci/archive/20250701/202507011110.QFxtjmpf-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507011110.QFxtjmpf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507011110.QFxtjmpf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/mm/pageattr.c:170:6: warning: no previous prototype for function 'arch_invalidate_pmem' [-Wmissing-prototypes]
     170 | void arch_invalidate_pmem(void *addr, size_t size)
         |      ^
   arch/x86/mm/pageattr.c:170:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     170 | void arch_invalidate_pmem(void *addr, size_t size)
         | ^
         | static 
   arch/x86/mm/pageattr.c:556:17: warning: variable 'old_pte' set but not used [-Wunused-but-set-variable]
     556 |         pte_t new_pte, old_pte, *tmp;
         |                        ^
   arch/x86/mm/pageattr.c:1781:5: warning: no previous prototype for function 'set_memory_nonglobal' [-Wmissing-prototypes]
    1781 | int set_memory_nonglobal(unsigned long addr, int numpages)
         |     ^
   arch/x86/mm/pageattr.c:1781:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1781 | int set_memory_nonglobal(unsigned long addr, int numpages)
         | ^
         | static 
>> arch/x86/mm/pageattr.c:1787:5: warning: no previous prototype for function 'set_memory_global' [-Wmissing-prototypes]
    1787 | int set_memory_global(unsigned long addr, int numpages)
         |     ^
   arch/x86/mm/pageattr.c:1787:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1787 | int set_memory_global(unsigned long addr, int numpages)
         | ^
         | static 
   4 warnings generated.


vim +/set_memory_global +1787 arch/x86/mm/pageattr.c

  1786	
> 1787	int set_memory_global(unsigned long addr, int numpages)
  1788	{
  1789		return change_page_attr_set(&addr, numpages,
  1790					    __pgprot(_PAGE_GLOBAL), 0);
  1791	}
  1792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
