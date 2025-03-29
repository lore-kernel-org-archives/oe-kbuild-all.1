Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89445382
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206936; cv=none; b=e11jAFaWUk0pG7Zk+iaJ/vRPVe07Sxehg1DuBHtOGv765SQ8PmujOi3qtDRCpZQOQz7Mk9R612JV2b4GZFjP1qnZKKEhBY4LI1UpS36JLh1fgd/whZfR64qd0Ssgn2I2dZFwftICHdAQ18YGG8t70RVd1PEBkw+Xfj7X/qbXmrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206936; c=relaxed/simple;
	bh=sG+pAKeX5i4EQmukkse7DI01YBf87b9RdIT0rEUEK4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RyenEtcHhU7MFsfkCL+EjBxAkGdg+Vlr6EYEsdBL+mG8xR+WKuPXHnJFYQBNIJd+mA3RFX2zXtkGpcrDmgRJVI0uv7XfmLOhot57bviLrdv7BpqnUvMTVVOFwOZlCfj20IEPjvLOUsJRjaTzor1RUg46z1v1i43UfRocHV1fr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XILu/VnQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XILu/VnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743206934; x=1774742934;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sG+pAKeX5i4EQmukkse7DI01YBf87b9RdIT0rEUEK4o=;
  b=XILu/VnQsAIWE1CsTKVUxXApQEiaECp4co53CW8iQxL7nhYZXmMoJ0aN
   0Xlknlrnty8/Ov6fieZD+1csToq6FeMhWku+rofRAmr5VrLc3xSFojtx3
   MjoXqwbQTxCXOWZMPGZapwbcRm95jt6PkFb9EzyL6P5cJ69IEJcv7Zbxg
   O0BEAMmhiJEcAKHMhyDMiRXC3V3zBywHHq0bFBA4tGxAitt4ql3wzlZqC
   0mHf5g2BBJf9mb8Ihs1aWezvDmxt2ITQng1ooGg0Xrz6PS3APd2LeLt1E
   mLxiCN0X0wzOPxMfpdETZjYahRIAuYiCE17GsfRom8u3mIiAKHpy27svm
   Q==;
X-CSE-ConnectionGUID: MT1DXohQS3SysYkXTTR+Eg==
X-CSE-MsgGUID: i/hNDf3QSeCyVQ5MbOhUog==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="61974285"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="61974285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:08:52 -0700
X-CSE-ConnectionGUID: aHBfkv9LT0mwi03YSV3SPw==
X-CSE-MsgGUID: Pq/H/0LETLW6+bCjXK3PWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="126035408"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Mar 2025 17:08:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyJkm-0007mq-21;
	Sat, 29 Mar 2025 00:08:48 +0000
Date: Sat, 29 Mar 2025 08:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.14.y 38/71]
 drivers/firmware/psci/psci.c:724: undefined reference to
 `psci_cpu_suspend_enter'
Message-ID: <202503290851.ZHbgQsXZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.14.y
head:   02aed781c87390cf176b68e20906e28b96e9d18a
commit: 2e23c98c7d12831d1a5a84a741b2472129e2e137 [38/71] firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
config: arm64-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290851.ZHbgQsXZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290851.ZHbgQsXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290851.ZHbgQsXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/firmware/psci/psci.o: in function `psci_cpu_suspend_s2ram_enter':
>> drivers/firmware/psci/psci.c:724: undefined reference to `psci_cpu_suspend_enter'


vim +724 drivers/firmware/psci/psci.c

   721	
   722	static int psci_cpu_suspend_s2ram_enter(suspend_state_t state)
   723	{
 > 724		return psci_cpu_suspend_enter(psci_s2ram_suspend_param);
   725	}
   726	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
