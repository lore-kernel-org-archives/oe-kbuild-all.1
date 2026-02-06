Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC18D24B28
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 00:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770338853; cv=none; b=R7s6QN/nXXrbwU+TicFHTQjeqNclpQHuoJ08A+8VjcpmotNufVRv/zrNnN71dYS2q/UveZlMUL+NhLdQl3uNZjF0cPqIzNxpzl/iHShf4SaMQ4dt3x4mGHMoRCYPE8QnySuRJzULDm6U7EwzNThitXfwDAvlu3fKNPIqlyV2/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770338853; c=relaxed/simple;
	bh=Oe9meYR24Myu3MAkbBPCR6OX4BEoDuCk5njQm6tnnd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u/PWqL+FS+AqAnVfOb0Gp4F7PBdBMqhdf5htSHKiiceAMbAZ01Ja/+6tQ6MAZKNICNmdujHvLWTLVzKobseviM3qu3obks1XADwyKR526eSx9Qujo0ExzcBFc3wBfzfHwv3wrlyRLN2frpKIHmt35xUuyCKSiwQ2OFX54C2uocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtgBuZGE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtgBuZGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770338853; x=1801874853;
  h=date:from:to:cc:subject:message-id;
  bh=Oe9meYR24Myu3MAkbBPCR6OX4BEoDuCk5njQm6tnnd4=;
  b=DtgBuZGETCOby5XYlvsNKoKhpBVf0aJFx4dEDqbgD8JdO7P0L+UdM+gC
   uI7KYMD6zq2zif1Q3BfHfLXhzxffBZOBAGNNOce16vQLV+DzGR3WossvM
   3JpbcRl6wqz+fG+KJ4fZRZoRwf5g1j/Ab2/anfD0iCFrFcsHVOElj+Iy2
   EyE5T5Mv6QIJri6tX5Gouamk3NWgrkOzRFOgYcRAWCw0m+5DL5wmdzEXu
   kwfSUWPPzDS+ZB66+mckOsDeNI127HewDWpetJIQhNDFzJzLRbN0n7EPo
   mIi+Fkd6rWHdBMcJ4WUW8OFulGOeBm7YwDcrplNXHy8GWYF8hGdtvW8NZ
   g==;
X-CSE-ConnectionGUID: wGurULBKRdSI8yLpPgDjfg==
X-CSE-MsgGUID: D2zL4nK5Q+iYrOoORnHL2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71541111"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71541111"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 16:47:32 -0800
X-CSE-ConnectionGUID: e7raaSKiS4G1q/Z4D1MFag==
X-CSE-MsgGUID: 3+XqcaTJS/GI+6Ad1OygFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215687753"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2026 16:47:31 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voA0P-000000004Hp-0tJY;
	Fri, 06 Feb 2026 00:47:29 +0000
Date: Fri, 06 Feb 2026 01:47:06 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 2/4] warning: current MSRV (Minimum
 Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
Message-ID: <202602060123.Y1h6N2X8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   2c9cf695647e3347134a18354fc3bda43b501979
commit: 54d8e6a820741a82b2bdec15bc360ec8d3143fac [2/4] rust: dma: generalize `dma_{read,write}` macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260206/202602060123.Y1h6N2X8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060123.Y1h6N2X8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602060123.Y1h6N2X8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
   --> rust/kernel/io.rs:48:11
   |
   48 |         p.len() * core::mem::size_of::<T>()
   |           ^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#incompatible_msrv
   = note: `-W clippy::incompatible-msrv` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::incompatible_msrv)]`
--
>> warning: missing documentation for a type alias
   --> rust/kernel/dma.rs:457:1
   |
   457 | pub type CoherentAllocation<T> = Coherent<[T]>;
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
