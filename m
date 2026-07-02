Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3C82BD02
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 01:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782954614; cv=none; b=hzaMIKskw61FuCFysIobVFlRRK9dmg+djuYBewaxK1IvXXKqZI6gN2Pr+R7rrcfdQP9p/Std8+tMKIEjJM5aB52qYCFx8Ce74p9RIWnKSu1PRdMpqXm2CEQG35GhdlPJ5rrt4KTpyWkwGwX2CTJeaKQwJXqp53lcnKW97Stik8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782954614; c=relaxed/simple;
	bh=EPMBLCXGPRTQtN2OEz3i6Iw5viN8kGnkZwgNI6CKFUo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uv0pTqQHILno4EXxF4PwVCKy0p6FwumNKryMjfI9vpgvUNp+YzR7Akn/MVh13A0ohL9L2g/Qmrq3frJxQY+JMOIxX4YsMVzi/5r35+9nSq5Hc3pjpuVg5UAbcffeedmdjIRPld3MOJEiXoHye21M52I1lDmLn03CpklszxqtAQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jxp25NTe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jxp25NTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782954613; x=1814490613;
  h=date:from:to:cc:subject:message-id;
  bh=EPMBLCXGPRTQtN2OEz3i6Iw5viN8kGnkZwgNI6CKFUo=;
  b=Jxp25NTe+gM0HwvucKBvaKDbnhRYbY8hvrRkAQNZipzA/SHvxIbCsqwN
   bpEOJGqZtqGY5XuTQ2yHiSERo1PWCvT5Vp+E9x5lmN+WPkf8wD27q+FdQ
   3x55LVm5F5fctUJa0EfkEJ65x+9qqs3Skr9VOCZr/3DxlkSf094DkbFRk
   9jUwtuNX7+MRU8aLk9J9OI0JdNL2MYZXFOFhpW9FtSHhBXU7humsbneV+
   QCkhS9EZW7nN3naJNpP41BQSKfcGdShS51UHirmgO2L2xyPdnxZh/Q6Lr
   gZ8CFU7OtXBYaKbsM0gcxO/YS5pEkg5CSnBD2GFBaEWFRLwKE/qgqP2C+
   g==;
X-CSE-ConnectionGUID: jVwOEx7yRDuehtXn5BFnHw==
X-CSE-MsgGUID: mPnjFN+NR+KTGqyey8V9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="71220590"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="71220590"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:10:12 -0700
X-CSE-ConnectionGUID: 7IkGy1gNQKugOvlzGL9MQg==
X-CSE-MsgGUID: 6Cdr3LrbTaKuxzMd10Erow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="282784508"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Jul 2026 18:10:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf5wO-000000009oZ-2F3V;
	Thu, 02 Jul 2026 01:10:08 +0000
Date: Thu, 02 Jul 2026 09:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [davidhildenbrand:ptval_print 2/2]
 include/asm-generic/pgtable-nop4d.h:39:16: error: returning 'long unsigned
 int *' from a function with return type 'int' makes integer from pointer
 without a cast
Message-ID: <202607020840.w571GSuB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux ptval_print
head:   dc3342ef64ac75a436edc8bfec8e3826e15f0a91
commit: dc3342ef64ac75a436edc8bfec8e3826e15f0a91 [2/2] mm: optimize pmdp_get() and friends for folded pagetable levels
config: arm-randconfig-002-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020840.w571GSuB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020840.w571GSuB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020840.w571GSuB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from arch/arm/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/arm/kernel/asm-offsets.c:14:
   include/asm-generic/pgtable-nop4d.h:35:21: error: 'pgdp_get' declared as function returning an array
      35 | static inline pgd_t pgdp_get(pgd_t *p4dp)
         |                     ^~~~~~~~
   include/asm-generic/pgtable-nop4d.h: In function 'pgdp_get':
>> include/asm-generic/pgtable-nop4d.h:39:16: error: returning 'long unsigned int *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
      39 |         return dummy;
         |                ^~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/arm/kernel/asm-offsets.s] Error 1 shuffle=418363714
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2 shuffle=418363714
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=418363714
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=418363714
   make: Target 'prepare' not remade because of errors.


vim +39 include/asm-generic/pgtable-nop4d.h

    34	
    35	static inline pgd_t pgdp_get(pgd_t *p4dp)
    36	{
    37		pgd_t dummy = { 0 };
    38	
  > 39		return dummy;
    40	}
    41	#define pgdp_get pgdp_get
    42	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
