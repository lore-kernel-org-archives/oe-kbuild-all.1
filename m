Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F0813AD05
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769229295; cv=none; b=V8DtrUa2kT/mWd1wN9IyFc4mNBwwFsHlUQuCCfmNCBl7Iy0/iRjEWDLdOYHJjlwOw8jEcXrPs0S0X0wJRJg4WAB6ySMtTSsyldkhDjoisyR6C5WCCnRjWf1jAjg8cKR4mQhH803IKUGcCDjNQGzs9dLZ9DmWiJWPKlSGJAAn4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769229295; c=relaxed/simple;
	bh=zEH9nFD+ZslDWNBDZd6gyALBtjdnZClrhiwBs1/ZoLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fjLfMJDC8RKsuLL/g/28G04nvZXETBYzh2BYeFM5nm4zAQr6f53tHCGCfnYOK1kxu42x6xhTFnJpa83kcEDTtqFXxPPuNb3zps76b7WlPnZEX6LBoKpajsH9SQfsWirkcipTGMxd3butK6Ms6q5sK4gLmj3XZFjymUpK809qnfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9GKkk8N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9GKkk8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769229294; x=1800765294;
  h=date:from:to:cc:subject:message-id;
  bh=zEH9nFD+ZslDWNBDZd6gyALBtjdnZClrhiwBs1/ZoLk=;
  b=O9GKkk8NMiw+/lt1FR7hy8249R5nAdSq04v8RB1dy+zKNbpDZaraycQY
   X01C3ZC6RVI6Rs3+fPR3S0XlZlwCHadqPhnEzNBKltUjTfozVyEbvcsPs
   Zo8wkQet6+xXzeUP2hsnTaIrpLCykx4Qvw+JExQIdJNM2FmlD6vgcRS9Y
   9ErQKNzyPHpdSq4w/kLnqGSzyeFKxCjsxW0Tof4mZmdglnWSFd4FLTE5x
   ufsTz23oxQYllhPsr5713tTa8pTmd5cNTH/XSihaaGC3efo3IQbSyRo7C
   xS/TyAF2YrrLFG+p/HU+JbPXOfU4xAkixAp41FbpreKgZIfHOo7sdTZau
   g==;
X-CSE-ConnectionGUID: WXRKMA+XSmWNDFm1/JqhzA==
X-CSE-MsgGUID: a1z4PzMUSqOIGt97HNH8kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="93145226"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="93145226"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 20:34:53 -0800
X-CSE-ConnectionGUID: gDt5ry7NTmiaf/kJhmKtfw==
X-CSE-MsgGUID: uui14ItPQWCB7GmaQF16Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207438743"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jan 2026 20:34:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjVMG-000000000sP-42AY;
	Sat, 24 Jan 2026 04:34:48 +0000
Date: Sat, 24 Jan 2026 05:34:23 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [driver-core:driver-core-testing 12/12] Diff in
 samples/rust/rust_dma.rs:105:
Message-ID: <202601240553.wieP0mKV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   c991f93288cac176e6361617f91c17c63c23a86f
commit: c991f93288cac176e6361617f91c17c63c23a86f [12/12] rust: samples: dma: remove redundant `.as_ref()` for `dev_*` print
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260124/202601240553.wieP0mKV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240553.wieP0mKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240553.wieP0mKV-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in samples/rust/rust_dma.rs:105:
            }
    
            for (i, entry) in self.sgt.iter().enumerate() {
   -            dev_info!(self.pdev, "Entry[{}]: DMA address: {:#x}", i, entry.dma_address());
   +            dev_info!(
   +                self.pdev,
   +                "Entry[{}]: DMA address: {:#x}",
   +                i,
   +                entry.dma_address()
   +            );
            }
        }
    }
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
