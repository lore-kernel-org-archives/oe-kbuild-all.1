Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA60EEC0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 01:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961030; cv=none; b=iQV4lWqul/SOr0taO0XAhD+eY5TAMnmx+NUoVQYA3SpzOia0PuBrTE8XkkBoflBt+BzwJJpsJWz0FnIpiaZDvGanGXEXOsUOL+r5zT1XZxyJXaYAr1LTlnsunkqMtrggBry3jz1Ptv4JqlsyQCVvjoUPn2jmi0tU/lYbGVYLwnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961030; c=relaxed/simple;
	bh=Rkkf8MpX+s4+F2e+OJ/ETxMiyo/ztkZEBsrghdoAYOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QLNg64EfUqlbOnRxpDSK63qzl94ufa4gordsseoFtIbiLgT5gO1fILgQ85WWR039AdoqAa6Bpv34JCIVdrEcdt801Zvbi+GeXrVEA/e2sRS/eg51AolTyWxqB7shLRaNSX96Iyvov4pA1BN1IjXXBplLJRp/drHsxogKvtvtmDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Un3MMF4/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Un3MMF4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761961029; x=1793497029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rkkf8MpX+s4+F2e+OJ/ETxMiyo/ztkZEBsrghdoAYOk=;
  b=Un3MMF4/0GO7SfVdR0F9ozRwlT2aM52tA6EAPzZXVWwDHX0gJz5DcfCB
   MIveTDNmmZK9aYMBCuBMwq2iyfhU8B09ftPwXKKfGjFtGkUn3+j6Z0J6W
   OvHicIuYAz+nd1m6oUl5kcfPnyrrEEpA3C2fSJA/k1FVvdbPIuRJKd/EO
   ifUEUoYjYUVhiox8pBXjAGoMpHSankGmAcitG65g97b0iUH9coSEMtAPr
   iuf/chntWaYAkgkPqFHn+x3Oafo4pqbzUnvq+04/zLTxCD/DiNYJbKD+W
   NAbf9Yo8TCpum/gmumH98XNjXZsDa5Hxw18s9zIDCv7VQkmRTtXwZLB37
   A==;
X-CSE-ConnectionGUID: Z4VzU5B7Rt+S5PnBUOrB3Q==
X-CSE-MsgGUID: zBg47HUnRxOTchp8qXn7QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64226451"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="64226451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 18:37:08 -0700
X-CSE-ConnectionGUID: 8xwwAkv1Tkm5VmHEkXQvMg==
X-CSE-MsgGUID: omvXYY0mRMStdt1hDXKvPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; 
   d="scan'208";a="186702670"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2025 18:37:07 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF0Y6-000Nnc-39;
	Sat, 01 Nov 2025 01:37:00 +0000
Date: Sat, 1 Nov 2025 09:36:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <yury.norov@gmail.com>
Subject: [tglx-devel:rseq/slice 52/75] WARNING: modpost: vmlinux: section
 mismatch in reference: smp_start_cpus+0x0 (section: .text) ->
 set_cpu_possible (section: .init.text)
Message-ID: <202511010939.MnRSFUT7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   bee383449566a64254362dc3ff6a1bfd5bcb6a57
commit: 062451b0e7535f465e755354d2a410c841bfc2a4 [52/75] cpumask: Cache num_possible_cpus()
config: hexagon-randconfig-r051-20251101 (https://download.01.org/0day-ci/archive/20251101/202511010939.MnRSFUT7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511010939.MnRSFUT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010939.MnRSFUT7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x0 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x4 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0xc (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x10 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x18 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x1c (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x24 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x28 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x30 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x34 (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x3c (section: .text) -> set_cpu_possible (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: smp_start_cpus+0x40 (section: .text) -> set_cpu_possible (section: .init.text)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
