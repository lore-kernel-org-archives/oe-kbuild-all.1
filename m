Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEEC2AE93
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 08:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151802; cv=none; b=SOZcuwKopTL0QBwYGwx4oiw7w9ow6jdhcRROxsECBZFaB6ZSgnBdSzoCxvd3XpR8wxe/OodqzeQpredMKM4tfqNTyrBQZUrZk5Rz8lu1aP+mXluUxaALc0oL65mKNl+5Z/WPOJrufs2pMGZF5KQaItLATRbaXBpSdecG4pTQvg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151802; c=relaxed/simple;
	bh=qbh8stjkoKOoPPH9RsjjUGRjx6DS+Qtuv/u29rQsVzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ehJlmC/IUIYz3Yft8WgWJdU9ny263BLyuaHNmQ9BNZyVNSu+Hh4FJhKAOunEYJMnNZRO2Jb7wKBeEcjnIm8eCA7GdaihjQlo5waWR9rAY1kxJmf/y9iHYtVydBnHLlhPru9IDZV+z9dLwrRVlyfFaULentJWQng422ywOrbMSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icdbkhDY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icdbkhDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736151800; x=1767687800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qbh8stjkoKOoPPH9RsjjUGRjx6DS+Qtuv/u29rQsVzA=;
  b=icdbkhDYyjZwpmGn9aiMYFkElSVZdGlTS5qDhl1fXR5fhVGsF8KESt4C
   OfW6BZLWQium18iBUI23ggNdaEO72diBzRjk3PMc8wpQt0XxJUcj4KqqV
   3SsxlZjFNUB3tLACh9GeCDxsL9+J13NhLtg7mGzbXVbv75g4kvGG8g6/u
   wyRewSEjEG8prB1RlKPQFpybavFOK9aWQrmHehrenWFtmrW4Le3yTDrsw
   BBcVDxh4EWhY/nem9pn9fjGw0lmC4k/RBH03M1RFUTJ+ONiKxxXHuoEmd
   Pxb76ma6H7lCm3Uh8LPwTzfUL8XY4cgoaUvCUzoLcqyDIJ9xzwZI4sS5X
   Q==;
X-CSE-ConnectionGUID: Mepib72vQ5CQ3e/aVuIeEw==
X-CSE-MsgGUID: HDUCnOxgRjuYhZ2aZH3TQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="36170382"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="36170382"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 00:23:20 -0800
X-CSE-ConnectionGUID: ddA8u+WbRImU6byF4QhJSA==
X-CSE-MsgGUID: rQt2dOlFQfWP2aIwx4Tt5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133296706"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 00:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUiOD-000CNn-0p;
	Mon, 06 Jan 2025 08:23:09 +0000
Date: Mon, 6 Jan 2025 16:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	x86@kernel.org, linux-kernel@vger.kernel.org, ioworker0@gmail.com,
	david@redhat.com, ryan.roberts@arm.com, zhengtangquan@oppo.com,
	ying.huang@intel.com, kasong@tencent.com, chrisl@kernel.org,
	baolin.wang@linux.alibaba.com, Barry Song <v-songbaohua@oppo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>, Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
Message-ID: <202501061535.zx9E486H-lkp@intel.com>
References: <20250106031711.82855-3-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106031711.82855-3-21cnbao@gmail.com>

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-set-folio-swapbacked-iff-folios-are-dirty-in-try_to_unmap_one/20250106-112638
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250106031711.82855-3-21cnbao%40gmail.com
patch subject: [PATCH 2/3] mm: Support tlbbatch flush for a range of PTEs
config: i386-buildonly-randconfig-002-20250106 (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061535.zx9E486H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061535.zx9E486H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> arch/x86/include/asm/tlbflush.h:283:46: error: unknown type name 'unsignd'; did you mean 'unsigned'?
     283 |                                              unsignd long size)
         |                                              ^~~~~~~
         |                                              unsigned
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=998720002
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=998720002
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=998720002
   make: Target 'prepare' not remade because of errors.


vim +283 arch/x86/include/asm/tlbflush.h

   279	
   280	static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
   281						     struct mm_struct *mm,
   282						     unsigned long uaddr,
 > 283						     unsignd long size)
   284	{
   285		inc_mm_tlb_gen(mm);
   286		cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
   287		mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
