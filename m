Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B315CB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 03:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705893760; cv=none; b=hUmSnTqP8E90Gh3ndk7yO8+xPaHRSaBIRv6vPvkkOIBlsOxP3tTXqnCEC7ZAxHUl9VGVvHw7GmY+1pZE7UtYOdBR61XbwpLEjB0+ctQN7rkP1T3fX0O/dr6f1UeQcM1zM1inMuu1OS+WLf+i3SmYCHs3QLlLvgVepFd9yU9Hv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705893760; c=relaxed/simple;
	bh=RHnTqdXpuY9Bi2bbvXRFyFJQClSIO2F/uVOpwwrXjgY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3xW9xM0epF3TA4jdKEqeCnNSDemEFHlCYtP3l9MSJf+V/uIEVBLgdFqjRBlBr54Af143VuGAqa8h+qLlNkMG6d4Ms+FiEoAGSkaDwiWRCv1Gu4X3HnylyaClRkJN0eiOoJ72aDMlDuhScajr3iK3aCFUvPc6XdEht8hZQT1GK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOiuQGL+; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOiuQGL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705893757; x=1737429757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RHnTqdXpuY9Bi2bbvXRFyFJQClSIO2F/uVOpwwrXjgY=;
  b=iOiuQGL+7C6fQCq+yPfkESmOfV6LnnjgA9r38TyTfXCvCvwiUupptihX
   yWo2OSmx8bgM0LOgIjTUk/42wQCPeoHu8AQs34iBGIWRF21BY+rhZKpMN
   Nvg9sobxgeuODZ8AI6cpY03Aj6R38ZV6G3ow0T6BFVRnjgrS4/7Zkf9dq
   tu5J102YD519xqMpSi1ELzQIQZtr80AA8YWsoJA7irZe8hE41nQ5yXhk1
   gt5yICE3hcaBZniezY+4ABGfcJRDLE4qNXb5rH9Lj6+hZrGup+8z4VrRM
   xig1AJGrYFDjfTBluGLIewjfkTKQNhTfmzQ6G8rdIHy0C8RDGsC28C4CA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400746001"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="400746001"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 19:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="33914845"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Jan 2024 19:22:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRktN-0006NC-18;
	Mon, 22 Jan 2024 03:22:33 +0000
Date: Mon, 22 Jan 2024 11:22:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2128/2445] drivers/cpuinspect/sysfs.c:92:9:
 warning: no previous prototype for 'patrol_complete_show'
Message-ID: <202401221134.yXqn40h8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8d727c541fb1354691d382ff487a8c37162c75c2
commit: d91c6db8ca896824da23aab69dde9ce289222299 [2128/2445] cpuinspect: add CPU-inspect infrastructure
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240122/202401221134.yXqn40h8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401221134.yXqn40h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401221134.yXqn40h8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuinspect/sysfs.c:92:9: warning: no previous prototype for 'patrol_complete_show' [-Wmissing-prototypes]
      92 | ssize_t patrol_complete_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:98:9: warning: no previous prototype for 'cpu_utility_show' [-Wmissing-prototypes]
      98 | ssize_t cpu_utility_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:104:9: warning: no previous prototype for 'cpu_utility_store' [-Wmissing-prototypes]
     104 | ssize_t cpu_utility_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:117:9: warning: no previous prototype for 'patrol_times_show' [-Wmissing-prototypes]
     117 | ssize_t patrol_times_show(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:123:9: warning: no previous prototype for 'patrol_times_store' [-Wmissing-prototypes]
     123 | ssize_t patrol_times_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~
>> drivers/cpuinspect/sysfs.c:139:9: warning: no previous prototype for 'start_patrol_store' [-Wmissing-prototypes]
     139 | ssize_t start_patrol_store(struct device *dev, struct device_attribute *attr,
         |         ^~~~~~~~~~~~~~~~~~


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
