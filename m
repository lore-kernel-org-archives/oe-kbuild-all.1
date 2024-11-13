Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0CE15ADA4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 19:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731524474; cv=none; b=mTQs+Rtf70yrWD3wrmjeLr0Rmehi19X7dLNcRoHLa8AvjlDIYGHToX5Xp36fFps5JqKZ/zBpyAwTKi/L7IHFY2CSfzLR5VvqrfKWnZQ3dxp8n7JAy/atIZqDxb0wp/NI6mSghGF15BgKDYMf4tY/mLiFgAlyJRcViSlV/pJQXkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731524474; c=relaxed/simple;
	bh=5rIERK+9Rg8vHkjvQ2zMZylGn5bCcZDRtTCnmBCONTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oAUEgMwjTCODBwe1YtUMRJYR1sk/zKYOFnNQeShVCMcrY1Ou6FLrSbJ161IJ2l7gvmLHyuhO0BF5pEc2KACrHqouhJKy2F5pQ0/Ve0EG1XWVF8pJN+fr1fdafE6mHyH/2BQcW1KTJyB3oJq5vcWv6+coIqoFAkZ/lG1+AWZTIus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCX/1iKQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCX/1iKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731524472; x=1763060472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rIERK+9Rg8vHkjvQ2zMZylGn5bCcZDRtTCnmBCONTE=;
  b=SCX/1iKQi5AmyEPKpRmu53OCyIfLMW57vwAOgfizIy4ckpZKSxTbWaqZ
   yzugW/+1tmt5h9/VNa3/Qwv5ma/tkFZaBFNnZUvFvVd3du9SRhvuqQb7J
   5P6u+fZYxpsXDdNMgzIct/7CXKozdVJr4TALfNgsG8ddcGEik3ESkISwB
   FQaTCDnUja2TsQCmD31ch1mjxP1L8A6FY5wuJoMmkxDabINu31Wr2Xc20
   tHkeckJhWrwtpaLStfUIgD5kg9JcUCvvyaU+1182LZvdFIuvS/kd4pEwt
   IcNLbWUhBIg7XzPPahjGhM7dAwGwAcDDsL+ruJkeKmvZ/QdT2xptnr+Yl
   Q==;
X-CSE-ConnectionGUID: jhkr683OTyqgMi96yAYNVg==
X-CSE-MsgGUID: z8ddNkNXSeaR/rfwPLiN1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48940911"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="48940911"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 11:01:12 -0800
X-CSE-ConnectionGUID: pH8YiZUaRXGHCAEVLpRoqA==
X-CSE-MsgGUID: GyHI51MLRZ+tajjV5zIVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; 
   d="scan'208";a="88767394"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2024 11:01:11 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBIc0-0000dn-1z;
	Wed, 13 Nov 2024 19:01:08 +0000
Date: Thu, 14 Nov 2024 03:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1466/1466]
 drivers/cpufreq/loongson3-acpi-cpufreq.c:89:12: warning:
 'lasx_count_threshold' defined but not used
Message-ID: <202411140232.Npxt3xRi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   19640fb08a2ccfb131121859517dfdbc6a04ccb6
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1466/1466] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-randconfig-001-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140232.Npxt3xRi-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140232.Npxt3xRi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140232.Npxt3xRi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpufreq/loongson3-acpi-cpufreq.c:645:5: warning: no previous prototype for 'loongson3_set_mode' [-Wmissing-prototypes]
     645 | int loongson3_set_mode(int mode, int freq_level)
         |     ^~~~~~~~~~~~~~~~~~
   drivers/cpufreq/loongson3-acpi-cpufreq.c:835:14: warning: no previous prototype for 'load_update' [-Wmissing-prototypes]
     835 | unsigned int load_update(struct core_data *core)
         |              ^~~~~~~~~~~
   drivers/cpufreq/loongson3-acpi-cpufreq.c:1520:36: warning: 'processor_device_ids' defined but not used [-Wunused-const-variable=]
    1520 | static const struct acpi_device_id processor_device_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/cpufreq/loongson3-acpi-cpufreq.c:89:12: warning: 'lasx_count_threshold' defined but not used [-Wunused-variable]
      89 | static int lasx_count_threshold = 200;
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/lasx_count_threshold +89 drivers/cpufreq/loongson3-acpi-cpufreq.c

    85	
    86	/* threshold of core's get into msa */
    87	static int msa_count_threshold = 200;
    88	/* threshold of core's get into lasx */
  > 89	static int lasx_count_threshold = 200;
    90	/* other cores' upper load threshold when 1 core get into boost mode and enable msa/lasx */
    91	static int load_threshold = 60;
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
