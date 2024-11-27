Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E13A13C661
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 18:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732731349; cv=none; b=JHjl8fOjah09HHJXHjXDH6iIq0Z3tYiXDllFq8kftkTgyVS96eZrD0UFNzbMZjMM82B29p/Iopynt8a37Ilb07lbl/kWewnU+vgoXfp+Iqbfijjdttx4ndBb402yP0fh1BojV2h4vCso4e8ErwjFR/2Sn3Fs5LJwa4vWDP5uPf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732731349; c=relaxed/simple;
	bh=7O7ihBqbCAwshNOFOoE2RfNgKV/jbcdItxC6WXPKS6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKV6a39D2bRvAfqB5k07e41uTrz3AASsapM8NK/lTgvkC6IP41Z8mDTWDswkJHgQYRmc6T8FX1lkoVIRf9WwiM6uIjgSO8VmVcGQobK6XeLh9fz0u7uBsubjXLYXrPbnbolaXB6YIInNIfy2h2f/RUr4wQuIaxdr7KD5ndGSnLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L4fdiAim; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L4fdiAim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732731348; x=1764267348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7O7ihBqbCAwshNOFOoE2RfNgKV/jbcdItxC6WXPKS6k=;
  b=L4fdiAimMuOCotANG/CdJTCjSbkgiFwQ9cf/TDzxx1Cu4tkFDPaWE29z
   rV94NS9YymhRS3U62BQ4cLb0S5yJZuM5A0/ECkfFVPWZ9pqpuBf+qY6Bo
   T5qOYqqlhZzG7JqsaQGFKKLEBAYMoyVFrajxPWjaKPVeJwV87uZ1Laimy
   /Ce8O/xBE1xTWlpMedzS9ONiWjgs8rWLrrp9ZRMRnv+iEyU9DOsb1S6tZ
   APofW5C+Kg7vbKePpCwZ2d7yG8WXE756TlFMOHlKhuxWmnHWw64BjTvlh
   8WXWYvUbwMKwTn3RDFOXdpz6BtKL4UxXHrABr8Srm2g16sDMeMc/dEMR+
   w==;
X-CSE-ConnectionGUID: JtkNZMknSlq12TCmG2gE2g==
X-CSE-MsgGUID: Q3Bh8qi3TI+G9TWR2dhj+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43557496"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="43557496"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 10:15:47 -0800
X-CSE-ConnectionGUID: i3tBi8KuTTK6qIFSYz3drQ==
X-CSE-MsgGUID: e9rb5QVsQ2CeJt6fl9/f8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="122844827"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2024 10:15:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGMZj-0008FW-3D;
	Wed, 27 Nov 2024 18:15:44 +0000
Date: Thu, 28 Nov 2024 02:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenyu Huang <huangwenyu5@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] kernel/sched/fair.c:146:12: warning:
 'hundred_thousand' defined but not used
Message-ID: <202411280242.vXWcSB3O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4a0359af8c9d84ec3320a8a18f41c7fddf1f7a23
commit: a3c9f2da0a35df4e41751556be4308f57bdaf3d6 [1540/1540] sched: Introduce handle priority reversion mechanism
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280242.vXWcSB3O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280242.vXWcSB3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280242.vXWcSB3O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:146:12: warning: 'hundred_thousand' defined but not used [-Wunused-variable]
     146 | static int hundred_thousand = 100000;
         |            ^~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:145:12: warning: 'one_thousand' defined but not used [-Wunused-variable]
     145 | static int one_thousand = 1000;
         |            ^~~~~~~~~~~~


vim +/hundred_thousand +146 kernel/sched/fair.c

   139	
   140	static DEFINE_PER_CPU_SHARED_ALIGNED(struct list_head, qos_throttled_cfs_rq);
   141	static DEFINE_PER_CPU_SHARED_ALIGNED(struct hrtimer, qos_overload_timer);
   142	static DEFINE_PER_CPU(int, qos_cpu_overload);
   143	unsigned int sysctl_overload_detect_period = 5000;  /* in ms */
   144	unsigned int sysctl_offline_wait_interval = 100;  /* in ms */
 > 145	static int one_thousand = 1000;
 > 146	static int hundred_thousand = 100000;
   147	static int unthrottle_qos_cfs_rqs(int cpu);
   148	#endif
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
