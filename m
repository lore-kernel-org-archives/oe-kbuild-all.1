Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6A013B7A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766829285; cv=none; b=rz1wwNgXfboYUBKa/V5d1gLpDiH0n0FpmaJHDLHYmzQLJvUnLlYyydgYLokkp8YPEHc9YVCxyTccAvHK0yXXHEjzKSZtQzXBnGTUUJXWhIbQgwyp7lPtQH+MHIviHK1evOZmhtevt+EtxaXtycoaCrOl9Z99W5Ggn+dE7UDPPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766829285; c=relaxed/simple;
	bh=Q4dN823M7ZdkYe0/J0D3MJqQIm3xxOnoad05KwHs6Vw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MdzOcD9Fcoxz6kdqI0eGu3q8Vib0LxRL+h+fiQM9f74MdxpJYEe0Ta2CycwJKuSITZcSXkL9WpsPZbcm2yvlmCvlLQbNXEs//fACVgCivXv+enVkwHJg+OaZQTWhqO0GqnHrh8QOp/y5bmUNYhw5wHYiAKNPqSjc2wJtuWIncgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdwllrvG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdwllrvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766829285; x=1798365285;
  h=date:from:to:cc:subject:message-id;
  bh=Q4dN823M7ZdkYe0/J0D3MJqQIm3xxOnoad05KwHs6Vw=;
  b=OdwllrvGkg33/oEkwx4/HNXUDY4Ug/d068S4yhIPdBicqsEhZZ2rCw9T
   FAxABsDluTOzNi2mnpFD/cqeA18H7llrwicmPgc3GBiOT6vD0iiKCr5D5
   GXzwP5aCvoIWfwxj1+/7gILkcNOquQxjTNjST3wUiGwpiw8NDdh65LBpE
   xwxtsu14FIMmZula3IshnZNLJUKxfcfdI7MojwRZI5UsU/zzj2wXs04r2
   FIokOrV6gNFpxLcyxwKFYpoILs+gCUvYzi7LVe1fojLuGg2m3zcBsZxp6
   lblNIdszY6mPp4aroPZePrPUPEyrJnGB8Lpv4IOAqEbxGyM+3+dHYHPFn
   w==;
X-CSE-ConnectionGUID: PsGaQJ31Toy5dLDM/PWQqQ==
X-CSE-MsgGUID: DJbA2PRHRKiFQ1qNOFgg/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68429894"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68429894"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 01:54:43 -0800
X-CSE-ConnectionGUID: EXhPyXTuTImlXiCM97PHqw==
X-CSE-MsgGUID: oCtXGy2eQtmZbkkLiByvQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="199665802"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Dec 2025 01:54:41 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZR0Q-000000005iz-1ljT;
	Sat, 27 Dec 2025 09:54:38 +0000
Date: Sat, 27 Dec 2025 17:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
 Zong Li <zong.li@sifive.com>
Subject: [linux-next:master 1089/2671] riscv64-linux-ld: warning:
 arch/riscv/kernel/vdso_cfi/rt_sigreturn.o: unsupported GNU_PROPERTY_TYPE (5)
 type: 0xc0000000
Message-ID: <202512271717.NHNcN7vO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: 405206dc27786f57ba5febb9b1b9e698a071125a [1089/2671] riscv: create a Kconfig fragment for shadow stack and landing pad support
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20251227/202512271717.NHNcN7vO-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271717.NHNcN7vO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271717.NHNcN7vO-lkp@intel.com/

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
