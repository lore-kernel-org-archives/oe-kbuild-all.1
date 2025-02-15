Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7A3C14
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577637; cv=none; b=ddsOFAuTc27opEk30qapfK7983FfqPm94sKvrhf9LuS/lkoHAdvrJ+kwNUYQRJJAIVpkyjn4mBRtNFHKInrgg8LaSVRjtFVYx9XS6sG/Ofnnaov1hdKUz7i3y4a+wgiHQOed2uloMjRWPXLJEQcplHz3mSu+oVTb7mk1ZeUUjcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577637; c=relaxed/simple;
	bh=amuutJCuNDxyZJ7QgT7xRyCe6q1uiWlS8hBJVV0XIWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZ7mDNh5ba4u0i1DhWa0HzGKaQFsvc3BazcQpbw/NUG7tQGfCq/A8Izp2fS/QrOZsD18SFClWKeI6qMEvm2jnjigJG9ZyKTz7Tyx4sZEOnuOTEIyI9ccyMrbxcrP7u8Zltkr+5oKceIZC1EnCQjWOX7tpOAt1Wz3Ooo566O9TD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRYzY/5r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRYzY/5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739577634; x=1771113634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=amuutJCuNDxyZJ7QgT7xRyCe6q1uiWlS8hBJVV0XIWI=;
  b=fRYzY/5rl+F9147tpvejdDtU7g4aklO7N+uGCqlt2fV2oCMGOcBaGPWz
   2+MQvHgXWkPyte0Xj6mTJ9NyxbU+xKn/ETWU2khw7O9ZbSXcYsN/QkZRs
   owt2UXq0NgJ6eeL6VluB6Fm5XxprEqqA4I4mzyFX0CN30IhT+CcIunQxy
   H3IDiduvkGVffpZglgizThU0mie+dS8bNtsVqFPwhLxi5K9Mr0XXbjpLa
   +RWEKuzAPJvi9DHGJ+czAdAnKQe/aUIfeY6yP0dyH1RwlgGPO5GWW8GME
   ye+IgOJE6+QMAC5HRwI+p2pJH9SqK0As3EMdJWrRdRI0LeBohzzENWkjM
   A==;
X-CSE-ConnectionGUID: kcAboLk6Q4qPD61iRUoi+A==
X-CSE-MsgGUID: 4UB8UrSFSyu3WjP6rv1yLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39526549"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="39526549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 16:00:34 -0800
X-CSE-ConnectionGUID: qvTrUmPaRKKDNmIluC0dnw==
X-CSE-MsgGUID: q5BlMU0ITliDd0aybViZww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="113449214"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Feb 2025 16:00:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj5bi-001AIv-1A;
	Sat, 15 Feb 2025 00:00:30 +0000
Date: Sat, 15 Feb 2025 08:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'errata_list'; recompile with -fPIC
Message-ID: <202502150711.cW42YQaA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04f41cbf03ec7221ab0b179e336f4c805ee55520
commit: f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice value calculation
date:   7 months ago
config: riscv-randconfig-r054-20250214 (https://download.01.org/0day-ci/archive/20250215/202502150711.cW42YQaA-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150711.cW42YQaA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150711.cW42YQaA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'errata_list'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:93 (arch/riscv/errata/sifive/errata.c:93)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'errata_list'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:93 (arch/riscv/errata/sifive/errata.c:93)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'errata_list'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'errata_list'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L.str.8'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:0 (arch/riscv/errata/sifive/errata.c:0)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L.str.8'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:71 (arch/riscv/errata/sifive/errata.c:71)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol '.L.str'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'text_mutex'; recompile with -fPIC
   >>> defined in vmlinux.a(kernel/extable.o)
   >>> referenced by errata.c:99 (arch/riscv/errata/sifive/errata.c:99)
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
