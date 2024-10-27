Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC7F9EC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 03:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729998313; cv=none; b=IkrTbproXhRnq5blguDDaHhfiz9lsYH9uqNoD70lXbBmLMXtLBjgI1tJ7FNhWrfXaNRNqU3LF5AzwNODap+dWD0/7GyzMZhTnNFxU2QhcPZMRVXKuCZuM7UcLlhnZkody9+INOQcl7Wej5Stt7EzI6uK+rkd6VE9a6p3zIkVHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729998313; c=relaxed/simple;
	bh=1ftjEHKSVd9TCuerhLLskefaEUYU9XFWzW+2Ct7DU0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nflhLbsDo1/lrZdRGLqOG2ju6M8y2J0mQTEXYBacRomyT4kWj/w73UZK5QRlCz4pe45Q4wUAhao8CpP9kmT9Rd3Yu2OhRUR87gwIfKqsbISA9dru0y3R0S24qIOwkqQy8fM2VZVk0F0RdbT4b4Y3NazSfiNNnJo/7CShxBFRZIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjpjueLN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjpjueLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729998311; x=1761534311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ftjEHKSVd9TCuerhLLskefaEUYU9XFWzW+2Ct7DU0s=;
  b=KjpjueLNpAiX86A2sHprKcqVDrqGzJC1GW5gUMC4sFWe8pPrhm+Fh4G/
   erRCDqWTay/FwCQ/3gMa9iOcfppPk46zUG1Hp7msbjJ87EvwoJ+EsYbUy
   4UxLur2wpaMPbmYX2EsHqcMZWv0f9lyId6sniwma/K7Xj+gMxDU56Ph9c
   jiIbZqBkfrBZsgQMlRakzIrBkEie1ooX2rolDF+3g/fJ0LUVnxWzW0vIA
   yZjjuWK1ndQx85fQD3ENqPQl7wlfEQs7xSY8a3EB7OtJRMjVcWbHVtl4/
   n3Gyxo4P9QDq0B98n1oqHzR5DiPUA3+2l4vs5SGcjGU/2is/aSeY9RzI1
   A==;
X-CSE-ConnectionGUID: a9w2YaRoSV6CnaQa8wSp3w==
X-CSE-MsgGUID: iT49a0uIQuW8y455duLq5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52184842"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52184842"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 20:05:07 -0700
X-CSE-ConnectionGUID: uwK9FdqxQj2O5/Dxxd3K3w==
X-CSE-MsgGUID: Khh0jdDbSHCo5Dp6SinvCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80867483"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 20:05:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4taR-000aIs-2L;
	Sun, 27 Oct 2024 03:05:03 +0000
Date: Sun, 27 Oct 2024 11:04:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hui Tang <tanghui20@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26135/30000] kismet: WARNING: unmet direct
 dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by
 BPF_SCHED
Message-ID: <202410271152.QuObXsnV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: f23e7844132b626800d06e42d09e2ffe241c51cc [26135/30000] sched: Introduce CONFIG_TASK_PLACEMENT_BY_CPU_RANGE
config: arm64-kismet-CONFIG_TASK_PLACEMENT_BY_CPU_RANGE-CONFIG_BPF_SCHED-0-0 (https://download.01.org/0day-ci/archive/20241027/202410271152.QuObXsnV-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271152.QuObXsnV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271152.QuObXsnV-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE when selected by BPF_SCHED
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   
   WARNING: unmet direct dependencies detected for TASK_PLACEMENT_BY_CPU_RANGE
     Depends on [n]: CGROUPS [=n]
     Selected by [y]:
     - BPF_SCHED [=y] && BPF_EVENTS [=y] && BPF_SYSCALL [=y]
   
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
