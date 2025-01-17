Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7725A645
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 03:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737084399; cv=none; b=bzY5zckfQ7Qv1VzmR/leikaILOGw65kFpbUaHW6MPhBXTOZ4Jw5OvMc8VVPml/INHLNaaE87PcBxqSjjzvlAMPvdv1vwdkodb4XHia8/7VypiMce8PUp86fUY6PoEvQFSvZZ5fOYpmV91WwuEwvnTbhUC75lRYvMvKfwLEonUbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737084399; c=relaxed/simple;
	bh=n8OGWeJPLT0NbvM8BNRhfkt2AJaUOeKer0gIlu+ytcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3/iwc+aWD3ZlvLtxPZ9Oa2nCVhXevXQfJwICSr8SfMWP5qetgNWCEo6UxMQFS3qzEjhRh09WrE4npmsnYLQMRe/ZvuBdQ2jnpOXRqbM+HsAlmpVo1OEsAHiavRCiJJvwfI/g8DpHgbDpG2aR/rNOej3OXDQZt8eCpDKnjWCns0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/CrrSIz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/CrrSIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737084397; x=1768620397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n8OGWeJPLT0NbvM8BNRhfkt2AJaUOeKer0gIlu+ytcQ=;
  b=S/CrrSIzDzw/bpRZTcOwZLwNDvu0HdG+OkwMNrUCD3+Feg1lFirKIoik
   6vkQ4ofNYw9Vb1iDYaJZdCWxAgqOBZWEHwBTYxdxCf5hP+F6CA3IQXtYR
   NRyJs1AMAgykUVz5iEoBuPgjiZJ9Dm+oymaku5Ob9C8cvBNkOUCZ7Jftd
   0hEWZNv9BpoBpQ5uGrLDyr/nCgWDa9O+P3bSVXURYog6smSNSxVLjL08z
   gEuvFCd9ve59SqjydN59EtaeiTlZVOdwfiwh0ly9rsMTK4RBo5dSYzsYs
   YZ3O25lL/FBqjeqSGVT4QfMBhc2tmdcNIftbsa42xOHNS1HBJE0X86ZAr
   A==;
X-CSE-ConnectionGUID: zL7MtcNFSuSG/8AivLjClA==
X-CSE-MsgGUID: XQDUtRsBQ0CgfSXQBwRKCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="55048213"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="55048213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 19:26:36 -0800
X-CSE-ConnectionGUID: e1ZIiEUvSK61HJ7QsxSdaQ==
X-CSE-MsgGUID: rN1WInCtRhu1R1dBe+p5cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="105475672"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jan 2025 19:26:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYd0C-000SgV-2z;
	Fri, 17 Jan 2025 03:26:32 +0000
Date: Fri, 17 Jan 2025 11:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Rik van Riel <riel@surriel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 06/12] x86/mm: use INVLPGB for kernel TLB flushes
Message-ID: <202501171141.DrGMebNN-lkp@intel.com>
References: <20250116023127.1531583-7-riel@surriel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116023127.1531583-7-riel@surriel.com>

Hi Rik,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/mm]
[also build test ERROR on tip/master linus/master tip/x86/core v6.13-rc7]
[cannot apply to tip/auto-latest next-20250116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rik-van-Riel/x86-mm-make-MMU_GATHER_RCU_TABLE_FREE-unconditional/20250116-103657
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20250116023127.1531583-7-riel%40surriel.com
patch subject: [PATCH v5 06/12] x86/mm: use INVLPGB for kernel TLB flushes
config: i386-buildonly-randconfig-004-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171141.DrGMebNN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171141.DrGMebNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171141.DrGMebNN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tlbflush.h:13,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1132,
                    from arch/x86/mm/tlb.c:4:
   In function '__invlpgb',
       inlined from 'invlpgb_flush_all' at arch/x86/include/asm/invlpgb.h:80:2,
       inlined from 'broadcast_kernel_range_flush' at arch/x86/mm/tlb.c:1092:3,
       inlined from 'flush_tlb_kernel_range' at arch/x86/mm/tlb.c:1123:6:
>> arch/x86/include/asm/invlpgb.h:26:9: error: inconsistent operand constraints in an 'asm'
      26 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~
   In function '__invlpgb',
       inlined from 'invlpgb_flush_addr_nosync' at arch/x86/include/asm/invlpgb.h:87:2,
       inlined from 'broadcast_kernel_range_flush' at arch/x86/mm/tlb.c:1098:3,
       inlined from 'flush_tlb_kernel_range' at arch/x86/mm/tlb.c:1123:6:
>> arch/x86/include/asm/invlpgb.h:26:9: error: inconsistent operand constraints in an 'asm'
      26 |         asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
         |         ^~~


vim +/asm +26 arch/x86/include/asm/invlpgb.h

cd277b8b690f1e Rik van Riel 2025-01-15   7  
cd277b8b690f1e Rik van Riel 2025-01-15   8  /*
cd277b8b690f1e Rik van Riel 2025-01-15   9   * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
cd277b8b690f1e Rik van Riel 2025-01-15  10   *
cd277b8b690f1e Rik van Riel 2025-01-15  11   * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
cd277b8b690f1e Rik van Riel 2025-01-15  12   * be done in a parallel fashion.
cd277b8b690f1e Rik van Riel 2025-01-15  13   *
cd277b8b690f1e Rik van Riel 2025-01-15  14   * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
cd277b8b690f1e Rik van Riel 2025-01-15  15   * this CPU have completed.
cd277b8b690f1e Rik van Riel 2025-01-15  16   */
cd277b8b690f1e Rik van Riel 2025-01-15  17  static inline void __invlpgb(unsigned long asid, unsigned long pcid,
cd277b8b690f1e Rik van Riel 2025-01-15  18  			     unsigned long addr, u16 extra_count,
cd277b8b690f1e Rik van Riel 2025-01-15  19  			     bool pmd_stride, unsigned long flags)
cd277b8b690f1e Rik van Riel 2025-01-15  20  {
cd277b8b690f1e Rik van Riel 2025-01-15  21  	u32 edx = (pcid << 16) | asid;
cd277b8b690f1e Rik van Riel 2025-01-15  22  	u32 ecx = (pmd_stride << 31) | extra_count;
cd277b8b690f1e Rik van Riel 2025-01-15  23  	u64 rax = addr | flags;
cd277b8b690f1e Rik van Riel 2025-01-15  24  
cd277b8b690f1e Rik van Riel 2025-01-15  25  	/* INVLPGB; supported in binutils >= 2.36. */
cd277b8b690f1e Rik van Riel 2025-01-15 @26  	asm volatile(".byte 0x0f, 0x01, 0xfe" : : "a" (rax), "c" (ecx), "d" (edx));
cd277b8b690f1e Rik van Riel 2025-01-15  27  }
cd277b8b690f1e Rik van Riel 2025-01-15  28  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
