Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA3246789
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 02:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757472818; cv=none; b=WwqCeSQ4cfCebJXEoGmaQIcCafPAEt5rmReVDjvJs6I4IhMLlWnkueYgFv9Ty3GL527ohTh5N2RU+nJ7weGvXrB6/VG7gOcTuH0Ycu4FSiHdMqjz1QF+9EkLzoVEDEPiYEyGn7AlpKld6aMf+Q9ftlkCfd7YJi+7SfFKu0pY+k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757472818; c=relaxed/simple;
	bh=kMIsLqDK9FOnmmjFO5taXsFh9ghfqR1+IA0DSQszchM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCrBgpd73+DLrmXaIHwEXBb1PybSjiwHh7Plm33UL4hGgj9yFrfZ5jJ5W4cFR/FRrvqY2R5hQeJaqqeF10EUnmglKaf8+idlBERcbK/C2NR0t318pKrKdWgm0RlYMMZcTWBWYfC/zTGf5d47ohl4B48ovMRAMELNwXH2uOpr4CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQn5tIPz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQn5tIPz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757472817; x=1789008817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMIsLqDK9FOnmmjFO5taXsFh9ghfqR1+IA0DSQszchM=;
  b=cQn5tIPzzSGJ4GkMk25d3mqlQLn6iktvh/eilpJX7/UO2FAMSjteKOO3
   f5kVhw9c+u4WpxRV4ENqUjQZRQYhkuDYDNr9gWQDj5g3ABTJVIQa99guZ
   ZYgU9dheE1uHs0B83h8kHFQ/XZycUYSfMDma1bRZT/RKyWq97eLQK7VFb
   TQL7MgRuc3/1Q/eEs/rRDPWl97eIsxtwja/KqawAubk9GeFyjB4kilknf
   TF0Nk700NEDHSnhxpG0cUDBqLIYhqiqCUdPvxT9GdTP8+6CfPzJUqIna/
   X5GYbDhKPg/o3KlkVC7oe4tHIsxnmEwbipH8x4Hc8uw/RmOrrMtiz5Ye+
   Q==;
X-CSE-ConnectionGUID: SXR073eCSfmhZIJZ4aHMsw==
X-CSE-MsgGUID: MlNZ4lSZRM6RXpt4QfarEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="71188322"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="71188322"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:53:36 -0700
X-CSE-ConnectionGUID: GHlnZeFATy2WzVw7qhqDRQ==
X-CSE-MsgGUID: c4Rg919BRNinReMqM3lubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="173711671"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 09 Sep 2025 19:53:35 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwAxh-00056d-0X;
	Wed, 10 Sep 2025 02:53:33 +0000
Date: Wed, 10 Sep 2025 04:53:11 +0200
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dev-bitstruct 23/23] warning: this `impl` can be derived
Message-ID: <202509100457.NgAt2qeI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dev-bitstruct
head:   6057391d7392c11cd5f8c33c41a5704e68504ab7
commit: 6057391d7392c11cd5f8c33c41a5704e68504ab7 [23/23] rust: Add KUNIT tests for bitfield
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250910/202509100457.NgAt2qeI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100457.NgAt2qeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100457.NgAt2qeI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this `impl` can be derived
   --> rust/kernel/bits/bitfield.rs:356:5
   |
   356 | /     impl Default for MemoryType {
   357 | |         fn default() -> Self {
   358 | |             MemoryType::Unmapped
   359 | |         }
   360 | |     }
   | |_____^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#derivable_impls
   = note: `-W clippy::derivable-impls` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::derivable_impls)]`
   help: replace the manual implementation with a derive attribute and mark the default variant
   |
   349 ~     #[derive(Default)]
   350 ~     enum MemoryType {
   351 ~         #[default]
   352 ~         Unmapped = 0,
   353 |         Normal = 1,
   ...
   357 |
   358 ~
   |
--
>> warning: this `impl` can be derived
   --> rust/kernel/bits/bitfield.rs:389:5
   |
   389 | /     impl Default for Priority {
   390 | |         fn default() -> Self {
   391 | |             Priority::Low
   392 | |         }
   393 | |     }
   | |_____^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#derivable_impls
   help: replace the manual implementation with a derive attribute and mark the default variant
   |
   382 ~     #[derive(Default)]
   383 ~     enum Priority {
   384 ~         #[default]
   385 ~         Low = 0,
   386 |         Medium = 1,
   ...
   390 |
   391 ~
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
