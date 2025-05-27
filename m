Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2926989D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748348113; cv=none; b=pLiHRvg61TQIFr7YPUyF6om0EaQjG0vXvTzeF2sLydRarW5FWgHmvCXUplNKULKhA3uhQlyBmszHkdUJAi1+gaSKsm19mIKA1H4QT3iPqbb7/wZ3JuaD56HpTW5jDYFLqcEUlAdpIIsM1mlRnMR/KNLbOP2gg/6GXgG8+Srlkx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748348113; c=relaxed/simple;
	bh=iy/jdVOFj/GSAv1x/zbjOzl0SMMglkeFqv6vN0bcSQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zh729y6AaJAYFRymn0zGjHDooCx7Aa3zmSSpqE3YnrDr9eeQWXPm073stSFlUT7bAGFivt3yYxcmpBjqx8JWfXmF6XhFfThwqP9NCYqhEKIqKsbTUB9wyvAQUJvu97V/zdqCygKuW/oFEUJMxUxdhv/J4mWNciVrg9Snzqk86fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5mNckDg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5mNckDg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748348112; x=1779884112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iy/jdVOFj/GSAv1x/zbjOzl0SMMglkeFqv6vN0bcSQM=;
  b=b5mNckDgh3kTbbR9DVcYJU+uWdbySIiWEX4qZKf/Uxb0LknkvUPnE06t
   a+UqJVf8f5HLgKStQmaWZBw97HS38jQF/RPzpQjAPA8YlW/3hOXlldd3g
   XYtrXGTcPrc2KCNmM+cmL1imrzbhf3AQ5wEmpAvKgjCd5VQJ1lsngwTk9
   FEQvwhvV5GD5de2K40pS1IIXd7nQm42jQuW70vGUFamt4bfW+2YeQraRY
   sCGUETbndbgbfOIUy5FUu1Jggf559lm/8YsG3r7fb/xrXW0DVc9CAwQS0
   4SgYkQN/qWAIqZPj+m1DbQNTyazzbvBzq6tYkNSVy+vt45JOaYblexMkX
   g==;
X-CSE-ConnectionGUID: 505SkvADQV6ZjTDMDcY+Vg==
X-CSE-MsgGUID: GiY7TascSpSS2QCoJ4OcKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="37959366"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="37959366"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 05:15:11 -0700
X-CSE-ConnectionGUID: cOUe2SBwRlWeVbBTQKarKw==
X-CSE-MsgGUID: ey+C6W90QaWpyoWwFF/A2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="143762311"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 05:15:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJtD1-000TBM-2r;
	Tue, 27 May 2025 12:15:07 +0000
Date: Tue, 27 May 2025 20:14:17 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 61/77]
 arch/riscv/include/asm/io.h:34:19: error: implicit declaration of function
 'ioremap_prot'; did you mean 'ioremap_wt'?
Message-ID: <202505272041.K796220K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   bd9f757ef4bfde0edc1b68dd9af6e35e1f999fb3
commit: 7edc82b9a1b5d8dfab77c5ac582cd28b6ebbaef6 [61/77] riscv: Define ioremap_cache for RISC-V
config: riscv-randconfig-r052-20250527 (https://download.01.org/0day-ci/archive/20250527/202505272041.K796220K-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505272041.K796220K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505272041.K796220K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from kernel/iomem.c:4:
   kernel/iomem.c: In function 'arch_memremap_wb':
>> arch/riscv/include/asm/io.h:34:19: error: implicit declaration of function 'ioremap_prot'; did you mean 'ioremap_wt'? [-Werror=implicit-function-declaration]
     ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
                      ^~~~~~~~~~~~
   kernel/iomem.c:13:25: note: in expansion of macro 'ioremap_cache'
     return (__force void *)ioremap_cache(offset, size);
                            ^~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:34:3: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     ((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
      ^
   kernel/iomem.c:13:25: note: in expansion of macro 'ioremap_cache'
     return (__force void *)ioremap_cache(offset, size);
                            ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +34 arch/riscv/include/asm/io.h

    32	
    33	#define ioremap_cache(addr, size)					\
  > 34		((__force void *)ioremap_prot((addr), (size), PAGE_KERNEL))
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
