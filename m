Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C77346A05
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 05:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366947; cv=none; b=QwoJkxv/+yzG5gueMLPls1wkxvYM/DDaf5Qt+VYZZGR0FXEoJ1VgdV+tcZHg54fs11431Wkg0fwO2pUeGaljrNCdHw4ZhKmVAfTT+q8DGcqEDwedOZ63uQIHIlbBQd4K1RrHT+GYiUAuL3DRP6vbBdrpeqOjOoewe63ctZ3snaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366947; c=relaxed/simple;
	bh=13un0cqQfCV9qxXodgnzx79IyoEFSqdg0jZPIF0T75c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mTkvhnQKwAKYYFiOeOhDH/RYo0i+QahCGO6JmxoyiEtP/if0pX2Jti1H4PMjTMb0NJ2jWM9MvGd94gbCCR7gbJScFdw9Zfhxmh0rhwpv7xSsWAQ3bbutOMQUn5Jqf1liwFKJ8IsWjao6fNJLzh651bMISL2XfoBQR2xwBU6gDpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1c1uzmx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1c1uzmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768366938; x=1799902938;
  h=date:from:to:cc:subject:message-id;
  bh=13un0cqQfCV9qxXodgnzx79IyoEFSqdg0jZPIF0T75c=;
  b=S1c1uzmx1PAAohlR8vokcZfb3khEnOaICCVxMXU9nQ18wBOykrl1wmdY
   gdAY0hf0BCMMFbVfSGtnPWKUt549X3fmuL2ZAAiYZ1UHZ0TlU6GjQ8JsY
   c1QC8UKwJzje10WkDLYlmxA6sFlRM9cAivuT+K+kHk3sPNYt7KkO2J8Xy
   wQ8Xce5pihSE1Nigv019GrCIYI1v7SVBcboVBYY1wub+VeqeJuzX0XIvt
   0UlQoyCnNyzJXGu4IHfb/fi/PuD4iEUwwvFaB5fyGANLtD68U4JQEHWTw
   M60i0ewADH4bF9FFkJ7tQGz6RooLpHSAXnS1BKtqrIulWE84KLIrbzMkM
   A==;
X-CSE-ConnectionGUID: CWE0YAAfSfSWCk2bLnhY5Q==
X-CSE-MsgGUID: oyavLjs4SzaiajNoscBfPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="80771778"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="80771778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:02:12 -0800
X-CSE-ConnectionGUID: lZIGwCnERS+FXfgNQHjcJw==
X-CSE-MsgGUID: ZYBEzt5PROuAy84M+QnQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="208735328"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 21:02:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vft1E-00000000FoY-20wd;
	Wed, 14 Jan 2026 05:02:08 +0000
Date: Wed, 14 Jan 2026 13:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] error[E0425]: cannot
 find value `compat_ptr_ioctl` in crate `bindings`
Message-ID: <202601141222.ediygIJb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   32d3f32fbc53db0e7d79a02923d9e2c455dbfb8d
commit: c7f0753ca253525d4ce8e6db45c43a021dd33985 [3/3] UPSTREAM: rust_binder: use compat_ptr_ioctl
config: arm64-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141222.ediygIJb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141222.ediygIJb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141222.ediygIJb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `compat_ptr_ioctl` in crate `bindings`
   --> drivers/android/binder/rust_binder_main.rs:317:38
   |
   317 |         compat_ioctl: Some(bindings::compat_ptr_ioctl),
   |                                      ^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
