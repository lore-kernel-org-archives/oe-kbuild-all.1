Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06F23F8DE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 20:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951928; cv=none; b=uDdUhD4P08FWeTvvbUdz6fuPGHYNoKKmw8VgiG6l9x8cHXFFRE6Di04S/nuYTXZGhP8cqb3HaDpSFZqXUI9JUXPXlPQzCEHxDVZc7PzFde/4qV9xdQis7x+2ct3xjsDOX6FNxSvy5otAKIZRfhJb6YiqtSTjRIW7R/3366fwtlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951928; c=relaxed/simple;
	bh=CH//39un99O61truDpskGb68cb1NAu90d+q/yCd9lq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nivUY5x6H88P1jmeem2y39mAdvzD6DiqIoLfO4iZ2oIQiyXgbt2AcnRkM/voNN4FJh/unUo78jtO4OA34tfzIq9XSf2VU1qK7jucMucCb9NL0iR4jF0gQ5aw6g/PIOXgVLy+0sH8+Dy/qa61aQ80dFwxLhmKdwFEq5p0pJdcyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfkuWJHU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfkuWJHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773951926; x=1805487926;
  h=date:from:to:cc:subject:message-id;
  bh=CH//39un99O61truDpskGb68cb1NAu90d+q/yCd9lq0=;
  b=NfkuWJHUdex5OIXlS/X0DzKAa7M9rcLD1xs4cyPPyqkGadOI0WOCseqd
   pRIKcL1fr3C/7P5GKjw/nJb1+j1G5dwzcc+hOE3OgKQAcXzjSh64Y0Y3s
   kmq+VekamG8bahh6sCUtiBjBixJOzXwlANLPMn9PxBq6KLIOkEps8pzzu
   /7CiSoDR7qgL4zHT4odC7PqnCraYyH5/z3sWZF0RPOh0c5+Gb/P6LlqJq
   wzOHlIMuET/WZRI5RhNIc6CUG61OSVOaQlaFyIjlHQS295r+n7ajFCknC
   b6DGjg6YGSqEFARErbjmxNFUd9IPumQXT7RmZB37MkKfkIS5qusVk42XT
   A==;
X-CSE-ConnectionGUID: 2gSv9QMwRKWxqA+W0zcmWw==
X-CSE-MsgGUID: 3trWF6P6TPavWG+LRxqFhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75155765"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75155765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 13:25:25 -0700
X-CSE-ConnectionGUID: 7BAON17YSGa+Cx4DtZlgpw==
X-CSE-MsgGUID: 5+wmx5rvSPGaatlYJofusg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218492565"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2026 13:25:24 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Jvl-000000001d4-3HvK;
	Thu, 19 Mar 2026 20:25:21 +0000
Date: Fri, 20 Mar 2026 04:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] warning:
 function `binder_remove_trace_events` is never used
Message-ID: <202603200422.FY90Tsqw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   dfaa817f5dafd1f49886b6e26ce05e822ba2935c
commit: 29a81cabfac45853eb6d345552d4e9800a9553dd [3/3] ANDROID: binder: fix build error when CONFIG_EVENT_TRACING=n
config: arm64-randconfig-r113-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200422.FY90Tsqw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200422.FY90Tsqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200422.FY90Tsqw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: function `binder_remove_trace_events` is never used
   --> drivers/android/binder/rust_binder_main.rs:308:20
   |
   308 |                 fn binder_remove_trace_events(m: *mut bindings::module);
   |                    ^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
