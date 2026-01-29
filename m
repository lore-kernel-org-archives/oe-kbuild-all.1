Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504C03859EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685009; cv=none; b=XrTgir8ObyQaiNV0MkOnWfr1Lzr6v17FWCKPLaYcAsBjZiY8JbQn9nX0ib5Rd1YDtysWrYRvnqPQlJNm66zRGG1kN4B4asLm+OkgVtirUQWpztj/ZYZ+foU3L7ACfzlOXTn3PogHH8BkcPqUYPgwwRiZU73E1yIKYo1I2O6VOLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685009; c=relaxed/simple;
	bh=C9SxJOD3elyNjKmtx3XC9cqqV5VfqzbZY9bKNgymUR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hj+8FCvMw6CH+R4MSDK/Qk6J0qDIM0LB9RfK3RrspnstflRHM+Na2Pu/jh1ivehX3Hh2GDNZjgMHmonxLzF8t7AYrj7LbpblUOANGNkNBaZoJdnCUtuGrm3KKir5PYL1SlN2IT3PAZCo/SO+KBCn6NTdFkuYTf2xqvSHKG039HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nnhqsb3g; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nnhqsb3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769685006; x=1801221006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C9SxJOD3elyNjKmtx3XC9cqqV5VfqzbZY9bKNgymUR0=;
  b=Nnhqsb3gm+QyboGokZR+nKC9DOggVp7LK0tW0whcqXwo49ho5+u+nIv0
   azMYPKtlhT9YZydpr5OQHMrZ+x6Ozx+jrJqXiOFRKnZvpZo9luo6mykgp
   j8q0vLtIckBSFGgSLYBKR3ki51jQjaojJ2sYPBdSv8/6Foxd3Afl79v+7
   ROpFX2kUefUOc5XKy0EJzkloJZnAldt4wtwq8YqJbz8DQ+FIKYg2tgqiT
   ZBfnClJUrKPCzGDaruY5b2rmeZmIk36V873AfTDVB0CNeJRYnJdUsBtRc
   +QR/bsrLbCaEoKHjMeh0KZB1JO6t7UB8rGo0nNdypwCvqhyPMpmeQ4+Fz
   g==;
X-CSE-ConnectionGUID: fielKsqrSF6xNtlIo9J+WA==
X-CSE-MsgGUID: x9SG2Ez9QK+PngzfEYpREg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69935742"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="69935742"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 03:09:57 -0800
X-CSE-ConnectionGUID: eW8ME4/ATqWLV2zpP7Uc8w==
X-CSE-MsgGUID: kZOgzKVVRZ2BBvDdpOlZiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208154647"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 03:09:56 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlPuM-000000002HN-0LRJ;
	Thu, 29 Jan 2026 11:09:54 +0000
Date: Thu, 29 Jan 2026 12:09:42 +0100
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] rust: nvmem: Add an abstraction for nvmem
 providers
Message-ID: <202601291212.HAGuOxuH-lkp@intel.com>
References: <20260128182925.13225-3-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128182925.13225-3-linkmauve@linkmauve.fr>

Hi Link,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.19-rc7 next-20260128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Link-Mauve/nvmem-Document-enum-nvmem_type-and-its-variants/20260129-023240
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260128182925.13225-3-linkmauve%40linkmauve.fr
patch subject: [RFC PATCH 2/3] rust: nvmem: Add an abstraction for nvmem providers
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260129/202601291212.HAGuOxuH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291212.HAGuOxuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291212.HAGuOxuH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:59:38
   |
   59 |             let context = unsafe { &*(context as *mut T::Priv) };
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `context.cast::<T::Priv>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
   = note: requested on the command line with `-W clippy::ptr-as-ptr`
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:60:23
   |
   60 |             let val = val as *mut u8;
   |                       ^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `val.cast::<u8>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:79:38
   |
   79 |             let context = unsafe { &*(context as *mut T::Priv) };
   |                                      ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `context.cast::<T::Priv>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: `as` casting between raw pointers while changing only its constness
   --> rust/kernel/nvmem.rs:80:23
   |
   80 |             let val = val as *mut u8 as *const u8;
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast_const`, a safer alternative: `(val as *mut u8).cast_const()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness
   = note: requested on the command line with `-W clippy::ptr-cast-constness`
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:80:23
   |
   80 |             let val = val as *mut u8 as *const u8;
   |                       ^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `val.cast::<u8>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: `as` casting between raw pointers while changing only its constness
   --> rust/kernel/nvmem.rs:90:28
   |
   90 |         self.inner.priv_ = priv_ as *const T::Priv as *const c_void as *mut c_void;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast_mut`, a safer alternative: `(priv_ as *const T::Priv as *const c_void).cast_mut()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_cast_constness
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:90:28
   |
   90 |         self.inner.priv_ = priv_ as *const T::Priv as *const c_void as *mut c_void;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `(priv_ as *const T::Priv).cast::<c_void>()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr
--
>> warning: reference as raw pointer
   --> rust/kernel/nvmem.rs:90:28
   |
   90 |         self.inner.priv_ = priv_ as *const T::Priv as *const c_void as *mut c_void;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^ help: try: `core::ptr::from_ref::<T::Priv>(priv_)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ref_as_ptr
   = note: requested on the command line with `-W clippy::ref-as-ptr`
--
>> warning: `as` casting between raw pointers without changing their constness
   --> rust/kernel/nvmem.rs:104:27
   |
   104 |         self.inner.name = name.as_ptr() as *const _;
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^ help: try `pointer::cast`, a safer alternative: `name.as_ptr().cast()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
