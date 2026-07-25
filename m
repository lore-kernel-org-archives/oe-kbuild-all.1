Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B930C167
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jul 2026 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784938903; cv=none; b=HcE0lu52+Lh5Id0Normqj2F4aEXuMos+p7dd0QeX1fOUTTXdrIQWTd8/2LwPX7fn0MWwDcMmnjCsgc1CGKSN9P9aVfr0iRoO4opUTdhvXP3x7ZImL68lOakuNNItGXo7BMDfMj9KklN/ZUEan86Bp7ZziU+Y3i/9C74nysHkczU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784938903; c=relaxed/simple;
	bh=F8tu3WuiW3PmE3rgQPa9do/fl6ttPM7FbJ5qe7bmOtM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SG437155MkyC9dxXRdTCVpcPd2PwecZ59SMpZaRQMEV4ukhef4P2V9DCcveu7TeAAYIqW6QPxfx9S4BFFhGqA98d0OWtL0KtLU+es37JYFvi2V7Lum8FsXBuM4IqjhItpIl4ejsLfv7a74nT3EbKt7qFz5WSCI4Jl5D5LrBcvgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1Evgw0t; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1Evgw0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784938902; x=1816474902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F8tu3WuiW3PmE3rgQPa9do/fl6ttPM7FbJ5qe7bmOtM=;
  b=k1Evgw0tCYqrNfjF0/Y1xnO6z7pJ9FxZP40Xq9JW7tU7NkSwfy2x+JA1
   tLq+Pt36EES52ODFX5GOJAUp9xJcqlh4uEIB8UMcOezygt7GK5QJmSLfC
   F1nbykjSK8qGDnWTFI4FlmfZM7zdohH/cfwfoedgx7fxBaYtoEK/jxrzX
   T2dIu5EPzVDyx/cZ01CLLiXHe5T8WaPS7BIYYDfWzVIk+QmqhJ5ct0OWT
   qT94FZPyYiXEFGKx2hlGfnZiMauy8K+6HMwwgUsNEnRy06VK3sMgxrTpW
   +pmQPIqUIRqNFF+C3ynKK9ZVljgO+32ZAuc+3qc+sm7yZT6aahs4z0+v5
   Q==;
X-CSE-ConnectionGUID: /naFz988RGaixe0lXMu8ww==
X-CSE-MsgGUID: IrLw+YeRSAWh+cmg1gkk9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85478991"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85478991"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 17:21:41 -0700
X-CSE-ConnectionGUID: 6xhAX8P3QSCSjrVfZieeow==
X-CSE-MsgGUID: /ammhzJnTjiaXYACzlsbig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="283351629"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jul 2026 17:21:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnQ94-0000000014Y-1pyE;
	Sat, 25 Jul 2026 00:21:38 +0000
Date: Sat, 25 Jul 2026 02:21:17 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: /kbuild/src/scripts/syscalltbl.sh: 100: Syntax error:
 redirection unexpected
Message-ID: <202607250223.SRjDp1Mi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/syscalls-Create-unified-partial-table-for-all-archs/20260725-040333
head:   8c63d3ddb37ca9ef5da08071f85493dd0b281816
commit: d1da21b66eb29855b0d6a4d81ddfeb31efd2f125 syscalls: Create unified partial table for all archs
date:   4 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce: (https://download.01.org/0day-ci/archive/20260725/202607250223.SRjDp1Mi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250223.SRjDp1Mi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /kbuild/src/scripts/syscalltbl.sh: 100: Syntax error: redirection unexpected
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:52: arch/x86/include/generated/asm/syscalls_32.h] Error 2
>> /kbuild/src/scripts/syscallhdr.sh: 114: /kbuild/src/scripts/syscallhdr.sh: 114: Syntax error: redirection unexpectedSyntax error: redirection unexpected
   
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:29: arch/x86/include/generated/uapi/asm/unistd_32.h] Error 2
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:43: arch/x86/include/generated/uapi/asm/unistd_64.h] Error 2
>> /kbuild/src/scripts/syscallhdr.sh: 114: Syntax error: redirection unexpected
   make[3]: *** [/kbuild/src/arch/x86/entry/syscalls/Makefile:39: arch/x86/include/generated/uapi/asm/unistd_x32.h] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [/kbuild/src/arch/x86/Makefile:256: archheaders] Error 2
   make[2]: Target 'headers' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
