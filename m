Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6975329C70
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768629804; cv=none; b=Br7n7VeIxIYmuIqeWWHKF2dwu4Y45eXgRl5/lMw+U5ijHdAnyfBvFNUhesOHLsF1ZIdfR6gAkHhdu/O1hpuRsaCbU9bs3fxhyFvAXEKilyfsmI8C8O2cz7zzc2EjjzpL/xXZobTl0QG7C+3+3f6eF/i2A/WMbi4P/LJH0A4uHsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768629804; c=relaxed/simple;
	bh=TrmqV14ASTJdt+FxJnSBgrKZUfAFznjaco40qMOrmtk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cfA2uWixVTTsl3QsImkotdg89GTc9FOzNjUwQlXO+x7WqCnUq4D/GL+SYf7cCwTJTdS5lSMdcZH6Xp7SdRJNlxiTtebAhvhE9VNMPAbei2HNlX11kxUTOlj0e86qH7VXCuMoT2wc3vk2/IF36rS4kECG327gkREfjS99tOqY6as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK9t1qhd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK9t1qhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768629803; x=1800165803;
  h=date:from:to:cc:subject:message-id;
  bh=TrmqV14ASTJdt+FxJnSBgrKZUfAFznjaco40qMOrmtk=;
  b=KK9t1qhdnP9qmTfYWnRTMiSEtPpZ4zRAd1n+XPakzNDnKf8KV/d0WzKG
   x2lf+c59mnwAPzqdSE7QHsHZJGi5O7hxnbUCnFJCcm382hERrlkmAAQnh
   FQOnpee31UNCvRaIfsHEnx3LVpGPLCmTkhNNC7QI9SBazFnZbP14MOG6Q
   e4j00C6yTjYH/+4mCxUx4PIi4wPD4jwMkxkspTR7KjlOtK02+MM3DCErk
   Dw2emFDQw5fCT36vMmJQK9UCBv+X8LFEUXDsjN5UFkfue0MdqeMZS6CHs
   3gawbhWbbj7njxrIpAN86gYYYgMi0ij5OOWEfuB3X9ylCm/jNadjRDPzt
   A==;
X-CSE-ConnectionGUID: UYf4l3C+QhqScMgUTrujtg==
X-CSE-MsgGUID: beHO2JV2QI+QrBDbwv61Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="57489758"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="57489758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 22:03:22 -0800
X-CSE-ConnectionGUID: WExpMurlSiKa+znyeauOZw==
X-CSE-MsgGUID: 5Sg3+5MYTaiJcsTNMsRbNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="210430917"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2026 22:03:21 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgzP4-000000001vx-1qa7;
	Sat, 17 Jan 2026 06:03:18 +0000
Date: Sat, 17 Jan 2026 07:02:29 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 7/30] warning: unresolved link to `CListIter`
Message-ID: <202601170700.i21LELuM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   a056e0068d12763c5e899bb676bf64e3f59e2aff
commit: 9bc52b8bfe01af7348c041e5c368cead1e7d7c51 [7/30] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260117/202601170700.i21LELuM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170700.i21LELuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170700.i21LELuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `CListIter`
   --> rust/kernel/gpu/buddy.rs:474:26
   |
   474 | /// as references from [`CListIter`] during iteration over [`AllocatedBlocks`].
   |                          ^^^^^^^^^ no item named `CListIter` in scope
   |
   = help: to escape `[` and `]` characters, add '' before them like `[` or `]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
