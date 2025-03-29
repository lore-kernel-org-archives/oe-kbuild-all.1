Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91398AD5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 00:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208877; cv=none; b=iWso8dkcX+jFwcZqYHUkXLyZSv0k8DkFkQVtS54T6rk3vIn/hS+ib7U+ySnHLtBWLLya2Qy89ciuT+47BEK96teJMqbYED/6wOr0nUJ/6CUzisMyT42cAZyyODCHcP5Igjf5Ib+E+fF/4P+mdN6Lb70ozQ6ifxRT/s6m7kwZL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208877; c=relaxed/simple;
	bh=sL010Od++1Ubwc8XHN6jmSz/A3EnTJEO4geRMBeP/zU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aI9hd6QrpBJf5t7X115uJl6mOIrl2V248nH9NzzJBlBny4xq+uQD597k9UNK1SRJcI8XbxkMAyg+n2gywqBr2yP1nPtwzNrz9HpgFLd7+inWVX/ndik6Quhzb2KiUUZ5HIMo7J6wrhyEojK5zeartw4VDHk667ImdFC6IRi+UjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZ2FxYr1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZ2FxYr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743208875; x=1774744875;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sL010Od++1Ubwc8XHN6jmSz/A3EnTJEO4geRMBeP/zU=;
  b=cZ2FxYr1WfqvgulsNhP168kV9YlBEWAzigCIcfJPC/RcmBGzrNMpcq91
   Fme9VXwLsgfbLac7m3HXecDz7D+EaqxDULMozrSJfEwrWr55tTigeZxvE
   6LuQofaPVC5BwIcQh31G7dVVJk4bMUKZJAEI+mqsRWSKir5nCmTpvalSu
   Onhhp+vIVUMqsv5ExI0+0ZTngXeIfhtkxKq0tDIYiskqXTTMCl6GsrUZH
   wQ+CY5UUx/6PRRfRas2OGfci3alhsZbA9a1vNWD/Nj1C1UkS64ZhejAl4
   KqjwL1m5o2c1LJI2Oz+Kwpeo+PFkioLRmFklX5Ipk1Bkys4+VYzQpQ2mq
   Q==;
X-CSE-ConnectionGUID: 0MrMZLDWQ5qaHXS2B9lAXw==
X-CSE-MsgGUID: D4iRPX6LTAe0cyskwSdEcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55950471"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55950471"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:41:14 -0700
X-CSE-ConnectionGUID: mInZFE0gTQ+DeEVIbeAPrg==
X-CSE-MsgGUID: d7v/HIv9Qwu/upg9EUPmrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125475833"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2025 17:41:13 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyKFz-0007oo-0A;
	Sat, 29 Mar 2025 00:41:04 +0000
Date: Sat, 29 Mar 2025 08:40:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Weili Qian <qianweili@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2064/2064] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_DRBG_CTR when selected by
 CRYPTO_DEV_HISI_TRNG
Message-ID: <202503290855.eVbc4pVd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   94d50befec22eea69046e558027594d630edb926
commit: e623afb45e58ded6b45cc4f0ac6c19b3736c96f9 [2064/2064] crypto: hisilicon/trng - support to obtain random numbers from soft algorithm
config: arm64-kismet-CONFIG_CRYPTO_DRBG_CTR-CONFIG_CRYPTO_DEV_HISI_TRNG-0-0 (https://download.01.org/0day-ci/archive/20250329/202503290855.eVbc4pVd-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250329/202503290855.eVbc4pVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290855.eVbc4pVd-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR when selected by CRYPTO_DEV_HISI_TRNG
   WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR
     Depends on [n]: CRYPTO [=y] && CRYPTO_DRBG_MENU [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_TRNG [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
