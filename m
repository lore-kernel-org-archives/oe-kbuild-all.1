Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1E134CDD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Aug 2025 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755896341; cv=none; b=O+OAMdZbSVmzTOokshC88wKoShbiDEEDC4VVNOiuV3pZD8FTFgq2tbnAqD3ERNr0tfJhE7WLlL3Tz8Y0cGFy8InrM8+XFomNCHUXjg957kdV0p0BB/UqgFRdBq/0RV5DMsu9nt2NSygGTNF0u8m4X4l1IwfCJc6QoFR3U9ivK1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755896341; c=relaxed/simple;
	bh=1sa+VUMwRPCd8QSe8C+Po/yKjuVouUZBYgCVx7K/ASo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhBhF3BOQ3/CohSoXqGZRpgljzPXUWI1q5Z0bWL0ng2p+SREusddpuuFMVvKflt4+zhj6lJA7XTvY//v3uGIEqY91O/YlCOKNiM3nG3Fb4FVEJhUNOrqxmAKuSNjNsrCXCtmLOGn7R0YiiofSVfIdCG3rARzG+UlJI2sqGajF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a7GcceJC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a7GcceJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755896340; x=1787432340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1sa+VUMwRPCd8QSe8C+Po/yKjuVouUZBYgCVx7K/ASo=;
  b=a7GcceJCXQZZ22eIcOyWM4UTUEEjsi/QE8EAR+SbyNuEuFetRew1aFYr
   6p4KlEBRYoLi2mje/Ho5UY/eC5OVgmqekvItd9EAarkLJf8hNDeA452xG
   AMLarqp7SJDdDXSZcbRGe5q+AgrZpQZGbenxsm9QHNs97GI8En+ntbheT
   tA8aZmHe+viYAaORShdpBJofqntAKVFw7fPYTMCEQHvaofSdVQJsAKD/c
   i4NgxXHguA9zrUEjAJcdJQAP+8vNEJt0d3A3EEi0/B+5EkVu6zFAoL2Qu
   UOR4g6mB7E+17W02LGed9mLtphx+W4FIUpSdBqmeDPN08BW1+FFqcc+0e
   g==;
X-CSE-ConnectionGUID: caBsStmsRLm1My4oyaHd8w==
X-CSE-MsgGUID: 1EgofGrGSw+6FzC+/zaKRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58307066"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58307066"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 13:58:59 -0700
X-CSE-ConnectionGUID: Ut/BtiiSRQWFZm7jvsJvVw==
X-CSE-MsgGUID: HFC8tZ3aRp2uUAEB7iiGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="199759348"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Aug 2025 13:58:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upYqd-000LpT-05;
	Fri, 22 Aug 2025 20:58:55 +0000
Date: Sat, 23 Aug 2025 04:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 57/75]
 arch/riscv/include/asm/io.h:34:19: error: implicit declaration of function
 'ioremap_prot'; did you mean 'ioremap_wt'?
Message-ID: <202508230450.pwx1A1xE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   92deea46a4aa824180e18db93d5d47319a08187b
commit: 2939a124a8fb72e4d051bd2d6ea9a015cb6c6565 [57/75] riscv: Define ioremap_cache for RISC-V
config: riscv-randconfig-002-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230450.pwx1A1xE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230450.pwx1A1xE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230450.pwx1A1xE-lkp@intel.com/

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
