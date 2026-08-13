Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6BE3DB64A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786620986; cv=none; b=Ly42g6QmPJ0Z1sEDe/GEZHCz74MxewZ0ztuJi9QRGGZ03hhyNjdXhRxfvps/3yqrvoXVXeorl50W9BduZpa5wmw+Bl5SerAdHQfyzStaMfAyXncc4Y93i8rhGUX/BkW5zyQTEy8cjRAaPWXwAgMTqPRNDQzj8AwyxNZz/DfB22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786620986; c=relaxed/simple;
	bh=87rbxhacz42PHxZhwrSgyqAuRxoyIJv1kZ5h2nPhAoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A3xa5BQ3tlfueKjGbI+u3bHOfBJgOQr07C+79gzhYB3rOIye+S7ZGWM3RQ4TuYOg6rjFwkqe6d5aZ5/WRK6r+nkT8VmbMdc6wi8hFCMoBSu6goJkxKtU6usVDqlJyu4No1wF+x0VFo1PVhfYIr4SUqoWdbmLMdEWzrwYPyaH/D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF74zx82; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF74zx82"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786620982; x=1818156982;
  h=date:from:to:cc:subject:message-id;
  bh=87rbxhacz42PHxZhwrSgyqAuRxoyIJv1kZ5h2nPhAoQ=;
  b=dF74zx82+IHGVgolqZ0qya3EOM/iJYoK0lFu3HMY5S4aRH4g6v4p6yzy
   YVSI9+ot+cEZVSYmbRK8DUtGD1tmHaUqGRYrGlDLQNHlCeAhrv/YEYHnp
   gplIvMPOfftVcOceoscWrohuCq46E2YiU6MqEEnrYCbcwozoemCjxyQ0R
   RMN8UqNmVxUi+GWrp6Ao6q+J8Uewt7Kg4W9nyzAMlnfVZvhCTZXQBSZs9
   7pQycB4tvmkD0juWKtjxpFtIh+h+s91Y4r3g21mJuRCI2CFwPzpT1izLr
   BRaSTwlaAPdNmXT0QU7lTjSOnJVoeFzzcJx2f3GnSBf+kS+GkxuZ/oip+
   Q==;
X-CSE-ConnectionGUID: 84Oi5gQHQtufy56k8afW3A==
X-CSE-MsgGUID: cxH9NFa+S1ey+hLj4ZlldA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87408545"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87408545"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 04:36:19 -0700
X-CSE-ConnectionGUID: daeVJ8MHSlaaOEBMeTf4JA==
X-CSE-MsgGUID: SwAbkBEnS+SeNWDz+4SGcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260103898"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2026 04:36:18 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuTjL-00000000Ttc-1igE;
	Thu, 13 Aug 2026 11:36:15 +0000
Date: Thu, 13 Aug 2026 19:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol
 'sync_fence_signaled_obj_name' was not declared. Should it be static?
Message-ID: <202608131959.wxg4Rhos-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: b402a1d75befcddca1b54a72297785474d05a99d [1/1] ANDROID: sync_file: Weakly paper over potential xe driver (and similar) races
config: x86_64-randconfig-r112-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131959.wxg4Rhos-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131959.wxg4Rhos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131959.wxg4Rhos-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/sync_file.c:119:12: sparse: sparse: symbol 'sync_fence_signaled_obj_name' was not declared. Should it be static?
>> drivers/dma-buf/sync_file.c:120:12: sparse: sparse: symbol 'sync_fence_signaled_driver_name' was not declared. Should it be static?

vim +/sync_fence_signaled_obj_name +119 drivers/dma-buf/sync_file.c

   118	
 > 119	const char *sync_fence_signaled_obj_name = "signaled-timeline";
 > 120	const char *sync_fence_signaled_driver_name = "signaled-driver";
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
