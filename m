Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A962F6198
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765620699; cv=none; b=ipEm9E8rSjsMHZehrLQzwQDkWRRP0sMPaloSEFZiTrEKu12ZgcIBV7GVGlbVKgl7fSAIrGA3uVeFd72ZRAxw1Q+2h2/LkB8So0q3szD1y6+fvKrFV/Xx+BVi7C5ZqxuppzqfyzhsOW2Y/rIz84/EXpGJgx4Nav40SHs6J5O92pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765620699; c=relaxed/simple;
	bh=IfbKpiIVxy7XJsCt5TXDBeJi/y/GHIHWhKACTkhH1nM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5gXBCrpFgXnCfXYZWiWII97EZI+uiQkbwsR9TOOEXMVwk9lyJ1VNI0Zh5j/gnLCIt+/oQxAc6fiuao9EqfvYR9bHwUH2g/YL63fj2q57wv/vl/DybFQz0I0hWblKP9eCjzU0EaIrZEOrjSH1fLGK9VOTJ8B+DeDNdKGY60vs/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zv/t3fv5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zv/t3fv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765620697; x=1797156697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IfbKpiIVxy7XJsCt5TXDBeJi/y/GHIHWhKACTkhH1nM=;
  b=Zv/t3fv58wgeGvA4x2J4yek7TmK+hLmqQp/X+ile48cHq+lfdbIlzUBR
   BMsiV7+p7w7EFOotuOYXed0JNt/cUbq1RsJVJ5Qv30tKDfDM2QEpb+8R+
   lt0SmIZjlyJ/3iYDDFtFdb+5KuJxCJWSM7d70/Y8sLYG8vxvXMNUnCEjL
   b+sm+7LlI54lZEK5qgkIzywpD0iDwnMB6Ejn1HiAhjJnWqhqtkHznbV+4
   3RSaXaCeCWWgME3uMwCUAo9FXooV6MgH3ErkKX841VGk8lF7QHZe17hur
   OT6yiIOv+pu+amRFe+501BqoGXx1RpGlnF1ulrjjksoKBVkpdNcJJltXR
   w==;
X-CSE-ConnectionGUID: vBUaJVyVRBOuUOkPQYoSZw==
X-CSE-MsgGUID: k59Oxx8LRjOYcwe3uRj/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71456383"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71456383"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:11:30 -0800
X-CSE-ConnectionGUID: cugwslR+Q5C1QgmcqVgF9g==
X-CSE-MsgGUID: M1lH8OB+RwukwFphSGiVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197050368"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 02:11:29 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMb0-0000000021Y-1pg5;
	Sat, 13 Dec 2025 10:11:26 +0000
Date: Sat, 13 Dec 2025 11:11:25 +0100
From: kernel test robot <lkp@intel.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/lib.rs:128:
Message-ID: <202512131156.3MKJ6hYR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Matthew-Maurer/rust-Add-support-for-feeding-entropy-to-randomness-pool/20251213-072100
head:   23b9bc8fd8f552be4ca3325f71acf4ea2a08d1e2
commit: 23b9bc8fd8f552be4ca3325f71acf4ea2a08d1e2 rust: Add support for feeding entropy to randomness pool
date:   11 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251213/202512131156.3MKJ6hYR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131156.3MKJ6hYR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131156.3MKJ6hYR-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/lib.rs:128:
    pub mod print;
    pub mod processor;
    pub mod ptr;
   -pub mod rand;
    #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
    pub mod pwm;
   +pub mod rand;
    pub mod rbtree;
    pub mod regulator;
    pub mod revocable;
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
