Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593C3201023
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 11:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730199962; cv=none; b=L+V+bO07jqjZ9WPAJpo286VqDjTfYWfr9Tlqk5sVyJJwJDjIHRKvA3VNWEWqL+MJP94ynIf48H9rSq3rfq14VZsNNZXrQICSboRjZNG7BgrO4xa/xkxJnKzTNfAUH5xtCAF9Q61F/zv/tBtGawE5U9CF/7OCevMIP5TTP8HgjOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730199962; c=relaxed/simple;
	bh=oFs5iC4MpL9fFh2E77aHPtJn18aLLOUHZvWdRLuSO00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWRU+AyMLDkvbXNdR6l/NHc6qG9Ox/0rLqfBkbXalkzNqkBAzzy55MKTqgtjPr053WzcwEKgJdvr5nEaIDTLouAC0h+6PyttXmEDdq1GD0aVerg6pdPT7Dk2IjzsGIj+5NLLtNB/mEcJFyTflgajlWtqJNR9k4xG6dOOqm0tNmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkX6DtWT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkX6DtWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730199961; x=1761735961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFs5iC4MpL9fFh2E77aHPtJn18aLLOUHZvWdRLuSO00=;
  b=LkX6DtWTxww0e81E+4vUe6cOpqmOkxbYdei+BS+Tq3pHzruTbLNF17u7
   aLPpOe/LOOsSCi8//2kPVePelbkSgtXuxGWnN5skevGaoLeuFa6u2IrvQ
   KrDjkl2iif4bU9zu+biFyqbnMF2LxPGPPR+m+nLqRuMZxbYJQduovmH0Q
   4mMM79e8yuFFFso4/D/UsSdhR+utqx1dlF5q8acO1cG6WGQbqIzeA8GE9
   w4VU9lbyg6FLrSjJgIEv09n+YRMo/AtAUz94u8H7/Gl6bQvf8JB3knzGi
   IdTbKCH3ZLejnr9g9pp2YRuMVbpo4Ym3nYZSbIm9IrRDTBuUX9E6zXRzI
   Q==;
X-CSE-ConnectionGUID: nk28QDS3SOGQT4cICRg3Mg==
X-CSE-MsgGUID: jqT7Hzc4SYGdIMaYca2Nsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="32687297"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="32687297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:05:58 -0700
X-CSE-ConnectionGUID: MVj7T1glSBO3h/A/9rIP1A==
X-CSE-MsgGUID: vK5InuUeRrCx/dOdWVOWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="82008604"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2024 04:05:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5k2q-000dZ2-0M;
	Tue, 29 Oct 2024 11:05:52 +0000
Date: Tue, 29 Oct 2024 19:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 46/98] kernel/sysctl.c:878:5: sparse: sparse:
 symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
Message-ID: <202410291808.9yfsZ7ur-lkp@intel.com>
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
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291808.9yfsZ7ur-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291808.9yfsZ7ur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291808.9yfsZ7ur-lkp@intel.com/

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
   887	#ifdef CONFIG_PID_NS
   888		table->data = &task_active_pid_ns(current)->max_map_count;
   889	#endif
   890	
 > 891		return do_proc_dointvec(table, write, buffer, lenp, ppos,
   892				do_proc_dointvec_minmax_conv, &param);
   893	}
   894	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
