Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E19624336D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 16:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945401; cv=none; b=BYGDWAWBHgXwXfnV7bpFTEOu9cJ+Ygeki7asU3/1WJXqTwnnA/lXyBY5xDtwc1v3l39U4b5bIInnPi/nZuCvkvScUNldFVXYzS0eVDn1VQwequPSkO0skRsn3jNUs5uhhKdSUhEn6IseY4RH1W+0sdBo5MkYLy3blJUcHvX6/t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945401; c=relaxed/simple;
	bh=YX21x+Y+iJZzixxItrO1Fj7HaftJxWWaZ25QiCdNp5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGUumEo2rQpdJxWBlAGqDByKWU64P9xlI/yUh7+gk9r7CcFCNfbRK8v/ps4gy74xq018SWjXMgnwdNLrWy4A2YXcnd5vCjkBLR2MMe3gY7BUj/jGLWpaLOKGzJsmQs8Wb2iSHjSKaTLyNMGd5/zflna+u3MTIIW7RDDiJPCJIPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNUjUR9j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNUjUR9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745945400; x=1777481400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YX21x+Y+iJZzixxItrO1Fj7HaftJxWWaZ25QiCdNp5A=;
  b=gNUjUR9jGFmd0nRlVnyw62zFF4G9bcX+RPEvQqf7ntXka7OtSWicS2i8
   guPXU8gt97P9s2jLPZmTC1RbA8t3PHLGmzMs2FoZIXWi22+jBirk3U8xf
   1QQw5W3l1ECcSfGo3vNwNgNXTwxEqWSD3zKC8aX0WK/VHiCibYXsBOne5
   RRz2UaJhYplY4phSUWMViYP5AQ+xnXM3UDGy4IoqD/0boG4Dms9ySZVJi
   cfORge23nBpirJbZ0DWLagAmh3cvIWhDgSQ/h0M+JibLYyrVGvYwa8dvw
   vCJ9rcXASDbLSmRBxk8yrNffLy1umu5tGJ/wN1vZbJTW884FiQlNoYR91
   A==;
X-CSE-ConnectionGUID: q5qBfjoeSQeO7WnbUKdX7A==
X-CSE-MsgGUID: Eby76kPESZeCqMFifNkAkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46826054"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="46826054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:49:59 -0700
X-CSE-ConnectionGUID: 569xYmzzRuO/IeGaQWk7XQ==
X-CSE-MsgGUID: q+q0kNaMSPioKwtZpIYMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134388333"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 09:49:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9o9b-0000yr-2w;
	Tue, 29 Apr 2025 16:49:55 +0000
Date: Wed, 30 Apr 2025 00:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Catatomik <cata@catadev.org>
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1161 136/195] warning: casting raw pointers to the same
 type and constness is unnecessary (`*const u8` -> `*const u8`)
Message-ID: <202504300039.jkrd9kyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1161
head:   9f5fa1ba161d636d346f72ba808ce20ee4a3fa70
commit: 283ec23ee806ada848fe131fdd15445969f97094 [136/195] feat: set eth hw addr
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250430/202504300039.jkrd9kyJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300039.jkrd9kyJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300039.jkrd9kyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting raw pointers to the same type and constness is unnecessary (`*const u8` -> `*const u8`)
   --> rust/kernel/net/dev.rs:293:54
   |
   293 |         unsafe { bindings::eth_hw_addr_set(self.ptr, address.as_ptr() as *const u8) }
   |                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `address.as_ptr()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
