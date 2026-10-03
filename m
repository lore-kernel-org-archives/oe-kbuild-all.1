Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDCC48F83B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058317; cv=none; b=m2JVxnCkXFeZykug/HWIenY+TH9vBxueoZTGlxQy7RuONllisNVA1G01UIT9YsuNiZV/By+J7IU4E9hQlKnTWVBN24w+IHMwySbMrH3s9TlV6FJ4ZJlPzr0hrp+klN4Z87F9T6y1NbP+YzhxOKhUM3foS1eY9jK8f1SxMtlBceU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058317; c=relaxed/simple;
	bh=o2Oa6vYS+SFFLt7RnT8ZSSVhoDPjGAv6zxjBvtQucEE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCNoJSDeGSadyekjMISqJj2FZVS3l3RNIOXLkxTgwCCcrdZ9OvhTAM9le1RPbB3iQ3GIQXIbjAUE5VMDge6PA5LKH3cPMMO4wqK6DNZcSmPuQ2FWX1ZniH3TBNHLywhGo86skG6fY6EciefmpUu/7X8A23ar671fYrfofzabB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlNrRDR+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlNrRDR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791058316; x=1822594316;
  h=date:from:to:cc:subject:message-id;
  bh=o2Oa6vYS+SFFLt7RnT8ZSSVhoDPjGAv6zxjBvtQucEE=;
  b=LlNrRDR+svgLOnGUWhqglxW/5lvtHdhwMOd0pz7NGC8yGaJzbbcgQb2c
   g1zS4E1ODte4M+BNrOoKSSZIx1MBxyZP4OjtWgVJev21IXHhHM/BN31//
   Q6+W5Vy0XNsF8BY0xXQ1b9OqzsJ75tYTTD1ZCZp9PKnR45OpJsBioWHFn
   QUAJXQ6frezDt7Gj+2lhIpRi0lPKvdJBaue9j3wHTG9dYS+Xh1swxqdoo
   rUyKE635BFMMDcWmjxjXDwUaO2EX00rngqZm8kmrhwG50P8FiXYsaKXwg
   agT/uHK9g//vqryUS7lZGDP+MqYDkoIQ9XFrg0/CNyRFoBkO4s0K2KD5U
   w==;
X-CSE-ConnectionGUID: G1gdAB1XSuq/9DrCVAk2SQ==
X-CSE-MsgGUID: g7e4HxZhTFeusBxZi+XyNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="94661833"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="94661833"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 13:11:56 -0700
X-CSE-ConnectionGUID: qQV5EKgsSQujuJ/3mSQnFg==
X-CSE-MsgGUID: SUr0+TroS+OhMTb8zUfzPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275598281"
Received: from igk-lkp-server01.igk.intel.com (HELO eeb1dbb20e31) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Oct 2026 13:11:54 -0700
Received: from kbuild by eeb1dbb20e31 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xD65G-0000000000p-1bnN;
	Sat, 03 Oct 2026 20:11:50 +0000
Date: Sat, 03 Oct 2026 22:11:47 +0200
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: [bpf-next:master 15/16] Diff in
 tools/testing/selftests/bpf/progs/data_in_arena_rust.rs:42:
Message-ID: <202610032132.AVJhE1qE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   d82cbceca49252bb0cd695326af8206c734e2744
commit: e86cb7315451e166f1392032d392f1736fa6853e [15/16] selftests/bpf: Add test for global data of a program in Rust
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261003/202610032132.AVJhE1qE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610032132.AVJhE1qE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610032132.AVJhE1qE-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in tools/testing/selftests/bpf/progs/data_in_arena_rust.rs:42:
    #[no_mangle]
    static IN_RODATA: Node = Node { val: 3, next: None };
    #[no_mangle]
   -static mut IN_DATA: Node = Node { val: 20, next: Some(&IN_RODATA) };
   +static mut IN_DATA: Node = Node {
   +    val: 20,
   +    next: Some(&IN_RODATA),
   +};
    #[no_mangle]
    static mut IN_BSS: Node = Node { val: 0, next: None };
    
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
