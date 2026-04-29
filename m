Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0937BE87
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489944; cv=none; b=O4qZP4hn3ueatEr9luBHNtGYhLYNzCtrlsUqcbsxY868SCqhL6M+i5wrLz3+ltIWCZ4dkFXtXcit026p+pcPkSCP2+kdO34Nihr+nBMj1ZN9d+B6l0NBNIF/GTrRnlGjzV5BYk7BH3DJ+KNA6Bs6wD4CHb67JUAjgUx6x0BUp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489944; c=relaxed/simple;
	bh=EN0ojz0H79CS02gvZ5vSJrZ5X6c2Jx6GaGr6ppkFw+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YQFIWT3Qa9B5QL/AWUmZtIdcxBnIQBB+LqkB/XI5S6ea5r3oTwWp+culz9aB6jb4gy9qyl0M747n2VJ3xwqVYOIFkTkb8sJGZzLZbDHwysGFYllfvPE+vG5C9Y0OcPIduWHgjLn40xnd1e+L30kwMTWqFSvCtlSQxlmhGnHF0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKE2ekn9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKE2ekn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777489943; x=1809025943;
  h=date:from:to:cc:subject:message-id;
  bh=EN0ojz0H79CS02gvZ5vSJrZ5X6c2Jx6GaGr6ppkFw+8=;
  b=ZKE2ekn9tiGyVKtPivzsfEEbDdA4PRWVTH/KPec6WAvA44ZPwTxVR0rm
   M28fulWzG/KvxR6WiIJo06XBEC8OwD21b7TBSkCwFOEMbdj2Xc5ZLn3gg
   rCLCgBRlEfcP0rYrMaBfIz6bidcp7ky9pxdFtXJMKaW3gsmvz5T4KJn+p
   H4TpVuj7GzKp1BBTMS6kbu/j7i4PqyuMfpsv0iTC5AkRDlud12k/mwy+X
   wqqqPfEWdzByyjNOpH9+EvpF+aGWO+YMQnGQbhoAmp0dgJ2WLEelvv1fA
   yxVtZPCBp3rKxBHd7nMRuvEpjrGjHeggtU+0F0eC8UvHBkvkdacJfOo7a
   Q==;
X-CSE-ConnectionGUID: Ilnsfc9yT5CRgIFY6tqf7w==
X-CSE-MsgGUID: INqlO+i4RRqEfPBiLwcHCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78140432"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78140432"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:12:23 -0700
X-CSE-ConnectionGUID: lrq/Mnx4RWi5aPFmF7hoIw==
X-CSE-MsgGUID: ujqTMEW3QiWMedQZveehig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234232511"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2026 12:12:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAKZ-000000004YZ-3KzF;
	Wed, 29 Apr 2026 19:12:19 +0000
Date: Wed, 29 Apr 2026 21:12:12 +0200
From: kernel test robot <lkp@intel.com>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: warning: casting raw pointers to the same type and constness
 is unnecessary (`*const bindings::iio_chan_spec` -> `*const
 bindings::iio_chan_spec`)
Message-ID: <202604292124.XvMaVOyc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Muchamad-Coirul-Anwar/i2c-rust-add-smbus_read_byte_data-and-smbus_read_word_data/20260429-233312
head:   e9adb2f89bd4c6455e79fc2f1c67ec48a5b2d863
commit: c00b5cedb3fdc88d5b3e32b2f10dacc663f4851a rust: add minimal IIO subsystem abstractions
date:   4 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260429/202604292124.XvMaVOyc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292124.XvMaVOyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292124.XvMaVOyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: casting raw pointers to the same type and constness is unnecessary (`*const bindings::iio_chan_spec` -> `*const bindings::iio_chan_spec`)
   --> rust/kernel/iio.rs:199:37
   |
   199 |             (*indio_dev).channels = chans.as_ptr() as *const iio_chan_spec;
   |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `chans.as_ptr()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#unnecessary_cast
   = note: `-W clippy::unnecessary-cast` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::unnecessary_cast)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
