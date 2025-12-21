Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF9307AF0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766341810; cv=none; b=UXLor8d3IlSaPjJeXU7S1lEwa56xBqugwPGOUX0Nn3TqQ95tzC99FzLc3ZKZUPZqS7P0di9f8RU+cOlDWOhr2vozmY2Fh01Jb1O+IFG06LPMDaMj7a7m8ceRV1DGOL8Vk8sZcxquFNrkCMPSg/YVVO/kvr5japEnjgjxPJE4B0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766341810; c=relaxed/simple;
	bh=eoNAoG7ZDDlKNnf4as1Dv+0tGU+jbGUMvbRuUxIGaQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oqiEHYQdLiDaE17nn8MlKfeBQzXcMS+EgteF74mytgbFkRXIPfmGH5b5hS2QvzrKWqEwtM/CUXApP2SdvwPTopjoEcgSemqzbfduNHqtApA8TNqSEgh2nPINJ8bRabO0x5jl0QoJUp4OxPpu4zQ+5rc86uDOLRJJY9onMqVJmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IppMfMBB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IppMfMBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766341808; x=1797877808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoNAoG7ZDDlKNnf4as1Dv+0tGU+jbGUMvbRuUxIGaQM=;
  b=IppMfMBB8n9KGqrRt5n4FI8uu9dE9HF91vCmLabYJebtKXcRfTK67mHE
   6DhpuFjGqRWZQhc1FL12ykv12INjBu6/t7SZfYU3gqwxUNWsN3goduFGK
   5wCV0Sq3Kq4Arl/3vszE1+LKHOu9cHglz6IUwWbYQzcZzxi3mSlFXaEYN
   1p0G+io65PdG19nqsOJ0srFS4nkQL8DfMnggCulh0VeZT4JIaeTSizAR2
   0dJZXXB0KhZSY9ZisCd+F+7i1e+PjmzJ+0TEQCxiZDNikOhUmOmDPM6Dc
   m1/bwx1vgbEpHabA+7v5HR8M0VJaifynYWa5ZvPkSkypLCtdHfIuuwfeo
   A==;
X-CSE-ConnectionGUID: f4KZp2VvTrmHP5AyNg0zqw==
X-CSE-MsgGUID: tiZAq25PTjOawfZ47CQNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68108384"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68108384"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 10:30:07 -0800
X-CSE-ConnectionGUID: aoIXu8R/TPWTTtjNQ+j3bg==
X-CSE-MsgGUID: 6mjRtI+HRAy+wpcp4QlKKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199316221"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 10:30:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXOBv-000000005C4-3SM6;
	Sun, 21 Dec 2025 18:30:03 +0000
Date: Sun, 21 Dec 2025 19:29:08 +0100
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 34/62] Diff in rust/kernel/device.rs:5:
Message-ID: <202512211940.5lmm5QVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e08116e258e28774a3770a80debc819b89928f45
commit: 7dbaef25e64f06bcdefde84bedfc79e830abdb92 [34/62] rust: of: Add OF node abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512211940.5lmm5QVL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211940.5lmm5QVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211940.5lmm5QVL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/device.rs:5:
    //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
    
    use crate::{
   -    bindings, fmt,
   -    of,
   +    bindings, fmt, of,
        prelude::*,
        sync::aref::ARef,
        types::{ForeignOwnable, NotThreadSafe, Opaque},
>> Diff in rust/kernel/device.rs:5:
    //! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
    
    use crate::{
   -    bindings, fmt,
   -    of,
   +    bindings, fmt, of,
        prelude::*,
        sync::aref::ARef,
        types::{ForeignOwnable, NotThreadSafe, Opaque},
   make[2]: *** [Makefile:1832: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:90:43
   |
   90 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr
   = note: requested on the command line with `-W clippy::ref-as-ptr`
--
>> warning: reference as raw pointer
   --> rust/kernel/alloc/kvec/drain.rs:104:43
   |
   104 |             .map(|elt| unsafe { ptr::read(elt as *const _) })
   |                                           ^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref(elt)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr
--
>> warning: using `as _` conversion
   --> rust/kernel/io/mem.rs:307:39
   |
   307 |     pub const WC: MemFlags = MemFlags(bindings::MEMREMAP_WC as _);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^^-
   |                                                                |
   |                                                                help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/of.rs:77:5
   |
   77 |     pub(crate) unsafe fn from_raw(raw_node: *mut bindings::device_node) -> Option<Node> {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
   = note: `-W clippy::missing-safety-doc` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_safety_doc)]`
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/of.rs:90:5
   |
   90 |     pub(crate) unsafe fn get_from_raw(raw_node: *mut bindings::device_node) -> Option<Node> {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/sync/lock.rs:158:33
   |
   158 |                 t.__pinned_init(slot as *mut T)
   |                                 ^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `slot.cast::<T>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/xarray.rs:151:22
   |
   151 |         NonNull::new(p as *mut T).map(|ptr| {
   |                      ^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `p.cast::<T>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: using `as _` conversion
   --> rust/kernel/xarray.rs:244:28
   |
   244 |         unsafe { T::borrow(self.ptr.as_ptr() as _) }
   |                            ^^^^^^^^^^^^^^^^^^^^^-
   |                                                 |
   |                                                 help: consider giving the type explicitly: `*mut ffi::c_void`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/xarray.rs:244:28
   |
   244 |         unsafe { T::borrow(self.ptr.as_ptr() as _) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `self.ptr.as_ptr().cast()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.87.0`
   --> rust/kernel/alloc/kvec/drain.rs:173:40
   |
   173 |             let drop_offset = drop_ptr.offset_from_unsigned(vec_ptr);
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
   = note: `-W clippy::incompatible-msrv` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::incompatible_msrv)]`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
