Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360C984A35
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 02:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770429656; cv=none; b=JXA/K7biR7xkzKPwkwnXhwj7CvQyX57Ra42fzKEZ2vuwtVZU5UIJXtnTXNeI70TsWwgiwIiZkw5XweJwrRYC4B1e+e1cdhO+qEd4NRTg7PTvBxWm5RO937UJY2koKq2fYTRIIFYG0j5sRHiafPZRQIX0fmgTtvgFkPe2GzM5prE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770429656; c=relaxed/simple;
	bh=yVZfsKnl8ez1pz5iLt9Kaz8xjpsxj92OP2tI/gt8l7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rt9y2P7Du0xs3/n4TV7kiTMDRYHixIaAPe3j2cdIbZ/ZqseAOIEEjTsjk5Vmk50w4ZL1ok45FvlvdQvhz+snR57g4ywQrFBPScU2ltzHkXc5KnKDkmHcE4HqKhuQB1bznW5ixwJh8dqUMiEcXaMTegtBI5vZldccrEwX4Sg8xgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6fbdOzq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6fbdOzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770429656; x=1801965656;
  h=date:from:to:cc:subject:message-id;
  bh=yVZfsKnl8ez1pz5iLt9Kaz8xjpsxj92OP2tI/gt8l7U=;
  b=R6fbdOzqoS4uOnouLIctqf/s0XrrJyizWodRWT2AbKIocxGYUYZXqdae
   E/srPNbeZy6Gppj1KbjpB1IXc+ZhnCUDyC+HUhX+bxtqd3T7dTL4kTzsq
   PAnOiWEPUukkyvwp6isC6c+TGU/tQno5Tc9Z5U//cljbQYM1vIocv2v3G
   3RTrYehKeBM05Wl/5CjAXdxobbsQJ0Yauwxeb0vH5RSIiPmpnv+NrKN8d
   iT+13kqgjwXB1PWgKiJgzK+hdexv0CGyL6DQre/tqROT1BfmBjx9yfwfF
   GyqsLdkHbSTaLdS3B0UA+VknH5/TSSNnR1Zm7iIK7ONXjb2kFUwCRUUeQ
   A==;
X-CSE-ConnectionGUID: zwvLUsK2QWulaJ5LxN8Gnw==
X-CSE-MsgGUID: 0y7Tii+pQ36GE5faKO9cDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="89058242"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="89058242"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 18:00:55 -0800
X-CSE-ConnectionGUID: /sMApUGOQ0ST6w0kHvoLYQ==
X-CSE-MsgGUID: z0RgjJSNTTiz1Tdg8sNETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210787935"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2026 18:00:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voXcy-000000004mJ-1h05;
	Sat, 07 Feb 2026 02:00:52 +0000
Date: Sat, 07 Feb 2026 03:00:22 +0100
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: error[E0432]: unresolved import `kernel::mm::sheaf`
Message-ID: <202602070259.iGZXPJF4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/rust-xarray-minor-formatting-fixes/20260207-051500
head:   0e687be84c0b65e132df77e63e676a62b0530c90
commit: 0e687be84c0b65e132df77e63e676a62b0530c90 rust: xarray: add preload API
date:   5 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260207/202602070259.iGZXPJF4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070259.iGZXPJF4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070259.iGZXPJF4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::mm::sheaf`
   --> rust/kernel/xarray.rs:33:9
   |
   33 |     mm::sheaf::{
   |         ^^^^^ could not find `sheaf` in `mm`
   |
   note: found an item that was configured out
   --> rust/kernel/mm.rs:22:9
   |
   22 | pub mod sheaf;
   |         ^^^^^
   note: the item is gated here
   --> rust/kernel/mm.rs:21:1
   |
   21 | #[cfg(not(any(CONFIG_SLUB_TINY, CONFIG_SLUB_DEBUG)))]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0433]: failed to resolve: could not find `sheaf` in `mm`
   --> rust/kernel/xarray.rs:75:18
   |
   75 | impl kernel::mm::sheaf::KMemCacheInit<XArrayNode> for XArrayNode {
   |                  ^^^^^ could not find `sheaf` in `mm`
   |
   note: found an item that was configured out
   --> rust/kernel/mm.rs:22:9
   |
   22 | pub mod sheaf;
   |         ^^^^^
   note: the item is gated here
   --> rust/kernel/mm.rs:21:1
   |
   21 | #[cfg(not(any(CONFIG_SLUB_TINY, CONFIG_SLUB_DEBUG)))]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
