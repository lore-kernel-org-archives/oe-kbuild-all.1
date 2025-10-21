Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D512635
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 02:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761012471; cv=none; b=NVJ1pmZS9t5IndD0I6jIQX6FkV/+qmZ+DIkhDuuNh1WDlAPzvAJZXF6O6AZgb2pJFWD2KrM3KHZmtm+eIWe4hEbj7/A88HO+BVKZfhm9mBM52mVamiewww4qseUVTqJST+AuAoEnQqhxopfuzvYPiyTgjlZ5T3puqzTJDBXqQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761012471; c=relaxed/simple;
	bh=Mflq5XVQFspwunQfr5IfrfMajezAK6oU59Lw/8gbw0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IraBhWhLYvZx8YPOiij5TzCKLhROoQpsSq4t87T4uGb7Etm6xuzOSYSs/cQxP0NBhzQ6+ZOmKkvVv0fkMUs1RWuvrT2wzifbT9akVmC8UDNKZP781B02aZwbWforn3XsjrrAvvlc3Xx5YKdDHu/CbyUgUFWi5DJ0BW+BsWfkA0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g04dwfhS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g04dwfhS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761012470; x=1792548470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Mflq5XVQFspwunQfr5IfrfMajezAK6oU59Lw/8gbw0E=;
  b=g04dwfhSt7M4pr66nJQOql4VnwS3FhdGeR1I7g2LZCyTk+U1kkU94FqM
   sCCpA39+P/co6PNmQwkXf92sTikiGdMAOvtUlgDeLoIPDU7IBkMYC4U3b
   S4t+S/TXavaBc/j9BCYfgA7twsDHh3pXaKdf1ePsPCZ7Thsy4q1iL+kf/
   RUSDXDwYfimpQ3tE7HqybMgArPVawwXL907GowSitGXBB0ojlyMnFsYXE
   hk3BlDaqTf+cX5+c9JWc2TKnDr0ARQIMMFu3vqOVoYsZwatEqkYdxCe4l
   lEw3hicwBvUZAB9z/7N8Q5fzhUCzUdUbmY93N0M1PIQtQXFhe/1+QB8Oi
   g==;
X-CSE-ConnectionGUID: hHQ1h0e7QDq+LXq/nAETOQ==
X-CSE-MsgGUID: Oof68qgxR4eU2Tdqb8rT0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63044133"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63044133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 19:07:49 -0700
X-CSE-ConnectionGUID: xEp/vqrFTuq8sertBKI2EQ==
X-CSE-MsgGUID: g39KyKFpSCqXKtpySVixFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="214435477"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2025 19:07:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB1mk-000AMv-07;
	Tue, 21 Oct 2025 02:07:39 +0000
Date: Tue, 21 Oct 2025 10:06:57 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v21 25/28] riscv: create a config for shadow stack and
 landing pad instr support
Message-ID: <202510210913.T4XXCGuu-lkp@intel.com>
References: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-v5_user_cfi_series-v21-25-6a07856e90e7@rivosinc.com>

Hi Deepak,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/mm-VM_SHADOW_STACK-definition-for-riscv/20251016-021733
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251015-v5_user_cfi_series-v21-25-6a07856e90e7%40rivosinc.com
patch subject: [PATCH v21 25/28] riscv: create a config for shadow stack and landing pad instr support
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20251021/202510210913.T4XXCGuu-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210913.T4XXCGuu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210913.T4XXCGuu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/rt_sigreturn.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getcpu.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/flush_icache.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/sys_hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/note.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
--
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/rt_sigreturn.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgettimeofday.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getcpu.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/flush_icache.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/sys_hwprobe.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/getrandom.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/note.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-ld: warning: arch/riscv/kernel/vdso_cfi/vgetrandom-chacha.o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-objcopy: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg.tmp: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
>> riscv64-linux-nm: warning: arch/riscv/kernel/vdso_cfi/vdso-cfi.so.dbg: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
