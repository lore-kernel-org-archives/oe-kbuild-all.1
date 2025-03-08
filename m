Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7651A5BAB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741456161; cv=none; b=UW+MjxY/z+LXKJrBgSRDTNeRN2ldzIMO5VXi5YY6au4XAImfJT0iyBlRSKpKEDs05Zka2LwENPGqsjh85is5PrIZgmvv8LkRCau2I26ahipfzFX4i/KxI6v1GB71+uXlu7W9Bdm4sBJ4FetXpprASg+Zf8Vi53CA36TGJO0q4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741456161; c=relaxed/simple;
	bh=rNMLNbSgd8oZWNIC4Ktzof8VxtRf3PaXQN7dU1AD4Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKzZD/Sl1i2CtOEBqIpBKTN99MTR+bg3SfbvegK6ttHTKwKJ2gbXean/UO5Z/spUYHki5fliimHcBxNnSkNXFW1NGEgZA7PVXdKtGzGBwO2HOn+xpP8ThkUdvWJR5lzNoGddem1Nec0TZjm+TaZSJ+DrEg1lDwGlT2nnlxIxIFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKBieBHx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKBieBHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741456159; x=1772992159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNMLNbSgd8oZWNIC4Ktzof8VxtRf3PaXQN7dU1AD4Mw=;
  b=UKBieBHxthfcJrU8IArempO6cFBowtAdDOHT28EQA9QRXej6EpLnFlX4
   SL0uGINlBkfxfGloti6RJqPdJnyCr52y1fx7R9PuFh14TYau4I9j/ltTf
   lM+j/pwyNugq1ZdYGFB85k8RQ733H89Zf47Omkmv1KsnEjQiCdUny+ETD
   L6IJxnHCCnhqwWYIBrQfvYSDI16B/Zn97ECNanqrRzpqq+LTlhbXU1/QI
   fRZ1ytGUYGvJdFl0eHdMf8csJAbMDkZSrz/lNKP6RTHU1rnkvvhVAmUdT
   nrZwxGeCIJqC6G4lRStvdujkRxoSvEUmTJb3/9hwmVgDbxWRimkMgJfPB
   w==;
X-CSE-ConnectionGUID: piKkWKosSfifKBdwhX/sOA==
X-CSE-MsgGUID: KAZ7EzxOTg6iQBZFXmGBRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="52699879"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="52699879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 09:49:19 -0800
X-CSE-ConnectionGUID: HApZSM+RTpedm8ScIJof4w==
X-CSE-MsgGUID: IGMTxARUSwiv5+LBylzIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="120079535"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 08 Mar 2025 09:49:17 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqyIV-00029c-2Q;
	Sat, 08 Mar 2025 17:49:15 +0000
Date: Sun, 9 Mar 2025 01:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [trace:ring-buffer/for-next 1/12]
 arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202503090135.MkaxUr8M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace ring-buffer/for-next
head:   9042bbf702038634a80b24bca6f0a71160c06bab
commit: 10a299da2c2b95a3daf1171ba82b268f940cc9ed [1/12] ring-buffer: Allow persistent ring buffers to be mmapped
config: arm64-randconfig-004-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090135.MkaxUr8M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090135.MkaxUr8M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090135.MkaxUr8M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/thread_info.h:17,
                    from include/linux/thread_info.h:60,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from kernel/trace/ring_buffer.c:7:
   kernel/trace/ring_buffer.c: In function '__rb_map_vma':
>> arch/arm64/include/asm/memory.h:424:66: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     424 |         __is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));      \
         |                                                                  ^~~~~~
         |                                                                  |
         |                                                                  long unsigned int
   kernel/trace/ring_buffer.c:7093:21: note: in expansion of macro 'virt_addr_valid'
    7093 |                 if (virt_addr_valid(cpu_buffer->subbuf_ids[s]))
         |                     ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/memory.h:379:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     379 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +424 arch/arm64/include/asm/memory.h

4f04d8f0054511 Catalin Marinas 2012-03-05  421  
68dd8ef321626f Will Deacon     2019-08-13  422  #define virt_addr_valid(addr)	({					\
91cb2c8b072e00 Catalin Marinas 2021-02-01  423  	__typeof__(addr) __addr = __tag_reset(addr);			\
873ba463914cf4 Mike Rapoport   2021-06-30 @424  	__is_lm_address(__addr) && pfn_is_map_memory(virt_to_pfn(__addr));	\
68dd8ef321626f Will Deacon     2019-08-13  425  })
4f04d8f0054511 Catalin Marinas 2012-03-05  426  

:::::: The code at line 424 was first introduced by commit
:::::: 873ba463914cf484371cba06959d320f9d3121ca arm64: decouple check whether pfn is in linear map from pfn_valid()

:::::: TO: Mike Rapoport <rppt@linux.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
