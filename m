Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA3972632
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701690; cv=none; b=T+7QYC2mYy1uovmXr21WkFnMRVaL1JdlWKbOasuXY371BXAu/PFMoGCjCN3dMy76YBPpGNjhMo/Rzq2KkI9v6USg5cI3LZXLKdsgNuiI+F9khIiViPDO6NRNY34zkCs08wD0Rga8HG2elyR214mN8viysEY86U/11XiZa3AB7L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701690; c=relaxed/simple;
	bh=0G3xGn0wXbbQHsU0iJh2t1R6DRC5QbtGgfgbZOM7w80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0eVSiZTaCwsQDPhPgqaYYIS/t709JticmHg4qlQAfk+cC7FDWM4WrkGvYRkbUwtDxgpXnMNHLUKakIQCJGMhZ7T/VJbJ70wZfJGkXt4W6xclw12EdCmcrmNrOS0Mrs5Ie8sq97bOUZew/+mZ2gFkA1rKU9L5x5u4jhCq+XrOdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBBb09pU; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBBb09pU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746701689; x=1778237689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0G3xGn0wXbbQHsU0iJh2t1R6DRC5QbtGgfgbZOM7w80=;
  b=OBBb09pU02IQrfSP2WamDtZ5NZMC0Paeqw0PQ6VM8Sk6Tg+fW+aWQqW6
   rBgjzQvn00rZq9CB0Rh0acno1SH64bnhFtPP4sXxV2thQUozYSodaQ/2n
   JhN/DBnEbdZqpGYqr+c/pIiAD+cX7RYAn825vjjOjPlEc1IF/+79Nrtez
   X14DZBRA6n3x5A0yEgAEpabLvlAF6bJn3Dd/29LGNHRGZIJq1VsmoJ3or
   hfWcYrGhYowwQzHB1DjBHUYemvU4KMLU82TTqe1NsLQm9FhrcV4E+NFH8
   mAc4l6BrE/kCuMpcu6/DNWYu0GEugW5QmyrfyF0W2AwLs0BcQ8GQZrTJQ
   w==;
X-CSE-ConnectionGUID: Pb0a4jP4Qx28s0a9TseYgg==
X-CSE-MsgGUID: rr51F7XpQhibhQNrWK4rPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48344967"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48344967"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:54:48 -0700
X-CSE-ConnectionGUID: MVDszO5nScqLESOCU4F2bg==
X-CSE-MsgGUID: AyjaBK2iQ7Kk+u+jThF7Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136134706"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 May 2025 03:54:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCytp-000AtJ-17;
	Thu, 08 May 2025 10:54:45 +0000
Date: Thu, 8 May 2025 18:54:15 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6916/9729] (.ref.text+0xac): relocation truncated
 to fit: R_MIPS_26 against `start_kernel'
Message-ID: <202505081840.Xx7TDoR8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 852faf805539484968aa8cc93866008b7a6d0d52 [6916/9729] gcc-plugins: remove SANCOV gcc plugin
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505081840.Xx7TDoR8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081840.Xx7TDoR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081840.Xx7TDoR8-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `kernel_entry':
>> (.ref.text+0xac): relocation truncated to fit: R_MIPS_26 against `start_kernel'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x8): relocation truncated to fit: R_MIPS_26 against `_mcount'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `_mcount'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x58): relocation truncated to fit: R_MIPS_26 against `_mcount'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x80): relocation truncated to fit: R_MIPS_26 against `_mcount'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0xa8): relocation truncated to fit: R_MIPS_26 against `_mcount'
>> main.c:(.init.text+0xdc): relocation truncated to fit: R_MIPS_26 against `__ubsan_handle_out_of_bounds'
>> main.c:(.init.text+0xf0): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_const_cmp4'
   init/main.o: in function `rdinit_setup':
   main.c:(.init.text+0x13c): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x170): relocation truncated to fit: R_MIPS_26 against `__ubsan_handle_out_of_bounds'
   main.c:(.init.text+0x184): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
