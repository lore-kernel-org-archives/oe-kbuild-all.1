Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D585E2E11BC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775354166; cv=none; b=oPvsnkKaD0IBeL4KBUhLSZhUJSZ151ryzDk0zRDmIjivvB8KroaV0i7FQUKMysIAtU6FiOq1R+J1Ms6IvmoTZ2yW5YnsV+oD+KeQo+kcxFTM/UCIo34YNBlbZ+gF2+eom17XzO9Zn4rRAePo/7+C4YroLYUnpDjulNQGE3iwaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775354166; c=relaxed/simple;
	bh=86B+xMZUcGF7A0ZOFvXMVcfEkrQm+nHZP+uexex2cE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BjDF47zDCCUJ1lmUg8JAmN6J8ppMVxQ3qbjPjCxHLMLUC68GGkcbXbov2ZtwRvBXhqsSPS7D+02qva8qShd4yzXN4Y0l17cg1+CKLpwHi/jUgVGSTX8SzYawqCdRNktfAkhUh+sy49+MYPw2RSv3YJ6xYZga5vWYvUEZC2mAiuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c01f9Gza; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c01f9Gza"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775354164; x=1806890164;
  h=date:from:to:cc:subject:message-id;
  bh=86B+xMZUcGF7A0ZOFvXMVcfEkrQm+nHZP+uexex2cE4=;
  b=c01f9Gza+GtiWG4O+oKyuegD2BpleYwfUueB0D66CRABzdCd74OCq7JP
   HIkN0ef0EVEjioTz3Sb2c1TnR/oz0m6J6XZgfnoOD+MCocL/EcuIBN3tP
   oYXBHOnEnC0psCK2ArNDuvMftWtwuqpBf7hbtz92aa7nd4UvtsOyQosPb
   LjmAodHF0UfpXArV6Rk0ohWOlJdswKXOPFPvE4s79ElObdMirB569ijH8
   xUt2JSJXd8GUiiE8cm7k2IObVcoRClZktwEzbxir69zJHr72/UZYksKlc
   +X0d5GVfBfrIOQAzUyh/35zWfvBzDqDda2W4Ck2Cf7Iggx9zng7yfvRS8
   w==;
X-CSE-ConnectionGUID: 7yk+2BqRQLCRxNF+PdYfyQ==
X-CSE-MsgGUID: e30/9UgoR+CnNpxHMDjw/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="93750416"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="93750416"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 18:56:03 -0700
X-CSE-ConnectionGUID: pc9xAYf9SKGnfoc2p2EpyA==
X-CSE-MsgGUID: 24GhqFfkSfawI2wELBNO7g==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2026 18:56:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9CiV-000000009jB-3goA;
	Sun, 05 Apr 2026 01:55:59 +0000
Date: Sun, 05 Apr 2026 03:55:32 +0200
From: kernel test robot <lkp@intel.com>
To: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/net/netdevice.rs:4:
Message-ID: <202604050315.IOHuPUuO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenzhao-Liao/rust-bindings-expose-networking-headers-needed-by-nlmon/20260405-042552
head:   42ddd676c18be754ca0f79ad82588768790e437f
commit: d72a81434b5fb884d2741cb950ec3c113c8f9994 rust: net: add minimal skbuff, netdevice, and stats abstractions
date:   5 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260405/202604050315.IOHuPUuO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050315.IOHuPUuO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050315.IOHuPUuO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/net/netdevice.rs:4:
    //!
    //! C headers: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    error::from_result,
   -    net::skbuff,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::from_result, net::skbuff, prelude::*, types::Opaque};
    
    /// Network device feature flags.
    pub type Features = bindings::netdev_features_t;
>> Diff in rust/kernel/net/stats.rs:4:
    //!
    //! C header: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    net::netdevice,
   -};
   +use crate::{bindings, net::netdevice};
    
    /// Equivalent to `dev_lstats_add(dev, len)`.
    pub fn dev_lstats_add(dev: &netdevice::Device, len: u32) {
>> Diff in rust/kernel/net.rs:2:
    
    //! Networking.
    
   +pub mod netdevice;
    #[cfg(CONFIG_RUST_PHYLIB_ABSTRACTIONS)]
    pub mod phy;
   -pub mod netdevice;
    pub mod skbuff;
    pub mod stats;
    
>> Diff in rust/kernel/net/netdevice.rs:4:
    //!
    //! C headers: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    error::from_result,
   -    net::skbuff,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::from_result, net::skbuff, prelude::*, types::Opaque};
    
    /// Network device feature flags.
    pub type Features = bindings::netdev_features_t;
>> Diff in rust/kernel/net/stats.rs:4:
    //!
    //! C header: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    net::netdevice,
   -};
   +use crate::{bindings, net::netdevice};
    
    /// Equivalent to `dev_lstats_add(dev, len)`.
    pub fn dev_lstats_add(dev: &netdevice::Device, len: u32) {
>> Diff in rust/kernel/net.rs:2:
    
    //! Networking.
    
   +pub mod netdevice;
    #[cfg(CONFIG_RUST_PHYLIB_ABSTRACTIONS)]
    pub mod phy;
   -pub mod netdevice;
    pub mod skbuff;
    pub mod stats;
    
>> Diff in rust/kernel/net/stats.rs:4:
    //!
    //! C header: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    net::netdevice,
   -};
   +use crate::{bindings, net::netdevice};
    
    /// Equivalent to `dev_lstats_add(dev, len)`.
    pub fn dev_lstats_add(dev: &netdevice::Device, len: u32) {
>> Diff in rust/kernel/net/netdevice.rs:4:
    //!
    //! C headers: [`include/linux/netdevice.h`](srctree/include/linux/netdevice.h)
    
   -use crate::{
   -    bindings,
   -    error::from_result,
   -    net::skbuff,
   -    prelude::*,
   -    types::Opaque,
   -};
   +use crate::{bindings, error::from_result, net::skbuff, prelude::*, types::Opaque};
    
    /// Network device feature flags.
    pub type Features = bindings::netdev_features_t;
   make[2]: *** [Makefile:1914: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/net/netdevice.rs:27:34
   |
   27 |     pub const SG: Features = bit(bindings::NETIF_F_SG_BIT as u32);
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::NETIF_F_SG_BIT`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/net/netdevice.rs:30:40
   |
   30 |     pub const FRAGLIST: Features = bit(bindings::NETIF_F_FRAGLIST_BIT as u32);
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::NETIF_F_FRAGLIST_BIT`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/net/netdevice.rs:33:39
   |
   33 |     pub const HIGHDMA: Features = bit(bindings::NETIF_F_HIGHDMA_BIT as u32);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::NETIF_F_HIGHDMA_BIT`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
--
>> warning: `as` casting between raw pointers while changing only its constness
   --> rust/kernel/net/netdevice.rs:260:40
   |
   260 |         unsafe { bindings::netdev_priv(self.as_ptr() as *const bindings::net_device).cast::<T>() }
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast_const`, a safer alternative: `self.as_ptr().cast_const()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness
   = note: requested on the command line with `-W clippy::ptr-cast-constness`
--
>> warning: struct `SkBuff` has a public `len` method, but no `is_empty` method
   --> rust/kernel/net/skbuff.rs:43:5
   |
   43 |     pub fn len(&self) -> u32 {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#len_without_is_empty
   = note: `-W clippy::len-without-is-empty` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::len_without_is_empty)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
