Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE3B3B9DBF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101209; cv=none; b=B/MEWu3dbnCFOcn/OA2+f6UJ/8H7wlNTv5YNpWXqKiPHIoIw0NbsV8Wt2Q8/vi5iHVMPalvOUAs2f3tKRQnDwklImD9HXh3Q0dk/S1bDtE41sbyFAqgUwymdxXlc1mMplE4/naMTur8uV8iha7AzXzclCHs9vkgoSW0wSL85Lqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101209; c=relaxed/simple;
	bh=KppeXDXHGfNljLeW/WkrbSy492ZKMl96nGFBnmbvhqk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RwdXKPaFvK6YWxTA9zVaoVTcMQjRc6ZaPdvPdtNC/Pme7IDcbUCT9BFhINDv0KzAXg/Pe2e4peVW7E8wWIMEO4NEfig60/LSUKW2RgA+HHEDkxVpCFHGuHWH6zcyZIapsRuU8TsxIYKznFr25tEunOnotlB05KeNSkBoAr+gVQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FW9APh7y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FW9APh7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788101206; x=1819637206;
  h=date:from:to:cc:subject:message-id;
  bh=KppeXDXHGfNljLeW/WkrbSy492ZKMl96nGFBnmbvhqk=;
  b=FW9APh7ycD/v7bXMVdVpj5bWDKd5yMaBf+9mcSkJ2G5UlO0ycmklYg16
   uH9MkK2+hNid9eMFJhYC9Pnmv395f/x40HZPpgI0z1HxJSUiARGS9XBIc
   IWBNSyaTXH/pHhbJMKHqSX0ZnWC3365N036ZNnw5Rj2nzf1L96iQvZ5Lo
   7iP2/8/uD+IvVaQtF6F9rX/ayBxd+9jyvFKK7B7yyruycCGsXnXh4BmA3
   PROgX7DXcSwAcufhgd1WJIpxRSlIbBIRxK3GQkHnCtFobP/UDRSb0PJ+u
   ub2/SNJJdtx+Ni7IEBQ9HGlR9+d2dZNjohVZ4a1iMKHqXVrNJ6/f5up5X
   A==;
X-CSE-ConnectionGUID: hceAEFOQQ3SQ3XWaxu0Jfg==
X-CSE-MsgGUID: GKLfM6vFSSaDi4BNyaoREA==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="88578224"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88578224"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 07:46:45 -0700
X-CSE-ConnectionGUID: Kj+LPcshSF+g1tM0vhZ/tg==
X-CSE-MsgGUID: sj8cF1XASsizG3dZateLBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="270512946"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2026 07:46:43 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0gnw-00000000DzQ-3WER;
	Sun, 30 Aug 2026 14:46:40 +0000
Date: Sun, 30 Aug 2026 22:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3] error[E0425]: cannot
 find function `has_capability_noaudit` in crate `bindings`
Message-ID: <202608302213.T3NKdjs1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   afea13f9ff7137797a2858fc973c226ec93866aa
commit: a61ad61ecb80b8656aab70fefb4aefd553219644 [3/3] ANDROID: rust_binder: priority inheritance
config: arm-randconfig-004-20260830 (https://download.01.org/0day-ci/archive/20260830/202608302213.T3NKdjs1-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302213.T3NKdjs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302213.T3NKdjs1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `has_capability_noaudit` in crate `bindings`
   --> rust/kernel/task.rs:289:28
   |
   289 |         unsafe { bindings::has_capability_noaudit(self.0.get(), capability) }
   |                            ^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
