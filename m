Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63882145B27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580262; cv=none; b=WS3fhvXfp3KAWzJ/VLMRoCzU5siDB35t3+KmGzY8Oxy2V28vUrzt1teSfXyDCWWprhbh0JcfJ1GOAUZUD1+iLZKJSErZawzqr6PxRax2tQUwh8xXIcDGtwGynO2/eFksEChQH7y7+elbJqTnOJk/+hFPknZMt008R5S6S4UPVnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580262; c=relaxed/simple;
	bh=w65JVPyYlF7r4QqJeG3oWgiImMlexFnF1x3ZayOvnLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FpNDV3AKbCrUHr9oEXf92T1hXelKYXNOpEXKlpRXcpHy/sHgz5zsoC6C4aivL3x4PnCQv8HpKou5+TUcMgvVEqtRguZZ8dB4BGMZSpy1DdTxVy+ontxeCI3yeE+xqvc97D+251HUSJo/aiuManV69hCZn+oXXl9vsIcdcKfJm9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O09Qm+SD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O09Qm+SD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777580261; x=1809116261;
  h=date:from:to:cc:subject:message-id;
  bh=w65JVPyYlF7r4QqJeG3oWgiImMlexFnF1x3ZayOvnLk=;
  b=O09Qm+SDrn8TpoFljo2IYyJHl+vkBvc5Vok5tAqg9TD899ob06nYQBX5
   c0wfb1Z135F0e86W4IUA1PnQWSkPHmstfqjHfqq5xNEcHnn7zxxNX95qR
   P9j/XFHclaEF8xEYz+PorpxrD+9O6rBD5/rt027pqnqsPgJIsa8YMAMHw
   9ulQeijG3fz7+RMUxWY3/ORaEUnCX9TEIa8n5/hrsxXoeeG+ccLs+LWZA
   qdoW+cfuJBncvX0UYCptV9yHUVx+kISMWqYaSzKHSnhnXOCL9HqdKJqRy
   S/H8ApOYbsLuLO5wYK8dZpFwPtefRogarbuN59gaNMVcfCOD+o8mJLx9D
   A==;
X-CSE-ConnectionGUID: EeO25uMdQjqGxjFJUxQN9w==
X-CSE-MsgGUID: aLGdhMI5TbWg2rAGuhq4ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="90009597"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="90009597"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 13:17:41 -0700
X-CSE-ConnectionGUID: hYltPkCARqqeetHMFdJkDw==
X-CSE-MsgGUID: B7vRwXxFQSuAXYIM5DoRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; 
   d="scan'208";a="238661028"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 30 Apr 2026 13:17:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIXpJ-000000004sr-2k6X;
	Thu, 30 Apr 2026 20:17:37 +0000
Date: Thu, 30 Apr 2026 22:16:45 +0200
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./arch/riscv/include/asm/pgtable.h:925:16: error: implicit
 declaration of function 'pte_swp_exclusive'; did you mean
 'pmd_swp_exclusive'?
Message-ID: <202604302230.P4UrOg3x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-add-softleaf_to_pmd-and-convert-existing-callers/20260430-233124
head:   62010337c75b14016955c092466110e39a5ee1a0
commit: 66f97c2502af85f1ebfa1006c2a970b2eda0d5c0 mm: add PMD swap entry detection support
date:   5 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260430/202604302230.P4UrOg3x-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604302230.P4UrOg3x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604302230.P4UrOg3x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/pgtable.h:6,
                    from ./include/linux/mm.h:31,
                    from arch/riscv/kernel/asm-offsets.c:9:
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_exclusive':
>> ./arch/riscv/include/asm/pgtable.h:925:16: error: implicit declaration of function 'pte_swp_exclusive'; did you mean 'pmd_swp_exclusive'? [-Wimplicit-function-declaration]
     925 |         return pte_swp_exclusive(pmd_pte(pmd));
         |                ^~~~~~~~~~~~~~~~~
         |                pmd_swp_exclusive
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_mkexclusive':
>> ./arch/riscv/include/asm/pgtable.h:930:24: error: implicit declaration of function 'pte_swp_mkexclusive'; did you mean 'pmd_swp_mkexclusive'? [-Wimplicit-function-declaration]
     930 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~
         |                        pmd_swp_mkexclusive
>> ./arch/riscv/include/asm/pgtable.h:930:24: error: incompatible type for argument 1 of 'pte_pmd'
     930 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   ./arch/riscv/include/asm/pgtable.h:748:35: note: expected 'pte_t' but argument is of type 'int'
     748 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ~~~~~~^~~
   ./arch/riscv/include/asm/pgtable.h: In function 'pmd_swp_clear_exclusive':
>> ./arch/riscv/include/asm/pgtable.h:935:24: error: implicit declaration of function 'pte_swp_clear_exclusive'; did you mean 'pmd_swp_clear_exclusive'? [-Wimplicit-function-declaration]
     935 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        pmd_swp_clear_exclusive
   ./arch/riscv/include/asm/pgtable.h:935:24: error: incompatible type for argument 1 of 'pte_pmd'
     935 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        |
         |                        int
   ./arch/riscv/include/asm/pgtable.h:748:35: note: expected 'pte_t' but argument is of type 'int'
     748 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ~~~~~~^~~
   ./arch/riscv/include/asm/pgtable.h: At top level:
>> ./arch/riscv/include/asm/pgtable.h:1201:20: error: conflicting types for 'pte_swp_exclusive'; have 'bool(pte_t)' {aka '_Bool(pte_t)'}
    1201 | static inline bool pte_swp_exclusive(pte_t pte)
         |                    ^~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:925:16: note: previous implicit declaration of 'pte_swp_exclusive' with type 'int()'
     925 |         return pte_swp_exclusive(pmd_pte(pmd));
         |                ^~~~~~~~~~~~~~~~~
>> ./arch/riscv/include/asm/pgtable.h:1206:21: error: conflicting types for 'pte_swp_mkexclusive'; have 'pte_t(pte_t)'
    1206 | static inline pte_t pte_swp_mkexclusive(pte_t pte)
         |                     ^~~~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:930:24: note: previous implicit declaration of 'pte_swp_mkexclusive' with type 'int()'
     930 |         return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~
>> ./arch/riscv/include/asm/pgtable.h:1211:21: error: conflicting types for 'pte_swp_clear_exclusive'; have 'pte_t(pte_t)'
    1211 | static inline pte_t pte_swp_clear_exclusive(pte_t pte)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/pgtable.h:935:24: note: previous implicit declaration of 'pte_swp_clear_exclusive' with type 'int()'
     935 |         return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~


vim +925 ./arch/riscv/include/asm/pgtable.h

   922	
   923	static inline bool pmd_swp_exclusive(pmd_t pmd)
   924	{
 > 925		return pte_swp_exclusive(pmd_pte(pmd));
   926	}
   927	
   928	static inline pmd_t pmd_swp_mkexclusive(pmd_t pmd)
   929	{
 > 930		return pte_pmd(pte_swp_mkexclusive(pmd_pte(pmd)));
   931	}
   932	
   933	static inline pmd_t pmd_swp_clear_exclusive(pmd_t pmd)
   934	{
 > 935		return pte_pmd(pte_swp_clear_exclusive(pmd_pte(pmd)));
   936	}
   937	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
