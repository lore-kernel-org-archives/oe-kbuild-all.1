Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6716C17C9F1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 12:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737806517; cv=none; b=Da1b1ES0TPsVssCBxJ8AzhuFUl6v6CjfYsZndNWXhtt45A+CLajP1jbSRH+Ed3OSMf33k3NJOQu3jOSK18ZVpkO0IE/9PDnGiIE1MaiP2uJsC/qZNssdQIc82Okp2mKbXkRmSx4o6Ed3SHX2I69bEptjL4gSLFkcRrZRvRmm3nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737806517; c=relaxed/simple;
	bh=qRyMghLX+PRlRT9KcNfggUwV/vTXa0NRAck0fAubLKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WmYwlP4cWxqUf4vQ7DpFOfBlX3uhPehpCeQNvNDLb/XkkcEcwTQ8CYaLkO2HJUxkU7XAgODKp2OKzDAj9yoxHtX7S95XgDDobANZAdmivBGpJJe/l9k6f1ioHK4KJurtcYMYExb4TTVstsvLagCH/dryVtDFouyic1DNPrOfLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNmCK4bM; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNmCK4bM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737806516; x=1769342516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRyMghLX+PRlRT9KcNfggUwV/vTXa0NRAck0fAubLKA=;
  b=YNmCK4bMnW/dJOzONUuXctWjQuXmXaLJnUhtVpfRGXpB5SHi+jzjA5B+
   ipI33z5nhqNaq0auG0HY4P9lEbuMJ3JHvpvfugkH0HhLSUEOv9hMSdnT7
   kZwvi9tLOc5yoCfgFRqflwsZq/zcgHgoQO7Lm+tGoYgK+OTomkMTAjMWo
   tWaWJTc/llZz/nPYpnwV9snylUVvvY8dx0YYHgmCT9ADdAzfKPK+YKmwo
   hZIM9acTZ99hlTNNE1a9xgq2AIikgP+DhN+rrb4JZyoJmIyCXkUhOZVwl
   XRebtxsBb+mE5YjXqCXI/SzGfdNEsKJTLO2LihwyfzUWiA44luPsM6xsk
   w==;
X-CSE-ConnectionGUID: WRvKhHxhTP2ibAPdyPO9Gg==
X-CSE-MsgGUID: 9Qn7m2eTRPabiurg1MdNxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38472724"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38472724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 04:01:55 -0800
X-CSE-ConnectionGUID: vN45d00ORE26M/UISPHRsQ==
X-CSE-MsgGUID: jcFn/zhSQHa9rIRC0nGrRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="138866758"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2025 04:01:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tberH-000dmw-1X;
	Sat, 25 Jan 2025 12:01:51 +0000
Date: Sat, 25 Jan 2025 20:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:compat_get_cpumask 6/8] clang diag:
 include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t'
 will not be visible outside of this function
Message-ID: <202501251947.JAiy4D8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux compat_get_cpumask
head:   b7162e407638adc57cdf6d6f1acea90f9d84a638
commit: 2dc86881c56e6ed3f0b9640c3a402631aaeca482 [6/8] compat: add compat_get_cpumask
config: x86_64-randconfig-006-20250125 (https://download.01.org/0day-ci/archive/20250125/202501251947.JAiy4D8b-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501251947.JAiy4D8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501251947.JAiy4D8b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
--
   In file included from arch/x86/kernel/asm-offsets.c:10:
   In file included from include/crypto/aria.h:22:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   1 warning generated.
   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
     955 | long compat_get_cpumask(struct cpumask_t *cpumask, const compat_ulong_t __user *umask,
         |                                ^
   1 warning generated.
>> clang diag: include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
>> clang diag: include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
>> clang diag: include/linux/compat.h:955:32: warning: declaration of 'struct cpumask_t' will not be visible outside of this function [-Wvisibility]
   rust/core.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/core.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/compiler_builtins.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup
   rust/kernel.o: warning: objtool: _RNvMNtCs1cdwasc6FUb_6kernel8securityNtB2_11SecurityCtx8as_bytes() falls through to next function _RNvXs_NtCs1cdwasc6FUb_6kernel8securityNtB4_11SecurityCtxNtNtNtCs5QSdWC790r4_4core3ops4drop4Drop4drop()
   rust/kernel.o: warning: objtool: asan.module_ctor+0xd: call without frame pointer save/setup
   rust/kernel.o: warning: objtool: asan.module_dtor+0xd: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
