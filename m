Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BAC167DB7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 03:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741405225; cv=none; b=ZaH3fmfXCBQ6sGH1CtLvkCAFzj7lHwzgbR80b2lsJzhqR3FKsODSwCLCwSF/OKoMuNeFfOq3inbin5yex9a1e4SymVMivNX/D7Qb2Rk26q/XKtHVchvaAhyxbJgwDG1m+936WrKy4lUcGx7hghIcJEOOU5yZtG1q111sXBjoqsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741405225; c=relaxed/simple;
	bh=FNIf8fb1W4LhRCc+VdEQvwegP4bHbXZ2sxHvJM5gi5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cxupPaFAvkBtrBhVFjOqnBWk2OQgAQTGPtNpvxLbpbn5Um36h+TKmwcItKx9Cwc34u4Sw9cH2sLJs2ykiaG9W9gvbO3IpZLohfF60DyLrZN4pA8+hTAAeM8J19Y9kk8JEftLKhVWi1b4FhBF5kEfgGMu2qhR3ehdoWgaBwMr+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs64xhLh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs64xhLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741405224; x=1772941224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FNIf8fb1W4LhRCc+VdEQvwegP4bHbXZ2sxHvJM5gi5M=;
  b=gs64xhLhimslOJ6jMdwMsTtGA34MB8LfaPDPxN3V2hjvP4+cpU8RL7WJ
   DdJatJNf7FZlhpgLwqC8tgAKQ+/Oq/UnQpaRm/r0J/VJxNeJU9KNRKm99
   hlIwPmbKlhbgWyycyLdPF3BC7P/HNsL5watplh7Xjjv9R2uzV/b+OqbyL
   ZX2oE+oTM3GqS3CB8NhLu1/UdwuQXQduMEuZXzkaRxU4TG3W78f/E548N
   8cCPkNmICsLlV/a97hz5Qh9x5giPBXcGgG5xAbUYPzgATMwIrbTfSkc3N
   FKQ3i94wfWxW0FVCXYWQjnaUK3oygAb/HbzGI4mnt2yboDSLXbDO+LpU3
   w==;
X-CSE-ConnectionGUID: 7O3V9IGrRxmlBrPFdLBLfw==
X-CSE-MsgGUID: YMNF9P0QTlSLc+vKWC9aLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="53850568"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="53850568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 19:40:17 -0800
X-CSE-ConnectionGUID: +DvbQXp7TUe61XpshgTb5A==
X-CSE-MsgGUID: CMWOJAayRcqP3W5dmhR7TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120012749"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Mar 2025 19:40:17 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tql2m-0001Qu-1x;
	Sat, 08 Mar 2025 03:40:09 +0000
Date: Sat, 8 Mar 2025 11:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-experiments 240/411] warning: casting a character
 literal to `u8` truncates
Message-ID: <202503081107.0ppWvwWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 664df195a2bdc97bada3c2f5140ff0d591fdbdcb [240/411] rust/dma: cleanup some exports
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250308/202503081107.0ppWvwWr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081107.0ppWvwWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081107.0ppWvwWr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting a character literal to `u8` truncates
   --> rust/kernel/elf.rs:163:51
   |
   163 |             e.ident()[Eident::EIMAG3 as usize] != 'F' as u8 {
   |                                                   ^^^^^^^^^ help: use a byte literal instead: `b'F'`
   |
   = note: `char` is four bytes wide, but `u8` is a single byte
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#char_lit_as_u8
--
>> warning: casting raw pointers to the same type and constness is unnecessary (`*const U` -> `*const U`)
   --> rust/kernel/elf.rs:245:30
   |
   245 |         return Ok(unsafe { &*(sec_hdr as *const U)});
   |                              ^^^^^^^^^^^^^^^^^^^^^ help: try: `sec_hdr`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
--
>> warning: matching over `()` is more explicit
   --> rust/kernel/page.rs:323:16
   |
   323 |             Ok(_) => {
   |                ^ help: use `()` instead of `_`: `()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ignored_unit_patterns
   = note: requested on the command line with `-W clippy::ignored-unit-patterns`
--
>> warning: casting to the same type is unnecessary (`u64` -> `u64`)
   --> rust/kernel/scatterlist.rs:29:9
   |
   29 |         (unsafe { *self.0.get() }).dma_address as u64
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `(unsafe { *self.0.get() }).dma_address`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
--
>> warning: question mark operator is useless here
   --> rust/kernel/scatterlist.rs:178:9
   |
   178 |         Ok(SGTableInit::alloc_table(&self.sgt, nents, flags)?)
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try removing question mark and `Ok()`: `SGTableInit::alloc_table(&self.sgt, nents, flags)`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_question_mark
   = note: `-W clippy::needless-question-mark` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::needless_question_mark)]`
--
>> warning: name `EICLASS` contains a capitalized acronym
   --> rust/kernel/elf.rs:129:5
   |
   129 |     EICLASS = 4,
   |     ^^^^^^^ help: consider making the acronym lowercase, except the initial letter: `Eiclass`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#upper_case_acronyms
   = note: `-W clippy::upper-case-acronyms` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::upper_case_acronyms)]`
--
>> warning: casting a character literal to `u8` truncates
   --> rust/kernel/elf.rs:161:51
   |
   161 |             e.ident()[Eident::EIMAG1 as usize] != 'E' as u8 ||
   |                                                   ^^^^^^^^^ help: use a byte literal instead: `b'E'`
   |
   = note: `char` is four bytes wide, but `u8` is a single byte
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#char_lit_as_u8
   = note: `-W clippy::char-lit-as-u8` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::char_lit_as_u8)]`
--
>> warning: casting a character literal to `u8` truncates
   --> rust/kernel/elf.rs:162:51
   |
   162 |             e.ident()[Eident::EIMAG2 as usize] != 'L' as u8 ||
   |                                                   ^^^^^^^^^ help: use a byte literal instead: `b'L'`
   |
   = note: `char` is four bytes wide, but `u8` is a single byte
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#char_lit_as_u8
--
>> warning: unresolved link to `fsleep`
   --> rust/kernel/delay.rs:11:34
   |
   11 | /// Equivalent to the kernel's [`fsleep`] function, internally calls `udelay`,
   |                                  ^^^^^^ no item named `fsleep` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
