Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32906A33F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 19:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735759527; cv=none; b=kjPBF5HAbW/DeiQx6dt2okqReBtY98d395CHYxOQELVQMOgBQhfjT9HtwNUDBWEVEyRiiTiO3mNyXeIJ7bbS4gTYxY4793PlIhkU0sKY/f4T/UsCaSsGzKBzV3k55jbz2hHDuZWExiSFD7m8Yx26fwE0xVO/XS8V91im30mc624=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735759527; c=relaxed/simple;
	bh=GRhkfkG8QO0TDtnl7G4bMOcDQyfQjlupIwn13EGPYVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6DaK6p3EmUuCctTagWP5Db5XVkpH5tM03ySjF1+da0dY/wyHOLqtFEQCc9Gl8GT+2OwWtfuVgWSEfrQctN+VPif0eUpqHASIJVAu4k+5Pvi/toCaYonN/HG0UQU+t7QjvI1ZeaqMcP9FoIdF04SEH3DS6qJU3LWreo5Ab0Aln8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AFveCKo3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AFveCKo3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735759526; x=1767295526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GRhkfkG8QO0TDtnl7G4bMOcDQyfQjlupIwn13EGPYVU=;
  b=AFveCKo3CwM/IIcdkmWO/G5Nc1/voqFYuOfzSRmWqMuPOPJ6aRFDUHfE
   DHSBdiCPhaFfLmQ9O96cbS6SfLSJUXXY26doMcjUJ0H7WbstPN/5AOzGi
   afRr5RBkeAueGOT8qLzt9tDzgyEe9b+S8JKjFSYHkRADwatvpBVTAyr60
   GDFxy1OmJ0Z8BRZHjh+4KhdIdu0413ZH1/WJiKwYzRZCBZc40XgQoDPd5
   Rh8oQzed5s1Fs7KxWZ0uElHO6EzpanFxZEqgDzWOerTEkrBsx7pDnIC6v
   7wfCYK7EocWrIuOxW77d3cJCGe1yDxBIIVtTlo7y5/dZ8LLlw/zqUDvtm
   Q==;
X-CSE-ConnectionGUID: 0rCMCQW2Q06gfPIx8U5ZOg==
X-CSE-MsgGUID: o9kllfPVQlqx0K2UIu1ulg==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46998504"
X-IronPort-AV: E=Sophos;i="6.12,283,1728975600"; 
   d="scan'208";a="46998504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 11:25:26 -0800
X-CSE-ConnectionGUID: j5VBX/jvQ6K0TnUUmDFyUA==
X-CSE-MsgGUID: 8bchZHVaRhmMw6cak/wJBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101158242"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jan 2025 11:25:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tT4LK-00081x-0X;
	Wed, 01 Jan 2025 19:25:22 +0000
Date: Thu, 2 Jan 2025 03:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb 9/12] arch/x86/mm/tlb.c:1315:58: error:
 'mm_context_t' has no member named 'broadcast_asid'
Message-ID: <202501020343.LTojE2Wq-lkp@intel.com>
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
config: x86_64-randconfig-102-20250101 (https://download.01.org/0day-ci/archive/20250102/202501020343.LTojE2Wq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501020343.LTojE2Wq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501020343.LTojE2Wq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/mm/tlb.c: In function 'flush_tlb_mm_range':
>> arch/x86/mm/tlb.c:1315:58: error: 'mm_context_t' has no member named 'broadcast_asid'
    1315 |         if (IS_ENABLED(CONFIG_CPU_SUP_AMD) && mm->context.broadcast_asid) {
         |                                                          ^
   arch/x86/mm/tlb.c:1316:17: error: implicit declaration of function 'broadcast_tlb_flush'; did you mean 'trace_tlb_flush'? [-Werror=implicit-function-declaration]
    1316 |                 broadcast_tlb_flush(info);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 trace_tlb_flush
   arch/x86/mm/tlb.c:1319:17: error: implicit declaration of function 'count_tlb_flush'; did you mean 'trace_tlb_flush'? [-Werror=implicit-function-declaration]
    1319 |                 count_tlb_flush(mm);
         |                 ^~~~~~~~~~~~~~~
         |                 trace_tlb_flush
   cc1: some warnings being treated as errors


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
  1316			broadcast_tlb_flush(info);
  1317		} else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
  1318			flush_tlb_multi(mm_cpumask(mm), info);
  1319			count_tlb_flush(mm);
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
