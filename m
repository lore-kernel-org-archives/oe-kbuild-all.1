Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C420F215073
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Aug 2025 22:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754261123; cv=none; b=a1KMN9qXq72sdILAiGZ5kl9/MaU5eNiztE78FhdnLLm6sA6tykbBJfqpcOqFVyKn2ca9AO1k9JVfqHn2l/8u8b4xiGC5ckR22dCO6DZ6u8SPuCvaHESIPwwLBkLYLYUmqjv2VH0AzES4Q93C+pB4l2fDD/QqCkGW6DbyU4VIfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754261123; c=relaxed/simple;
	bh=5ELDt3OakYBpCAHRpqVuDk3mpGAC6IOIjXAlnA8GbYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=piAWtldPLoSKEuOXuRqZLDyD+fQZCeQnUqMCdCB5x3hmUmIaadnSYqV7VZq1mIMb8cI+7moaGXMWdx/szQYCw9FnNqScQweWfsilMqtm7DBj2bb+AAdWhNlQy1QMgmgKgoqxJrB4Uh8nD6vAJ2llDKPMDZFwLRjNQ57/9Wz+jic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWKoxEOC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWKoxEOC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754261121; x=1785797121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ELDt3OakYBpCAHRpqVuDk3mpGAC6IOIjXAlnA8GbYE=;
  b=gWKoxEOC+F81NPzX0vJDDedawzm94KAicxVoxid+T32LXuwAMiqso/GL
   k7l5HTOL+Qi0H7cHvquVBG5coNUBBb2ZlcRCjPEAddaa3G5Xv09CXa9Ts
   1ng/JWJBIt2rXFPzh9nUQSz7Iu/8kxn1YrYPKj7hBt3/JW4weh8vlqTOG
   zPYqmuF4YsNduYzxKPoiDXC/zF0aW1z6xpIsOhgWyE7PtDZNkGeJUUNWm
   n8wlTQ0JT9fwEe3s7bCGLyt8VY8JYcPectT70InlXYfOhWOYxz0KplMdv
   OZcLXTDlO6M74whwBdTB0iJVTuhuZ364FBExnvIhDk0aluClGb3v8Y+2l
   Q==;
X-CSE-ConnectionGUID: GhIIhu7XRLuGcTqVPVIASA==
X-CSE-MsgGUID: zmhSxPsJTx6mTXC6/g0/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="67969223"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67969223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 15:45:20 -0700
X-CSE-ConnectionGUID: sg5lYZj/QdapvuVs0MjvUA==
X-CSE-MsgGUID: ypg9CJBUSoS30zq1BR1U4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163286667"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 03 Aug 2025 15:45:19 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uihS8-0001gp-2S;
	Sun, 03 Aug 2025 22:45:16 +0000
Date: Mon, 4 Aug 2025 00:45:08 +0200
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/250-aop 44/85] warning: deref which would be done
 by auto-deref
Message-ID: <202508040052.olOycacT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   800be80e4ce2e4872e0d8f2716b2b7c79a0511ef
commit: 9010e06df0a80c2f6a97716684f16b0a95fdabca [44/85] rust: types: Add declare_flags_type()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250804/202508040052.olOycacT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508040052.olOycacT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508040052.olOycacT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: deref which would be done by auto-deref
   --> rust/kernel/alloc/kbox.rs:546:9
   |
   546 |         &**self
   |         ^^^^^^^ help: try: `self`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#explicit_auto_deref
   = note: `-W clippy::explicit-auto-deref` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::explicit_auto_deref)]`
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<i64>], &mut [i64]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> rust/kernel.o: warning: objtool: _RNvXNtNtCshc5sK6KjdJJ_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix14from_str_radix() falls through to next function _RNvXNtNtCshc5sK6KjdJJ_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix7abs_min()
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<u8>], &mut [u8]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: `-W clippy::missing-transmute-annotations` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_transmute_annotations)]`
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<u16>], &mut [u16]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<u32>], &mut [u32]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<u64>], &mut [u64]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<i8>], &mut [i8]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<i16>], &mut [i16]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: transmute used without annotations
   --> rust/kernel/device/property.rs:420:40
   |
   420 |                   Ok(unsafe { core::mem::transmute(out) })
   |                                          ^^^^^^^^^ help: consider adding missing annotations: `transmute::<&mut [core::mem::MaybeUninit<i32>], &mut [i32]>`
   ...
   462 | / impl_property_for_int! {
   463 | |     u8: fwnode_property_read_u8_array,
   464 | |     u16: fwnode_property_read_u16_array,
   465 | |     u32: fwnode_property_read_u32_array,
   ...   |
   470 | |     i64: fwnode_property_read_u64_array,
   471 | | }
   | |_- in this macro invocation
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_transmute_annotations
   = note: this warning originates in the macro `impl_property_for_int` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: unresolved link to `mem::forget`
   --> rust/kernel/alloc/kvec.rs:753:11
   |
   753 |     /// [`mem::forget`], for example), the vector may have lost and leaked
   |           ^^^^^^^^^^^ no item named `mem` in scope
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
