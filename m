Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879731AF1E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367880; cv=none; b=th1Yvy/E2SXs520tZ0GWwOhBAG8L7DUBziAVo4cytMb5kWsat5qOe3X3Os97oHkccFDdY3d9E4H110qkwvX3UCJo/myw0QOz7ZeFAdYB24w4afnvDaiaiQrpovanEZ7aF15tO3ByecC1eSpnR36OANvhiZ6JmunabeV4PFVh8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367880; c=relaxed/simple;
	bh=TQXycHqSL6n0JiU8w2DSD4c8pWvEIcHv4C500Nkfg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw4NNnMy2iqhCcJnc9dRSYj/c8AdVaTHeevdi957ExCM29+MyeEvpsI3YrJbL6EDqLPOnU4JcPmh9bzH8pN3RJG4Y4AOAj9EqpYE5SmEgiF/ExpLQZu5dLtSRUh7Ce58M4YtT5sLhH5LZDdcn87h1W2mAbhEaoHVv6bIJpZv3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zes+dOei; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zes+dOei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763367878; x=1794903878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TQXycHqSL6n0JiU8w2DSD4c8pWvEIcHv4C500Nkfg4Y=;
  b=Zes+dOeiv4VWl6RI5LFNZpkjdMJNnHLwjxTcZasr9A118lDX5OJeHkTh
   xnMoCeqwyYF1pfkrOSy0ETVkyXbDN0Ix6FcjCsquMvAN0p8dYE6iIM7wl
   BjRmgnhBTFDgGjYRzqhXT6HbJXR9uNUqAQc3pjdYpZz3WpYdAZrseemHq
   aGBgqpRpUjxnumxwUG0Oy77MF7rY926vLZcApqSzR/G4GkPqRn1ZUJmQM
   0NYkZDv1/aAO9qUrqmzdgTRmLSDxXICbj1FTfU29kGRXrPSE6kYFAqjcl
   C/e0cd9ZZN54PiCuGiKCcktD72Ll7F0ahfK9AREWkasfDX8RXoBYLbUp2
   g==;
X-CSE-ConnectionGUID: yzizEqsvT0SBygDSkmbPMA==
X-CSE-MsgGUID: P4/ArjPUQIyHYssLKUA1BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65397101"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="65397101"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 00:24:30 -0800
X-CSE-ConnectionGUID: c9glhzGwQYuv/RYm2wflTw==
X-CSE-MsgGUID: aoQUlQ2sRDOdCer+E0IhDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="190549375"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2025 00:24:30 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKuXD-0000JX-0x;
	Mon, 17 Nov 2025 08:24:27 +0000
Date: Mon, 17 Nov 2025 16:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta via B4 Relay <devnull+debug.rivosinc.com@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v23 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <202511171618.ISGQXA1I-lkp@intel.com>
References: <20251112-v5_user_cfi_series-v23-25-b55691eacf4f@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-v5_user_cfi_series-v23-25-b55691eacf4f@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta-via-B4-Relay/mm-VM_SHADOW_STACK-definition-for-riscv/20251113-084937
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251112-v5_user_cfi_series-v23-25-b55691eacf4f%40rivosinc.com
patch subject: [PATCH v23 25/28] riscv: create a config for shadow stack and landing pad instr support
config: riscv-randconfig-002-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171618.ISGQXA1I-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251117/202511171618.ISGQXA1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511171618.ISGQXA1I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> objcopy: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> objcopy: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/rt_sigreturn.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getcpu.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/flush_icache.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/sys_hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/note.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
   riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
