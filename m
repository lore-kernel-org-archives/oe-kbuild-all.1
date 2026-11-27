Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800224;
	b=waxt2V9W4obsM+DR0bst0Q3EsLYheT0sz9WQ61Gfn/lxlogTvqg9duK4nEqjIHbAWEaA
	 Q7mJsoLEjE1Tv4J0Cf7B8q0UMdWqv8y4wcvp+Jom+ypxZf4ACnenZKzCtJPbTc5QAX9Dm
	 va26ZqeABXEDhLW6obj05HnOgIKQ8JUK+kx6xHp8tjag8ze+scZ7gDp4vJyjyA21O9ZZl
	 ZzEIQxpXxDZngJ7u/z4AUKPfHE0kbJBfwdqRqgQuL2rLqnFJ+U+/OdSJoibDWNTMRti2q
	 UQRpReeFDjnFKYftnRxLCs0tYjGyaB9rkDHDeZSr8966lSSHMn8ifhxy6/CTGNb9RmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800224;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o7fnpmNw+oGu7qJhW7VQ5SMPf9sxQgyx8/kjlmqaf6k=;
	b=iWqoWwTv6xoZQ5ybHSInUQPeXnkbT9WIP1S39OGoDp8SlZyomjvKkE4vtmj0JR8U4DnJ
	 Gf7uEC5Q4FmxVlqmFsXSmgcaj1XN/b3FG3JT7V40XeRmN1NwqZYRmLsKAmIhEfW4211pz
	 luxIZfPbRBJD3dziNDSBPzdqNEjaS3PpIWHzvI8QR9eGuW7+nyBaZDozZa8RW3Q4tRCbw
	 xzRNy7wS6PpbO1bpc0c3StAmkXF3gwq8wPh0NYBsOxVa6uGvUR39sIj1OxuPcHIqV+QdG
	 Xlcrf7EmGZmYmYElvHuia+SBA95C4SfnCLndtmx1J+dptWHQ6+4Ueqic4Ur5qh9tRPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYVlaFW3;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60372606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 17:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60372606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYVlaFW3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795800225; x=1827336225;
  h=date:from:to:cc:subject:message-id;
  bh=jaUKlnFYB1gMSi2R9mK2SRb9RepGlNMX3d6NyeLNmdU=;
  b=dYVlaFW3P0gQaGvrr6mNVokRpVw8xKjurZY14/3hW6jRMJJKd7UjerQi
   IT7oYr/QhXTeCqFuxIdqm7yTh6yAH9wcxcws2PqbH3P8X/Pqo9zWhZ4PU
   deJxmua/8rguqdPshCrAoH3vMRYmJCUy1wCstfTZ9nbqHYBEZXK3VkwMZ
   kLWajGYNAhoUzlBmXoS9G4F+ZbomdmINbhnJz3zgARvb/FPekFDRckQBQ
   scbn55Yta/7Um5+w/BDZrVR1HP0sjEvgVMUomGPEpxfeLizc1EyFLYPCM
   xkXrfV8iD9hPiNopDK/uIW9KZ9RA0DLOCfLxhMuAnYD0HFPxY1XNnMK2J
   Q==;
X-CSE-ConnectionGUID: J3BB11vSTAW9Y6PQtftsiQ==
X-CSE-MsgGUID: VnEtZgYyQHC8rb48gL0VZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4605774"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4605774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 09:23:44 -0800
X-CSE-ConnectionGUID: 9+D9DyCETX2QKxnFWNW45w==
X-CSE-MsgGUID: Cn4VycoXRbisnF9om8GD8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12223520"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 09:23:43 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWzfg-000000000GM-0yxd;
	Fri, 27 Nov 2026 17:23:40 +0000
Date: Fri, 27 Nov 2026 18:23:04 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] warning: constant
 `WARN_ON_FLAGS` is never used
Message-ID: <20261127181529.10ADLWB3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b38025ea3e69ef15148e9c5eb6973b879eb604e2
commit: 97882be093cae6e16d6d2a114a6422de92653a01 [1/1] UPSTREAM: rust: sync: add SRCU abstraction
config: arm64-randconfig-2000-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127181529.10ADLWB3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 578b1f2d6a9776b63cbb6b86f4cca6208d429f48)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127181529.10ADLWB3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127181529.10ADLWB3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/sorttable.c:452:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
   452 | static int long_size;
   |            ^
   1 warning generated.
>> warning: constant `WARN_ON_FLAGS` is never used
   --> rust/kernel/bug.rs:120:19
   |
   120 |               const WARN_ON_FLAGS: u32 = $crate::bug::bugflag_taint($crate::bindings::TAINT_WARN);
   |                     ^^^^^^^^^^^^^
   |
   ::: rust/kernel/sync/srcu.rs:106:12
   |
   106 |           if crate::warn_on!(
   |  ____________-
   107 | |             // SAFETY: By the type invariants, `self` contains a valid and pinned `struct srcu_struct`
   108 | |             // and `srcu_readers_active()` only checks the active reader count.
   109 | |             unsafe { bindings::srcu_readers_active(ptr) }
   110 | |         ) {
   | |_________- in this macro invocation
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
   = note: this warning originates in the macro `crate::warn_on` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
