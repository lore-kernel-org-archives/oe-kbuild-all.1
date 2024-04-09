Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE9158D66
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 22:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712703075; cv=none; b=OQw8W9Q7qiZhNxtLphVHccDCm83XsxEigAXfW9X1VggZMnhaI083RYAjzOvjuAqzWZ9YyMK5YFCaj5UqYcT+PHpLm6/ZtTZDF1nK0Jsue4AU6oDFCKxpGVHxZq+PcYwueBL8Ph9Sm9vYSdpBu9wp3yorzT72VcHHpOBuuwCTWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712703075; c=relaxed/simple;
	bh=rXrlqd3Ot5QvjPaQ5jAwi3NeK8jdOPQwuBJhoX4Z7BU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XfcHf15sDou/C7hT1pdCzUBaYJxIBqI1Li4yQw9wKwvhQNof33fHz6PdMWn/FRnoePgXjvXZgbwMlHkxzNBInvf9dhpj7NSgo0iIE3TWXdBVIx/9I/SRaKNqhEhMCe6h2hLjR+PcNsQ/ojsp6sHHhk6owrdw1JWfoKDt+hH1Ris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QA2ka/J4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QA2ka/J4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712703074; x=1744239074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rXrlqd3Ot5QvjPaQ5jAwi3NeK8jdOPQwuBJhoX4Z7BU=;
  b=QA2ka/J4ZKRR/91UO7YKH/zcP+Atf/vhWZqpN62cy0zughvem4W96E1V
   r3Bz/q/E/0dWUTjaVLRn2pl4e9guHzA4TeQvA1bBQzRjmqrPNrWgFh5Sy
   ZaOqL7kwX/tVuze1wYfuhFXmMsukxPShwWM3kfUpLpbRXkB2kI3+jBx4Q
   w1lvAGMK6TJt20Fg8mRYwN0Lt0bIcwMwdaNL6j00sORCMUW1I9mJJJYxd
   4ooQbaYrDYDPxmrJq9fD8APJIqyk247CZKsHlW7yJFjF36fWdHU1wadQY
   KfbY7C5XkbZfZBFOg8WT9+NBtWBK9a1Gnhon+jnx550kwR8s3q/dCURxm
   Q==;
X-CSE-ConnectionGUID: gyN6YmKFQ2GOsRr5K+scxA==
X-CSE-MsgGUID: WLXE1VAvTbC5do+Su7OGQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11884119"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11884119"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 15:51:11 -0700
X-CSE-ConnectionGUID: lt4IdXNhTzGDqI2LW506sw==
X-CSE-MsgGUID: 3CfsIiPnSsayFdQ6yYBUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20337145"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2024 15:51:08 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruKJ0-0006ai-1T;
	Tue, 09 Apr 2024 22:51:06 +0000
Date: Wed, 10 Apr 2024 06:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/7334]
 drivers/cpufreq/loongson3-acpi-cpufreq.c:93:1: sparse: sparse: symbol
 '__pcpu_scope_msa_count' was not declared. Should it be static?
Message-ID: <202404100627.ugFjSuPi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   830c644d6e307456c2e77e6ce8bd6f1cf1ddc351
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/7334] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-randconfig-r123-20240410 (https://download.01.org/0day-ci/archive/20240410/202404100627.ugFjSuPi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240410/202404100627.ugFjSuPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100627.ugFjSuPi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:93:1: sparse: sparse: symbol '__pcpu_scope_msa_count' was not declared. Should it be static?
   drivers/cpufreq/loongson3-acpi-cpufreq.c:169:3: sparse: sparse: symbol 'all_package_data' was not declared. Should it be static?
   drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: sparse: sparse: symbol 'loongson3_set_mode' was not declared. Should it be static?
   drivers/cpufreq/loongson3-acpi-cpufreq.c:835:14: sparse: sparse: symbol 'load_update' was not declared. Should it be static?
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

vim +/__pcpu_scope_msa_count +93 drivers/cpufreq/loongson3-acpi-cpufreq.c

    92	
  > 93	DEFINE_PER_CPU(unsigned long, msa_count);
    94	EXPORT_PER_CPU_SYMBOL(msa_count);
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
