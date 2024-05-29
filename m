Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D06128E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716957639; cv=none; b=mC8mtHPDGjUS1SkgBWgd2ICzLxAtdrjgPowegAvnYSWgIPdjky5r6DIZwJaDn0ZwXhn8iuj5B2XQ0ecIJaBTWRCHzDUqlvsuzXzKPMSm4zcKLQwPVdmE5czJAO/xoA97p4qOTq0fCK/TaUZtVGj5XwUgDZ1tTWBfvBmsyx68ULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716957639; c=relaxed/simple;
	bh=a0O+Xu+FqGDE+fhxmmkI4u12Bh8CmNc+MEn333tCOnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RvwwUOZNO7LfafuR8my/OQUPpyrQYcHa0WbaZxuwA9pGY6Y/uh73BQhg2SiHbY4CGfTmh3SY+Mz54UfNaWCbxILGVTK7/INQdyIfLdwtp8fN71z4MblW5Z+vqgm7Xpw42C7sFYA9/VPTGni4SIbbm+wLNCPCAv0HOWVEd3E9n8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMk5KQUk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMk5KQUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716957637; x=1748493637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a0O+Xu+FqGDE+fhxmmkI4u12Bh8CmNc+MEn333tCOnM=;
  b=YMk5KQUkxygISnH7wRX32qxL3Da2nP1T/8tO68vR7Md8bkMLEQSDzAFf
   hCzeZuSQIPUPebX+yawSZg6egdqshIzb0uaizb1+vQhodq5bxSbL+rb5o
   R58E7UQc+kHmQWTeEYUW3B6QpC3mw+S/V8RuDBeDdqTeI52N/waTNUE5g
   3UKjknje12NtYlDTOUyB6/0hY7HMPMl/KSoVtxuigXpLyw7/q7I7Em78w
   V54dEIgYX4MjNQ4SV2d7en//m1RiGHm8taaH033m9aoKrNbR3pxUFHpT0
   eyAKE9LClxlWkIDnH1phulF7AmVOl8Qj9dQWnkR57S6SJs6c2QCeIe1fT
   Q==;
X-CSE-ConnectionGUID: BVv5CP3VQOSqWq7nV8jeBg==
X-CSE-MsgGUID: H49v5vH/Q3OMtpJ65jhbGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13564575"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13564575"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 21:40:37 -0700
X-CSE-ConnectionGUID: NwXSPwDgQ5+RbeQezZeuDg==
X-CSE-MsgGUID: i3PQUjLtRre7VRiXFi5+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39732958"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2024 21:40:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCB6n-000D7X-1n;
	Wed, 29 May 2024 04:40:23 +0000
Date: Wed, 29 May 2024 12:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 20/20]
 drivers/base/arch_topology.c:214:72: error: 'struct device' has no member
 named 'id'
Message-ID: <202405291237.7x6ILymf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   f37061809bb98e131179785e0d1ff3fe5bfbd819
commit: f37061809bb98e131179785e0d1ff3fe5bfbd819 [20/20] driver core: Remove struct device::id
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240529/202405291237.7x6ILymf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291237.7x6ILymf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291237.7x6ILymf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/base/arch_topology.c: In function 'cpu_capacity_show':
>> drivers/base/arch_topology.c:214:72: error: 'struct device' has no member named 'id'
     214 |         return sysfs_emit(buf, "%lu\n", topology_get_cpu_scale(cpu->dev.id));
         |                                                                        ^
>> drivers/base/arch_topology.c:215:1: warning: control reaches end of non-void function [-Wreturn-type]
     215 | }
         | ^


vim +214 drivers/base/arch_topology.c

c214f124161d44 Lukasz Luba     2021-11-09  207  
2ef7a2953c81ee Juri Lelli      2017-05-31  208  static ssize_t cpu_capacity_show(struct device *dev,
2ef7a2953c81ee Juri Lelli      2017-05-31  209  				 struct device_attribute *attr,
2ef7a2953c81ee Juri Lelli      2017-05-31  210  				 char *buf)
2ef7a2953c81ee Juri Lelli      2017-05-31  211  {
6f79f7fa3f4de7 Bart Van Assche 2024-05-28  212  	struct cpu *cpu = to_cpu(dev);
2ef7a2953c81ee Juri Lelli      2017-05-31  213  
aa838896d87af5 Joe Perches     2020-09-16 @214  	return sysfs_emit(buf, "%lu\n", topology_get_cpu_scale(cpu->dev.id));
2ef7a2953c81ee Juri Lelli      2017-05-31 @215  }
2ef7a2953c81ee Juri Lelli      2017-05-31  216  

:::::: The code at line 214 was first introduced by commit
:::::: aa838896d87af561a33ecefea1caa4c15a68bc47 drivers core: Use sysfs_emit and sysfs_emit_at for show(device *...) functions

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
