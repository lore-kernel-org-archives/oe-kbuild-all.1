Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55223B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 04:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737692505; cv=none; b=GQknOaudbqnyL4ICWgvAPMHaXWoHlL4MrvXJnfi8oM/n67Xx3wQOy1XukuKHmAwkTlPhLaGSGVMwyOseatsVn93sGdty/EPdH0rF7eJUTTkW+Fq/MpL0fdS5G8irWTu9xxYg/r0KRM9aMQB9fmY4zm67ldUqY+FN+duOFAcrVtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737692505; c=relaxed/simple;
	bh=ERuCSPtDdKj1NtE3jpbJaVHCV+9fVL+o0QB6Rl5PP/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AS/7UPuPWkyghR86xzY8pAQ0/ZQAYKgOAkQreyRq3izGsUjUAHc3I5aab3QlXV7akWHKpuHvTlOF3S26c9e4ljEK8piJIJxP0ruCjwnDKSZkLM1VASTNnPDBjm2Lpt3X5GvpcGMiZMI0MytG9u6QcY3SnHrwDvzmUb6YQkTJ2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuSsvae+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuSsvae+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737692503; x=1769228503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ERuCSPtDdKj1NtE3jpbJaVHCV+9fVL+o0QB6Rl5PP/s=;
  b=CuSsvae+HFthfVmqQ+GQDU1TItZxTiYiiNtdpAPisMt2AAub336tG+Ly
   PDw5CN5x8GOdSdS0wZ9ZYYZ/o9ad8AE2c9Jd050XhLDs3vqy00DBG5TYY
   +dlMFEjh9cJarNjQ3iODCJLa2Mgn4zy9mVlXutkDEDTh5NBN1QNcZC3Ne
   jUKAsXNMDcoMm92bpGTyMR4xyf2CtwRc665AeLK98F5fNNg4FU1UuVHlS
   LKcojedgFgqxeJyRUvzRp00sJmBp/PkRzlj+L6t7S4Av+CxalOb4iF7Fs
   mGNA/r/ven0BlF0Ua0TUZtv7e7lUcR8ITJCKgjVYmNTvsm6cI++JkNwH4
   Q==;
X-CSE-ConnectionGUID: O/fMNt4hQ4KpNqzkPKGw9A==
X-CSE-MsgGUID: xwECHutJSnySa+mMTWTHwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="42147989"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="42147989"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 20:21:42 -0800
X-CSE-ConnectionGUID: AKK8xGifTpygxtk9hm1e2g==
X-CSE-MsgGUID: Askd0pMhTkWzw4vTQoMxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107479075"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2025 20:21:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbBCN-000c8h-1o;
	Fri, 24 Jan 2025 04:21:39 +0000
Date: Fri, 24 Jan 2025 12:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.13/invlpgb 9/12] arch/x86/mm/tlb.c:1317:3: error: call to
 undeclared function 'broadcast_tlb_flush'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202501241212.SQtopXFd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.13/invlpgb
head:   0eac464fd4b743bca914b4703038caae98b43b12
commit: 804d8b879afa408752ba12eb641ba95be1e865e8 [9/12] x86/mm: enable broadcast TLB invalidation for multi-threaded processes
config: x86_64-buildonly-randconfig-004-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241212.SQtopXFd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501241212.SQtopXFd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241212.SQtopXFd-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c:1316:52: error: no member named 'broadcast_asid' in 'mm_context_t'
    1316 |         if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm->context.broadcast_asid) {
         |                                               ~~~~~~~~~~~ ^
>> arch/x86/mm/tlb.c:1317:3: error: call to undeclared function 'broadcast_tlb_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1317 |                 broadcast_tlb_flush(info);
         |                 ^
   arch/x86/mm/tlb.c:1317:3: note: did you mean 'trace_tlb_flush'?
   include/trace/events/tlb.h:38:1: note: 'trace_tlb_flush' declared here
      38 | TRACE_EVENT(tlb_flush,
         | ^
   include/linux/tracepoint.h:611:2: note: expanded from macro 'TRACE_EVENT'
     611 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:473:2: note: expanded from macro 'DECLARE_TRACE'
     473 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:278:21: note: expanded from macro '__DECLARE_TRACE'
     278 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:67:1: note: expanded from here
      67 | trace_tlb_flush
         | ^
>> arch/x86/mm/tlb.c:1320:3: error: call to undeclared function 'count_tlb_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1320 |                 count_tlb_flush(mm);
         |                 ^
   arch/x86/mm/tlb.c:1320:3: note: did you mean 'trace_tlb_flush'?
   include/trace/events/tlb.h:38:1: note: 'trace_tlb_flush' declared here
      38 | TRACE_EVENT(tlb_flush,
         | ^
   include/linux/tracepoint.h:611:2: note: expanded from macro 'TRACE_EVENT'
     611 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:473:2: note: expanded from macro 'DECLARE_TRACE'
     473 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:278:21: note: expanded from macro '__DECLARE_TRACE'
     278 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:67:1: note: expanded from here
      67 | trace_tlb_flush
         | ^
   3 errors generated.


vim +/broadcast_tlb_flush +1317 arch/x86/mm/tlb.c

  1283	
  1284	void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
  1285					unsigned long end, unsigned int stride_shift,
  1286					bool freed_tables)
  1287	{
  1288		struct flush_tlb_info *info;
  1289		unsigned long threshold = tlb_single_page_flush_ceiling;
  1290		u64 new_tlb_gen;
  1291		int cpu;
  1292	
  1293		if (static_cpu_has(X86_FEATURE_INVLPGB))
  1294			threshold *= invlpgb_count_max;
  1295	
  1296		cpu = get_cpu();
  1297	
  1298		/* Should we flush just the requested range? */
  1299		if ((end == TLB_FLUSH_ALL) ||
  1300		    ((end - start) >> stride_shift) > threshold) {
  1301			start = 0;
  1302			end = TLB_FLUSH_ALL;
  1303		}
  1304	
  1305		/* This is also a barrier that synchronizes with switch_mm(). */
  1306		new_tlb_gen = inc_mm_tlb_gen(mm);
  1307	
  1308		info = get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
  1309					  new_tlb_gen);
  1310	
  1311		/*
  1312		 * flush_tlb_multi() is not optimized for the common case in which only
  1313		 * a local TLB flush is needed. Optimize this use-case by calling
  1314		 * flush_tlb_func_local() directly in this case.
  1315		 */
  1316		if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm->context.broadcast_asid) {
> 1317			broadcast_tlb_flush(info);
  1318		} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
  1319			flush_tlb_multi(mm_cpumask(mm), info);
> 1320			count_tlb_flush(mm);
  1321		} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
  1322			lockdep_assert_irqs_enabled();
  1323			local_irq_disable();
  1324			flush_tlb_func(info);
  1325			local_irq_enable();
  1326		}
  1327	
  1328		put_flush_tlb_info();
  1329		put_cpu();
  1330		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
  1331	}
  1332	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
