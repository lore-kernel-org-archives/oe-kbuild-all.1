Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63551DE8BE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 07:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917054; cv=none; b=JBJujg/dtqqSFHyV8zsdV0lehbJcGkIawNenmqQ5Tjdz5hdKD1SUkd4GyBhb6WOiS04YYSkG630NuIOfiWpI41fQnh5GjYSzR3qf91Bifsd6sfD3jbQNjWxuyCz0z07mpyVUgrTXw4dYoalPhTzKfA1TrCiuxqyWp7XdMA35yZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917054; c=relaxed/simple;
	bh=sgVe6bmorh7tYciyVkwQ/sNrI0bBRs6mNUEZWXv/ru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6455XpdY09QTWX0SeSIIZwLOkew1Kg1kevgnBpSlrnemwpy4NuGi+URihMPUJ21gT9UpVdO8I1fm3QKl9rvwGaY4ouqIL8gkbwP0j/D63zMP0tqTql+ICAJeD2bXGDYZvqofE96Kw3inbGPf1T/qrElk21ns1r1+KZ6SxCCg+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQuTjxlF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQuTjxlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771917053; x=1803453053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sgVe6bmorh7tYciyVkwQ/sNrI0bBRs6mNUEZWXv/ru4=;
  b=UQuTjxlFbM+qNK16qyQ8U3MX+JzPzHlBY4G8hX92T+2pGbmqQ71p7faQ
   +XrjRZli6p+Snx6HdzIaJKXnT5v2fokOysXH2jKLUL6kPmLuquDiEE8Kd
   7FsQdHWBzwThX31wbxdLA+cC6NmSd7NvYXtmNk5pqfpoHURQEzEX3fnPS
   5jStRjQEaI2zA/7t9MSPTg8aIsV/n9XdO+mGLcAaVZsS5ensoirfQOxA8
   6/s0ttTOlJgBuZyUkWWHojM1iLlvAcYPxqU98VZGCjz4CctQ1fk4a3BkJ
   bBeNnQhjK+OSVSVeG+F5IQv8ggh3GtMwgCsQKxgpXUhkkFgunudbVlDZO
   Q==;
X-CSE-ConnectionGUID: A021fM1jSJmsVIcGSNvSbw==
X-CSE-MsgGUID: Fc1BzNp/QSunFKVbP6Bw/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72898000"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72898000"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:10:53 -0800
X-CSE-ConnectionGUID: +LUqEjoJTSWxMyk7Z4eFPQ==
X-CSE-MsgGUID: wfQjcVEGQKO6HkA/RtiUHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246401189"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Feb 2026 23:10:52 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vumYv-000000001bV-294c;
	Tue, 24 Feb 2026 07:10:45 +0000
Date: Tue, 24 Feb 2026 15:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 07/16] arm64/mm: Convert READ_ONCE() as p4dp_get() while
 accessing P4D
Message-ID: <202602241424.CuYju4BX-lkp@intel.com>
References: <20260224051153.3150613-8-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-8-anshuman.khandual@arm.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0-rc1]
[also build test ERROR on linus/master next-20260223]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything arm/for-next arm/fixes kvmarm/next soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Abstract-printing-of-pxd_val/20260224-131447
base:   v7.0-rc1
patch link:    https://lore.kernel.org/r/20260224051153.3150613-8-anshuman.khandual%40arm.com
patch subject: [RFC V1 07/16] arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602241424.CuYju4BX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241424.CuYju4BX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241424.CuYju4BX-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/mm/fault.o: in function `show_pte':
   fault.c:(.text.unlikely+0x238): undefined reference to `pud_offset'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `split_kernel_leaf_mapping_locked':
   mmu.c:(.text+0xfd0): undefined reference to `pud_offset'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `alloc_init_pud':
>> mmu.c:(.text+0x1c38): undefined reference to `pud_offset_phys'
   aarch64-linux-ld: arch/arm64/mm/fixmap.o: in function `early_fixmap_init_pud.constprop.0':
>> fixmap.c:(.init.text+0xa0): undefined reference to `pud_offset_phys'
   aarch64-linux-ld: mm/memory.o: in function `follow_pfnmap_start':
>> memory.c:(.text+0x21d8): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `free_p4d_range':
   memory.c:(.text+0x2984): undefined reference to `pud_offset'
>> aarch64-linux-ld: memory.c:(.text+0x2bc8): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `unmap_page_range':
   memory.c:(.text+0x5488): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `__handle_mm_fault':
   memory.c:(.text+0x83f4): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o:memory.c:(.text+0x8b1c): more undefined references to `pud_offset' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
