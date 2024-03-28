Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515154A18
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711622288; cv=none; b=eHzIlqzKFwAnNeO26aafaJxNJnRw0cJMqhHQqewkA/Ki2Zydjc9U9QGSF3pEx74gRgJO5AL2YRasdFycA9L7Y8pfw39MJZ2i199F+C/Xjg9mA67jAjbtD2Y5umxfBeaauLOzszyuUK07LXUQMdjp2xF5fR2zPNk7z+z2VXpxWoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711622288; c=relaxed/simple;
	bh=FFuq2mNrqUT1iReNnrTOy77yWwWPMZrRXb4AFQYhuCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBFU1U+EK3j9ufhgJ8Z2/HGwCUx6TMEW0WTh/+/t4zmPi2HGkDxkmTWWqyFlSHULqS3i70K5H43HVh3WGzNPWqXkoguqdADz4nBHirHtvdA2QjLmNvLiO3wKA9UiPULOVvHlZcfIce8dyv0wehynpf/UFrHb51Jb6glpsBbBtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFJ36wDm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFJ36wDm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711622285; x=1743158285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFuq2mNrqUT1iReNnrTOy77yWwWPMZrRXb4AFQYhuCE=;
  b=fFJ36wDm4t+LBwRs5z7ErFjrkHGLYcdpv+Sp3nRA75p8th+8+ikKI/Ps
   W94aitSbApupFb+j8zZfDZIZa4wvknYVzNgYqqEFOUHqgEwXTU3pgBBkZ
   ehBJWX74oWn0i2wioJmGzgxlWxmOYG9hHwAf1BZ9zQ/EvpUd1zBHhbK1b
   giouPL30JbvtxgR4jOvf1ID4uDKU9fMkzRLdooA833U22QAMlMJfaKQvy
   97W6hmWVWB+SD6X8ZhY9nXYVEPbnnMZ1BHWWvOR7ZG2ADKnruOE2KyWUT
   82Hr+B9vx+DaoI3IetkINf2HEshx/gUI/WhGEx2cZMeRMHgDt9McS5BhK
   g==;
X-CSE-ConnectionGUID: XgllpLHkQc21MuysqEtapg==
X-CSE-MsgGUID: rS1iN6+RQn2PN5KSca9zLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="9724895"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="9724895"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 03:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="54048197"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2024 03:38:04 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpn8z-00023m-0G;
	Thu, 28 Mar 2024 10:38:01 +0000
Date: Thu, 28 Mar 2024 18:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/6998]
 drivers/cpufreq/loongson3-acpi-cpufreq.c:169:3: sparse: sparse: symbol
 'all_package_data' was not declared. Should it be static?
Message-ID: <202403281803.cHWLgiB2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a22ee16da0b46a53cf62e5915dec6c5cfbcc5ad6
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/6998] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-randconfig-r113-20240328 (https://download.01.org/0day-ci/archive/20240328/202403281803.cHWLgiB2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240328/202403281803.cHWLgiB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281803.cHWLgiB2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:169:3: sparse: sparse: symbol 'all_package_data' was not declared. Should it be static?
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: sparse: sparse: symbol 'loongson3_set_mode' was not declared. Should it be static?
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:835:14: sparse: sparse: symbol 'load_update' was not declared. Should it be static?
   drivers/cpufreq/loongson3-acpi-cpufreq.c: note: in included file (through arch/loongarch/include/asm/loongarch.h, arch/loongarch/include/asm/cpu-info.h, ...):
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:322:3: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrwr_w'
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:25: sparse: sparse: undefined identifier '__builtin_loongarch_iocsrrd_w'
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:25: sparse: sparse: undefined identifier '__builtin_loongarch_cpucfg'
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:284:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type
   ../lib/gcc/loongarch64-linux/13.2.0/include/larchintrin.h:107:11: sparse: sparse: cast from unknown type

vim +/all_package_data +169 drivers/cpufreq/loongson3-acpi-cpufreq.c

   161	
   162	struct package_data {
   163		int boost_cores;
   164		int max_boost_cores;
   165		int nr_cores;
   166		char in_boost;
   167		int nr_full_load_cores;
   168		struct core_data core[MAX_CORES_PER_PACKAGE];
 > 169	} all_package_data[MAX_PACKAGES];
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
