Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1755FB8A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 02:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726194757; cv=none; b=n7y6A/i/4Y4hOMbxPp1jjtffXcwpY0d6EMFHyWgA+/EW7jA9dZ51+W9mwDJHVFIs9SnsP2ByTaTTLrhxzrThYxAeh8AWODxK9Qx0HIdAbPiF+uRl7cLWTw9uOJ2BA7jf+VImNgBKCgxSwNcUDtJcL+gD4pdKAVfP8wBHDCTh9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726194757; c=relaxed/simple;
	bh=0NNGanjMMdj04IUVrkKNSWX4RtzBLYvA2Xj5EgB1rHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYyn/6SBXoPw5BIbpxBoIMQpjK+j5zG7BSsgcMSyzNtnMc14MeLdeG951N+FYZOz0Wx197QRFQEeOu3kwOhwDc0uBzzHYCRdXvw+IuZidwmorZQJOePfji0XgGrFLk3UBLPtm1voJwIZvTvBuPSCNY24ufGBsCd1wFiuy51DIeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlvHvHcC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlvHvHcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726194756; x=1757730756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NNGanjMMdj04IUVrkKNSWX4RtzBLYvA2Xj5EgB1rHw=;
  b=SlvHvHcCBnn7Iw2GFwGLqkwHU5y3i+vcwXkKclDON3vXTOkxbJZf1Oam
   4s8JFXF0vB4aqFwledVXGrJsrCTlHvncF49m6HjrtGN4zqK6Hgi7R6+1K
   s+1JgoVIjcDWHUwERbX8Qr9NPHL4mRr/FQyod4YN06ONuBT2N0EVpZX26
   Hd1r5t0Jtvb0fbod86Cn6RiSgEt8BZJTpd5GTag04d5V9j77jbemNLPX+
   Yh+NNkpZCy6I/31td1Il1s9hhqeHPwiNK9TqORAhW/UhKlwM4BC06SxjF
   6Rjb46FflxJbGUhC8PmM4aEhFeiS8vglC3C5pzfK1YblJUJZGL1byugX/
   Q==;
X-CSE-ConnectionGUID: BC25l1ShTp2mr4+4VEPrSw==
X-CSE-MsgGUID: DmFZMZ8UTuaHQ0ASp0BI6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="27997811"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="27997811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 19:32:33 -0700
X-CSE-ConnectionGUID: e9CZwZWFSCy+WUHLZqoc5w==
X-CSE-MsgGUID: 2GtFDRv4SeGUW8yrPG31dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; 
   d="scan'208";a="68211943"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Sep 2024 19:32:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sow6m-0005vK-1s;
	Fri, 13 Sep 2024 02:32:28 +0000
Date: Fri, 13 Sep 2024 10:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip 2890/2963] warning: unresolved link to
 `RawDeviceId::to_rawid`
Message-ID: <202409131020.5gpiD8TA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   3e835461bf36824d84f098a1c534320be0c45d35
commit: 3d0f470e38db1811b62840d17fa3ea69f6747247 [2890/2963] Revert "rust: str: implement `Display` and `Debug` for `BStr`"
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240913/202409131020.5gpiD8TA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131020.5gpiD8TA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131020.5gpiD8TA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `RawDeviceId::to_rawid`
   --> rust/kernel/driver.rs:131:11
   |
   131 | ///   - [`RawDeviceId::to_rawid`] stores `offset` in the context/data field of the raw device id so
   |           ^^^^^^^^^^^^^^^^^^^^^ the trait `RawDeviceId` has no associated item named `to_rawid`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `module::module`
   --> rust/kernel/module_param.rs:389:57
   |
   389 |     /// This function is only meant to be used in the [`module::module`] macro.
   |                                                         ^^^^^^^^^^^^^^ no item named `module` in scope
--
>> warning: unclosed HTML tag `t`
   --> rust/kernel/time.rs:129:58
   |
   129 |     /// Returns the time elapsed since an earlier Instant<t>, or
   |                                                          ^^^
   |
   = note: `#[warn(rustdoc::invalid_html_tags)]` on by default
   help: try marking as source code
   |
   129 |     /// Returns the time elapsed since an earlier `Instant<t>`, or
   |                                                   +          +
--
>> warning: unclosed HTML tag `T`
   --> rust/kernel/time.rs:146:52
   |
   146 |     /// Returns the time elapsed since this Instant<T>.
   |                                                    ^^^
   |
   help: try marking as source code
   |
   146 |     /// Returns the time elapsed since this `Instant<T>`.
   |                                             +          +

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
