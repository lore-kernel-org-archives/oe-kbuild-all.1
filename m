Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6B4200132
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 16:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732723952; cv=none; b=Kck1udYuWok3weNnCFwWlJOIv1lJhaW5GsNEsekDn6FaovE45HzDYXYlq1bopchzCNxoqf7af25nXNlP+I56dkciX5yBNUrrS4ZDs5hMUWHDdmWqmp69J0JVR5rP8RdBOXT13QYC8FJDYDC3UOK9Fl0wF5GUKU0lBIUVFMuuiEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732723952; c=relaxed/simple;
	bh=bcYDyf1PBRZJnxkTwNQOTBy7a1RD9Nalu6FfwQILofA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jdnly3CboKQnTRtQyeFVkqUGFMwueXFRaQt4wMRSr8vyZh7uOOyo9Hs+5pNWoM9L+AkWpsnIJHIf8vrGc712WmjOjYtWjAS+LmL8FWDiB4avrQvAS2lqLF0blZqbtqnV4QnG6a11CJ7QQ0kDRhREH/eQtyfo8Rtv19/vJMJAK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWS80ESK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWS80ESK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732723950; x=1764259950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bcYDyf1PBRZJnxkTwNQOTBy7a1RD9Nalu6FfwQILofA=;
  b=SWS80ESKGFm3CTFq7aVrUGm+Su3x4XHfCk43savv6BXR0IHK/8QncRbN
   tzhsJ/UELV2OWsFyxMup1PvkfyiEQdXY8/gNsYpsjZxtNFRh3cjtHOWvi
   xjS1qyZ2SeujtSC4xW8wd9r5ngUACixpHU2G5Q8lr+Ije9TVHPGgZn5nr
   lkojC9neBkf1FcRc3rzuiMKhlrFUo3WwOKIZqU/S3SPYLi737oNsyV5ym
   K9+XEyX09We0ZTnv5QNijI+6uAkkIZf3ZF7a9kgbqva57ssOA6KC0k3Yy
   3wKaaTupRNWKcX0zBrQMZU78yxfY1fWTSloR+ogAkPDflkMT6uy36lkvO
   g==;
X-CSE-ConnectionGUID: 7ngQ9U+3Qbibu7zRfB6bQw==
X-CSE-MsgGUID: +tRYnPG7SgyLLSoQBLxnsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="32887432"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="32887432"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 08:12:29 -0800
X-CSE-ConnectionGUID: /Krw7asGSrmKtTUwwy2sJg==
X-CSE-MsgGUID: LPhecSlpRfap7aUOWHFssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="91857130"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Nov 2024 08:12:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGKeP-00087b-0K;
	Wed, 27 Nov 2024 16:12:25 +0000
Date: Thu, 28 Nov 2024 00:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] error: unknown target ABI 'ilp32'
Message-ID: <202411280013.GdY1RDbl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [1540/1540] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-001-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280013.GdY1RDbl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280013.GdY1RDbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280013.GdY1RDbl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/arm64/kernel/asm-offsets.c:10:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:37:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
>> error: unknown target ABI 'ilp32'
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1 shuffle=2151591646
>> clang: warning: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Wunused-command-line-argument]
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1 shuffle=2151591646
>> error: unknown target ABI 'ilp32'
>> error: unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1 shuffle=2151591646
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:90: arch/arm64/kernel/vdso-ilp32/sigreturn-ilp32.o] Error 1 shuffle=2151591646
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:202: vdso_prepare] Error 2 shuffle=2151591646
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2151591646
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2151591646
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
