Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD522EB5A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519649; cv=none; b=syHRRr+jzcn7DUo8pbcB20Yr7eKhii6ZN/fY+7D9UBmWhA166Fc4GM4dgLyIG/ZBopYmwIgoNJNqBQjA8MUpyzKr0fzTrKhSgg3buDi68HEV/tmyT/b/TKQ1YkJHIqEsgC9jXN0hp1zEvJBi41A3PyaN0vdXTarNsG1Ilmn/khQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519649; c=relaxed/simple;
	bh=Sdk6xQnp3Tk58w+p+cLYzne1TLQ1er1IWO0LTD+hUqA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E2qOtVeRjHHYhkQE/IX1Pna4ml0P+Wm88cHTd9dC9jSUI/OhF0ET9T3oyigd22/ReZ36ngzX9XkY5ktCCnLfPbvyDsbOcRqGNyHwPtMmHU91EeZirQ4G8aHHZRO7KPdcHpTPyrIVijQSPfVlE6bdtzFcDgXOxObullPmYl8WWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsdMy1D2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsdMy1D2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766519648; x=1798055648;
  h=date:from:to:cc:subject:message-id;
  bh=Sdk6xQnp3Tk58w+p+cLYzne1TLQ1er1IWO0LTD+hUqA=;
  b=DsdMy1D2+J4zN2KTbFw6WMTF8LSZQ6iL5Rh201y7NbFKq5pdbkg5ojUx
   daDmjTjmxwOyr/XsfqMMgSGcpeHLdOYzKp106WZFmHm4RX/ZNoad7kxJg
   g1q7eA2pwa9Q9B2Evn9VjYWuQJchUVWQSrsYCAVI+2wPZm5JpY8j73jJI
   1+8Wh13F4lNEhq/klJbM1xtc0vDD6gUSf63MO3TBu6WiFB6CH2JB81lH7
   2zVjR6yQ35/9Xi1WePohK3j28aYcruE938nbXU75hk+WwvkQ9zIDyllN6
   rvQ9lt/vho8TWn9QNKmU7uHbyVIvvopa3A/HuifEbdrru1ssQW7mUwxlG
   Q==;
X-CSE-ConnectionGUID: 412iwi8xTuq3DlFSUvz76g==
X-CSE-MsgGUID: Rgn4csHqSlOzNBrR0DrkjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79731706"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79731706"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 11:54:06 -0800
X-CSE-ConnectionGUID: d4G0nTjTSfmYO4bhN0qkSQ==
X-CSE-MsgGUID: O4PmNUz0RTiZb8LJTIgpMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="200746721"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 11:54:04 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY8SC-000000002KD-10Nf;
	Tue, 23 Dec 2025 19:53:58 +0000
Date: Wed, 24 Dec 2025 03:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Liao <liaoyu15@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544]
 drivers/cpuinspect/sysfs.c:98:9: sparse: sparse: symbol 'cpu_utility_show'
 was not declared. Should it be static?
Message-ID: <202512240309.Ohc8FBKV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: d91c6db8ca896824da23aab69dde9ce289222299 [3544/3544] cpuinspect: add CPU-inspect infrastructure
config: x86_64-randconfig-r121-20251215 (https://download.01.org/0day-ci/archive/20251224/202512240309.Ohc8FBKV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240309.Ohc8FBKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512240309.Ohc8FBKV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/cpuinspect/sysfs.c:92:9: sparse: sparse: symbol 'patrol_complete_show' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:98:9: sparse: sparse: symbol 'cpu_utility_show' was not declared. Should it be static?
   drivers/cpuinspect/sysfs.c:104:9: sparse: sparse: symbol 'cpu_utility_store' was not declared. Should it be static?
   drivers/cpuinspect/sysfs.c:117:9: sparse: sparse: symbol 'patrol_times_show' was not declared. Should it be static?
   drivers/cpuinspect/sysfs.c:123:9: sparse: sparse: symbol 'patrol_times_store' was not declared. Should it be static?
>> drivers/cpuinspect/sysfs.c:139:9: sparse: sparse: symbol 'start_patrol_store' was not declared. Should it be static?

vim +/cpu_utility_show +98 drivers/cpuinspect/sysfs.c

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
   104	ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
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
   123	ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
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
