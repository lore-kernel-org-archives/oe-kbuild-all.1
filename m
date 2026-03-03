Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C9389100
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772568023; cv=none; b=If4sCyebnQ1VxP89uUbN2VGIvcovhmUt4rbTgjDfwJRPs9dZaTQEaSir128HFWPFlW0IQ7jwPEY0VC3sr5e/5P6MbaxHaoMAbtdzB6PjdVQmLfHkugTy7FVWQRdnOuzOSmOKptQ2YNhqbzjDiYCEcqilOB+k4revCf7ib/AbdHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772568023; c=relaxed/simple;
	bh=M1pQPBqXqzg3dsbE27b9jsHUC/B96NgKUWu+3Hbc/9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jZUIogg24ECUDwYEonjXwS8IseJ54ZMwXNKXXTIisziIsMhe3weGUyCaAgszMpIt5fQirzybcgv24LhdxwbhsIkKs9T6sf0XOyyuaQse4QwppJcsVGdkK3dpDg59aTjjNEDz3uR+/5BcXkapey12UqWdg56PvdPRApFfhFL+R7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHzDXuA1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHzDXuA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772568023; x=1804104023;
  h=date:from:to:cc:subject:message-id;
  bh=M1pQPBqXqzg3dsbE27b9jsHUC/B96NgKUWu+3Hbc/9M=;
  b=QHzDXuA133QPqAFUjPNvdGCCaNWBIRvYIMvw8mkP5HZ+paKMY+6Q/hKm
   mHTxJvqs6QYq5Xovt1EEe1Qzs/jdF+LOMQOH1EzDEUFBnXOUtEbCPh0qk
   8r1YNsliuRyXf21hGNAxWmQ7prOuI4VMF8YmxggjQ9GYcLLQKjb2lJ+UZ
   VCoGuxzPfGyRjmAKi+NeMPxF++qtMkqfDiWKHvynt86snESh2egHvGLxy
   DIkRXqKK7yb7CayUls4i3GtFnuhKyQUG2RQDRaGqh96gO2pFCluzkGSKD
   pLJFSgWAtWywbkeBH0kA0+suziFe37Opx2PjBSpx+a3oxd6j3TFTS8of9
   A==;
X-CSE-ConnectionGUID: qMrG7wOQTF6DgOUaFpNVdA==
X-CSE-MsgGUID: uViKke0qTcGPW4knEW48hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73583314"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73583314"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 12:00:22 -0800
X-CSE-ConnectionGUID: hn7rGSGrRsGU1UgdDJoT/A==
X-CSE-MsgGUID: k11rYgsxSoWYFoRxvjkk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222582176"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2026 12:00:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxVuk-000000001Wr-20Kv;
	Tue, 03 Mar 2026 20:00:18 +0000
Date: Tue, 03 Mar 2026 20:59:21 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 10/10] Diff in
 rust/kernel/alloc/kvec.rs:5:
Message-ID: <202603032007.42Bfq7FJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c146faa1afa91fd116c5cc33d6c93d2914ba93a6
commit: 31ffab1230dd3867606f0eededc92a43abc9ffef [10/10] BACKPORT: FROMGIT: rust: kvec: implement shrink_to for KVVec
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260303/202603032007.42Bfq7FJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032007.42Bfq7FJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603032007.42Bfq7FJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
>> Diff in rust/kernel/alloc/kvec.rs:5:
    // May not be needed in Rust 1.87.0 (pending beta backport).
    #![allow(clippy::ptr_eq)]
    
   -use crate::page::PAGE_SIZE;
    use super::{
        allocator::{KVmalloc, Kmalloc, Vmalloc},
        layout::ArrayLayout,
   Diff in rust/kernel/alloc/kvec.rs:12:
        AllocError, Allocator, Box, Flags,
    };
   +use crate::page::PAGE_SIZE;
    use core::{
        fmt,
        marker::PhantomData,
   make[2]: *** [Makefile:1810: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:242: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
