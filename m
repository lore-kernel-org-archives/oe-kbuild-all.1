Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B620102B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 22:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754432830; cv=none; b=ZmzGShyAIgEM0cVqvEfxpJuxnddL7Di56UMxJAjf14EmzJb4O7mOkBnwJG/N+lshp8Ach9zC0iED75ikpCmttUuVID28g7h1fOIHvsiJDAJvG4YXWaPen3CS02SKx7bfewETYB1iLBIlwsLc9aO/gYHbW0/ZvGgO8M9cZwfhFT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754432830; c=relaxed/simple;
	bh=+k+K0hcGmuGSm5njtLugFdrwL6PqCfugnrJtRuzlHGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9e4TxFli+4ZYD5lqU+o+vsKDmiGjHL3x9DnXGA9o9PUSf3qio04sHSjwzPdtjBtgGej7bGyHcabrOSm7kUNo3gjAW5wpbms9wCzOCPeAmZFwXTmMLKgrNhWddg3I8awag315oq/DIz5O0d7ZQQz6EVDjUKf7SwWXMyn1UUT8rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgpFJ2kZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgpFJ2kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754432828; x=1785968828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+k+K0hcGmuGSm5njtLugFdrwL6PqCfugnrJtRuzlHGk=;
  b=AgpFJ2kZxOYRKkwcjoRIa4C71eY1rB1x7+irwVPgvqKO43McPPFGRAzp
   s3oV0GZEpRxdUhUM4dl4WaADCNvIO7KCvNqlNz+YYwU/X99P6lhQ874L2
   YDEI4LXO758A0l6I4gNUPB6UXyNCd2MxViUbIupm/hJQsJgURAmdyZ7uo
   n2p8zoGa/R03KszU0JfUvtKgnCPWxrME81P1ndwU5mcLQX7U/pLOG6SLs
   z5Lp9F33JX1z+vkET8maKwzEcsCUkMDnlqwvZ6Cly7GOolWwS3MTPj2ue
   zUIAymR1P2EuUwdV2Vr/OipWfHaeEUcxoXTaM0guDxKIqyQgcidhvad5H
   w==;
X-CSE-ConnectionGUID: r/uuLdzhSrGW3qfOAKqzxA==
X-CSE-MsgGUID: N7OeiS1tQ32y6p5ydpUAlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="55954433"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="55954433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:27:07 -0700
X-CSE-ConnectionGUID: JY/OcuV3SBC6UtT2BnhKAg==
X-CSE-MsgGUID: F1y3KfmsQuyMS870BAfoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164947850"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 05 Aug 2025 15:27:06 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujQ7c-00024R-0n;
	Tue, 05 Aug 2025 22:27:04 +0000
Date: Wed, 6 Aug 2025 00:27:01 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-core-unstable 3/63] warning: useless conversion to the
 same type: `core::ops::Range<usize>`
Message-ID: <202508060029.7nqKNHZV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-unstable
head:   0da13e48131fa8c0a652594e556695e8ced23a2d
commit: 517d19246c968d673a055322f276d7f204269158 [3/63] scatterlist feedback and fixups
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250806/202508060029.7nqKNHZV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060029.7nqKNHZV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060029.7nqKNHZV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: useless conversion to the same type: `core::ops::Range<usize>`
   --> rust/kernel/scatterlist.rs:222:9
   |
   222 | /         (0..self.num_pages())
   223 | |             .into_iter()
   | |________________________^ help: consider removing `.into_iter()`: `(0..self.num_pages())`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#useless_conversion
   = note: `-W clippy::useless-conversion` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::useless_conversion)]`
--
>> warning: use of `offset` with a `usize` casted to an `isize`
   --> rust/kernel/scatterlist.rs:225:17
   |
   225 | /                 self.as_ptr()
   226 | |                     .cast::<u8>()
   227 | |                     .offset((PAGE_SIZE * page_idx) as isize)
   | |____________________________________________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ptr_offset_with_cast
   = note: `-W clippy::ptr-offset-with-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::ptr_offset_with_cast)]`
   help: try
   |
   225 ~                 self.as_ptr()
   226 +                     .cast::<u8>().add((PAGE_SIZE * page_idx))
   |
--
>> warning: method `borrow` can be confused for the standard trait method `std::borrow::Borrow::borrow`
   --> rust/kernel/scatterlist.rs:400:5
   |
   400 | /     pub fn borrow(&self) -> &P {
   401 | |         &self.table.pages
   402 | |     }
   | |_____^
   |
   = help: consider implementing the trait `std::borrow::Borrow` or choosing a less ambiguous method name
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#should_implement_trait
   = note: `-W clippy::should-implement-trait` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::should_implement_trait)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
