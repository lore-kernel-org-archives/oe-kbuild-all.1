Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEFA286A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176488; cv=none; b=TpuRq9eS0OqU18w/Go+w/2X+53KlDB7wywiRwgTKbJ7Ajyhwl5ntLOc6ZRmCM7nsTzDbS6Arn2n90Pv3GYACCc497xucdVGu9sH6L9ZIv/F+U+ZipiBcezF01SbhHpDzaftigoXeVRFnn0ajkl2SCJ2FPGP9we/Hlth5sYhyQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176488; c=relaxed/simple;
	bh=LV5rWyfR9HpNynqRaV4x5INcQWkdp89DEK0YmL7b9pA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EOMojyOvxUEZlONt8ywe2MNKSbgqQvtPK/lPvuvH3rd0WtK93nAJVtzcXTPmVV+LikpEbZHelmTXMJbKVj6bXGJFTcRNSzTx/uCPyedFYOMglrhsXWoDDzjWCysDtZeANVNP5zrkfaqq3rvdTslDp1zohNU8SF9JDdnM1yxhKj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/WavVTJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/WavVTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769176486; x=1800712486;
  h=date:from:to:cc:subject:message-id;
  bh=LV5rWyfR9HpNynqRaV4x5INcQWkdp89DEK0YmL7b9pA=;
  b=P/WavVTJ4SRpse9zSfP51ayRBAy+9hj7nJ58+H/gdH90cVzUt5cJfLV1
   HxkGlyWVTMgW2tf0UAQOonyvBfrqXAkfk+VQKteg40YZilE2oC1E8+REZ
   JZplp/fLvUYdosdsbh3z7xTmitpyiI9Ld5R1ChNZeBtwg8KSN+Eb9Eyh/
   ZvJVjm8zZuRHEl7TaiJ6TvfjNLxLDIvAjzcQ4PXnYu0+ymlpj4t+EO8g2
   qUpyGRVGZMnX319RGrgpKq+UQVkaHBmuk0Gu41gSdJJVG5mxTGfHK9UZm
   r1pTunju4SRqdLkfb3jSrEh5mWJNc+8Sp5q4VFcfNCVBLWGNwxW/ykW7S
   A==;
X-CSE-ConnectionGUID: AIoBMyd2TSKKoZtjwj0+VQ==
X-CSE-MsgGUID: ub/ad8GlTMCLBmJ/HwJTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74286711"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="74286711"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:54:46 -0800
X-CSE-ConnectionGUID: +wD8KAWKSlKQ38sb7vrgAg==
X-CSE-MsgGUID: hq2oRd6ETYyL6UzS19PB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="229989544"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 05:54:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjHcY-000000000jd-3iHz;
	Fri, 23 Jan 2026 13:54:42 +0000
Date: Fri, 23 Jan 2026 14:54:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1] warning: using `as _`
 conversion
Message-ID: <202601231439.oCFY1dSi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   97ff507bcd5320d8ef97219b42b1e353890e73ca
commit: a61ad61ecb80b8656aab70fefb4aefd553219644 [1/1] ANDROID: rust_binder: priority inheritance
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260123/202601231439.oCFY1dSi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231439.oCFY1dSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231439.oCFY1dSi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: using `as _` conversion
   --> rust/kernel/task.rs:353:56
   |
   353 |         unsafe { bindings::set_user_nice(self.0.get(), nice as _) };
   |                                                        ^^^^^^^^-
   |                                                                |
   |                                                                help: consider giving the type explicitly: `isize`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#as_underscore
   = note: requested on the command line with `-W clippy::as-underscore`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
