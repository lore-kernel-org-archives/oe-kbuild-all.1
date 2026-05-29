Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726B3A4F26
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780035575; cv=none; b=QmSrT4eDFu2b+up/BlZLVETRdMr6KLrB9Ti58eNUYi1nhXWKb3hTSBhg5cvbejiwh5orzINElzJsaL3Isribf9uAqcJ0oWkwoycgk/oTWSsJWpoQXI8WxXLLM2Muec7JO0Q88bV5ogh7AKQpt2YS0wznnfS3XzmAijf0YKn0t9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780035575; c=relaxed/simple;
	bh=9bhry/3986v+fvaHmpVoXZLKy0Vg6iKE0sIvYv5sJ/k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rgt3OGJE79GI26UciAXCBZENNMOnzbv1V0EYbXKdS9eLntPvhbxFjCIM8n/p/N4MuBDs5n3cFqk6vY2DfRuXPNllbIoDLzGQbLtF8KgxgbufIMy6dAc/RlZ9CXTFvd4lAMNi4WzZvTDiGdoG1RcqYTtwkX68g8GrZll8KRbp/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmSYVKLn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmSYVKLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780035574; x=1811571574;
  h=date:from:to:cc:subject:message-id;
  bh=9bhry/3986v+fvaHmpVoXZLKy0Vg6iKE0sIvYv5sJ/k=;
  b=nmSYVKLnkQekzc6iNUIfpoDlIulJPx6M8tBk5C0soXl8CWOPMmhcSzMf
   xYDNIY8d/99+2RA2sEg4k7tL0dxUc2WCNFseKL8Ol5D+T4Tz96I2iWONn
   52pjaTY0BwSgOTt9aGGcEgy8ZdELpDipqvtLG9vzROFzDShdWBiR2X7LF
   U270HBKQhE1Sao2QWVvxfQhPVC++5fy2zJMja/YSycP3STAsKg2bKY0Ng
   UJAbq6p/aeWfdOXGMzNSkgTBfIvNGt8uWtT0ycgvXzYO1JoyPy5AsTzSN
   2ScU6FUj2FnQwECly4vMJ4OPbyWFX6m/o/7qi/yhjZErxV6uV2cBH27rP
   A==;
X-CSE-ConnectionGUID: 17k3+tQZQPGGrkuRJ3aYAw==
X-CSE-MsgGUID: h9AluE5SRPCaD1yf45fKFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80911283"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80911283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 23:19:34 -0700
X-CSE-ConnectionGUID: urHlsW6aRw6F2Y6FnL7v1w==
X-CSE-MsgGUID: KHDKJxU3QWOEG/U1Y8DDIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="246772115"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2026 23:19:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSqZ8-000000000p5-1hxI;
	Fri, 29 May 2026 06:19:30 +0000
Date: Fri, 29 May 2026 08:18:55 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:io_projection 4/19] warning:
 `kernel::build_assert::build_assert` is both a module and a macro
Message-ID: <202605290838.M1qbL8Tl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbdd0121/linux io_projection
head:   c53915574e787e2ef9e3998645328cdff6822fb0
commit: 4ef5969e3d5e49232cce370a4e346d51606fa53f [4/19] rust: ptr: add panicking index projection variant
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260529/202605290838.M1qbL8Tl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260529/202605290838.M1qbL8Tl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605290838.M1qbL8Tl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: `kernel::build_assert::build_assert` is both a module and a macro
   --> rust/kernel/ptr/projection.rs:262:42
   |
   262 | /// - `build` will use [`build_assert!`](kernel::build_assert::build_assert) mechanism to have
   |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ ambiguous link
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
   help: to link to the module, prefix with `mod@`
   |
   262 | /// - `build` will use [`build_assert!`](mod@kernel::build_assert::build_assert) mechanism to have
   |                                          ++++
   help: to link to the macro, add an exclamation mark
   |
   262 | /// - `build` will use [`build_assert!`](kernel::build_assert::build_assert!) mechanism to have
   |                                                                            +

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
