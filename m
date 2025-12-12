Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F628B3E7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 22:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765577979; cv=none; b=FpwderjwpIxG5nf7P1NdCNIuVOZvqatwxu1jJyb9eDUPAQKsOmQIC9Yrw5yuuo+DjNm3aT1B17s4G6B5Z+w8eIsEJzpJQYTSa12jOnkzE5yKX8qCBGUSfJnKiBijOknZLsuSc3TyctyUAq0/dzHJeiaHm1P71uOb5HXHbXx55EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765577979; c=relaxed/simple;
	bh=/Ban17iSHmiHIeSsCAheof85bRCH4DwnKR6vKdwF2dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqumygSu14/a19oYbImxOgo39C7aBDap5GoIFdOKkHXW8DbboA7VFSBqdASIqLyeMVmGkZNR4JUEZWf8fYqfKdsQmPV4S27d12SX42fJTvrdQIcondZqpl0HBO+kw4Tq76D5ipwo5ZMtfiSOr8tucsSTYJdKRSjyHd9+/aHzH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSTOiAMv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSTOiAMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765577978; x=1797113978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ban17iSHmiHIeSsCAheof85bRCH4DwnKR6vKdwF2dQ=;
  b=dSTOiAMvN5+g5HNNYIXBYGrj98dZ0PCNCNmS9k1d2IP0QoPMlvzAdowR
   pVJfdlSfuOY6dPiAThfIKYYHVCrsZk8+HkPhVfwlk3Hq2Bl4zjQ57ih55
   6q4Xh6HHNgYalMWbLSiYeBv1wneW5pZfB2QXMMzd2u8Hwqfiyn26mkYQo
   ZQglXwNzewJzIymqae7kxNPCciYiLZd6WhGqeBuGvwmNfyhIy02rskizG
   nca2sqVI1L0/cQP4tvgqZ5WsVBatk9zuyrgmLfpp/+2S857Ad4TuSS5RO
   5CRmKiPoCiVW5yeaj6pOBuQ6fG6RhEzs5sd2QNTZVp5AcJdH38+d8aRjI
   Q==;
X-CSE-ConnectionGUID: CEihGl+ISkW4c9LAZGXcDQ==
X-CSE-MsgGUID: 24Sc6tW6SkGIpNTgDkh4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77901765"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77901765"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 14:19:35 -0800
X-CSE-ConnectionGUID: JaLmRvFxSLW1HzZq0lV8xw==
X-CSE-MsgGUID: bgSpscscSj664VBbtii3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="198016224"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 14:19:33 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUBU3-000000006gp-1lsE;
	Fri, 12 Dec 2025 22:19:31 +0000
Date: Sat, 13 Dec 2025 06:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Liao <liaoyu15@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] drivers/cpuinspect/sysfs.c:98:9:
 warning: no previous prototype for 'cpu_utility_show'
Message-ID: <202512130602.wgKjB7EZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: d91c6db8ca896824da23aab69dde9ce289222299 [3541/3541] cpuinspect: add CPU-inspect infrastructure
config: x86_64-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130602.wgKjB7EZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130602.wgKjB7EZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130602.wgKjB7EZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cpuinspect/sysfs.c:92:9: warning: no previous prototype for 'patrol_complete_show' [-Wmissing-prototypes]
      92 | ssize_t patrol_complete_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:98:9: warning: no previous prototype for 'cpu_utility_show' [-Wmissing-prototypes]
      98 | ssize_t cpu_utility_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:104:9: warning: no previous prototype for 'cpu_utility_store' [-Wmissing-prototypes]
     104 | ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~
   drivers/cpuinspect/sysfs.c:117:9: warning: no previous prototype for 'patrol_times_show' [-Wmissing-prototypes]
     117 | ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:123:9: warning: no previous prototype for 'patrol_times_store' [-Wmissing-prototypes]
     123 | ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:139:9: warning: no previous prototype for 'start_patrol_store' [-Wmissing-prototypes]
     139 | ssize_t start_patrol_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~


vim +/cpu_utility_show +98 drivers/cpuinspect/sysfs.c

    97	
  > 98	ssize_t cpu_utility_show(struct device *dev, struct device_attribute *attr,
    99				 char *buf)
   100	{
   101		return sprintf(buf, "%u\n", ci_core.cpu_utility);
   102	}
   103	
 > 104	ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
   105				  const char *buf, size_t size)
   106	{
   107		unsigned int cpu_util;
   108	
   109		if (kstrtouint(buf, 10, &cpu_util) || cpu_util < 1 ||  cpu_util > 100)
   110			return -EINVAL;
   111	
   112		ci_core.cpu_utility = cpu_util;
   113	
   114		return size;
   115	}
   116	
   117	ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
   118				 char *buf)
   119	{
   120		return sprintf(buf, "%lu\n", ci_core.inspect_times);
   121	}
   122	
 > 123	ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
   124				  const char *buf, size_t size)
   125	{
   126		/*
   127		 * It is not allowed to modify patrol times during the CPU
   128		 * inspection operation.
   129		 */
   130		if (ci_core.inspect_on)
   131			return -EBUSY;
   132	
   133		if (kstrtoul(buf, 10, &ci_core.inspect_times))
   134			return -EINVAL;
   135	
   136		return size;
   137	}
   138	
 > 139	ssize_t start_patrol_store(struct device *dev, struct device_attribute *attr,
   140				  const char *buf, size_t size)
   141	{
   142		bool start_patrol = false;
   143	
   144		if (strtobool(buf, &start_patrol) < 0)
   145			return -EINVAL;
   146	
   147		if (!mutex_trylock(&cpuinspect_lock))
   148			return -EBUSY;
   149	
   150		/*
   151		 * It is not allowed to start the inspection again during the
   152		 * inspection process.
   153		 */
   154		if (start_patrol && (int) start_patrol == ci_core.inspect_on) {
   155			mutex_unlock(&cpuinspect_lock);
   156			return -EBUSY;
   157		}
   158	
   159		if (start_patrol == 0)
   160			stop_inspect_threads();
   161		else if (curr_cpu_inspector)
   162			start_inspect_threads();
   163	
   164		mutex_unlock(&cpuinspect_lock);
   165		return size;
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
