Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD915E8B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 19:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747510996; cv=none; b=ZsMpUMrYAKhHH0CB+Z8RRGPkMm/ds6QJdnVrq4FjL4xHI0j4s5BDHWuqgawJG2ELiLXA53lWbGLbzt0Bzq4L0rcpsw+9uj5X5XBVCwCbzZWkfvuiyLlP7xQuPxL1/t8JLslSRz8RHYfLrE92ikLJpPmVWGsmQEzqUpjTinXqQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747510996; c=relaxed/simple;
	bh=iLl3SB2Z7fCrywpxu/ecEIEYgWKDSAbn/J+qsFQ8RXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6TxEd4iXzr/FDLrP98suerqbv4AXbpW1OiBtLXYwotcieRiJ6Pw/AW35khWfwWvockN9OPx3L98TDO3gvw2VljayeW5nMXaWJjl4INZcLAy42Q4bs88uVXZQ0naI/EXg7bAX6vQOU87CV69kpgEpCWc1izC4tCdfrBKmzaiG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0pWHbtk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0pWHbtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747510994; x=1779046994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLl3SB2Z7fCrywpxu/ecEIEYgWKDSAbn/J+qsFQ8RXg=;
  b=Y0pWHbtkc4DSpJPmt29gSXKkU/CE468OA3lv4S5qSwDwlF4vx3IPdtEf
   Vr2Ql0+qqp4nvesQnxKEvA9eegL36lCdo6H9YIroz2owiAXc9KvBIcoaY
   QjIzpyaprAzAv1MQ5ft0sOt+2zb06vVX+keHrfiRSaKhPQpd3p+qqEt0r
   ksLPwT53gxaMoALiEa+Kv+qKqJJ6/OsybF+0sY99kTvUc959wCOHL2v0x
   +M97xwVpoYV4r0gispaEBfaN528WsD1Q5FrWUMXAJJtRelgEod5fUSOVa
   zZA97eVsGG9hH4PZPF0OQjqjDdYp/hzBVHXTG6B5QroDhx7/OekvWZt0K
   w==;
X-CSE-ConnectionGUID: CoYomB5QTTOeWns8MTRxYA==
X-CSE-MsgGUID: 1UWe2vK6QoyNpZgAxJ2NGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60485807"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="60485807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 12:43:13 -0700
X-CSE-ConnectionGUID: gpT29MJTTPCAN+SK6jH1dQ==
X-CSE-MsgGUID: fKTNoyGvSX+tUdi1gj1NlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="140012972"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 12:43:12 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGNR7-000KOF-2h;
	Sat, 17 May 2025 19:43:09 +0000
Date: Sun, 18 May 2025 03:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:la57-cpucap-v4 5/6]
 arch/x86/include/asm/pgtable_32_types.h:18: warning: "pgtable_l5_enabled"
 redefined
Message-ID: <202505180307.D23Qndff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git la57-cpucap-v4
head:   51ac31cc5bf5d24277d69246d6e89e67b10d5348
commit: ebbbb0910e2fb82b773ba3b0ced0f843eed79436 [5/6] x86/boot: Drop the early variant of pgtable_l5_enabled()
config: i386-buildonly-randconfig-001-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180307.D23Qndff-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180307.D23Qndff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180307.D23Qndff-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_types.h:281,
                    from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/cpufeature.h:7,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/elf.h:8,
                    from include/linux/elf.h:6,
                    from arch/x86/boot/compressed/misc.h:32,
                    from arch/x86/boot/compressed/kaslr.c:22:
>> arch/x86/include/asm/pgtable_32_types.h:18: warning: "pgtable_l5_enabled" redefined
      18 | #define pgtable_l5_enabled() 0
         | 
   arch/x86/boot/compressed/misc.h:28: note: this is the location of the previous definition
      28 | #define pgtable_l5_enabled() (native_read_cr4() & X86_CR4_LA57)
         | 


vim +/pgtable_l5_enabled +18 arch/x86/include/asm/pgtable_32_types.h

f402a65f93c712 Jeremy Fitzhardinge 2009-02-08  17  
ed7588d5dc6f5e Kirill A. Shutemov  2018-05-18 @18  #define pgtable_l5_enabled() 0
e626e6bb0dfaca Kirill A. Shutemov  2018-02-14  19  

:::::: The code at line 18 was first introduced by commit
:::::: ed7588d5dc6f5e7202fb9bbeb14d94706ba225d7 x86/mm: Stop pretending pgtable_l5_enabled is a variable

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
