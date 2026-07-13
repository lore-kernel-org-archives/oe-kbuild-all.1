Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67B31355D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913024; cv=none; b=sVG9qOW0uw2hq/zRODra9RjCENomh+vGykzKtdJcNRyQMTh99LRsL1tgmxnvj3DdaL/jrBRN/3q6Fh8y0a5QMjXQ59c4CqMzHkwSxKuEXL3KCvrg4iQiyyl2uX1djVweHxr0rcqqQ76NOhhTNp8mw2EPxm91J34u6/lsk/eGU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913024; c=relaxed/simple;
	bh=+Tf4a+3XInTol29v4DS2q0y2ACRK6UTrAT6UzkwoG4I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tRBV4rFIEkFNKQ1hx0qMa9t6Yv8Zdf2wBJENCb2Wb/FRiWASMHvEAyrBX5v1g7swyXgeAxl5eQQzpoWmS9PPpNrmDMoQ52jRCF+zcB1jqe3zeyNHZateoKFBKhx9/5KOp0IlOohX7hrQWNx6aUsSN5c/OicuqrTLGBNQ21Y9izo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4/TmuER; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4/TmuER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913022; x=1815449022;
  h=date:from:to:cc:subject:message-id;
  bh=+Tf4a+3XInTol29v4DS2q0y2ACRK6UTrAT6UzkwoG4I=;
  b=U4/TmuER2SoWI4ADz8wlFywPUdKRLnx6NsRblqzhTN8golxh3deYOIJY
   jetikrQCC9KxxSDuum3TF/F7FESrc53wvZ+CYMN6UISO/omHbHc9nRHcl
   zQXnMBCYdgF8hufy5NS7NOBSm4iXkvdRj5Eeg3k8jnSf6JNg4PtcDGD0I
   kSKqNQGXEB6plUTSppXOZJwemIZZmcKFOu7GfDJ7VwH8aUgs+H27V+9b4
   LENJ38nYlGc5qKnJLHhg2SnFiODe4+56vr8qDdvwq8RgSrTMmAJoooVzO
   cM+6ynfsbQg2ubZOQk8lsqTbe64oQDWSuxgs8Lj4Sbg3ENdkljeQrPCsd
   w==;
X-CSE-ConnectionGUID: FoTYI2Q2STyRLC1jdUP1tg==
X-CSE-MsgGUID: frmONaE1ScG5txRytBJwlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="107316855"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="107316855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:23:42 -0700
X-CSE-ConnectionGUID: U3opswGgSTGpHRlBF9Btzw==
X-CSE-MsgGUID: LltbU4RUTM2GFo/KtRZjXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259292280"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2026 20:23:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7GX-00000000LKa-1Cyu;
	Mon, 13 Jul 2026 03:23:33 +0000
Date: Mon, 13 Jul 2026 11:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 46/59] ERROR: modpost:
 "random_get_entropy" [crypto/jitterentropy_rng.ko] undefined!
Message-ID: <202607131059.0cMHcwSJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 55e6e884f28682997f0eba61281632c0eaa94874 [46/59] arm64: Select ARCH_HAS_RANDOM_ENTROPY
config: arm64-randconfig-004-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131059.0cMHcwSJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131059.0cMHcwSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131059.0cMHcwSJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "random_get_entropy" [crypto/jitterentropy_rng.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
