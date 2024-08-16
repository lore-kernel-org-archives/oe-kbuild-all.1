Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EF4315D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723843938; cv=none; b=lKJSJOQD/DqoK1CBL2EOC4Wp9fPeUkVRLLFfeYZl8jTwgYbFblD18IWkeZrZ471383Ufa4RySs8STDxVDcDQ9NQSpH2Oj98bp5gwXw1X296r87qhhLPEGemJM6NKDpNrnNUOci8pDKOpMcFfMkq/TLhoDtPU5aaLEu7JF3MqmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723843938; c=relaxed/simple;
	bh=0K/Jw2B67AhoiIkpT7kv8e2a23GoC3mj1CHrEqdTnXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9AQHGd/oTOWhzbEbmpGSm7R0DImpN+xLs3R1epB8p3iJs4udAVsAS4OVGWK6/d6AAe7sBmBLPbaEaQHyfjx04dDvAQ6nISg3UliDUoIAX70UppeJiUkSO4vyoZOWdy33yPjKirWhqLO3+CTiN0UW5kaxcRIwD4j0l0witwPwks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kebD70/b; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kebD70/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723843937; x=1755379937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0K/Jw2B67AhoiIkpT7kv8e2a23GoC3mj1CHrEqdTnXg=;
  b=kebD70/bZyKsHYj/bgkv7Z3HW6+PxESQKoMA378YK8Y0Fsn7FAfHoZLh
   pQoCrvt87v4735YkB+nax2dtkOJN/lAKmzK7P5yLSTkmIlYt87Wb4kCF1
   qPygSHaIQ9yTE0A2VPf6+HevydWEaYd1+2JKAmfkCddSI+kLwIMUxRo76
   f1wEHSMSSJsLfYPKHg5M8D+b8UzvqKvFGM8BimjUVMqFLyz2rZTYxqspE
   +XhrKCkF5Q/7hKqwlNCx0HqchaY4cDIj18fkRDYvCh8NY+2gozJ8+xoss
   zdnyhm/i8jAr19FXH0HNDr5iENFotG2FjH4HAqn7wq8H6QMg9iiOi/u+k
   w==;
X-CSE-ConnectionGUID: aP4FQAfhQeWkyr2abMARww==
X-CSE-MsgGUID: 0r4wpoeVQDW6AFpps9IHWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22122634"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22122634"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:32:16 -0700
X-CSE-ConnectionGUID: j98OByWYTTO1WBGfsRE3dQ==
X-CSE-MsgGUID: Qw8rIDBFRxOs2KWatTdM2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="90519495"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Aug 2024 14:32:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4YP-0006wg-2U;
	Fri, 16 Aug 2024 21:32:13 +0000
Date: Sat, 17 Aug 2024 05:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: fix missing TLB flushing
Message-ID: <202408170522.BEawbdZP-lkp@intel.com>
References: <20240815120715.14516-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815120715.14516-1-zhengqi.arch@bytedance.com>

Hi Qi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc3 next-20240816]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-fix-missing-TLB-flushing/20240815-201808
base:   linus/master
patch link:    https://lore.kernel.org/r/20240815120715.14516-1-zhengqi.arch%40bytedance.com
patch subject: [RFC PATCH] mm: fix missing TLB flushing
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240817/202408170522.BEawbdZP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170522.BEawbdZP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170522.BEawbdZP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:46:
   include/linux/mm_inline.h: In function 'cond_flush_tlb_mm_range':
>> include/linux/mm_inline.h:518:17: error: too many arguments to function 'flush_tlb_mm_range'
     518 |                 flush_tlb_mm_range(mm, start, end, PAGE_SHIFT, false);
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/pgtable.h:120,
                    from arch/riscv/include/asm/uaccess.h:12,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from kernel/fork.c:23:
   arch/riscv/include/asm/tlbflush.h:48:6: note: declared here
      48 | void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
         |      ^~~~~~~~~~~~~~~~~~


vim +/flush_tlb_mm_range +518 include/linux/mm_inline.h

   512	
   513	static inline void cond_flush_tlb_mm_range(struct mm_struct *mm,
   514						   unsigned long start,
   515						   unsigned long end)
   516	{
   517		if (atomic_read(&mm->tlb_flush_pending))
 > 518			flush_tlb_mm_range(mm, start, end, PAGE_SHIFT, false);
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
