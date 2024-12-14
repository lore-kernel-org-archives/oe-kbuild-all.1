Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6FB18AFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 04:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734152084; cv=none; b=HWowYg80WBsUH7hkN+bXMhQix7Mx6bLCjXZptv6bVMAx+m7XbrhgAju+93FfwT/OSxkD+UPUQQGadn/tEgzw9ELE0kSHjSnwRoyQwPdXdLiv5GG4UbPLcv479M8oUsFBuMeZAMcESy6M0TW8HErapYmCUgJ5PbIeWOgU3jG2Wh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734152084; c=relaxed/simple;
	bh=Htp3jrrK12YoEhQmxDNEGbO+JeDA399E5q95WXM5blY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uvk6YwTWZMesaK9SskRK77SOIAA0zDp9F7KOceNgHVxHrgq/Mh1zdakUurOk+HZiVZkGz22NAXYsvH4zhnNVl85V/HyvFr4krzZUMSq2YdMUBaI1Fuo/ke1sXrxhwiQK0XPGpQ/Nir7GA/OuwW+J4lYpQsXZ3CIuZR1GAYoo8OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCbU5vBR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCbU5vBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734152082; x=1765688082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Htp3jrrK12YoEhQmxDNEGbO+JeDA399E5q95WXM5blY=;
  b=NCbU5vBRT/tBNc2EcyN52l3FhRV7zLVjVcQ6OoS4pOFIn8xSpEwGdhSY
   rXb8f4pSNC9FEiq1HLNGYOLEgiBmvpFyZqtuzrcqBOg5uwsNmr6JOHIpl
   k9ty8ebdPRSBScB5fAOYf6dQAzABrtTXEWk19g1cl6ba53ObpclKmyvMO
   HIkf5QcJ9Qmg9SLa5RmioI9dQy4dZexYMIRvQ0CYM9QuaVrFWdeg8YNnZ
   x57IZuFOoetUV+mdCgTVNdbKTN6PJ0P7cR9gZctdJQoSu6vFjr4sw8YbI
   x8TvrPGsyf7x7oK6XEtaVZ9vnKLFRYAKsyPgbChd6YRExX7xncJoIr0yt
   w==;
X-CSE-ConnectionGUID: 5SVV0q9vQGWugu64AEWS5Q==
X-CSE-MsgGUID: w4RDQixNSMKjfybZNbTr0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46003671"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46003671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 20:54:42 -0800
X-CSE-ConnectionGUID: OYD5K7t+QCmGFRIO/MSKQA==
X-CSE-MsgGUID: bixVIZSYTYeJZHf+YoKihQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97153272"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2024 20:54:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMKAo-000CiB-2T;
	Sat, 14 Dec 2024 04:54:38 +0000
Date: Sat, 14 Dec 2024 12:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/3] ld.lld: warning:
 drivers/vmlinux.o.lto.built-in.a(privcmd.o at
 143086).o:(.discard.ignore_alts+0x0): has non-ABS relocation R_386_PC32
 against symbol ''
Message-ID: <202412141200.RSbKBQBU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   c7ba1c1c82ed097a483b2e866cf7c04369579143
commit: 38bfd3357f2354c7299584c06f188dc45d65c54a [1/3] FROMLIST: x86, mem: move memmove to out of line assembler
config: i386-buildonly-randconfig-003-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141200.RSbKBQBU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141200.RSbKBQBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141200.RSbKBQBU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: drivers/vmlinux.o.lto.built-in.a(privcmd.o at 143086).o:(.discard.ignore_alts+0x0): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: drivers/vmlinux.o.lto.built-in.a(privcmd.o at 143086).o:(.discard.ignore_alts+0x4): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: drivers/vmlinux.o.lto.built-in.a(privcmd.o at 143086).o:(.discard.ignore_alts+0x8): has non-ABS relocation R_386_PC32 against symbol ''
   ld.lld: warning: drivers/vmlinux.o.lto.built-in.a(privcmd.o at 143086).o:(.discard.ignore_alts+0xc): has non-ABS relocation R_386_PC32 against symbol ''

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
