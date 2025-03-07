Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65361465B4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 02:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741315038; cv=none; b=ZbFRO5Az2sVTXnooa7+0WhlZeeZHCi5deTfA+5Q6Hzices+80wY4WjWidxH96U+rtCZObzECfEy02+42xzK5l0q/IsTsaB9Qzbf1Mcf77lMjgCXSc93HQLDIEVJbIFPxx+8qWXlzltM6YF6XK+E5ftT8cTK3vqYebWC2i3dCA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741315038; c=relaxed/simple;
	bh=Jd3WxAw1Yz8IcwdWocznRc7jYx53jS6EBdCUY3V66h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTdOfJJnv0YCL7BcuBtKOSTlxD4Vkd3DQV7EScJl8nYIl/z4mmV0srACJ4grMWVDlkQocASR9yF5iRHM4hadt0QwZJoVtKXFVx/1I6sIMwbAt4qWfc32FIItML5LOvgoKpWKxoY1HdNQ4uNqr6NET5gMEELWLaQLyfvYhwD5vb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WChJDFef; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WChJDFef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741315036; x=1772851036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jd3WxAw1Yz8IcwdWocznRc7jYx53jS6EBdCUY3V66h0=;
  b=WChJDFefQsq3dLykZFOSrQRXC02+pCOcKTL/oauUqA1ELcfhR3t3xArG
   s+6Dp7ST0xjIuodi1MJG4FQFtLX53BRMcs71eYEAbiowV8gUr1Z8RV8IL
   taj6rMqkJaAta1u9LpfLcmUJVph38z6i+N6KFr0yNmtC6ZaJaLWxdraCV
   jzqfbqf+Zt9oHb222OtBoh/WlIST3gGqtm0kibKnq7ypgLRu1nsVmH4yl
   6SzLyXMvOqHKQ7HTbHF01cpwqNMTDj44yNKso1kt1RM9kfPS58XCjseKO
   ESuaG4ujUEpoOWUKtNxKZ+LlBn8WKdmwhDzqLJjNUyAv4PwdAc70xs8Pb
   w==;
X-CSE-ConnectionGUID: fIyOXvm6RIuCQl0VRNtudg==
X-CSE-MsgGUID: 3vs6+xkmQuOuRanVfd6x8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42495149"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="42495149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 18:37:16 -0800
X-CSE-ConnectionGUID: ilwbktjHQ0qF2rwf6rhYGg==
X-CSE-MsgGUID: wxJYM4+oTOGi3sa1RmffiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124403972"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2025 18:37:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqNaJ-000NzK-0T;
	Fri, 07 Mar 2025 02:37:11 +0000
Date: Fri, 7 Mar 2025 10:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, willy@infradead.org,
	michel@lespinasse.org, linux-mm@kvack.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH 3/7] lib/rbtree: add random seed
Message-ID: <202503071016.2u0gPG0V-lkp@intel.com>
References: <20250304011952.29182-4-richard.weiyang@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304011952.29182-4-richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250306]
[cannot apply to akpm-mm/mm-nonmm-unstable akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/lib-rbtree-enable-userland-test-suite-for-rbtree-related-data-structure/20250304-092345
base:   linus/master
patch link:    https://lore.kernel.org/r/20250304011952.29182-4-richard.weiyang%40gmail.com
patch subject: [PATCH 3/7] lib/rbtree: add random seed
config: riscv-randconfig-r133-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071016.2u0gPG0V-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250307/202503071016.2u0gPG0V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071016.2u0gPG0V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/interval_tree_test.c:22:1: sparse: sparse: cast truncates bits from constant value (2b992ddfa23249d6 becomes a23249d6)
   lib/interval_tree_test.c: note: in included file (through include/linux/timex.h, include/linux/time32.h, include/linux/time.h, ...):
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *
   arch/riscv/include/asm/timex.h:25:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   arch/riscv/include/asm/timex.h:25:16: sparse:     expected void const volatile [noderef] __iomem *addr
   arch/riscv/include/asm/timex.h:25:16: sparse:     got unsigned int [usertype] *

vim +22 lib/interval_tree_test.c

    20	
    21	__param(uint, max_endpoint, ~0, "Largest value for the interval's endpoint");
  > 22	__param(ulong, seed, 3141592653589793238ULL, "Random seed");
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
