Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1342042
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Sep 2024 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727048719; cv=none; b=KnLwEJiMMzf+qIGU3jiqRyrmH8Ec1oppOe6qk9oBIcBSwl5AkQc+uoBZL2pZBd+e53wi0dSICKL/DXNuUba6x0YKeEZctAItgvr/m72GwSz0JdAVbcISizgN0dRp3/H/PRY5znwFdka1qPU/P8GM+LKx/KnpF0Lc7cDixNBk4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727048719; c=relaxed/simple;
	bh=ScT84scBtrHkoCi69DewJn+zJYX4QtY0nT6N0BBHdDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/nMHBOy0TW6hXcKkI5hw8QaVbx7Is3IiLBG0lPqQ3D2aaX1cWd6vfxI88xyd/wDq3Vd0Y3S/HWOMSwS7uDH3cIwtxCTpcLy7HjLv+hD2BJvNfOZJalfEcNZ15EZ9fnxYow6+3IPqwNUwYW17b5bFplpa0v5I2jJXuA+FwucKjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF6CiRhu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF6CiRhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727048717; x=1758584717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScT84scBtrHkoCi69DewJn+zJYX4QtY0nT6N0BBHdDQ=;
  b=VF6CiRhuBsiQM2xNzIUGfQfo+doBFirvhmdelw6lX0mYJmn5lWnmX6bz
   DHaR06n3O4Wi2QOWTFwULe+JHefGf+SBiBkFPPfwZtZR13d8V0lgkvhU9
   Gq5h16uQuu5Amm26SK3d+E7wtOneeoqO+QGZabWj+5qH89gPmW8ua6iCb
   dEOvd6pN6c1gNzuJUU0ZXmyAmP+TF4YRPIl0NGsD+W3Ko9mewTMu/GfWU
   zs61XTX6Fai6sMc7GhODJablcRG55n6Rxxs/qaFoShqMlb0wfnimWZrrG
   cmkjyhOiakdCjxwvv4vuQtxhbnKiSrDsBXIF8bkZQB1yAgpU0Byg0Xnb4
   A==;
X-CSE-ConnectionGUID: VwMoOVg0Q3G1e9dn7iKSVg==
X-CSE-MsgGUID: pSKH/E7LR3SgsC/nNcQfvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="51400802"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="51400802"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:45:17 -0700
X-CSE-ConnectionGUID: EYtWML9rStmJTxzY/golmA==
X-CSE-MsgGUID: fLaZTziHQQGIYUMzrSq6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="101624334"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Sep 2024 16:45:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssWGO-000GkM-37;
	Sun, 22 Sep 2024 23:45:12 +0000
Date: Mon, 23 Sep 2024 07:45:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:rnvme-device-id-without-macro 54/69] warning: field `dev`
 is never read
Message-ID: <202409230729.aEgSPr6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux rnvme-device-id-without-macro
head:   d401b76fe0c1420b142e21e601ee4029af53021f
commit: cde6959b6956df83daade091da491001d0c3819f [54/69] rust: add dma pool and coherent allocator
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240923/202409230729.aEgSPr6L-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240923/202409230729.aEgSPr6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409230729.aEgSPr6L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: field `dev` is never read
   --> rust/kernel/dma.rs:77:5
   |
   75 | pub struct Pool<T> {
   |            ---- field in this struct
   76 |     ptr: *mut bindings::dma_pool,
   77 |     dev: ARef<Device>,
   |     ^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
>> warning: unsafe function's docs miss `# Safety` section
   --> rust/kernel/dma.rs:24:5
   |
   24 |     unsafe fn allocation_data(data: &Self::DataSource) -> Self::AllocationData;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
   = note: `-W clippy::missing-safety-doc` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_safety_doc)]`
--
>> warning: missing documentation for an associated function
   --> rust/kernel/dma.rs:23:5
   |
   23 |     fn free(cpu_addr: *mut (), dma_handle: u64, size: usize, alloc_data: &Self::AllocationData);
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for an associated function
   --> rust/kernel/dma.rs:24:5
   |
   24 |     unsafe fn allocation_data(data: &Self::DataSource) -> Self::AllocationData;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a struct
   --> rust/kernel/dma.rs:27:1
   |
   27 | pub struct CoherentAllocator;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a function
   --> rust/kernel/dma.rs:42:1
   |
   42 | / pub fn try_alloc_coherent<T>(
   43 | |     dev: ARef<Device>,
   44 | |     count: usize,
   45 | |     atomic: bool,
   46 | | ) -> Result<CoherentAllocation<T, CoherentAllocator>> {
   | |_____________________________________________________^
--
>> warning: missing documentation for a struct
   --> rust/kernel/dma.rs:75:1
   |
   75 | pub struct Pool<T> {
   | ^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a struct
   --> rust/kernel/dma.rs:150:1
   |
   150 | pub struct CoherentAllocation<T, A: Allocator> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> warning: missing documentation for a struct field
   --> rust/kernel/dma.rs:152:5
   |
   152 |     pub dma_handle: u64,
   |     ^^^^^^^^^^^^^^^^^^^
--
>> warning: unsafe function's docs miss `# Safety` section
   --> rust/kernel/dma.rs:214:5
   |
   214 | /     pub unsafe fn from_parts(
   215 | |         data: &A::DataSource,
   216 | |         ptr: usize,
   217 | |         dma_handle: u64,
   218 | |         count: usize,
   219 | |     ) -> Self {
   | |_____________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: missing documentation for an associated function
   --> rust/kernel/dma.rs:214:5
   |
   214 | /     pub unsafe fn from_parts(
   215 | |         data: &A::DataSource,
   216 | |         ptr: usize,
   217 | |         dma_handle: u64,
   218 | |         count: usize,
   219 | |     ) -> Self {
   | |_____________^
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
