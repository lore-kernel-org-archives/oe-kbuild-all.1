Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0610123BCE3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358441; cv=none; b=UH45dDoGjDBSCb7J8nAypzhECJT2PkOPDqatBKkRpy2H7VRo5A464sVrzqfls/uhRuy8vt9iWhdpYGiGe8RtHERlHw2JnnhvdwX4IDrIutD5jFSpn/Y2pm8vTNc093sufGNkqqU4MLY7QZF3bCT4ikes2OYvJQGI0qTPGiHR1ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358441; c=relaxed/simple;
	bh=tIO5ex0j+Pyr+Z4CQQOwMWUZFlaougdUfX/tbF7AQio=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTu12YEaCdTz+nyGLes67giukZJtC151BoFKS3nO01RG/s5Xq/8Do/nHefuu96oUlSUu+Cwplwoq816KnRUEIsN7NEijWT/M1HiNG70MTxjDr22Vs5tVhtnLAp32ZsxK8qkpNlHsA1Ky+KtqonYjlJ/oEtv07YJOA4Yn2vv0D2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie2zK1md; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie2zK1md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358440; x=1791894440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tIO5ex0j+Pyr+Z4CQQOwMWUZFlaougdUfX/tbF7AQio=;
  b=ie2zK1md+SvqQ0/E/ahowMRLXd4WRcK/j9ymTRP3pPhmtIbw9k0FREcE
   Puy6RoC+pSFMG7Hza7UlDSFQI+/Rt/Cy2CBBEWoi+eUmeTgEVDrPokzjT
   t6QTZnZFL8cp1j9AjG2UzBSNNodGopqlnncZdoqaExJ4i2WVnwxrnxF72
   wqiOTzf31Z3acPnB8pO6HAzs3VMHYze27QQyhJqruDzJ38LZ+O/mROQyx
   69A8D8gzqFtFScpHbUnSmGdFjOwCBRPy75Bp2MqK9b4IeZ7S/nSRIxfed
   4gFKxObdSccq/aQmo0LlJCIyhu5zUp2mHW/4fsD51rHA+6svnJu3vtbxD
   A==;
X-CSE-ConnectionGUID: R9R5q17BRuOUo1BPzr8e9g==
X-CSE-MsgGUID: 5zWcbFWERqyc2epfK8fgnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62528673"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62528673"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:19 -0700
X-CSE-ConnectionGUID: o9vsPEjmRwm01ZK7WSsCjA==
X-CSE-MsgGUID: ymKHQC+aS/OUyQO1pzWCyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186001670"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008s9-1oDG;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:50 +0200
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 58/75] warning: using `as _` conversion
Message-ID: <202510122042.sh8wTiUn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   8b6709186beeb5586868e91c84775efe3194d98d
commit: 7c0959a07d1902bd77e8aa037d6326cc4f5f8461 [58/75] fixup! rust: Add Ownable/Owned types
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251012/202510122042.sh8wTiUn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510122042.sh8wTiUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510122042.sh8wTiUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: using `as _` conversion
   --> rust/kernel/io/mem.rs:296:39
   |
   296 |     pub const WB: MemFlags = MemFlags(bindings::MEMREMAP_WB as _);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^^-
   |                                                                |
   |                                                                help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
   = note: requested on the command line with `-W clippy::as-underscore`
--
>> warning: using `as _` conversion
   --> rust/kernel/io/mem.rs:302:39
   |
   302 |     pub const WT: MemFlags = MemFlags(bindings::MEMREMAP_WT as _);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^^-
   |                                                                |
   |                                                                help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: using `as _` conversion
   --> rust/kernel/io/mem.rs:307:39
   |
   307 |     pub const WC: MemFlags = MemFlags(bindings::MEMREMAP_WC as _);
   |                                       ^^^^^^^^^^^^^^^^^^^^^^^^^-
   |                                                                |
   |                                                                help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: using `as _` conversion
   --> rust/kernel/io.rs:269:17
   |
   269 |                 buffer.len() as _,
   |                 ^^^^^^^^^^^^^^^^-
   |                                 |
   |                                 help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: using `as _` conversion
   --> rust/kernel/io.rs:290:17
   |
   290 |                 buffer.len() as _,
   |                 ^^^^^^^^^^^^^^^^-
   |                                 |
   |                                 help: consider giving the type explicitly: `usize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
--
>> warning: using `as _` conversion
   --> rust/kernel/xarray.rs:244:28
   |
   244 |         unsafe { T::borrow(self.ptr.as_ptr() as _) }
   |                            ^^^^^^^^^^^^^^^^^^^^^-
   |                                                 |
   |                                                 help: consider giving the type explicitly: `*mut ffi::c_void`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
