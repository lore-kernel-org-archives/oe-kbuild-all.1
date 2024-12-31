Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F0136E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 00:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735603987; cv=none; b=ORy3D1LOSNZAlOO35FFShZ3aAo/395M/ywgPcrMdCm+jC4mhUsC9126VlZelybBh4j0nHHgVwAwVzzPKmL0ZrenWrfmVhe5vx0zOX7vOeoYKG9HWJMDWzOrPKU55mp3cDqsETXG6s3+5k9IEPpEiWMs4Ja1se2PLc8RGKCYOC5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735603987; c=relaxed/simple;
	bh=NjPjW/W6wJ61sFKLJwFr9DNoQQYWxv+56/E7LxIAUHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyzFYtbQLGcf2NfBy8Ny+P+TUKI1IdBLJNLnNIHzJwOZprJrqC7zkapV8mw9e6ee0joV75I+48vxyxR70dVcVFNUxNqNAlGQ97UwnBOLixTFo8Ui/hG0ibd0DYuUfPQpKNGY/XsQ8dpLbK0x1F9YwtPr12iZqBbJgIMMLLKyp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QP5/kSF2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QP5/kSF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735603985; x=1767139985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjPjW/W6wJ61sFKLJwFr9DNoQQYWxv+56/E7LxIAUHc=;
  b=QP5/kSF2Cn44shA2E8awhWmq5Au0domoERLN8E/oPMLsjBU5Yrlx903e
   xy7a1iSNVvg/y4bvYWP/c1je5sNPe9S4g/rrYUABn7GF1VFTiddZ83+q4
   i3SLotRJCagBuamTj7Q1HpdtzJh/YVLDPI8QuEHalkgQ+p53S/rjCRniE
   jO/51j1/KD8zgxKaQoOAB6PwEYmeSffCk2SzhNPwse4uH8zJAU8gtSx11
   c5nte9pmAXoMPLEhFgYjfc24lnpTlXcH6EBOlRkj4XnHbbvsPQPuHKYoH
   nn/cWTEu/6PmA6HwOAkBRrJCx6ZsSJlb1WYt+XRL18S9jSJ5+H99Um4tl
   A==;
X-CSE-ConnectionGUID: MppWyQOwRgig4ot78qBSWA==
X-CSE-MsgGUID: UppQne+uS3WasBX4+YKTwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="46476962"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="46476962"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:13:04 -0800
X-CSE-ConnectionGUID: GVOe+FvOQZGhBCDbOoisyw==
X-CSE-MsgGUID: 5RiiZjnfQ8S+Wok9SqowzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101407679"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Dec 2024 16:13:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSPsa-0006UB-2U;
	Tue, 31 Dec 2024 00:13:00 +0000
Date: Tue, 31 Dec 2024 08:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb 9/12] arch/x86/mm/tlb.c:1315:52: error: no member
 named 'broadcast_asid' in 'mm_context_t'
Message-ID: <202412310824.4ObTMqDE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/invlpgb
head:   6960238e894267da7a06ad453cebe17c2cf72f4a
commit: ddfe42c6d6b421fc0fa05306cb96eee737d6bb42 [9/12] x86/mm: enable broadcast TLB invalidation for multi-threaded processes
config: x86_64-randconfig-078-20241231 (https://download.01.org/0day-ci/archive/20241231/202412310824.4ObTMqDE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310824.4ObTMqDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310824.4ObTMqDE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/mm/tlb.c:4:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/mm/tlb.c:1315:52: error: no member named 'broadcast_asid' in 'mm_context_t'
    1315 |         if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm->context.broadcast_asid) {
         |                                               ~~~~~~~~~~~ ^
>> arch/x86/mm/tlb.c:1316:3: error: call to undeclared function 'broadcast_tlb_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1316 |                 broadcast_tlb_flush(info);
         |                 ^
   arch/x86/mm/tlb.c:1316:3: note: did you mean 'trace_tlb_flush'?
   include/trace/events/tlb.h:38:1: note: 'trace_tlb_flush' declared here
      38 | TRACE_EVENT(tlb_flush,
         | ^
   include/linux/tracepoint.h:587:2: note: expanded from macro 'TRACE_EVENT'
     587 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:453:2: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:275:21: note: expanded from macro '__DECLARE_TRACE'
     275 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:80:1: note: expanded from here
      80 | trace_tlb_flush
         | ^
>> arch/x86/mm/tlb.c:1319:3: error: call to undeclared function 'count_tlb_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1319 |                 count_tlb_flush(mm);
         |                 ^
   arch/x86/mm/tlb.c:1319:3: note: did you mean 'trace_tlb_flush'?
   include/trace/events/tlb.h:38:1: note: 'trace_tlb_flush' declared here
      38 | TRACE_EVENT(tlb_flush,
         | ^
   include/linux/tracepoint.h:587:2: note: expanded from macro 'TRACE_EVENT'
     587 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:453:2: note: expanded from macro 'DECLARE_TRACE'
     453 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:275:21: note: expanded from macro '__DECLARE_TRACE'
     275 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:80:1: note: expanded from here
      80 | trace_tlb_flush
         | ^
   1 warning and 3 errors generated.


vim +1315 arch/x86/mm/tlb.c

  1282	
  1283	void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
  1284					unsigned long end, unsigned int stride_shift,
  1285					bool freed_tables)
  1286	{
  1287		struct flush_tlb_info *info;
  1288		unsigned long threshold = tlb_single_page_flush_ceiling;
  1289		u64 new_tlb_gen;
  1290		int cpu;
  1291	
  1292		if (static_cpu_has(X86_FEATURE_INVLPGB))
  1293			threshold *= invlpgb_count_max;
  1294	
  1295		cpu = get_cpu();
  1296	
  1297		/* Should we flush just the requested range? */
  1298		if ((end == TLB_FLUSH_ALL) ||
  1299		    ((end - start) >> stride_shift) > threshold) {
  1300			start = 0;
  1301			end = TLB_FLUSH_ALL;
  1302		}
  1303	
  1304		/* This is also a barrier that synchronizes with switch_mm(). */
  1305		new_tlb_gen = inc_mm_tlb_gen(mm);
  1306	
  1307		info = get_flush_tlb_info(mm, start, end, stride_shift, freed_tables,
  1308					  new_tlb_gen);
  1309	
  1310		/*
  1311		 * flush_tlb_multi() is not optimized for the common case in which only
  1312		 * a local TLB flush is needed. Optimize this use-case by calling
  1313		 * flush_tlb_func_local() directly in this case.
  1314		 */
> 1315		if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm->context.broadcast_asid) {
> 1316			broadcast_tlb_flush(info);
  1317		} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
  1318			flush_tlb_multi(mm_cpumask(mm), info);
> 1319			count_tlb_flush(mm);
  1320		} else if (mm == this_cpu_read(cpu_tlbstate.loaded_mm)) {
  1321			lockdep_assert_irqs_enabled();
  1322			local_irq_disable();
  1323			flush_tlb_func(info);
  1324			local_irq_enable();
  1325		}
  1326	
  1327		put_flush_tlb_info();
  1328		put_cpu();
  1329		mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
  1330	}
  1331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
