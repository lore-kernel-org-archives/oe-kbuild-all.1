Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D29219FC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772682408; cv=none; b=SFM75JnXhKnnlipmtyQFWdZ8bbUanPImgHd3gQKDgofi14ghPfOIdJ0chNTIf2WzzPiZAbVyhs2l3FQAg5lI5gbcoVwDowlXsjQSW370h+QZZZqXtFNm6kTH+5trp0pKRS3ddVKjD1kr7wX4ZsDVsBeogFf3QyI8ko7QD7N47wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772682408; c=relaxed/simple;
	bh=osXjFNDpGk3O63VpiQNPQ9qXsDfM9cPDPVgDLNkwgTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vp8JpbW3Nlk3GSWN5njDZcnbwx4zHWM+LQaH65xQu92bRnGEb9Tu6017q4tgflB8qMJEfgSN09LzKQDKgixlXrcUO2Y2pAwKRZDtNS7Nkk871qjVEDZwtWDdRl4K8fG2UTh8sXnBYwmlxu8NGcBVyksY6ApE/zpyXM4Ii0+QPuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwYSbiSl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwYSbiSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772682406; x=1804218406;
  h=date:from:to:cc:subject:message-id;
  bh=osXjFNDpGk3O63VpiQNPQ9qXsDfM9cPDPVgDLNkwgTM=;
  b=fwYSbiSldOUz7WgxJ5iUMJ97QE/49gpWp/Uo+JzW7c6pfdFBnCN94+0c
   6j5OhLqPqQz4o88DAum5mX6SMsRT/u0gWRU/Ax/ljvy2SA8c4D1F2vfCw
   pQJnbpFsfrr2y2Rc9UDYMS9qI3Ln35FkjPv3fzUhoLAeDLgjnJJ2MpME2
   nWKrK/vJNRXtSj81g1CWeI9P9Qu/IdwK7G1LRajm4VprQ4SgnkEpHiFWb
   qr74yNCsZ72Isa2YTprTQSEU1EZG4/X4JKmZ104fa39ML1gCuUId9+vRQ
   mCyvQEhNpH5m5mZubdCVRYT5L3S1a7Dl/A7u3WXt7OrnLsul6a4y5KzEh
   w==;
X-CSE-ConnectionGUID: Y4PdOaExTzy+pMH2uXohjA==
X-CSE-MsgGUID: R5npFq3cQtGzmwRrK6OelA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91150910"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91150910"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:46:45 -0800
X-CSE-ConnectionGUID: s1yPDXGlQFmZFicI9TvD6w==
X-CSE-MsgGUID: 4YWxgxz1QF2oLqa3iAE8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218496529"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 19:46:44 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzfa-000000001wP-1H9f;
	Thu, 05 Mar 2026 03:46:38 +0000
Date: Thu, 05 Mar 2026 04:46:34 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 464/467] error[E0425]: cannot find value
 `seq_read` in crate `bindings`
Message-ID: <202603050416.XBQFEyKt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 1248b180312701c655e99defd535922cb603adc5 [464/467] seq_file: remove seq_read()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260305/202603050416.XBQFEyKt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050416.XBQFEyKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050416.XBQFEyKt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `seq_read` in crate `bindings`
   --> rust/kernel/debugfs/file_ops.rs:134:34
   |
   134   |             read: Some(bindings::seq_read),
   |                                  ^^^^^^^^ help: a function with a similar name exists: `ec_read`
   |
   ::: rust/bindings/bindings_generated.rs:61420:5
   |
   61420 |     pub fn ec_read(addr: u8_, val: *mut u8_) -> ffi::c_int;
   |     ------------------------------------------------------- similarly named function `ec_read` defined here
--
>> error[E0425]: cannot find value `seq_read` in crate `bindings`
   --> rust/kernel/debugfs/file_ops.rs:186:34
   |
   186   |             read: Some(bindings::seq_read),
   |                                  ^^^^^^^^ help: a function with a similar name exists: `ec_read`
   |
   ::: rust/bindings/bindings_generated.rs:61420:5
   |
   61420 |     pub fn ec_read(addr: u8_, val: *mut u8_) -> ffi::c_int;
   |     ------------------------------------------------------- similarly named function `ec_read` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
