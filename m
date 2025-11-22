Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AD286A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 00:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763769904; cv=none; b=Qms2Qasoey4/v6d2qC9PtxMhr8T8IR3Qjx3JW8fqkSB6LleUD3PonoOVUSUibm0vx6q95wpBY9WB6FPLOlgUproQxc8TG7QGPb0zW23ka79PlBF/ZmydcgVTm4g0lwEhnFHdeifgqpEVooTCyn95RdF1ZvqYISrBqHILhsfMBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763769904; c=relaxed/simple;
	bh=qkYI/9mDMjyEzWxkgWIHA9KJIsZsWa2BGC2KWew/rf4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MhfpF7mETh9t39PKlRUNXMqskED5/u19W3y2aPmTIZFAa9mujsdIIdVJmHlD+UCVH8J0RSOsKZIGPU4xHJMsbUjLGEMffhWqrAuoCji3pGHGisJwhVRpUk7k64TTM53ZHk7pZspRM5h6eESAztEiu1wUgwvrUkYxT0uUmoK6a0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEmTC2yf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEmTC2yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763769902; x=1795305902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkYI/9mDMjyEzWxkgWIHA9KJIsZsWa2BGC2KWew/rf4=;
  b=mEmTC2yfLyc8tHWAXiV+FMrbF4buXrQWsItemqsLQNC11a3xthfNSx5U
   uNy+Fxhmx4L+6EiB30k6jfX7h6QcW20mv92i+wEqsjWTFD9SyKHO8TEjJ
   lTm6Xzk/ATaS9HT8CSqKSyUdbl9eP0KX9lLhQtRvsepmtvsdoXgwOniNA
   AmRmL6Mgg7FFG/nEVy3e9XFfjusVpUe+LRA6Z2fEB/QIXQBL75xxbSpPf
   AQrzhMwRivQpZtboPexlIZCmMZexT0IIrAGfmxFJmPSE55SdOtuunGrfg
   tTFgx0LbQZmMGA/AzmkO1x9zZCMvlco4gK1leNYlnFd0eVwI7W9fU1qR4
   w==;
X-CSE-ConnectionGUID: Rqc0oCQgQO+AEUgAAei8OQ==
X-CSE-MsgGUID: dh/B1+BXR7qs+OBqfGnwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76197286"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="76197286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:05:00 -0800
X-CSE-ConnectionGUID: Hej3IMrsTAKHHavQO3IJnA==
X-CSE-MsgGUID: WnAKFpXHSP+qNGqh+xYRHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="215172103"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2025 16:04:59 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMb7Y-0006zd-3B;
	Sat, 22 Nov 2025 00:04:57 +0000
Date: Sat, 22 Nov 2025 08:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] error[E0609]: no field `policy`
 on type `bindings::task_struct`
Message-ID: <202511220721.wDutpXlD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c1902e025e9f61d6df517052ea698b429b1f6589
commit: c0d8982f50bc5d140c5e2fb03d88832e7204ab92 [1/1] ANDROID: rust: add Task methods for priority inheritance
config: arm64-randconfig-004-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220721.wDutpXlD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220721.wDutpXlD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511220721.wDutpXlD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `policy` on type `bindings::task_struct`
   --> rust/kernel/task.rs:268:54
   |
   268 |         unsafe { core::ptr::addr_of!((*self.0.get()).policy).read_volatile() }
   |                                                      ^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `normal_prio` on type `bindings::task_struct`
   --> rust/kernel/task.rs:278:54
   |
   278 |         unsafe { core::ptr::addr_of!((*self.0.get()).normal_prio).read_volatile() }
   |                                                      ^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
