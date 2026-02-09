Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF433D6FA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Feb 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641693; cv=none; b=i6Lab6H1zdeDgmoVjUk12ODtIFwT+2KpEcuSUHG0Ek606JfIj8U7p+E3r51Q5/JFC4GsT+TENyd3/itfOWKGBrpfpLTX8ZnK51JKKiIbacObBGsduhEMB+GzOmqco+XieIzjwjKScBHl0/H5/EM7N8ug22jcPm2vnT9KdSk2DCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641693; c=relaxed/simple;
	bh=TqxtuC+U5q9efczlX6nWHsC5gmVfH9tmyLnTh9YcCMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lK9FSDfG/VAtY7f8hHoXu8Hx/QOa7mKsKX9PqsEOG2Zv4u9UJWI+dnh9Yj+p+mW0Ela2rrQFPHdnTQOGSNK9bknbXwmyvywGOK7GSbl5AGmtb/FUA8Qt+FD6WrlVhksTLP6NnZ7twWaGg5RzI+y7eiQiYt6FEs1nx6l5rPrXQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMaGfJWP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMaGfJWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770641692; x=1802177692;
  h=date:from:to:cc:subject:message-id;
  bh=TqxtuC+U5q9efczlX6nWHsC5gmVfH9tmyLnTh9YcCMk=;
  b=DMaGfJWP61WXgMZJ4GemPeC+dpzJkZ/Q2rapyeYp9oKy1b9hfQwwEjRI
   9nZH4kx3c7/I5TAuhtb0MiLf4qFKIpy2IH4WLhdUHobPLYM0kUd5DMKyu
   4YkCiuXFJvI/zaWLqRErVIm6YhkZnKFHLl6ruDUNZAVHBZ40ymZU5yOAw
   5vKKDWV3fIZ6TLLA+Cp+77SDFHkKDrjGyEXr59oXDjUTQTYB9399Zt9mU
   TogR25o4nV4vp83STbDP/SDNS+Ve1i4vrxdwkwGCKpe7LEhCIQKaZVdog
   mkn28xLKY4EFDGGOiWaR2b7YX628A4GAuLo4jqnz1iQGSCTcOOTu4N+Xr
   w==;
X-CSE-ConnectionGUID: PEuNOyt/RVSXVVRETKILMA==
X-CSE-MsgGUID: frD6u01rRYaq9PfJyAY8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82077473"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="82077473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 04:54:52 -0800
X-CSE-ConnectionGUID: 7NWipfwTRrK1o66bQzNshg==
X-CSE-MsgGUID: OL0P/TLWTrW5FsehKYawZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211639069"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Feb 2026 04:54:50 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpQmu-000000000DV-0VFc;
	Mon, 09 Feb 2026 12:54:48 +0000
Date: Mon, 09 Feb 2026 13:54:22 +0100
From: kernel test robot <lkp@intel.com>
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [perf-tools-next:tmp.perf-tools-next 102/104] Diff in
 tools/perf/tests/workloads/code_with_type.rs:10:
Message-ID: <202602091357.oyRv6hgQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   335047109d7d488bf5ad32a4076e1a011994cd0e
commit: 2e05bb52a12d3cdb81f3b6f5de5cb3905d383552 [102/104] perf test workload: Add code_with_type test workload
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260209/202602091357.oyRv6hgQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091357.oyRv6hgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602091357.oyRv6hgQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in tools/perf/tests/workloads/code_with_type.rs:10:
    
    #[no_mangle]
    pub extern "C" fn test_rs(count: u32) {
   -    let mut b =  Buf { data1: 0, data2: String::from("data"), data3: 0};
   +    let mut b = Buf {
   +        data1: 0,
   +        data2: String::from("data"),
   +        data3: 0,
   +    };
    
        for _ in 1..count {
            b.data1 += 1;
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
   make[2]: Target 'rustfmtcheck' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
