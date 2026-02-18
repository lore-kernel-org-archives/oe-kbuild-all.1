Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1472634
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 01:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771378453; cv=none; b=BTerBQ/ZgHA4C27ooEk7LPn+FNq1m+a1sBVebnxcMDHRo4kJlT4KzBa1XJuXP5rRw0FyjWZvzPjUvx9CjomEmyQK8+9iqSEcBaM1/6Y8ZonAMaMA8FlDMv9Cn6AV0wNu9opwOdOuX7OulETE/F5SDyCWnNTDiH/cn+qg4SgMECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771378453; c=relaxed/simple;
	bh=DPA4HhADt6yZU38KTSXrvI2fqu4jTXfZepOuSUmvzeQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bE4tJxe70pEneKiBPr9Lwc7nCRIFZEdTk34rIluxZxfGLZ0EvrmZzmvAzYhbyAPz0aFX1GZ32i1SFVgcHBhkmR6kHpGT/sMfrguZtlnRRFHLt46POw9uvFzKbMaVEMCN0scHWsxwTNLEqdBOAz6EeAsPjIhKIHzdigLeH6mr4iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXSjUKNm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXSjUKNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771378452; x=1802914452;
  h=date:from:to:cc:subject:message-id;
  bh=DPA4HhADt6yZU38KTSXrvI2fqu4jTXfZepOuSUmvzeQ=;
  b=jXSjUKNm/CierQBKFHnu1xNSpspBf5qK+fIV3kQfr8QZSaQvRBanx5xu
   JXOiRXngq18Prd2KD7Dcgz349JMP5ZAI96QcRtWwkMirqEVgf515aDnMk
   i1dcMT8W/iNlaVk5FYIRovxHrxR2tmTbPOR0PnQiUo/z845pY/UbX7EC6
   z29LQkg8Qw+Fpyz5Qg5yLn4Bwnp6iW4G5gvBMzyHtA74PD5WYBY+4GX56
   NTXZ4Jx+nfr4yfh3ijNhYQibITSWUwIkxRKDJEMGnlUX6Lje3mKREHxP8
   7wrd9ZQnTgWAeejy4IvnNh2DLGjhQ/BfEwXEewQsU1OEVsia1+8gX8bzt
   w==;
X-CSE-ConnectionGUID: qRCA9OydSt2BmT+RsiCxzQ==
X-CSE-MsgGUID: zSZGksgXSnqenuUF7G0DIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72549759"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72549759"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:34:11 -0800
X-CSE-ConnectionGUID: 1S8xfctQTMypO6wreG8Fvg==
X-CSE-MsgGUID: RCob6hYnS5q/i6fSsLJiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="244643807"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2026 17:34:10 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsWS7-000000003Mf-22yh;
	Wed, 18 Feb 2026 01:34:07 +0000
Date: Wed, 18 Feb 2026 02:33:14 +0100
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 3/29] warning: public documentation for
 `AllocatedBlocks` links to private item `GpuBuddyInner`
Message-ID: <202602180248.Zzlc3pVL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   37b89e17139395c3a1a0871785230f02e8c65622
commit: 75cbff2364f73f762219202a501e1777c4a6b77f [3/29] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260218/202602180248.Zzlc3pVL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180248.Zzlc3pVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180248.Zzlc3pVL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: public documentation for `AllocatedBlocks` links to private item `GpuBuddyInner`
   --> rust/kernel/gpu/buddy.rs:405:1
   |
   405 | / /// Allocated blocks from the buddy allocator with automatic cleanup.
   406 | | ///
   407 | | /// This structure owns a list of allocated blocks and ensures they are
   408 | | /// automatically freed when dropped. Use `iter()` to iterate over all
   ...   |
   413 | | /// - `list` is an initialized, valid list head containing allocated blocks.
   414 | | /// - `buddy` references a valid [`GpuBuddyInner`].
   | |___________________________________________________^
   |
   = note: the link appears in this line:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
