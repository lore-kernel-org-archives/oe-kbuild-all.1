Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C71D5CE8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 18:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749320607; cv=none; b=GI2OGykrIiC+AsDghmoO66uqjR/Pe4nZUhU/yx8Os9ZGNkB0I/NjkbcJk/w7jeK8K+RI3sqCE5j0Sg4R2YmJf5U5IcR56LrEgnDMmcZDLOUVpaMWA20ckSDhoUQxtYJ8hEoZ0w025ZxALKUOvwy2Q5cCrppSI2bCuPk6F0RkXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749320607; c=relaxed/simple;
	bh=OsnyKiJzbiVVgC3m/F8n5afYqbC/hBaaMkFGxfrT1P0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GkEUcWryXApaaRSQbmxeXsisP6nSqdT2jJE38auNiO0rHeIlH4B8pIvVx8/mWbFmsqUpd3JALRCgWqf/6XIq7L2Lt2GJZ0413pSz6lW8YoShWRvrrtKFcI9rdiKCLcvAEZIAHjn1z2UBTbH6bvZhMY2C7C62To08/lFFpbd2HVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaVaYPiE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaVaYPiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749320606; x=1780856606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsnyKiJzbiVVgC3m/F8n5afYqbC/hBaaMkFGxfrT1P0=;
  b=KaVaYPiE6pZ6dOfTqYJmc1WmH42qF8bI7BQP47TRxnB+zj2rGnYIT2a1
   7GlKvgdbM415bbUHDWvmpKjDK+aM8ng2EdfucV0lZV50Pibes1KWoIV7c
   uZf1WoonJuJC3ERf8hOp7Gn/tsj3ApQGy8SKehQJZBy3NEtScuTEZej3I
   hCBG1LWvGcS12rn5OQUtxOhiycmImDl3jezy+NClE14vSCYaQWWdLoueM
   m5URL2MUzftLYHD3UjxNWGd4QkHZi9A+tN4h6KpVcLQNWptugSPuLnC5T
   O02Lcp/HRfIo1BkTfFJAK+e3DjW5WtPTxwWLotko8YnbQtubTVScDQydv
   Q==;
X-CSE-ConnectionGUID: yrrhfoNZR8uziixih0hjhQ==
X-CSE-MsgGUID: 7ai7tijmSF6huB7qG9zPGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="50554988"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="50554988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 11:23:25 -0700
X-CSE-ConnectionGUID: IUP2DfonTb60C4GfNODcgw==
X-CSE-MsgGUID: AjzCqhqdTfWQiHLqBQt5SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="149935638"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jun 2025 11:23:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNyCQ-0005vx-0Y;
	Sat, 07 Jun 2025 18:23:22 +0000
Date: Sun, 8 Jun 2025 02:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 7/21]
 arch/x86/include/asm/msr-xen.h:31:10: error: invalid input size for
 constraint 'a'
Message-ID: <202506080220.CcibyyWi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   c51b6cfbe618f75b4ccf351866386968eefcf9dc
commit: fe551b0cfdbd17501cb584baf185e074fba0395e [7/21] x86/msr: Utilize the alternatives mechanism to write MSR
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250608/202506080220.CcibyyWi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506080220.CcibyyWi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080220.CcibyyWi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/entry/vdso/vdso32/vclock_gettime.c:4:
   In file included from arch/x86/entry/vdso/vdso32/../vclock_gettime.c:11:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:13:
>> arch/x86/include/asm/msr-xen.h:31:10: error: invalid input size for constraint 'a'
      31 |                 : "a" (val), "c" (msr), [type] "i" (type)
         |                        ^
   1 error generated.


vim +/a +31 arch/x86/include/asm/msr-xen.h

    15	
    16	/* No plan to support immediate form MSR instructions in Xen */
    17	static __always_inline bool __xenpv_wrmsrq(u32 msr, u64 val, int type)
    18	{
    19		BUG_ON(!cpu_feature_enabled(X86_FEATURE_XENPV));
    20	
    21		asm_inline volatile goto(
    22			"call asm_xen_write_msr\n\t"
    23			"jnz 2f\n\t"
    24			ALTERNATIVE("1: ds wrmsr",
    25				    ASM_WRMSRNS,
    26				    X86_FEATURE_WRMSRNS)
    27			"2:\n"
    28			_ASM_EXTABLE_TYPE(1b, %l[badmsr], %c[type])	/* For WRMSR(NS) */
    29	
    30			: ASM_CALL_CONSTRAINT
  > 31			: "a" (val), "c" (msr), [type] "i" (type)
    32			: "memory", "rdx"
    33			: badmsr);
    34	
    35		return false;
    36	
    37	badmsr:
    38		return true;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
