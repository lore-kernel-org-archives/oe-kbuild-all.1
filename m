Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E393BB9FE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 10:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828554; cv=none; b=aVrtmlR3wI/b5OwetWqmRgUzMmeyg+oj3ZGUQsryzFj5VbUKX9V/Nd8FKzLs8JABInfB/A2rkArndUviip56oNGnWliBATEjYiv4V1apWqJPPuuIVv/oAMkNJwkp7hBdY3eAEVWP+P3Edgj4IQJK7oN1Bs2iwNhPuN7AxpHOAYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828554; c=relaxed/simple;
	bh=ToGZJ9LSG+ggkGOL2UbDJCsSga4UOd46NmjFVUdPSKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYcPp/SChOrLL5pXnvgS9ixO2+QPdEDHkB9On1dAwfgQN3348U19MkLrYvGwnHDYyzNm695r5IPKLYkjbupqtN9MJeAneWPn0TEAMOVW0qjjnnb8lsb00hrrYQUVZ5Jn0ePtjS2wgr8TnhZuhdDOORCvJY2kxiwi6WznlwKH/kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1CFMFQK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1CFMFQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773828550; x=1805364550;
  h=date:from:to:cc:subject:message-id;
  bh=ToGZJ9LSG+ggkGOL2UbDJCsSga4UOd46NmjFVUdPSKE=;
  b=S1CFMFQK7Bj+2s0bBlCS7m4OYcCJS8cHY199vT46rYC29PpphWn0KbSB
   yAZK0qICu6GuR9sw7asUqii2quBXza0RtKV/iylX76vm82vur7fu1T0X5
   UxDNoyMmfI7OVpxl6CwyHsXCICUa4SbLIgH2Zxrs8NFKHmN312U5DrbN+
   V7fjrwcudEvmTijk4Q7dlH2p+GZbR8kvU8Z1jbz3TpnK5SAhqSz8C2sdP
   0LcIxYBWzetcRoz/Hi8EHSl39L0qn+Zr2wYOkfrK3gboYX7MLiHNXqzQo
   1vC2hR5dNCrHH4BEmjOqZN2Rk6rmLuvlv2DwCyOTXzB6BB3G9MaL6V3ln
   g==;
X-CSE-ConnectionGUID: ioyGuhJnQm662Boq1UB83Q==
X-CSE-MsgGUID: 0RI5twteR1K5gsEBE4XDGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85509652"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85509652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 03:09:09 -0700
X-CSE-ConnectionGUID: IGGUlTfqTeS2R8bJQBdqow==
X-CSE-MsgGUID: bMYESVUvTHm/CWT0/GFWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="247091161"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Mar 2026 03:09:08 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2npp-000000004dV-3PMm;
	Wed, 18 Mar 2026 10:09:05 +0000
Date: Wed, 18 Mar 2026 11:08:39 +0100
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bennolossin:pin-init/sync 3/5] warning: unsafe impl missing
 a safety comment
Message-ID: <202603181124.fztsUFjW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/bennolossin/linux pin-init/sync
head:   ba18c8ab5a224c01bf681d2ed06b0388d3cafb5a
commit: 4d92d3ef0e849e31561a67d9b2a7f05e6c83096c [3/5] rust: pin-init: doc: de-clutter documentation with fake-variadics
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260318/202603181124.fztsUFjW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181124.fztsUFjW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181124.fztsUFjW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe impl missing a safety comment
   --> rust/pin-init/src/lib.rs:1652:9
   |
   1652 |         unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*) {}
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ...
   1657 | impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
   | -------------------------------------------------- in this macro invocation
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
   = note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`
   = note: this warning originates in the macro `impl_tuple_zeroable` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: unsafe impl missing a safety comment
   --> rust/pin-init/src/lib.rs:1652:9
   |
   1652 |         unsafe impl<$first: Zeroable, $($t: Zeroable),*> Zeroable for ($first, $($t),*) {}
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ...
   1657 | impl_tuple_zeroable!(A, B, C, D, E, F, G, H, I, J);
   | -------------------------------------------------- in this macro invocation
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
   = note: this warning originates in the macro `impl_tuple_zeroable` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> warning: unsafe impl missing a safety comment
   --> rust/pin-init/src/lib.rs:1677:9
   |
   1677 |         unsafe impl<$ret, $($rest),*> ZeroableOption for $($prefix)* fn($($rest),*) -> $ret {}
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ...
   1682 | impl_fn_zeroable_option!(["Rust", "C"] { A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U });
   | --------------------------------------------------------------------------------------------------------- in this macro invocation
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
   = note: this warning originates in the macro `impl_fn_zeroable_option` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
