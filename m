Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF2486AE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714040577; cv=none; b=F8Gf4fI81zWsVhgnGT+SGJSZj6NRO3d3w3TwitvDN+uH9yyjLnHxZoDlScwBmVEb3wft8YxjUj4No/jjnEr09AQeWt/Ms5rv8Cst4x5p8ps9WtjZwpBr5oq9HwS5wfkUQ7mmIHZ3fsiDTxCx8QH/k4BtoYja3WVes3oy5l+YVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714040577; c=relaxed/simple;
	bh=I8Utgubg05SQUfrLqwAjYCls0jh/dmiHPshk1Kjb8DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ce40gsr1EoA22p3k/1ZUS/9nlf3s8jJud2RWc5DihbdtIuroWBsqUGOtprDONNP2AHswExPF48nOmKCHVye6TJolV0SIahOBqo6ghHzXjJF0SX7iZTbgYnT7dskgi4gljdLqjnHlE0VQlTd0f+Br/8DMSwxdxtgVCuOOZwzFwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htDGjdVn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htDGjdVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714040576; x=1745576576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8Utgubg05SQUfrLqwAjYCls0jh/dmiHPshk1Kjb8DQ=;
  b=htDGjdVn97sjC2Mwm8nJ3I9lGdu5nMKe2jw0J32m5JZznSLGPNGRHK+G
   1vOglGZ3qjAFaFWKVO+FyBHuhZXJYX1CzZ1OPRvQHAtyvREcLXGyd+MgM
   AVWRM55oDfnSrFJw5zr60hTgSSKdEbS7WBd23Ihc3w5XIlA5lV3N4qMxt
   n+s9HOYF6Uw8QmkFYWOq6s/TpVFbV9ysn4/uTC+K2Uf61ZZqJmlds6PF9
   PaXF0+/hc+JO9dV2+VNDXFovzDEdYAAi1kXGJGKPp+rJbAQIoxHRPcauj
   g010+5yrkPBSPSTRUMBwqOSwdrEC2T0kpEvcEyeXROxc5F8XuTx1y8seQ
   g==;
X-CSE-ConnectionGUID: rccWzfj1QDuOz2faiejJPQ==
X-CSE-MsgGUID: tqfoIfOlT5yqrNC209cF4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35111702"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="35111702"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:22:55 -0700
X-CSE-ConnectionGUID: j4sJiLUxRmuWQhzZ3o4JAA==
X-CSE-MsgGUID: hAwJMohXTLGAOaoFrFvRRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="29652867"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2024 03:22:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzwFf-0002GO-2V;
	Thu, 25 Apr 2024 10:22:51 +0000
Date: Thu, 25 Apr 2024 18:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/6]
 drivers/base/arch_topology.c:226:2: error: implicit declaration of function
 'trace_android_rvh_cpu_capacity_show' is invalid in C99
Message-ID: <202404251822.wStCNYSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   1ee7deeefc44498ddedd4256528fd49383d26bd1
commit: 915f526315bb4c89edbcc0ea31f4f1ca3a1dae60 [5/6] ANDROID: topology: Add restricted vendor hook for cpu_capacity_show
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240425/202404251822.wStCNYSM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251822.wStCNYSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251822.wStCNYSM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/arch_topology.c:226:2: error: implicit declaration of function 'trace_android_rvh_cpu_capacity_show' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           trace_android_rvh_cpu_capacity_show(&capacity, cpu->dev.id);
           ^
   1 error generated.


vim +/trace_android_rvh_cpu_capacity_show +226 drivers/base/arch_topology.c

   218	
   219	static ssize_t cpu_capacity_show(struct device *dev,
   220					 struct device_attribute *attr,
   221					 char *buf)
   222	{
   223		struct cpu *cpu = container_of(dev, struct cpu, dev);
   224		unsigned long capacity = topology_get_cpu_scale(cpu->dev.id);
   225	
 > 226		trace_android_rvh_cpu_capacity_show(&capacity, cpu->dev.id);
   227		return sysfs_emit(buf, "%lu\n", capacity);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
