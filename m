Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABD81F03C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740208104; cv=none; b=exS1x1JiJPi259dzlM9SQmhke+b+KztXaxx3EP4gwIkYFNJDcQiJlfj7BqAxfGwpLa3mSTJKvSMRtVpTxG1BUH1yaVhacajw5O8EchrdQAiQ9QiuQ2SRcGnz5NOSEZ72NTpsqZDHXdskyqme3ct/iYHjBamI7V3JAPwD29um29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740208104; c=relaxed/simple;
	bh=jJJhFiY88ymYM+d79dmqyNzqw+p5FIsRXdyNaD8dc3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksCUcFEraVp/4dJ5QAjwGtg0suo888YeUe3VZXzOj1khUwAZjYccH8N5YyxiZ2/UjWoVJ51Rw6AJ4H9/9OmmAsDB56TAtdSql2uWcoK+4vZlKPo9KR3rMSi8Ou68rhX2xCkjvO9QwrWE/y0ykrkS99uN7EgQQAVKhQcHzSxfIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrzoSk2L; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrzoSk2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740208103; x=1771744103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJJhFiY88ymYM+d79dmqyNzqw+p5FIsRXdyNaD8dc3I=;
  b=HrzoSk2L2l+dFGM/TL8VCNrOiMMHL4A1WKFl5okaQNavA5DrTLDi9zf6
   dMW7Zlxjf0iBZY4siBbF0Fycipzpv+Jo9Xb0zCN1DI9KG0vOBbiClDyW1
   qlCB3JMtr0EU/LehxfW/Qn/JUQa8wLFym2nuXygRSsacCwKTm2TVa59gg
   EnEYQ9fiiVuonijssDWYEaB2EfbQHoQBd4pIIeVdJ6YcVOcicrBY0w48H
   C8TwarrvKfMfSW5e0WcrRw/NIlVOVirRq7/OllvrLwnuK3CUKkV/Nn21R
   BWEtjIle4v0EaD1kI8Fgp29OFd0tThgdZx8BQ72GOcQIqfQxnULH6P+8O
   Q==;
X-CSE-ConnectionGUID: w+mdKDQ4Q7aMjFmBshIvxg==
X-CSE-MsgGUID: wauJmRFQS/6lJ7FhfhIa8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66400789"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="66400789"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 23:08:22 -0800
X-CSE-ConnectionGUID: tftB5lopTUqDM4rLQAgZrA==
X-CSE-MsgGUID: 5pSid9ICSiuwsiLZ8KOfsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="115763831"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Feb 2025 23:08:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tljcU-0006Mj-1S;
	Sat, 22 Feb 2025 07:08:16 +0000
Date: Sat, 22 Feb 2025 15:08:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1963/1963] include/linux/mmzone.h:1788:2: error:
 #error Allocator MAX_ORDER exceeds SECTION_SIZE
Message-ID: <202502221546.vr9bH9ug-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi zhangtianyang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   97a32f076246fcfdb99917daa4daffc96a22e3d9
commit: c93eb12529e21dbb59796132f4fdf75fad4eddaf [1963/1963] LoongArch: Adapted SECTION_SIZE_BITS with page size
config: loongarch-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221546.vr9bH9ug-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221546.vr9bH9ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221546.vr9bH9ug-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/loongarch/kernel/asm-offsets.c:9:
>> include/linux/mmzone.h:1788:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
    1788 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
         |  ^~~~~
   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/loongarch/kernel/asm-offsets.s] Error 1 shuffle=1637967642
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=1637967642
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1637967642
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1637967642
   make: Target 'prepare' not remade because of errors.


vim +1788 include/linux/mmzone.h

d41dee369bff3b Andy Whitcroft     2005-06-23  1783  
835c134ec4dd75 Mel Gorman         2007-10-16  1784  #define SECTION_BLOCKFLAGS_BITS \
d9c2340052278d Mel Gorman         2007-10-16  1785  	((1UL << (PFN_SECTION_SHIFT - pageblock_order)) * NR_PAGEBLOCK_BITS)
835c134ec4dd75 Mel Gorman         2007-10-16  1786  
23baf831a32c04 Kirill A. Shutemov 2023-03-15  1787  #if (MAX_ORDER + PAGE_SHIFT) > SECTION_SIZE_BITS
d41dee369bff3b Andy Whitcroft     2005-06-23 @1788  #error Allocator MAX_ORDER exceeds SECTION_SIZE
d41dee369bff3b Andy Whitcroft     2005-06-23  1789  #endif
d41dee369bff3b Andy Whitcroft     2005-06-23  1790  

:::::: The code at line 1788 was first introduced by commit
:::::: d41dee369bff3b9dcb6328d4d822926c28cc2594 [PATCH] sparsemem memory model

:::::: TO: Andy Whitcroft <apw@shadowen.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
