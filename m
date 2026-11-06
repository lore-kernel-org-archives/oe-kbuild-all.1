Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963860;
	b=2CS2RL2FuNr+OHXKdQIz0F22H10mPfoglLFv2xBQ5fvsGSD6vM38yoL1DRZdFZC3NHgO
	 7dO5acltKMDtQDuxeZu74gLGf1GZJdU5cTWQ6D+Tb0cSqubmRSSNHy7jVdkrIgQd7kKmH
	 CI07D7TzLyun8b7J8z5/9GKrc9ScK4dfqaGe/ASAWvAWg3LkZ8etRDBtWTSvFJBW+f3fA
	 4LXazAbLg19hVvNbRRcxmlansYZMRvAs+Xfqwnk7BspdE89M1R2umnEPuFkylp1OM3ySV
	 Bhd994ItwX+ESN2Q+ILkgkVLsFznX9paXzKSbcZsyws79/Je5E4/EeRSFMhKcHCZVRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963860;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=z84o5/vrnTeRbh4tXrX7gGqOrKIeIF46rinszmkzV6A=;
	b=wAThPw3pQLFOewvThCwNMviI532xTRqY5dIBg4JkDvIc0nF/YszqRPFGIL55MECq4Win
	 Y4bcw4GEbO2atFpRAmaDwDMgxz4ULGQ9hPZyR+9J/EHJ6ffeJYJM7TwqvW/H8y4YFEhRy
	 7Ov+W5sab1D4KIyjHloumqwUFPToaiN+rc2Pzk1JQbs8tpPGJS1sSKBfQR/+pNTeoOYup
	 h0CPZOsZ6rq5w9L7QMEO41VMTuAyPhVseIYSRCzHCsfN+gAHvJJnwEGuJicf42R8Je//Q
	 p0LkfJPeSAwA9pgUlqYHWdUaeHbYFsEP1U9KYz6TNQ5lEIe1giH1Q7svHB/1xr6ByZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xu6YDQDH;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C20606A32D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 11:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C20606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xu6YDQDH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793963860; x=1825499860;
  h=date:from:to:cc:subject:message-id;
  bh=uwAB3MUtjFb/YmJhrZ2n+VPLNfBckLAkHrkveC6ZU1M=;
  b=Xu6YDQDHhnal4VrWD8doKnPijQWKo2u5vLI/cf7NZSwnuU/kYYPXGydQ
   2OrpoNaodrtBEU033OCleVxxYiZpYJZUFtez4IRv1pdEJf3XwV+ci5grz
   zwIwkVmhVvpuaQFPBqGs9ld0cRddXoH1K6C2+8Bd9auPeBX63R7+GmWu+
   icEEAx6jr/flBAgpYBf4PEBja7C7bEARH9BPIyzC/ZK6nE/tUEELkAXj0
   lP7m6l6ShMGUnRw0s4E00kzZjtaYNX6/6eyam3MkjWH/4VGEKbaWubPHH
   GYGnArn4NQZkEI2yf1v1DWthpPDgYiYK+iDODfvN1KcQfuR3+Qhbw/F2L
   g==;
X-CSE-ConnectionGUID: a8kFsz2kQri3iXC5yA0YzQ==
X-CSE-MsgGUID: JrV0XyLLQqaE1gpwNlR/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2802586"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2802586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:17:39 -0800
X-CSE-ConnectionGUID: hf267mi5SdqQWCCymTXG9g==
X-CSE-MsgGUID: DX7y5pWrS0WWxbbwLEziRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7375121"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 03:17:37 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHws-00000000AEH-05MJ;
	Fri, 06 Nov 2026 11:17:34 +0000
Date: Fri, 06 Nov 2026 12:17:01 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent'
 was not declared. Should it be static?
Message-ID: <202611061227.p3eSWAYF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b835509d43ba8175031f800f12347f8e8206a471
commit: 88e59f90e918a5d074d07e6f6c5af7a58317a1d4 [1/1] ANDROID: drivers/vfio: Allow non-coherent device for pKVM
config: arm64-randconfig-r2302-20261104 (https://download.01.org/0day-ci/archive/20261106/202611061227.p3eSWAYF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061227.p3eSWAYF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061227.p3eSWAYF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/vfio_main.c:65:6: sparse: sparse: symbol 'allow_non_coherent' was not declared. Should it be static?

vim +/allow_non_coherent +65 drivers/vfio/vfio_main.c

    64	
  > 65	bool allow_non_coherent __read_mostly;
    66	module_param(allow_non_coherent, bool, 0444);
    67	MODULE_PARM_DESC(allow_non_coherent, "Allow binding of non-coherent devices, not supported with type1 IOMMU. (default: false)");
    68	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
