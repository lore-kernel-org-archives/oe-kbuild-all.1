Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAF23EA7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715793418; cv=none; b=hhu9vsMnlwxFUCKXF60WosXqsY87vhn60Inbrk6r6YM/FnX5YpHxb9QBMRY5owt0IKRgCy3q9ybApq57uNSPFHW6hQprwewK/nk/0I361mgKeo8bd6ob/qfDJJkSBkvS6JS9JZJih2YMLoID+BHA7OnYA/P8LRwgn2maA96qGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715793418; c=relaxed/simple;
	bh=zpFmLI+kdiXG83RlvhTyU6ZEKG13X+OgpPys1Z4CLwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jB+raQRUAeXQ/EJXbjv74sWBlGb4o5On2OC5X/ImGQO4fZMaHWAAKDLsRAlfC6aN8Ib6nRxcPQpEpBb+b3OsjG/nyETpGuTfcFW5/FM4COVxsk6i74juoSIsuf3+KqlmpQneNz6/pY3kPrTDzqRc9u7G6DX+RzByCY/A8vqrYOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jf3GrKKw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jf3GrKKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715793417; x=1747329417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zpFmLI+kdiXG83RlvhTyU6ZEKG13X+OgpPys1Z4CLwE=;
  b=Jf3GrKKwEBjfCiB5hmB4TWsFys1gj5XGtZe4A3XACazGZBUMXMweuKFz
   qruS1FyiRMoRT6lgzU07XEt489mB/NX9DehhoXtWeryIha/APsf33hi/M
   q6DMXWQSdJaQ4ANITJOvQsMkML4XT83p77Xcte1HZI5d300m9eFMvZ6Rs
   2J07ayytLkfxzBbTsIV+q6973NsSGS218wc2HY+E5lkI3KyVB8TYjPdIw
   JsVCvyp9vnAwoNm2fhgnj1rV7bkBgf1Z71YayXRDHbmoLkMUE5Dsw1BrY
   qB4ExL4J4Z7oY4UQzRXhHetoDcczZI6/1t2HkRHfxfqTRE5x45ToAIk9m
   Q==;
X-CSE-ConnectionGUID: 1WxJ3BcmRPqVNm+Gt4awwQ==
X-CSE-MsgGUID: KpPOdNJ6RlGvgL7XapRnnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23262273"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="23262273"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:16:56 -0700
X-CSE-ConnectionGUID: 75uSRRx3Tv+KgzRI1NH9dQ==
X-CSE-MsgGUID: 3LPts6I5RKqVoZH5MlNapg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35678645"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2024 10:16:55 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7IFI-000D4v-39;
	Wed, 15 May 2024 17:16:52 +0000
Date: Thu, 16 May 2024 01:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [jic23-cxl-staging:arm-numa-fixes 6/11]
 arch/arm64/include/asm/sparsemem.h:34:29: error: redefinition of
 'phys_to_target_node'
Message-ID: <202405160145.lGsTS81g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/cxl-staging.git arm-numa-fixes
head:   d077bf9570e8024f6d670d5662b62778715084fc
commit: 67c8bdd7ebb95e48944e4ebffe0a6ce6b68d1663 [6/11] arm64: memblock: Introduce a generic phys_addr_to_target_node()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240516/202405160145.lGsTS81g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160145.lGsTS81g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160145.lGsTS81g-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/page-flags-layout.h:30,
                    from include/linux/mmzone.h:20,
                    from include/linux/swap.h:7,
                    from arch/arm64/mm/init.c:12:
   arch/arm64/include/asm/sparsemem.h:32:36: error: redefinition of 'memory_add_physaddr_to_nid'
      32 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:63:5: note: in expansion of macro 'memory_add_physaddr_to_nid'
      63 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swap.h:5:
   include/linux/numa.h:47:19: note: previous definition of 'memory_add_physaddr_to_nid' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/include/asm/sparsemem.h:34:29: error: redefinition of 'phys_to_target_node'
      34 | #define phys_to_target_node phys_to_target_node
         |                             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:75:5: note: in expansion of macro 'phys_to_target_node'
      75 | int phys_to_target_node(phys_addr_t start)
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/numa.h:51:19: note: previous definition of 'phys_to_target_node' with type 'int(phys_addr_t)' {aka 'int(long long unsigned int)'}
      51 | static inline int phys_to_target_node(u64 start)
         |                   ^~~~~~~~~~~~~~~~~~~


vim +/phys_to_target_node +34 arch/arm64/include/asm/sparsemem.h

    30	
    31	extern int memory_add_physaddr_to_nid(u64 addr);
    32	#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
    33	extern int phys_to_target_node(phys_addr_t start);
  > 34	#define phys_to_target_node phys_to_target_node
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
