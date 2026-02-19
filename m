Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF53019A4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 23:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771542287; cv=none; b=atWv65JIVRLZQkzrlJrqdLnSXAZOa1GHVXxYp81AZ2s0GoUXMDYfp5artcNRme9MQ95D7pPGhRgfiKVoXRgMIgQw5PiK3TvwbuHupyoIupEqwbbZVCBaeinqBO1UoUGzcrmXY4SsGxJKvpIkwJD4wrjsYfn3L+wPBFDsL1J/iPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771542287; c=relaxed/simple;
	bh=JVtMmS+9n71XzrdMK4vElhg1WfZqs+iQW6ZhCPpyn88=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kRwFrx+l4fr/OJQ9+qJwUa5c0Bph/t8kwCtu4prG4febcj7qs5AFjmEHpHGo9m4S2B5vcGvWw5shUwquypXIQWVlp9gDeh549ShSqbQ1q5D8TAXq5tgIyrsyMCVuZrxEY1P+R2aGDBbEDqy99QKISWlG8/zM1crwlIhd6QaL6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRE+bEBH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRE+bEBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771542286; x=1803078286;
  h=date:from:to:cc:subject:message-id;
  bh=JVtMmS+9n71XzrdMK4vElhg1WfZqs+iQW6ZhCPpyn88=;
  b=bRE+bEBHni9TgYBdQQoBjgL7mahdekI+gMDwP/0DCbt/fkgI+gbHsUKH
   NlL16K/Zw/m/oJyVE8/6W6fVfL4w9+kNhGo71ei230nYDBQMZn8DyPy/1
   QHe4sBrLTEpcsQ42feKnXw2ODfAxNzJOQw57BBR9p1T5KWua8wsiZNmyx
   WwbXfu1BTW7M9Rbu3cvrgg5pvhQ2gNCQ9qCv4J/PE15UOJh785eY6bOf4
   buDPZ3CfwQZCy5kjXUSbmpz/uFK8x+vxsDiLH1DqtCAqd4FxGuhGTvkAj
   ihoQJKWlyUdWtwtUHgd7CQDyCJDWc+FQqToW8E5Egb1lfHM0Q6d9NzU2S
   A==;
X-CSE-ConnectionGUID: 7Z1Agn41QDeOxYZ+4AFATA==
X-CSE-MsgGUID: NhWgdpKkRW6T0SU+oUUZPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="71847952"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="71847952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 15:04:45 -0800
X-CSE-ConnectionGUID: nIGB2utGQHuGOcuemps8bQ==
X-CSE-MsgGUID: iuwceRHOR3SDjYs0E2NlSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="219196378"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 19 Feb 2026 15:04:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtD4c-00000000453-0ajx;
	Thu, 19 Feb 2026 23:04:42 +0000
Date: Fri, 20 Feb 2026 00:04:19 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 6/31] error[E0133]: access to union field is
 unsafe and requires unsafe block
Message-ID: <202602200049.OkoRX24n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   d44aeb89db2e47449220a4721f5e89202bd7b128
commit: 6e05d1c7b5efa36e6e1c8581e1645c00eb6ab0f9 [6/31] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260220/202602200049.OkoRX24n-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200049.OkoRX24n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200049.OkoRX24n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0133]: access to union field is unsafe and requires unsafe block
   --> rust/kernel/ffi/clist.rs:331:28
   |
   331 |               |p| &raw const (*p).$($field).+;
   |                              ^^^^^^^^^^^^^ access to union field
   |
   ::: rust/kernel/gpu/buddy.rs:433:21
   |
   433 |           let clist = clist_create!(unsafe {
   |  _____________________-
   434 | |             self.list.as_raw(),
   435 | |             Block,
   436 | |             bindings::gpu_buddy_block,
   437 | |             __bindgen_anon_1.link
   438 | |         });
   | |__________- in this macro invocation
   |
   = note: the field may not be properly initialized: using uninitialized data will cause undefined behavior
   = note: this error originates in the macro `clist_create` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0133]: dereference of raw pointer is unsafe and requires unsafe block
   --> rust/kernel/ffi/clist.rs:331:28
   |
   331 |               |p| &raw const (*p).$($field).+;
   |                              ^^^^ dereference of raw pointer
   |
   ::: rust/kernel/gpu/buddy.rs:433:21
   |
   433 |           let clist = clist_create!(unsafe {
   |  _____________________-
   434 | |             self.list.as_raw(),
   435 | |             Block,
   436 | |             bindings::gpu_buddy_block,
   437 | |             __bindgen_anon_1.link
   438 | |         });
   | |__________- in this macro invocation
   |
   = note: raw pointers may be null, dangling or unaligned; they can violate aliasing rules and cause data races: all of these are undefined behavior
   = note: this error originates in the macro `clist_create` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
