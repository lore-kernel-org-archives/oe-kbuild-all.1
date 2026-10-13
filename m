Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016431862
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 00:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849795; cv=none; b=f5GYc/HQbHeQcU82gZa6ifVrQ509hfwvd0VLXax9MDqjMppz6I0JkhqGPWNZZvw38Tvm6Y7cQHAGlCw7Ky/1LpuQ/F2fr/NN/gWPxkYVdCWA70Wh5lxvJiiR+i+ic271eFOJvyhLWdpfX0SULO4PmKTj/rRE535HBePjGHogH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849795; c=relaxed/simple;
	bh=mwWMLNIjO9Ab3UUtxu8Fucnm5CnXcmPqbw4CQKFIpKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CTlaupPFcVLG/A3D9PdljOsHw20qgid3kiT5es8YbhVBvaa4g6YJUp60a5iaWjJzHgDai2qGM4/DHriBKxIfihW4FRJazoF2gGVR+o5CVgu9547/l/RJ/SSo/9A8LfKwCgRxRi4OgJindbInvxZ4pd02cnyuhA8wW+SwcmGKTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rsaav/yX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rsaav/yX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791849794; x=1823385794;
  h=date:from:to:cc:subject:message-id;
  bh=mwWMLNIjO9Ab3UUtxu8Fucnm5CnXcmPqbw4CQKFIpKQ=;
  b=Rsaav/yXM7IHM55ZesB1u+LwmXQOd5rMpyGyFdfIaSND236ErnFHTCtQ
   Xeb/cuwne83zF2jSdvibDtd2QTUvsKL8p4Fr8Jv7nWJ9RYIlCYYZGPRCa
   Wk6uFbhGDHPxfBRC0ioZwP3waLYiDfunpG71XmjB4pGj4z/3QXHm3/KFi
   WXWgO7dNhxic1s25OCRh+E9O4St/Lw0ADxtR7ofztMKE4IDMVGPRfEMmI
   0k3D8aIcHNxP0shS2tDszE+n5klIPeBcQr9U271UGxjQYkap4vpqDTPKg
   ajiNDQkTjOwq/U9ObFOAG5LyG0JfOqP1x4Pb7KDobrcek8hJrRCTdcW7g
   Q==;
X-CSE-ConnectionGUID: 5k1I5IsFRtSrLn2TBjCorw==
X-CSE-MsgGUID: kgHUo+tPToWhgxdr8EYo8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="454614"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="454614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 17:03:14 -0700
X-CSE-ConnectionGUID: FZS9GKl9QbybBwwe3JqFmQ==
X-CSE-MsgGUID: JdURKAOySrCURhPnALIGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="939720"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Oct 2026 17:03:12 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGPz4-00000000AIn-0NwT;
	Tue, 13 Oct 2026 00:03:10 +0000
Date: Tue, 13 Oct 2026 02:03:08 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:rxe-rust-v1 61/88] warning: use of a disallowed
 method `core::ffi::CStr::as_ptr`
Message-ID: <202610130159.ZWMsCiIl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rxe-rust-v1
head:   fe52737deab42b438e356282106b9418915da058
commit: 6a8249571db884afbc188c60b5a59a86c727ae45 [61/88] rust: rdma: Own pinned provider data across device callbacks
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261013/202610130159.ZWMsCiIl-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130159.ZWMsCiIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130159.ZWMsCiIl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:144:16
   |
   144 |         Send = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_SEND as u32,
   |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_SEND`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:146:19
   |
   146 |         Receive = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_RECV as u32,
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_RECV`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:148:17
   |
   148 |         Write = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_WRITE as u32,
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_WRITE`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:150:16
   |
   150 |         Read = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_READ as u32,
   |                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_READ`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:152:18
   |
   152 |         Atomic = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_ATOMIC as u32,
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_ATOMIC`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:154:22
   |
   154 |         SrqReceive = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_SRQ_RECV as u32,
   |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_SRQ_RECV`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:156:17
   |
   156 |         Flush = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_FLUSH as u32,
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_FLUSH`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: casting to the same type is unnecessary (`u32` -> `u32`)
   --> rust/kernel/rdma/capabilities.rs:158:23
   |
   158 |         AtomicWrite = bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_ATOMIC_WRITE as u32,
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `bindings::ib_odp_transport_cap_bits_IB_ODP_SUPPORT_ATOMIC_WRITE`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: name `PROVIDERS` contains a capitalized acronym
   --> rust/kernel/rdma/registry.rs:14:27
   |
   14 |     unsafe(uninit) static PROVIDERS: SpinLockIrq<Option<RBTree<usize, TypeId>>> = None;
   |                           ^^^^^^^^^ help: consider making the acronym lowercase, except the initial letter: `Providers`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#upper_case_acronyms
--
>> warning: casting to the same type is unnecessary (`u8` -> `u8`)
   --> rust/kernel/rdma/modification.rs:42:65
   |
   42 |                     .then(|| (*attributes).node_desc.map(|byte| byte as u8)),
   |                                                                 ^^^^^^^^^^ help: try: `byte`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unnecessary_cast
--
>> warning: use of a disallowed method `core::ffi::CStr::as_ptr`
   --> rust/kernel/rdma/statistics.rs:40:52
   |
   40 |             descriptors[index].name = names[index].as_ptr().cast();
   |                                                    ^^^^^^ help: kernel's `char` is always unsigned, use `as_char_ptr` instead: `kernel::prelude::CStrExt::as_char_ptr`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#disallowed_methods
   = note: `-W clippy::disallowed-methods` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::disallowed_methods)]`
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
