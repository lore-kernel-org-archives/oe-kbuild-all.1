Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC730DD30
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 04:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788927439; cv=none; b=Dtyyd0hwAm3tSBW47w3aDuRx0XgGE1PnZqeuVZcgdxcNWuH3VAkUcgvzSj/EPC1ygMc/sEN8FjlKPGuMUIOBuVGKbdfy4019MZaXSK2ho5Eup2Stu74VVaVMmtri0fevh/k4qj0Z9z5r9KS13c+68Il+KM3blEck69A0Niad3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788927439; c=relaxed/simple;
	bh=m2ouUXcD47v42Ohw+k3vysuGgWeOrNcVa0ROTH6JCo8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rxp+xg4YqnhIgCGqGrAo2PGrvuYytaybrhWk2ztUjy4+LnLiySF8d/GonO9s6nH0ZpxTmxLQ99HEvWLdpi7cB4g0dX7V1+7cu/HomKMAA30WrHhZWZn2o5CF6mFR+2p1TXL0i/jfcRobiBmzOWV+KOT4q500fmWEc6rdHkYX9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3eyZNMx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3eyZNMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788927436; x=1820463436;
  h=date:from:to:cc:subject:message-id;
  bh=m2ouUXcD47v42Ohw+k3vysuGgWeOrNcVa0ROTH6JCo8=;
  b=R3eyZNMxXe2jptqMryYJLiRcDm+18SoGBbPyLwjTe6dZHeO478D43Ecg
   avTdQBbPUwU8vY7hWII6kS89P9sl7RjYGn6l0/Mq0iIeApK22XkOtA2Y8
   FgZLRGIakuGOraL9ERlD0pKPgqVBDSZgn93zqGpN7T4c0r6kvvHsrrjMY
   ouuOjRIMAuOcDkd50hfZAJsDATKg+MmU0ThBu8B/LM+JNH/JL4qIJlThp
   5/yoDFG23u9Fe7XahUtfv1cpls1GhdAO76Cg+33oaFNd4BGoHpk+qhy0C
   T5rhWtVA93QKzhcVTnTfaX/ljY0ne8u5xcYvL1zvs3e/iudajiyJp3jcy
   A==;
X-CSE-ConnectionGUID: gPUY21ZFTm2Nvmv9LCrd4g==
X-CSE-MsgGUID: ThUXpT6kRHOlWjOqneNymw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100698983"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100698983"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 21:17:15 -0700
X-CSE-ConnectionGUID: U/yI+4E6Rt68W1njvlxAow==
X-CSE-MsgGUID: tfoU2fOqSO2hs4uFz7KxKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275330549"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 08 Sep 2026 21:17:14 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x49kF-0000000013b-1rP7;
	Wed, 09 Sep 2026 04:17:11 +0000
Date: Wed, 09 Sep 2026 06:16:51 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no
 previous prototype for function 'efi_vsnprintf'
Message-ID: <202609090621.8xNKJOFX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/x86-boot-Drop-pointless-re-implementation-of-panic/20260906-150819
head:   c551ec0edb0b057c415d5530905c288523a9bde8
commit: 00893af88a10aeb0548fcd863ad11e686a94957d efi/libstub: Output UTF-16 directly from vsnprintf()
date:   2 days ago
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20260909/202609090621.8xNKJOFX-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090621.8xNKJOFX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609090621.8xNKJOFX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no previous prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
     251 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         |     ^
   drivers/firmware/efi/libstub/vsprintf.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         | ^
         | static 
   1 warning generated.


vim +/efi_vsnprintf +251 drivers/firmware/efi/libstub/vsprintf.c

   250	
 > 251	int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
