Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABE4071C2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 23:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780701376; cv=none; b=MAbeEt7/ixkT1qeSCIgRFcnop8B4i4jsXe75BUHc2ThN12fuio7e70DYQP85z34nF+B7xYF8kHJsNZ7VIezaCfx4S8NQAidB8pQSP8JyjFTj8nwUt37nj79riOxt0uXThMjIOYtlKW6K7De1IwWlFXlpNK10PLHQpLGaSGgXeI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780701376; c=relaxed/simple;
	bh=NG/G/vdGbd/Z+6Vu+mKN9jxedQ8dO+wvOweMBoAlo3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EXxFG+L+GQisrsXLRvZ23j/ei63EnnY+Rdly5YwlnGwvBmh1UK06n6V2QTe4bmUxDw7OVOJVbBrqX2c/AbUauagyfJSKJNJHGwu1bDraYUauxwCTq2yf3ytsYyndxLYRYUGs/SkFF965sKMlPYPKqXWI4oPdo8TDv+yKklS1h58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6iP4KgF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6iP4KgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780701374; x=1812237374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NG/G/vdGbd/Z+6Vu+mKN9jxedQ8dO+wvOweMBoAlo3A=;
  b=N6iP4KgFh0yrv3c11FPsjKVwBkwDTyoi0jPPvsVj42OoRpVRAOJCUp0q
   ILp4s1zBu3Ghs8jSdSRtOEjUAbjG8fLdkU41p2VYckgvAFiSl3lx250Sr
   tjoV5LxiozMeMEmSS7B3aWAj3WKEQQrMo4a10HGAtsGcppr5+GEdA2cMZ
   7UjpuwQ6vnPivX4973DXCd86Mogfq2VT+xIzSuIGhy526OwYYjJyJYbj1
   mJ341+BQdWcmzC/Vvb1on5ZDUxJ6S2vY1rF7pVscv9Ak8Ar6ITlKPrVde
   RSIKVj7qZW4AB1Wvuma0fhN4xdo6T7tdLbQwTkPjmV6Yhplpdxfz2KvHv
   Q==;
X-CSE-ConnectionGUID: OcEvw2uxTR+Sjv/2GMZmrg==
X-CSE-MsgGUID: QYG6VLpGTEOx5aLo7y3qlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="99111645"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="99111645"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 16:16:14 -0700
X-CSE-ConnectionGUID: 0vVNzSUSTQ6inrzkklHcpw==
X-CSE-MsgGUID: 82u4KH8GRS6hhYJUgVqC2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="275187348"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2026 16:16:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVdlp-00000000GY6-3ovW;
	Fri, 05 Jun 2026 23:16:09 +0000
Date: Sat, 06 Jun 2026 07:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-arch-clockmodes 2/2] /bin/sh: 1:
 cannot create arch/openrisc/include/generated/asm/vdso/clocksource.h:
 Directory nonexistent
Message-ID: <202606060704.Ld5uk6Eq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-arch-clockmodes
head:   1b1c323824ccf946f485c54ed34d3a73a9e92651
commit: 1b1c323824ccf946f485c54ed34d3a73a9e92651 [2/2] vDSO: Make clockmode constants available without CONFIG_GENERIC_GETTIMEOFDAY
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260606/202606060704.Ld5uk6Eq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060704.Ld5uk6Eq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060704.Ld5uk6Eq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: cannot create arch/openrisc/include/generated/asm/vdso/clocksource.h: Directory nonexistent
   make[3]: *** [scripts/Makefile.asm-headers:78: arch/openrisc/include/generated/asm/vdso/clocksource.h] Error 2
   make[3]: Target 'all' not remade because of errors.
   make[2]: *** [Makefile:1393: asm-generic] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
