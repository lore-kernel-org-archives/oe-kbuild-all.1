Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A956493646
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 04:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787546937; cv=none; b=Wj7aAwLhs/w5fCvXR8cU/pJuLPP1DiEDA75jWG9ft1LpbvDuoKh72ssq41zThpv6gVN519Bpa3Cou+I/JLA65qEILdHaYISkbhXdlm01a+Xzk/zbxhEIUnBNffl3eUAPCwCcAEC6/uLEuWEvDh3JP4fLh57M8pKYaUJVjTprnQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787546937; c=relaxed/simple;
	bh=1Em4Shs4qqHoCzxFTf5BVAHRfjZIx8iI5qnfW1PPQc8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hWt1p5vLPB04fVNJXwZo3kdk7M4CQt+nfX2T/VzdEwcNsYXW9EpINgHeGbS3Mt9rMJpFsLaiNhWSyEVKsVmAFMI/gMRjZ/j17rbv4bFwidA9V/ZLGqogn4eoYBaxP0nwIxGMJ6nQGNPs16GL5hem5guD4qwCQTEkXhW9a8cWLR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/DBsURa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/DBsURa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787546934; x=1819082934;
  h=date:from:to:cc:subject:message-id;
  bh=1Em4Shs4qqHoCzxFTf5BVAHRfjZIx8iI5qnfW1PPQc8=;
  b=d/DBsURa7AU/RquKSwwlMY+2BakPWpkqcFp9qxdsNw+M4Zi3yO6nqCyN
   afE1C6a0cMzrR2B0XAf7G3mko+vA81KVbQRm1G93kJDfgTzlfhB2fsZB9
   DZGIY0dsC8YpLmFwnf7L2EjOBZQKz/9qig7r7oFS16KY5zT5PP6pWUsD1
   bFnnUyv5AoNFnGjF3Jscmqib7lndiTJvSksulMXh7/DOGt/X5yXHXzDBb
   a0HSlcTyhkuOHz38EEButKnFFffKboFfFvowsFTeev7RqwGCQiGSdLneO
   nJIpq0hC4fwyHqLV2xCD0+uDqfS1feIFrKbeXE6mpnDiAd119Hk+VF5k4
   g==;
X-CSE-ConnectionGUID: ouSrf3J6Tg2V163FN8P5jg==
X-CSE-MsgGUID: huzF+BapT5i7u3FobNE4oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="75528169"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="75528169"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 21:48:53 -0700
X-CSE-ConnectionGUID: XrjaqBTXSvenTDx+x1Mtgg==
X-CSE-MsgGUID: NI5DrsjsQWW/jZuVMRtudA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263178183"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Aug 2026 21:48:52 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyMc5-000000000H9-38ug;
	Mon, 24 Aug 2026 04:48:49 +0000
Date: Mon, 24 Aug 2026 06:48:20 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip-7.2 645/964] warning: casting raw
 pointers to the same type and constness is unnecessary (`*mut
 dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
Message-ID: <202608240637.5LUnBC0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux asahi-wip-7.2
head:   57124f5176e4a4ceb553942a5f3de94cb5035877
commit: b43e4afc340b3afc32dbb781176c790a5897f163 [645/964] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240637.5LUnBC0c-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240637.5LUnBC0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240637.5LUnBC0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:173:22
   |
   173 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
   help: try
   |
   173 ~     let p = unsafe { {
   174 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   175 +         let field_ptr = $field_ptr;
   176 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   177 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   178 +         container_ptr
   179 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:183:22
   |
   183 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   help: try
   |
   183 ~     let p = unsafe { {
   184 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   185 +         let field_ptr = $field_ptr;
   186 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   187 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   188 +         container_ptr
   189 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:191:22
   |
   191 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   help: try
   |
   191 ~     let p = unsafe { {
   192 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   193 +         let field_ptr = $field_ptr;
   194 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   195 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   196 +         container_ptr
   197 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:199:22
   |
   199 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   help: try
   |
   199 ~     let p = unsafe { {
   200 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   201 +         let field_ptr = $field_ptr;
   202 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   203 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   204 +         container_ptr
   205 ~     } };
   |
--
>> warning: associated items `as_ref` and `as_raw` are never used
   --> rust/kernel/dma_buf.rs:31:26
   |
   23 | impl DmaBuf {
   | ----------- associated items in this implementation
   ...
   31 |     pub(crate) unsafe fn as_ref<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
   |                          ^^^^^^
   ...
   36 |     pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:207:22
   |
   207 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   help: try
   |
   207 ~     let p = unsafe { {
   208 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   209 +         let field_ptr = $field_ptr;
   210 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   211 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   212 +         container_ptr
   213 ~     } };
   |
--
>> warning: `as` casting between raw pointers while changing only its constness
   --> rust/kernel/dma_fence.rs:268:9
   |
   268 |         &self.fence as *const _ as *mut _
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast_mut`, a safer alternative: `(&self.fence as *const bindings::dma_fence).cast_mut()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#ptr_cast_constness
   = note: requested on the command line with `-W clippy::ptr-cast-constness`
--
>> warning: casts from `u32` to `u64` can be expressed infallibly using `From`
   --> rust/kernel/dma_fence.rs:434:30
   |
   434 |                 self.start + context as u64,
   |                              ^^^^^^^^^^^^^^
   |
   = help: an `as` cast can become silently lossy if the types change in the future
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#cast_lossless
   = note: requested on the command line with `-W clippy::cast-lossless`
   help: use `u64::from` instead
   |
   434 -                 self.start + context as u64,
   434 +                 self.start + u64::from(context),
   |
--
>> warning: method `into_raw` is never used
   --> rust/kernel/dma_fence.rs:467:19
   |
   451 | impl FenceChain {
   | --------------- method in this implementation
   ...
   467 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
