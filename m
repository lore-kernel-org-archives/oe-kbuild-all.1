Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1062F7F12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 May 2026 18:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907265; cv=none; b=bAmniNvtDRMUGapI1SxWbhdNwGE9WFPzXQTMeUG4MYP80yleyg4eivIMTSy1Ont5HjEw9m22FehuXKe3DzLgp42PZcnbfk3MdgyP2fJqGkOWLH5GVtCY8exfJz35fxwyBJ5L8qV/mmeOSmQtxqgQS8iVvGrM1esOy+zeTbTq9u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907265; c=relaxed/simple;
	bh=IZK+258R9sPEFAvkfa7m/BVJXZJBtPFQEYarYZhtMW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FoXOLzb9P78fdX9rvgOR8D2p8UTZMj1ZCIUwJ7DScD5iaNOE2qzXaBjRUBkuVMHBKVAl5WoaH6FkRGW4JwFyipGbcZQ5sa2GQkcOSagIfJD+SjMzlfTcGtg/ikeydmpu/5ofwCdU9u6U87GCqOlVbTOEb/qI4EZ5icZX3oWYosA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHbpZ7Eb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHbpZ7Eb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779907262; x=1811443262;
  h=date:from:to:cc:subject:message-id;
  bh=IZK+258R9sPEFAvkfa7m/BVJXZJBtPFQEYarYZhtMW8=;
  b=RHbpZ7Eb6xxPA6LKPoCZK3B7hhd6j41/pN088qHMd/DSXeN8i9zzne12
   so+ZaGIf9R4/rFjNdf/jqfJd9SsqK0X0WkH9L/BdRAFiFz2YXlM+tpx01
   cVLaYY7WInWxNQFtBbIgxZ2Ju+Hh2hhi/GGbHkvs5McVXE+ieqvu4YFh8
   PmTY2EouySoxDsbOr6fB+zitYbqQpYCLpGqJaUGPXWNSW43soTSNGIZUK
   kSGkMhy0V3F4RxdeHuhjaeqwVnZZWJE6QuDrKBeXxe/R9MQq9dBiV0V4f
   Ejj7sP0/yYFI+Q8s5zOTAYkKdXUokCKdcoAN2yxmMVPaqQRsdYJzU1xg4
   A==;
X-CSE-ConnectionGUID: a52oYMrHQVWxW91nQhxhbg==
X-CSE-MsgGUID: pPwAOtEOTNujpbdVXa5hSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92223061"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="92223061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 11:40:58 -0700
X-CSE-ConnectionGUID: ormZEm8sSVi0doCFF47OMg==
X-CSE-MsgGUID: EM1M9aMTTcayyws7/fJXCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="247270720"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 May 2026 11:40:57 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSJBW-0000000004z-3y5y;
	Wed, 27 May 2026 18:40:54 +0000
Date: Wed, 27 May 2026 20:40:20 +0200
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: warning: the `r @ _` pattern can be written as just `r`
Message-ID: <202605271749.S4bdqJ6r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/rust-sync-lock-Add-Lock-get_mut_pinned/20260527-053150
head:   55a99379b0d06a1414f52ea1959867bf3264ad76
commit: 55a99379b0d06a1414f52ea1959867bf3264ad76 rust: sync: Introduce LazyInit
date:   18 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260527/202605271749.S4bdqJ6r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605271749.S4bdqJ6r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605271749.S4bdqJ6r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `core::ops::Deref`
   --> rust/kernel/sync/lazy_init.rs:270:9
   |
   270 |     use core::ops::Deref;
   |         ^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default
--
>> warning: the `r @ _` pattern can be written as just `r`
   --> rust/kernel/sync/lazy_init.rs:309:13
   |
   309 |             r @ _ => panic!("Calling once.init() twice returned unexpected value: {r:?}"),
   |             ^^^^^ help: try: `r`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#redundant_pattern
   = note: `-W clippy::redundant-pattern` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::redundant_pattern)]`
--
>> warning: the `r @ _` pattern can be written as just `r`
   --> rust/kernel/sync/lazy_init.rs:336:13
   |
   336 |             r @ _ => panic!(
   |             ^^^^^ help: try: `r`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#redundant_pattern

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
