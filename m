Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3F32BD588
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754435172; cv=none; b=dzc8lVbYKteDZiiwBTRraOWNfDY/Nc6XrTPtWUlhLPQFOk5NRHQysyhjgM+lDWE3kSGyXZlXH++oDJoV/5dVIgoeN4mm0bQEIGkBzRmhLdYOaBujqLCJxbA7ZXPDcb2LSv/IC0R4kKg1aCqmVZU95stPFP3XEz3+89kJT8wi5L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754435172; c=relaxed/simple;
	bh=/bm6uzDPNtxpFGFzExT6Nqd/U/LybLX5q9/Cql4qaJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSL1d6zsP7y3TKUKGav3rK/UflkRwTw6gjaTYVAJ0KXlcRohunMhvhPnDYZMK2a1kqTA4eWxbTVmKwty1wuCKQ6f06XVSYrJQ1rv/nwNWoxOensCz0CIeLJ90WtEKcEpdceEgOybQYLJ/S4WSDCkJT1HLCoUWB74YePHsYTA3Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bz+XRqjx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bz+XRqjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754435170; x=1785971170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bm6uzDPNtxpFGFzExT6Nqd/U/LybLX5q9/Cql4qaJY=;
  b=Bz+XRqjxd8IYbYrwi5e9dKjfN26hCaswBBTNgsrmL+ruw9OmtfJQfJHc
   pBqF7YB68bZW64VnThnGCvxMlWqtjrXap/Vl3Ad0j57giYQOxYicRDIbq
   ZJVJDwvhSCxxn7SKqa1FWDgVDzspP13p3tLpeJzm6QE2w1UF09Sz5jM1E
   HqmVgEhQT4n0B9p/xPyATsQyIOKF4ffZKnnPcUItPc1rCJpLUmtXEX7AF
   Am6eV4PYcsENzQ1EhUMXAjTOj1J5AvNQUSiBs0kKE59pRG/kuatb50zNm
   TuCR31E18vvcrfOHd+PF/zuovtdiCGoxYnz2K248H3hZEWiJiVaBst63z
   Q==;
X-CSE-ConnectionGUID: ylD7MaxTStizGxNW4I/1xA==
X-CSE-MsgGUID: yANlbNq1QUSRYGIhG8IPZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56661046"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56661046"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 16:06:09 -0700
X-CSE-ConnectionGUID: 3yupvVSFQDeFqevx99kYYA==
X-CSE-MsgGUID: PdepUtl3Toe9Qm3S/0PnPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="163878250"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 05 Aug 2025 16:06:08 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujQjO-00025D-1v;
	Tue, 05 Aug 2025 23:06:06 +0000
Date: Wed, 6 Aug 2025 01:05:45 +0200
From: kernel test robot <lkp@intel.com>
To: "Christian S. Lima" <christiansantoslima21@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>
Subject: [jfern:nova-core-unstable 4/63] warning: current MSRV (Minimum
 Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
Message-ID: <202508060129.SJ7hRwjl-lkp@intel.com>
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
commit: 3cf24146b9d6dfb84e6d8f3c8f5501f683c8ed03 [4/63] rust: transmute: Add methods for FromBytes trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250806/202508060129.SJ7hRwjl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060129.SJ7hRwjl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060129.SJ7hRwjl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/transmute.rs:114:72
   |
   114 |         if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
   |                                                                        ^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
--
>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/transmute.rs:74:68
   |
   74 |         if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
   |                                                                    ^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
   = note: `-W clippy::incompatible-msrv` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::incompatible_msrv)]`
--
>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/transmute.rs:87:68
   |
   87 |         if bytes.len() == ::core::mem::size_of::<T>() && slice_ptr.is_aligned() {
   |                                                                    ^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
--
>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/transmute.rs:101:72
   |
   101 |         if bytes.len() % ::core::mem::size_of::<T>() == 0 && slice_ptr.is_aligned() {
   |                                                                        ^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
