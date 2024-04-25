Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4555A0F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714027970; cv=none; b=oI2vYyEE0tUxh18TgUzhF286UtUCXy/DBvWsIStRK1BilY1UH4O4fYqkzFGzmTUYDl+oVxmui2v3cqou9+1M+bbz0nCvdgXNtB6e0qLVMtoJ9mvnKvCytzF63ke8f5QgdIaCrvyxWZHn1OEDeLrIyJx0jNn92o0jcQJjlFfAgbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714027970; c=relaxed/simple;
	bh=3ydQdWf+HlWw606K33zNKZ9l06bAkx0c7nlFYPoxlg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTU8tFVv9L8/kcjhDL31myCKizXypyKKqILPFmVkDfHnGNGKoa1GMTQWirNnci5YNaeueBCjtWkSobayFL8fP9TmsMJk+ww9Dv7XRrhofK0UDJL0LZzcx88pzT23FR2nGzJjJelqu1fcZbqe1sft5salJZnlvPN5OQik7zmTXC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxiZa8lN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxiZa8lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714027968; x=1745563968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ydQdWf+HlWw606K33zNKZ9l06bAkx0c7nlFYPoxlg0=;
  b=HxiZa8lNXU1jLlWKIGHInylU2eXP/r7rUlo3lkTANACgLYTJarnOAJG5
   mRkbbLaHTkWIdgwQH2vaNiNF3EC6+ctDbyUjLrs5xNu0pDSeaLtGpdP5u
   OMH+XQpTaZ+NyiDsflRwVn1MMG+yK6RCyozxL8lMjL4qu5js5YMNSh6LG
   g/r5sRe+fiQHPjIFVMPV6Bh792GEA/fw+y/n8cKbzAIDO9Ufcw4J/XM3a
   mseTFeg2vZh9GCLooZnzapIAcfepIxd/4y7geZ/DtXSLNNRUiGQePj4MD
   FggFbhTDJRjczKwKt//P3UA5cUFj/GdeoFuldLDjlFFFNpjRn2QPvdBxX
   g==;
X-CSE-ConnectionGUID: 3VqRw6gfR0a+4TWx8OehvQ==
X-CSE-MsgGUID: CO+J2u+cSNmCiAvs+72l7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20241131"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="20241131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 23:52:48 -0700
X-CSE-ConnectionGUID: UQPlJ3L2RNuepUvZwAaWeA==
X-CSE-MsgGUID: oKzK8s/VRCiGoKaV+d65bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="29430577"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Apr 2024 23:52:46 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzsyK-00025s-1W;
	Thu, 25 Apr 2024 06:52:44 +0000
Date: Thu, 25 Apr 2024 14:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/6]
 drivers/base/arch_topology.c:226:9: error: implicit declaration of function
 'trace_android_rvh_cpu_capacity_show'; did you mean
 'android_rvh_cpu_capacity_show'?
Message-ID: <202404251424.6Re1CBWr-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240425/202404251424.6Re1CBWr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251424.6Re1CBWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251424.6Re1CBWr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/arch_topology.c: In function 'cpu_capacity_show':
>> drivers/base/arch_topology.c:226:9: error: implicit declaration of function 'trace_android_rvh_cpu_capacity_show'; did you mean 'android_rvh_cpu_capacity_show'? [-Werror=implicit-function-declaration]
     226 |         trace_android_rvh_cpu_capacity_show(&capacity, cpu->dev.id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         android_rvh_cpu_capacity_show
   cc1: some warnings being treated as errors


vim +226 drivers/base/arch_topology.c

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
