Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFB286A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807981; cv=none; b=g6bjGHxhfsOM1j599Kq7NrvI3PAf77rXqZVV2ndAew7bsGpa4OnjIg3c7Y/Yk7AZNuAgW/tLwyeQ1RhJAgIlVbrxvxZyWXtbFqSGY9bCywekys9cngpF/rv0DWdAd0ApDysRU6eoYIw7V05CouHY2AR15s7VW7egm+qme0tS53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807981; c=relaxed/simple;
	bh=pZlNyfYrZh0ViYSNd+NsLFpIoEf9LHmJbyf7RlFGmwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oFGsDnEVgLJ+umXOl57UKtJF/036sL933aKdJMm80nRnSSubE1clboPAlvjSn6y5wDV1yodKXQRr6A5Q8NuJ6q1rPtb6Jt48A4YFswje07PSGIueT2wJf+I5vksgbkyouR2exGrvO1sz1zsPTC1M1YXR/mM32nVSIFAaH2C+Mls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6iJBHxK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6iJBHxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765807980; x=1797343980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pZlNyfYrZh0ViYSNd+NsLFpIoEf9LHmJbyf7RlFGmwA=;
  b=Z6iJBHxKtxt0gmycOb6YZgKn1R4SKgZFbDIfyMCvrgYzs1Dk7gFKI3Mu
   5IjhA3p0OHzRDPWzoFCnECL9u90npaW8itxsJNKKQsMTdvwol43ha4jxN
   5ENq0BsvWYDTVa9qAK2SLaitqMuO1OkdmGpEtMqv9iJyef9w+D7IrRkfQ
   UMBvwjRZOfhDiKXslgq6EUtoTsFBXAnCpKfZAi8E8lrIdHVzvtvQOwh+E
   QNcrnERtTHzrTqgs5iAHD4nFkbGv9Ke4UCmCjw6p6qjnCOOEO2D0lKQku
   CF7nDpHTmuJe9e/jAlw4v163BwNNt9EhEe9CUyLFWe9u4/ATyVT8D9o8N
   A==;
X-CSE-ConnectionGUID: +ii2MhH2SrChxNBbgj9T1A==
X-CSE-MsgGUID: AORMJ2gETGaVDI4CI2WpsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="71339437"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="71339437"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:12:59 -0800
X-CSE-ConnectionGUID: WmhO2tDaQqSJ4myYJoDd9A==
X-CSE-MsgGUID: 44BShaM0TSelOSVcyE9GIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="221111111"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Dec 2025 06:12:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9Jo-000000002g4-0fwu;
	Mon, 15 Dec 2025 14:12:56 +0000
Date: Mon, 15 Dec 2025 15:12:17 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:vtable-wip 3/3] Diff in rust/macros/vtable.rs:2:
Message-ID: <202512151501.o5coGUFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux vtable-wip
head:   b26df2e17c5c53ab1b818cc1d953dd3ece892da3
commit: b26df2e17c5c53ab1b818cc1d953dd3ece892da3 [3/3] Use `#[unique] const NAME: Ty;` without `= value` at impl site.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251215/202512151501.o5coGUFk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151501.o5coGUFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151501.o5coGUFk-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/macros/vtable.rs:2:
    
    use std::collections::HashSet;
    
   -use proc_macro2::{Ident, TokenStream, Span};
   +use proc_macro2::{Ident, Span, TokenStream};
    use quote::ToTokens;
    use syn::{
        parse_quote, Error, ImplItem, ImplItemConst, Item, ItemImpl, ItemTrait, Result, Token,
>> Diff in rust/macros/vtable.rs:2:
    
    use std::collections::HashSet;
    
   -use proc_macro2::{Ident, TokenStream, Span};
   +use proc_macro2::{Ident, Span, TokenStream};
    use quote::ToTokens;
    use syn::{
        parse_quote, Error, ImplItem, ImplItemConst, Item, ItemImpl, ItemTrait, Result, Token,
   Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
   Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
   Diff in rust/kernel/sync/atomic.rs:21:
    mod predefine;
    
    pub use internal::AtomicImpl;
   -pub use ordering::{Acquire, Full, Relaxed, Release};
    pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
   +pub use ordering::{Acquire, Full, Relaxed, Release};
    
    use crate::build_error;
    use internal::AtomicRepr;
   make[2]: *** [Makefile:1847: rustfmt] Error 123
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
