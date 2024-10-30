Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A069A1BD9E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730325463; cv=none; b=kxgqAdmw/j2DiiJSnzeLYCpWbB0zGAt2+88dKEIukq24IvxzQklXriFKxAg7MpqynfJExDvX+dEtkH9Am6YDj9LX75JU0fiotwSD6NJ/qPYHfZ+uBfYHas/Xxwhgr9sHA3JqfbNWQ1W9Qb9i1VKeU30ZkK6whxrTip7QoO1NtVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730325463; c=relaxed/simple;
	bh=pmpsydG/KpSJxn9SnaLJUbD6bSXCkWe2yNquaGG16UI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hry+dQ2IT0r12KrpyoxKogOC+w7OotGyP+MHKs85qgbDkJuPQR2gIwY2xMkVTYz/VylC13c3VGjaBf2vH716OhdfD5NT5KX2yztnNke7wbm4RmyrZPzSjM8PK4CXIYAmGMOXm+wY7e/3YKo+5tn0JDqDaubJ6aKNgQ1oaYI4gK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZlXrWAO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZlXrWAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730325462; x=1761861462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmpsydG/KpSJxn9SnaLJUbD6bSXCkWe2yNquaGG16UI=;
  b=EZlXrWAOtmB0sFcVSC6wtAcu+aPwl25xpLnvaWt5eQmHsRtaoPVISyvY
   2RBCXrRhviXYnxsLwkNADta73vYiPrGngsOfsTV6ld4ipI4GFCqEjKv2B
   rpplrOV+NKngEPpIGgfIOFTLtODqR6E98fdchpdmPSZnhpBSwWWGpvyOX
   a4KxiKkbOly/0vwTLEbAyMioNEFimCwUA55NwxjyQjh7c77A49k5WbI9w
   7+m0GkO0IzGlCN+AZ7Dt+qB1bsASKpjVXrWvsk0Ecl5pUmrdu088635sI
   UgYYv8rVUaEj4+7G4v27kS5y3b49N9UaoEVy+rsnm1x3bORx2DlOfZ39M
   A==;
X-CSE-ConnectionGUID: 2Voc7o89TOi6M1EePvcLnw==
X-CSE-MsgGUID: xqos+v5ZSx2kE5fkyV+4Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29907693"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29907693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 14:57:41 -0700
X-CSE-ConnectionGUID: vp6a1f6jRou9ieBFBSoObA==
X-CSE-MsgGUID: hxAgZNkLRG6CRzQRS/Xdvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82094408"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2024 14:57:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Gh4-000fM4-0E;
	Wed, 30 Oct 2024 21:57:34 +0000
Date: Thu, 31 Oct 2024 05:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 46/98] kernel/sysctl.c:878:5: sparse: sparse:
 symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
Message-ID: <202410310559.6hkmngur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 89a8f0b629af6e892fe0541ed2d10fc5dc5daefc [46/98] vm: isolate max_map_count by pid namespace
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241031/202410310559.6hkmngur-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310559.6hkmngur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310559.6hkmngur-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:891:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:891:47: sparse:     expected void *buffer
   kernel/sysctl.c:891:47: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:878:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1051:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1051:45: sparse:     expected void *buffer
   kernel/sysctl.c:1051:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1809:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1809:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1809:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2186:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2186:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2186:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:312:66: sparse: sparse: self-comparison always evaluates to false

vim +/proc_dointvec_max_map_count +878 kernel/sysctl.c

   877	
 > 878	int proc_dointvec_max_map_count(struct ctl_table *table, int write,
   879			     void __user *buffer, size_t *lenp, loff_t *ppos)
   880	{
   881	
   882		struct do_proc_dointvec_minmax_conv_param param = {
   883			.min = (int *) table->extra1,
   884			.max = (int *) table->extra2,
   885		};
   886	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
