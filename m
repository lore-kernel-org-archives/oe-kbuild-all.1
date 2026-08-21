Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270F228505E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 01:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787276078; cv=none; b=QoAQlEZpi36Rm30ei3cD87s7NkvYv/Nes50nKoUnL/gElmmfl/MHaY1PLlStIRyCecDoH/9Za4k3euBXhwBg1111v9Qvz1pbmLSYcENquCOmxDl/FvXdV1/31fL71H7GlzlQReTzXoLYP71YTAWE/PCNuLeNCcv1Zf0bUzL5gCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787276078; c=relaxed/simple;
	bh=0p6a6NnEY0h6ZNg0d/QcQYJu/VP8lBYEbzYyHQUuHpU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U0DM1M6VmxKp4IA7qZfWJVrB1WZaTmQY9bLFebiMuWLqdo470JSJQ7EJbLDLwH5SqgMIg+VqT1bL5iSimrPJ8MsBPNUdZlzbn/pkCAAlVE86UwlCo0DsZL4adpSY0DcZ0g4WHnrPGcNFlU3+/ROHNO7nYrnN9VninnntwTL4EPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTVQ+MmI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTVQ+MmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787276076; x=1818812076;
  h=date:from:to:cc:subject:message-id;
  bh=0p6a6NnEY0h6ZNg0d/QcQYJu/VP8lBYEbzYyHQUuHpU=;
  b=bTVQ+MmIBDyPQW/TADLfqBCe9KzqfBQM1blocke0kOnzQ4HmRO3R3y7f
   U1HiKqhQ4CJEJn3zibXV7F9rB/YTh/vj89jrAwS4yiK0/NDla3Ut421Yr
   KHXqMoe/4pnmHrz28NQyR6DCwqubnl/Dv0mNl7dXRsXJJOHI9snUVrCo3
   i3OKuP0C5ia1mwXzHeIKhCgqA2OP8yziZIvaNfdKBljzMzSIF8ljaSA5l
   27ZGk2XEcZoPyxqVjWWm57ADbea9LSD1F1muByllsTHemvWTSoStd1Mo9
   CqsI/dFoBr4lo2uMkX1fX+2S4O9pqn/Bt3z75UXi8ohbTJK/UVRkn3WYM
   A==;
X-CSE-ConnectionGUID: zbDaUWE5R9eKZhBKVA5OgQ==
X-CSE-MsgGUID: fw4BRuxqQsO/Wc18PSDAhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="110609782"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="110609782"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 18:34:36 -0700
X-CSE-ConnectionGUID: E2NyVHpdRe6pl1amHWeEBg==
X-CSE-MsgGUID: KzahseJwSTCoesa77cOvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="270011379"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Aug 2026 18:34:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxE9Q-000000007dN-24Yg;
	Fri, 21 Aug 2026 01:34:32 +0000
Date: Fri, 21 Aug 2026 03:34:15 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:module-combine-init-allocations 1/6]
 mm/execmem.c:525:17: error: implicit declaration of function
 'execmem_set_direct_map_valid'
Message-ID: <202608210359.JHtbdi9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git module-combine-init-allocations
head:   971ad17aef7db54eeb51f42d5fb415093b8ce5be
commit: 199c1b576bd83e93eb428181390a4f4cadae24b5 [1/6] mm: execmem: Introduce execmem_truncate()
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260821/202608210359.JHtbdi9k-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210359.JHtbdi9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608210359.JHtbdi9k-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/execmem.c: In function 'execmem_free':
>> mm/execmem.c:525:17: error: implicit declaration of function 'execmem_set_direct_map_valid' [-Wimplicit-function-declaration]
     525 |                 execmem_set_direct_map_valid(vm, true);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/execmem_set_direct_map_valid +525 mm/execmem.c

   513	
   514	void execmem_free(void *ptr)
   515	{
   516		/*
   517		 * This memory may be RO, and freeing RO memory in an interrupt is not
   518		 * supported by vmalloc.
   519		 */
   520		WARN_ON(in_interrupt());
   521	
   522		if (!execmem_cache_free(ptr)) {
   523			struct vm_struct *vm = find_vm_area(ptr);
   524	
 > 525			execmem_set_direct_map_valid(vm, true);
   526			vfree(ptr);
   527		}
   528	}
   529	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
