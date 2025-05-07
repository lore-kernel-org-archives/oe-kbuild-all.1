Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CA41FE455
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598031; cv=none; b=Hr0W6bM7XfdWi5ARPsvEf1kzSSOzzCroVsiTaBZlQzZ4h5tzlLmdT6Gj8/OCxj0EOLuux4ATBHcPgzbQe37t6oLzcNf2M5f27qYbVcxrMicrrFK7zuYzD4LuZxgl7w2NBE6J7uI54TFreLfmOsSip5GswFn65jN9lsk+b8R7L9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598031; c=relaxed/simple;
	bh=8OfccVnqK3v42+M75D3uO4PBW/zRcZOKOscz7OPSL4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IFGCusECZkwkCDyVv1J+8gs7KToWvFlxfR2ORDE4e0hmvg7xfgjEsOaIITSyqsuQd0BEYefQYbMlqsII4UpzxdSIBJAvptV09vG9cuWOSMJKrSj8fZ9o+17xnZxk5yNsUETN1J8IRoDNFTHIla3+3dpAT8Dhdml7H7XyeiEhBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+gCB2eh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+gCB2eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746598030; x=1778134030;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8OfccVnqK3v42+M75D3uO4PBW/zRcZOKOscz7OPSL4o=;
  b=W+gCB2ehbvd0Z9RujG/w2G4gXnfaO69HR5jzTg65F+CXdiSdmqxqNrd4
   4rxVTjEdC7zk3mV7e8ZBdm/8pxcmiC5o8GjqIxWkI94GlAyRPJk9Pm4Yo
   Sa6ZANK5RpeX32COVnAGr3XiDnXrA7OElu7bHSUrmX1KDni9L9iIxQYkn
   quwYrBQRKG3KzglIx33G8Ai7iV35czOI9w+UJ57/RkRMIVNsmaWlYC3oC
   gJxI/2pZSC3MpgnI/ktt6FL0OZOrP1lM+zvHoD66sO+aMeWg/LYGiUg/J
   EUonE5MVnfgB38DpxVeG3S3RHaGdAyiG3jQDhiODlOZh5kv+uS4Z5NiMW
   Q==;
X-CSE-ConnectionGUID: CKFaGI2tQOSD92ZgqvViGw==
X-CSE-MsgGUID: b6VKvlrrSEOW81cUjeZSqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48452754"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="48452754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:07:07 -0700
X-CSE-ConnectionGUID: hXbe8CroTQ2KcwLUwIQxtw==
X-CSE-MsgGUID: lV7cfuOSQ9uqYbbXS8so0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="136252150"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 May 2025 23:07:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXvr-00079a-0m;
	Wed, 07 May 2025 06:07:03 +0000
Date: Wed, 7 May 2025 14:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: [tj-wq:tmp2 1/2] error[E0308]: mismatched types
Message-ID: <202505071347.5qXsnO7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tmp2
head:   2762750ac5c6395dfa69b2cf1e3208fe6ae45cd5
commit: 345e029b561e03c4647b3d5b6603f40745a2ac92 [1/2] rust: workqueue: remove HasWork::OFFSET
config: riscv-randconfig-r072-20250428 (https://download.01.org/0day-ci/archive/20250507/202505071347.5qXsnO7G-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071347.5qXsnO7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071347.5qXsnO7G-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 21.0.0
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0308]: mismatched types
   --> rust/kernel/lib.rs:204:9
   |
   204 |           ptr.sub(offset) as *const $type
   |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutability
   |
   ::: rust/kernel/workqueue.rs:495:18
   |
   495 |               ) -> *mut Self {
   |                    --------- expected `*mut ClosureWork<T>` because of return type
   ...
   505 | / impl_has_work! {
   506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
   507 | | }
   | |_- in this macro invocation
   |
   = note: expected raw pointer `*mut ClosureWork<T>`
   found raw pointer `*const ClosureWork<T>`
   = note: this error originates in the macro `$crate::container_of` which comes from the expansion of the macro `impl_has_work` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
