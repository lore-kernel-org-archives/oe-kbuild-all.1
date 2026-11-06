Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793926423;
	b=UsflHgoURCr3alm1u/KYQxTT+0h1o2PIFwAyrM4UaHmXDKIuzrBRCsnv2zoPFNVCRlwP
	 b7N7OdTablQSzysGPVO23OGQBUg8+WBuUe4rsGVW2o50/vo+fceejoNKCYIDu6RKG7wIQ
	 YNhHSCIzK4i5e6uWziVdzyoUCc/P3epS1PwpxIWzjs4oU8xm8LaCkfNGDsh0wOjzyzR3f
	 L3cuJy1/urWbmKaB8nF2yHufjG16OElsFtHcV5+TmrhsB+XUeBhmKdxkXvu71KryFbDeT
	 3QsVghsZRhta+6j6l/LKgvGjxVOip++1BP86ts1ud5J0TyGmlaYKjeHSjjYE/MZkdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926423;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FERj9I68XNEL812ikuGHsxbYcdAzYFZIak32XKwYj/E=;
	b=fVlCjtFQ5pT7jr6Cub9X5vGWHrBcqLYisH8T2jk6o4BQ9IHirJOXqefBtgck9uSTx1Cf
	 NMLajDI7jBr950TjCrzmmo3XqmOOTFLJD39W5fyT/fpGcjsi5pxdZNpMJIy19Pi+9cx0h
	 tWTZCucMx2St3kV6v5jGurO/cdRGwN/LKOnl1XbSTrhPP1GUqzZ0nXeecrvESLAxP8pqn
	 KlOjbjCCOyjWr3eZQNaYP8wKUlVbBlbt4zRRCR9AXT8ODaiArPXMhLZB00m+m1wNJEYT+
	 XIBH7As/lGGa0MOrwefveDMnFQchC38UU8nWAdyH6+ernzT4q1LHm3zMoO3b8z05hyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=loL6KKjy;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEB9606A329
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 00:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEB9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=loL6KKjy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793926423; x=1825462423;
  h=date:from:to:cc:subject:message-id;
  bh=ZwciZFt7S0xReHHbErecsLoVH2veCrPQob1fYs/5U7g=;
  b=loL6KKjy3uouyW1dMrLFvn5qaizup2ooli9gmZRtLLRSMcx+Tyo390RJ
   CGfYSIjiYGHnR4G7pP7X/HBeix2s3K2xuFjFZ+TxF6IodwtXUiYBXZTKl
   5pyteFviYUcmT5a91mme/BHBmHOCBoKVBipzSCcEtncqo8Ipg8aD3iNW/
   WJv/8axhN2+D6ca4qn7b3xemsyEfPBoluneFrWyXUg/sv6d3zf1eKzs7c
   eSFrDKxjvBw5SqzkHtJi5PLKuHe1fSwPotuF5hW3rAOnAxgMGjJDAG4v5
   JQsz4VtLlxff4JDgLWYYELXYomSYGsCYqAMxiWc40aVxBIjNFNImVZj3F
   Q==;
X-CSE-ConnectionGUID: sClBsyIRSietysl6e3m07Q==
X-CSE-MsgGUID: FpI84SFyQ0uTxFAfLuH68g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2742512"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2742512"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 16:53:37 -0800
X-CSE-ConnectionGUID: +5/FRX+6SJStqkTUs6FSXg==
X-CSE-MsgGUID: +U/FOr9cSXuWS5hTvqigSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7479503"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Nov 2026 16:53:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP8Cy-000000009wV-17te;
	Fri, 06 Nov 2026 00:53:32 +0000
Date: Fri, 06 Nov 2026 01:53:24 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 11/56] Diff in
 rust/kernel/sound/card.rs:4:
Message-ID: <202611060149.jsR21Ibx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: 8c3e8dd553f3af45e664df85daa4a3e065d274c1 [11/56] ALSA: rust: add sound card abstraction (kernel::sound::card)
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261106/202611060149.jsR21Ibx-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060149.jsR21Ibx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060149.jsR21Ibx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/sound/card.rs:4:
    //!
    //! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
    
   -use crate::{
   -    bindings,
   -    device,
   -    error::to_result,
   -    prelude::*,
   -    types::Opaque,
   -    ThisModule,
   -};
   +use crate::{bindings, device, error::to_result, prelude::*, types::Opaque, ThisModule};
    
    /// A sound card.
    ///
   Diff in rust/kernel/sound/card.rs:67:
        pub fn set_driver(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `driver` is a fixed-size array of 16 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).driver.as_mut_ptr() as *mut u8,
   -                16,
   -            );
   +            s.copy_to_raw((*self.as_raw()).driver.as_mut_ptr() as *mut u8, 16);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:78:
        pub fn set_short_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `shortname` is a fixed-size array of 32 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).shortname.as_mut_ptr() as *mut u8,
   -                32,
   -            );
   +            s.copy_to_raw((*self.as_raw()).shortname.as_mut_ptr() as *mut u8, 32);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:89:
        pub fn set_long_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `longname` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).longname.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).longname.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:100:
        pub fn set_mixer_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `mixername` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).mixername.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).mixername.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:116:
        pub fn as_raw(&self) -> *mut bindings::snd_card {
            self.0.get()
        }
   -
    }
    
    // SAFETY: `Card` holds only an `Opaque<snd_card>`, whose thread-safety is
