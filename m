Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E52BF3F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781467248; cv=none; b=Ee08kg4gEhn1r0nrUrluYzR4evlWNBTvFyQjfYNfPAog9FTUE1pR181ngqSuioykakBoe4YVzLLp2/Bkm3FOFXKn/sn4I4jo5JkBy7OdU8cbPn1aBslGNFGhb9+E5EcbT1loC89eqMW4V408tHC6WOEhUK/KfJm3Op0GYDynZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781467248; c=relaxed/simple;
	bh=aqc3fMImSsp8YUWpUbkwFZy9S65zQAeBkXpwNbY9oJs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OIdcIf+FbwYnLjCoBZnsdnOIeLAPtLTV/tT4KpazzV4gGEoqTTnnX06jz4KrkL7hnKrZz9m1t/gB71hLTguTlACPiT3L9FC7Nl5n4JCTrDj1hb6kEoFPHzvTvDpdB+UNllBzRVxtjz8jlj9HCOEVN2m6QPpjAgsnJtfFfvGc5R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWHjxH36; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWHjxH36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781467247; x=1813003247;
  h=date:from:to:cc:subject:message-id;
  bh=aqc3fMImSsp8YUWpUbkwFZy9S65zQAeBkXpwNbY9oJs=;
  b=bWHjxH36W3DG9a6NQaKC7lC7o34LQOmgR8/adeDUtC42v4bWN0E+RASw
   QYIVFFG/Jm8N3p62jEPSWvC0RKlLwt9TktsDU9LY7Xo7/sBVRXiCZuaYE
   E2rv2Lx/Z7UUt/C8t0eKU2PzslQsbmEhTy2Bbttxg+fiNZJe7GA6nRNy7
   EagjcnNqroVT63Opao1YZLuzyLkd/ATSSHzfUzFWjij18mvjSYhmomnUs
   SrG5WZeIUO4PnTBKTI0TanVQdrLYhZEtiB6JQdtlE1oOz4WzJR3+w1/yG
   o7Igwgqy0pPkqNWWmYemGVFKylpk98LqNTRhvV+k4fTG8uBGpZe/lhRRf
   w==;
X-CSE-ConnectionGUID: FOLHO7xyRtO2S8mZtNO7eQ==
X-CSE-MsgGUID: pmwTGhssQnCr/sQKZR9q1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="99791368"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="99791368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:00:44 -0700
X-CSE-ConnectionGUID: 0Nne/A49QZG4/67UPU8KTQ==
X-CSE-MsgGUID: t/M48rufTXmZVAHQmEEi+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="277492977"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 13:00:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYr0a-00000000RAi-3ZVv;
	Sun, 14 Jun 2026 20:00:40 +0000
Date: Mon, 15 Jun 2026 04:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tamird:b4/bpf-ringbuf-callback 10/11] ringbuf.c:412:26:
 error: mixing declarations and code is a C99 extension
Message-ID: <202606150310.cXXCYcJ9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tamird/linux b4/bpf-ringbuf-callback
head:   60bd75d7c79a01786dd5da0b5264a58fc5a3c3be
commit: 669fde8241bd5bb91c22df6640b243ca1da272b9 [10/11] libbpf: ringbuf: Add a caller-owned iterator
config: s390-randconfig-002-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150310.cXXCYcJ9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150310.cXXCYcJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150310.cXXCYcJ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3371: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3361: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3840: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:4022: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/kbuild.sh:5679: make_prepare
     from /zdci/src/kernel-tests/lib/kbuild.sh:5908: test_kernel_build
     from /zdci/src/kernel-tests/lib/builder/base.sh:442: builder_execute_build
     from /zdci/src/kernel-tests/lib/kbuild.sh:6418: compile_one_config
     from /zdci/src/kernel-tests/lib/builder/base.sh:88: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> ringbuf.c:412:26: error: mixing declarations and code is a C99 extension [-Werror,-Wdeclaration-after-statement]
     412 |         struct ring_buffer_iter it
         |                                 ^
   1 error generated.
   make[6]: *** [tools/build/Makefile.build:96: tools/bpf/resolve_btfids/libbpf/staticobjs/ringbuf.o] Error 1 shuffle=173020936
   make[6]: Target '__build' not remade because of errors.
   make[5]: *** [Makefile:152: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=173020936
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:62: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2 shuffle=173020936
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:77: bpf/resolve_btfids] Error 2 shuffle=173020936
   make[2]: *** [Makefile:1557: tools/bpf/resolve_btfids] Error 2 shuffle=173020936
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=173020936
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=173020936
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=m] && OF [=n]
   Selected by [m]:
   - PINCTRL_STMFX [=m] && PINCTRL [=y] && I2C [=m] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
