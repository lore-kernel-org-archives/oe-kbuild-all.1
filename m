Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E84401
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZB4JWLgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705302559; x=1736838559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oyWPyNoAJY1LRDGMfvPSsYHYm9ZX5hMLMwIufC0XBww=;
  b=ZB4JWLgJLe7xi0HHd3VIShP3QTbosskxXqEy5ZlRuDrivBP+lG/cLZ+Q
   Sgm5VcQD0WD4AZjvUuJy3zL2l8Y3GZGxyJqS+sm7avGgWTYvJaG2wtI15
   ka1b9x5Azb6Gis7BhQkGcpj33+hDBurcZTXT3cWZKcjfTPdstcyuW5Nh+
   i9WfnnqHCXHvlGjTkn5l4EVIJvkHjaUkLoVYuKSb98ZdmljtaI64nxPwi
   Q6htAlIkBX4fRMTwm+mWKhyGEUjZjPozHfyaz170+4yoIKZaHgE/RtAxc
   r1O3FLjHuno5L0bxxWSQj9/FV91DIZu/qprMgozKskwkM7BaNxBFyFnof
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6643929"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6643929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 23:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="25387955"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 14 Jan 2024 23:09:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPH3B-000CGc-2G;
	Mon, 15 Jan 2024 07:08:37 +0000
Date: Mon, 15 Jan 2024 15:02:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2126/2363] drivers/cpuinspect/sysfs.c:92:9:
 warning: no previous prototype for function 'patrol_complete_show'
Message-ID: <202401151438.dkhrK0Kt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cad90c54b607223b1e1a66c6dd504c4f1e15f2da
commit: d91c6db8ca896824da23aab69dde9ce289222299 [2126/2363] cpuinspect: add CPU-inspect infrastructure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240115/202401151438.dkhrK0Kt-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151438.dkhrK0Kt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151438.dkhrK0Kt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuinspect/sysfs.c:92:9: warning: no previous prototype for function 'patrol_complete_show' [-Wmissing-prototypes]
      92 | ssize_t patrol_complete_show(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:92:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      92 | ssize_t patrol_complete_show(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
>> drivers/cpuinspect/sysfs.c:98:9: warning: no previous prototype for function 'cpu_utility_show' [-Wmissing-prototypes]
      98 | ssize_t cpu_utility_show(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      98 | ssize_t cpu_utility_show(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
>> drivers/cpuinspect/sysfs.c:104:9: warning: no previous prototype for function 'cpu_utility_store' [-Wmissing-prototypes]
     104 | ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:104:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     104 | ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
>> drivers/cpuinspect/sysfs.c:117:9: warning: no previous prototype for function 'patrol_times_show' [-Wmissing-prototypes]
     117 | ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
>> drivers/cpuinspect/sysfs.c:123:9: warning: no previous prototype for function 'patrol_times_store' [-Wmissing-prototypes]
     123 | ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:123:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     123 | ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
>> drivers/cpuinspect/sysfs.c:139:9: warning: no previous prototype for function 'start_patrol_store' [-Wmissing-prototypes]
     139 | ssize_t start_patrol_store(struct device *dev, struct device_attribute *attr,
         |         ^
   drivers/cpuinspect/sysfs.c:139:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     139 | ssize_t start_patrol_store(struct device *dev, struct device_attribute *attr,
         | ^
         | static 
   6 warnings generated.
--
>> drivers/cpuinspect/sysfs.c:252: warning: Excess function parameter 'dev' description in 'cpuinspect_add_interface'
>> drivers/cpuinspect/sysfs.c:269: warning: Excess function parameter 'dev' description in 'cpuinspect_remove_interface'


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
   168	static ssize_t result_show(struct device *dev,
   169						struct device_attribute *attr,
   170						char *buf)
   171	{
   172		return sprintf(buf, "%*pbl\n", nr_cpu_ids, &result);
   173	}
   174	
   175	static ssize_t cpumask_show(struct device *dev,
   176						struct device_attribute *attr,
   177						char *buf)
   178	{
   179		return sprintf(buf, "%*pbl\n",
   180			       cpumask_pr_args(&ci_core.inspect_cpumask));
   181	}
   182	
   183	static ssize_t cpumask_store(struct device *dev,
   184					      struct device_attribute *attr,
   185					      const char *buf, size_t count)
   186	{
   187		ssize_t err;
   188	
   189		/*
   190		 * It is not allowed to modify cpumask during the CPU
   191		 * inspection operation.
   192		 */
   193		if (ci_core.inspect_on)
   194			return -EBUSY;
   195	
   196		err = cpulist_parse(buf, &ci_core.inspect_cpumask);
   197		if (err)
   198			return err;
   199	
   200		return count;
   201	}
   202	
   203	/*
   204	 * Tell userspace to handle result if one of the following conditions is met:
   205	 *	- Found fault core
   206	 *	- Inspection task completed
   207	 */
   208	void cpuinspect_result_notify(void)
   209	{
   210		struct device *dev_root = bus_get_dev_root(&cpu_subsys);
   211	
   212		if (dev_root) {
   213			sysfs_notify(&dev_root->kobj, "cpuinspect", "result");
   214			put_device(dev_root);
   215		}
   216	}
   217	
   218	static DEVICE_ATTR_RO(result);
   219	static DEVICE_ATTR_WO(start_patrol);
   220	static DEVICE_ATTR_RO(patrol_complete);
   221	static DEVICE_ATTR_RW(cpu_utility);
   222	static DEVICE_ATTR_RW(cpumask);
   223	static DEVICE_ATTR_RW(patrol_times);
   224	
   225	/* show and switch inspector */
   226	static DEVICE_ATTR_RO(available_inspector);
   227	static DEVICE_ATTR_RW(current_inspector);
   228	
   229	
   230	static struct attribute *cpuinspect_attrs[] = {
   231		&dev_attr_result.attr,
   232		&dev_attr_start_patrol.attr,
   233		&dev_attr_patrol_complete.attr,
   234		&dev_attr_cpu_utility.attr,
   235		&dev_attr_cpumask.attr,
   236		&dev_attr_patrol_times.attr,
   237		&dev_attr_available_inspector.attr,
   238		&dev_attr_current_inspector.attr,
   239		NULL
   240	};
   241	
   242	static struct attribute_group cpuinspect_attr_group = {
   243		.attrs = cpuinspect_attrs,
   244		.name = "cpuinspect",
   245	};
   246	
   247	/**
   248	 * cpuinspect_add_interface - add CPU global sysfs attributes
   249	 * @dev: the target device
   250	 */
   251	int cpuinspect_add_interface(void)
 > 252	{
   253		struct device *dev_root = bus_get_dev_root(&cpu_subsys);
   254		int retval;
   255	
   256		if (!dev_root)
   257			return -EINVAL;
   258	
   259		retval = sysfs_create_group(&dev_root->kobj, &cpuinspect_attr_group);
   260		put_device(dev_root);
   261		return retval;
   262	}
   263	
   264	/**
   265	 * cpuinspect_remove_interface - remove CPU global sysfs attributes
   266	 * @dev: the target device
   267	 */
   268	void cpuinspect_remove_interface(void)
 > 269	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