>> Diff in rust/kernel/sound/card.rs:4:
    //!
    //! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
    
   -use crate::{
   -    bindings,
   -    device,
   -    error::to_result,
   -    prelude::*,
   -    types::Opaque,
   -    ThisModule,
   -};
   +use crate::{bindings, device, error::to_result, prelude::*, types::Opaque, ThisModule};
    
    /// A sound card.
    ///
   Diff in rust/kernel/sound/card.rs:67:
        pub fn set_driver(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `driver` is a fixed-size array of 16 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).driver.as_mut_ptr() as *mut u8,
   -                16,
   -            );
   +            s.copy_to_raw((*self.as_raw()).driver.as_mut_ptr() as *mut u8, 16);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:78:
        pub fn set_short_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `shortname` is a fixed-size array of 32 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).shortname.as_mut_ptr() as *mut u8,
   -                32,
   -            );
   +            s.copy_to_raw((*self.as_raw()).shortname.as_mut_ptr() as *mut u8, 32);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:89:
        pub fn set_long_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `longname` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).longname.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).longname.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:100:
        pub fn set_mixer_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `mixername` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).mixername.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).mixername.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:116:
        pub fn as_raw(&self) -> *mut bindings::snd_card {
            self.0.get()
        }
   -
    }
    
    // SAFETY: `Card` holds only an `Opaque<snd_card>`, whose thread-safety is
   Diff in rust/kernel/pm.rs:24:
        types::ForeignOwnable, //
    };
    
   -use core::{
   -    cell::UnsafeCell,
   -    marker::PhantomData
   -};
   +use core::{cell::UnsafeCell, marker::PhantomData};
    
    /// Runtime Power Management modes that determine how a particular PM
    /// transition is to be carried out.
>> Diff in rust/kernel/sound/card.rs:4:
    //!
    //! C header: [`include/sound/core.h`](srctree/include/sound/core.h)
    
   -use crate::{
   -    bindings,
   -    device,
   -    error::to_result,
   -    prelude::*,
   -    types::Opaque,
   -    ThisModule,
   -};
   +use crate::{bindings, device, error::to_result, prelude::*, types::Opaque, ThisModule};
    
    /// A sound card.
    ///
   Diff in rust/kernel/sound/card.rs:67:
        pub fn set_driver(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `driver` is a fixed-size array of 16 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).driver.as_mut_ptr() as *mut u8,
   -                16,
   -            );
   +            s.copy_to_raw((*self.as_raw()).driver.as_mut_ptr() as *mut u8, 16);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:78:
        pub fn set_short_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `shortname` is a fixed-size array of 32 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).shortname.as_mut_ptr() as *mut u8,
   -                32,
   -            );
   +            s.copy_to_raw((*self.as_raw()).shortname.as_mut_ptr() as *mut u8, 32);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:89:
        pub fn set_long_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `longname` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).longname.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).longname.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:100:
        pub fn set_mixer_name(&self, s: &CStr) {
            // SAFETY: `self.as_raw()` is valid; `mixername` is a fixed-size array of 80 bytes.
            unsafe {
   -            s.copy_to_raw(
   -                (*self.as_raw()).mixername.as_mut_ptr() as *mut u8,
   -                80,
   -            );
   +            s.copy_to_raw((*self.as_raw()).mixername.as_mut_ptr() as *mut u8, 80);
            }
        }
    
   Diff in rust/kernel/sound/card.rs:116:
        pub fn as_raw(&self) -> *mut bindings::snd_card {
            self.0.get()
        }
   -
    }
    
    // SAFETY: `Card` holds only an `Opaque<snd_card>`, whose thread-safety is
   Diff in rust/kernel/pm.rs:24:
        types::ForeignOwnable, //
    };
    
   -use core::{
   -    cell::UnsafeCell,
   -    marker::PhantomData
   -};
   +use core::{cell::UnsafeCell, marker::PhantomData};
    
    /// Runtime Power Management modes that determine how a particular PM
    /// transition is to be carried out.
   make[2]: *** [Makefile:2038: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
