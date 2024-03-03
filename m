Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9901DFCE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709492344; cv=none; b=BTKH8/k9RnTKH1fpZ3S5DZlF7BA1Hd22bso5yUZTBt186lSza+FZ1jBijdqHvTGp6eVb/gFgUylMOxtszyb5+hXYiNrnXy1bTXHUYuWMBIJQlFUjHOJL91MjvPINk47sH7mPvEC5I9wd4TXmRhcZrIxpBwm/QgOLbKF8+UOWthc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709492344; c=relaxed/simple;
	bh=SbzeXnKX9340Fv1ktHqt5sTSmHjJlbPmkZyGeXjTggc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhU7VWjPr9J/QoWi9tIp8aeLbU+Dvm23CueT1OUZ6k7Qg5DrH7NNb/+chI3MScffs5mOhEkD/T+Vns8UdxYaJj5MK0tmk7Jj9j50rld9vqjWkJe1RJI7eEr3ezK6f4BVvwaTlxGECJgcRpk+LAfFAqHzDL3oRr+Ozdx5x9lSteU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzAPIPcY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzAPIPcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709492343; x=1741028343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbzeXnKX9340Fv1ktHqt5sTSmHjJlbPmkZyGeXjTggc=;
  b=RzAPIPcY+jbi3sbVJLU7D/PXn4/YFp4/OB/djEu5c70YbVMgYzDx6bJ7
   gQdGwn6lpBl/1loxZM5DIM5S83iSE4RVmQuH03Ys+tou9tNzyOoXgxb6R
   2bXh9WkmRS1TNun6hp2gCSHRLzOzpsOx6bZuQdwLisR8zSFxn3W7MyTs9
   p9eGukLCdIL4NneKr7B8x6fNlE601LMsnBRBRBdBBq8YX3UaYS1nkF+B8
   nFRlVa3m/1HJIVlB+6PyCkKhIPsT6gubpoabJnU5raCvYQmUlynglsHrr
   uXbUpn04mHpSTLhOJkY71bVWXXWRaWPmxjO+wI1GHezeEUYZkjSRseKZ8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7788694"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="7788694"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 10:59:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13423714"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2024 10:58:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgr32-000220-0L;
	Sun, 03 Mar 2024 18:58:56 +0000
Date: Mon, 4 Mar 2024 02:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 13/98] kernel/sysctl.c:1033:45: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202403040201.RbLZa9tB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 95c98461d1dce7fd1d25f055c88ad639b0e3b7d7 [13/98] sysrq: add ALT+LEFTCTRL to trigger crash dump
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040201.RbLZa9tB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040201.RbLZa9tB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040201.RbLZa9tB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sysctl.c:1033:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1033:45: sparse:     expected void *buffer
   kernel/sysctl.c:1033:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1791:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1791:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1791:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:312:66: sparse: sparse: self-comparison always evaluates to false

vim +1033 kernel/sysctl.c

  1026	
  1027	static int sysrq_use_leftctrl_sysctl_handler(struct ctl_table *table, int write,
  1028			void __user *buffer, size_t *lenp,
  1029			loff_t *ppos)
  1030	{
  1031		int error;
  1032	
> 1033		error = proc_dointvec(table, write, buffer, lenp, ppos);
  1034		if (error)
  1035			return error;
  1036	
  1037		if (write)
  1038			sysrq_toggle_sysrq_key(__sysrq_use_leftctrl);
  1039	
  1040		return 0;
  1041	}
  1042	#endif
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
