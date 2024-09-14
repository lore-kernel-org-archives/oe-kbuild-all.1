Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8347F7A15A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726312260; cv=none; b=MhgwNmxXkJuoWAGjRjrvKHw7aJUzX+JTy6EKtLnFbgmJnySAacpg7xJCJqU1tKntqKbchyVcJLLGt4yF1gq/h6LcttoWCywxAc5pE8U9RwSIUx3ymYVqDUimKFvyMWMIuSsnyefKte7gtWPHv1AvB/pUxBIh/Hz78iFYrHcyicU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726312260; c=relaxed/simple;
	bh=m5O+bW3S77QwKD4n9NC8ZOWiOJkkcBT3z250zXKHcSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EQqcjNILksk6cUAstAtqVElwPJRrwbUV3v4FnFVICoOjac58a7p667d9vxlfG7XtttT32U3eXn3HJtpyxwPkeMdCgC8VggNFwf67q7UBxG0j2FSxK76NX2jlAPHVRYD5EVK5zgeHEisQXxVeAqGveNHAUeJZOKA03ZIWuPzZdBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b53XQ0MT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b53XQ0MT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726312259; x=1757848259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5O+bW3S77QwKD4n9NC8ZOWiOJkkcBT3z250zXKHcSM=;
  b=b53XQ0MTckh/VkLtHp5bsdp0WbnZRH2iCwtxfk61r24Iy61a9tw1VN8t
   imoDtYPC4Xi4jLaA1dGZtpC2v47jSQO6ZaEEK/AzMeAWzWLCyxAM9Onuw
   c0TcxyAcMqu4EtEux7H8PQizUzJHHyYwCuMVtRQIPR0vAT1cJhK0P26fm
   gtZ/pMnjgO2rJjz/x0rd0tcvZcM7K6FILPBpLYqfOL3NmjX5fImc4mZAh
   fto1149u0+LXg4qI8MtBJ4eQq6Nv0xQfyxbiZS8NcCuwKVfgBYbNDNu6Q
   mX/ZenD7cVwuvkDtzUyFIGkIIVH/YIib1/q4X1RY76sTs8j9cxkSWmkLy
   A==;
X-CSE-ConnectionGUID: Qd4WyRxYQDqRfZoJxc5lDw==
X-CSE-MsgGUID: QSmBDrkLRmSGlLlO51dJJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25148518"
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="25148518"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 04:10:58 -0700
X-CSE-ConnectionGUID: /IhQqtDCRe6tBCJvyVYqQQ==
X-CSE-MsgGUID: L2r6CUHwTzW1Sq3XX1K1Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="72973235"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Sep 2024 04:10:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spQg2-0007go-1Q;
	Sat, 14 Sep 2024 11:10:54 +0000
Date: Sat, 14 Sep 2024 19:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Liao <liaoyu15@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2153/13948] drivers/cpuinspect/sysfs.c:92:9:
 sparse: sparse: symbol 'patrol_complete_show' was not declared. Should it be
 static?
Message-ID: <202409141939.mPFkQsG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   1910604f7315d411c0c10359055daddee968441f
commit: d91c6db8ca896824da23aab69dde9ce289222299 [2153/13948] cpuinspect: add CPU-inspect infrastructure
config: loongarch-randconfig-r133-20240913 (https://download.01.org/0day-ci/archive/20240914/202409141939.mPFkQsG4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409141939.mPFkQsG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409141939.mPFkQsG4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cpuinspect/sysfs.c:92:9: sparse: sparse: symbol 'patrol_complete_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:98:9: sparse: sparse: symbol 'cpu_utility_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:104:9: sparse: sparse: symbol 'cpu_utility_store' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:117:9: sparse: sparse: symbol 'patrol_times_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:123:9: sparse: sparse: symbol 'patrol_times_store' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:139:9: sparse: sparse: symbol 'start_patrol_store' was not declared. Should it be static?
--
>> drivers/cpuinspect/inspector.c:34:22: sparse: sparse: symbol 'prev_cpu_inspector' was not declared. Should it be static?
   drivers/cpuinspect/inspector.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/patrol_complete_show +92 drivers/cpuinspect/sysfs.c

    91	
  > 92	ssize_t patrol_complete_show(struct device *dev, struct device_attribute *attr,
    93				 char *buf)
    94	{
    95		return sprintf(buf, "%d\n", !ci_core.inspect_on);
    96	}
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
 > 117	ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
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
