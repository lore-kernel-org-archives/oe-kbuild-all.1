Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2419755B
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 23:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754262384; cv=none; b=JyvQLsWWESluTi1zwMgJyVnbcH98b0NRmlcYl3W06tu5fKcLIsJSixSEMRAlrmALcsQjTuB3Yc7Yv9+BXIz/0jr+M5dZNf4U6OpyPKa1iwNSyvM1DAU6knvW1INyQ1iwXongnQiac59iSnbI9eS2lRbQCnedLBQD5i1sIcrfCsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754262384; c=relaxed/simple;
	bh=8pi8b9IRBRaBG5LgslRNqsiGMkODb31gr7ADQpV28Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXY5tuYx+cjuydaTWjafx/CDqq3GiTwIZlFD60zPBSbX230YYrWNx0XKj4yfqJV6bkm60198YUXhiAQr1A/0L3gM7K9YkWlJ/0Ok913IOvUgKwDgMMjRFYEG3+sd4piMYAmpou+TQaof4ifO3yj+JiOWQlWaLxjJ3WhpByk2n74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeFGfkbl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeFGfkbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754262383; x=1785798383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8pi8b9IRBRaBG5LgslRNqsiGMkODb31gr7ADQpV28Ns=;
  b=AeFGfkblZOhODW4j4UHyFjoVg8g4sFFNd/Ec5CEZFz5kRXuapiPehjQO
   NJvMrrQYxGoqnENCXQXOUxXeRLwoBGbo4SR1Rgu8ALtOdwTwi66OawIdP
   96pvzMol42xo25W5hcibjtZd20QCBVf80VDjEyxzW4PV2sYw66QkgBzfd
   BJ5VA1Y/2t039EjMIVvGkzmF3h8roCrnuis6NhcO9gvtxTHW/uHNvcHyc
   0pclnr4jtp+5ThpH2ZHWQ/W6+l2yw6qsBwmUN0iR3PbjlTRPg3Wx5lbsS
   OgNffknqUkiP4HbN3N635VPWD3ilCoAzGJMIHmUVBjQBwolJuvFD/pPU8
   g==;
X-CSE-ConnectionGUID: SQNzidNAS2+9SnzGspTvKA==
X-CSE-MsgGUID: mXVVD2jjQcudI92io3rEGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="59135836"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59135836"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 16:06:21 -0700
X-CSE-ConnectionGUID: 2xdL0SI4TleL2nC1vfVAgA==
X-CSE-MsgGUID: rhmA2tVMRW+mcVgK/V1xhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163281000"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 03 Aug 2025 16:06:20 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihmT-0001gx-2i;
	Sun, 03 Aug 2025 23:06:17 +0000
Date: Mon, 4 Aug 2025 01:05:34 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 824/987] warning: method `into_raw` is never
 used
Message-ID: <202508040120.WxoIHNUD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 0478f42cdb343787e247a07f23e58ec516f8dacf [824/987] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040120.WxoIHNUD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040120.WxoIHNUD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040120.WxoIHNUD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: method `into_raw` is never used
   --> rust/kernel/dma_fence.rs:470:19
   |
   454 | impl FenceChain {
   | --------------- method in this implementation
   ...
   470 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:177:22
   |
   177 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
   help: try
   |
   177 ~     let p = unsafe { {
   178 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   179 +         let field_ptr = $field_ptr;
   180 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   181 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   182 +         container_ptr
   183 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:187:22
   |
   187 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   help: try
   |
   187 ~     let p = unsafe { {
   188 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   189 +         let field_ptr = $field_ptr;
   190 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   191 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   192 +         container_ptr
   193 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:195:22
   |
   195 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   help: try
   |
   195 ~     let p = unsafe { {
   196 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   197 +         let field_ptr = $field_ptr;
   198 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   199 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   200 +         container_ptr
   201 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:203:22
   |
   203 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   help: try
   |
   203 ~     let p = unsafe { {
   204 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   205 +         let field_ptr = $field_ptr;
   206 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   207 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   208 +         container_ptr
   209 ~     } };
   |
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*mut dma_fence::FenceObject<T>` -> `*mut dma_fence::FenceObject<T>`)
   --> rust/kernel/dma_fence.rs:211:22
   |
   211 |     let p = unsafe { crate::container_of!(fence, FenceObject<T>, fence) as *mut FenceObject<T> };
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   help: try
   |
   211 ~     let p = unsafe { {
   212 +         let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
   213 +         let field_ptr = $field_ptr;
   214 +         let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
   215 +         $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
   216 +         container_ptr
   217 ~     } };
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
