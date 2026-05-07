Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED4631E849
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 17:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778175284; cv=none; b=ZYmEKpD9k1gfpfVZr+gwemzAlmR4w1O/d2L5/Et36QXBL16rCpIQDP3VffF+2pYK3KA6bD11sEBxaVats5Eemf8xRLXayRqq2c7fR0zJ1eGho/Dm2ob6AEU79HBom8i1rcHocyMS1XIn4iER09cUCmEylg1Urm/uj6c/Zj5cmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778175284; c=relaxed/simple;
	bh=786mnCJaF1iRtrrvIGbKV77dwvvCRqIkjK8WHcF3fcE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QQ6OKJ+wmCYToDFPeuwYUXZJ98SBhniuysLYklw5hqHxLWsj2ggY5aJOO06cZQ1Wwen0TB8G2AOcrt5usB/LVvOLma3kbP9FarbbJW72LNOu98g0jTOsERuT05VPzWuYf0pup7TuYXqsWDjAsbyScB4w5F3DTlil67D9PgPB5lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpY7s2ZN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpY7s2ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778175282; x=1809711282;
  h=date:from:to:cc:subject:message-id;
  bh=786mnCJaF1iRtrrvIGbKV77dwvvCRqIkjK8WHcF3fcE=;
  b=VpY7s2ZNNXLaemYiHuMhgvggKdWhuy42mt53HWmrXqnZGRNsMMrMFVA5
   gTED8sN6k3nQaC0acwJVrp3+kTTc7y3iEZxYRlokdNZRF/vEk8DXi2mH1
   /uEsuVOIR9IQMUjREyxLtbOomVWZs3kHDI0s22ZXRkDkJL0w4Wl74zOxx
   EOut9XKEr7tcZEGkV0sjOVDQd98soPml6y51A2Y//JtWudaMzn2o+LRql
   GXQ3fOM7Sorn7ENkRrS3qUNHUlOFtkuyjefU54/rbHA0+HZVY19nA7O1v
   kNtCQBh3VeT6g6iOzhK4W6LphnYl0uk7JaltVOYGKI6aaYYCFwKTiAE/B
   A==;
X-CSE-ConnectionGUID: wCXDRu2US5mc5dXCnownBQ==
X-CSE-MsgGUID: 0uhTONHbQZmriZzwa85JBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="90234776"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90234776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 10:34:41 -0700
X-CSE-ConnectionGUID: UW+M/a8lRguYR+XAMOERFw==
X-CSE-MsgGUID: iFCmJtRGQmOPpq4iVVJ0QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="238317709"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2026 10:34:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL2cP-000000006uf-40GN;
	Thu, 07 May 2026 17:34:37 +0000
Date: Thu, 07 May 2026 19:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2] warning: using `as _`
 conversion
Message-ID: <202605071925.5HSP2cy7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alice,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   d85edb4fec0c96888cb606c6320a84c11b4124f0
commit: a61ad61ecb80b8656aab70fefb4aefd553219644 [0/2] ANDROID: rust_binder: priority inheritance
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260507/202605071925.5HSP2cy7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071925.5HSP2cy7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071925.5HSP2cy7-lkp@intel.com/

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
