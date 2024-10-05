Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E8B1C6B2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 03:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728100740; cv=none; b=j0gd1JUu+EmTd4do42vwQKsbEJm2f9jqLTcEpFKema8kUZL9UBc4H5aTYFFV6J09acNAV9i1HMUDkfVe/6SkimcYUWZOL6BBF3NMnzlzrJJ5EHV+I77Ba9ZdYh0M8/aNDsD0LvhMI3oKY8YbpIYp+Oq4c/A7CjtK4AxKfhDrjBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728100740; c=relaxed/simple;
	bh=a0wlXcQRqfMHf8vs0EoolLj01U6bRRNu5k54XiU7gY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK1gcP2rh4pYgQmH4dM13ial6d11qCov6QRLLBponKL9peTb7hX7dfq6XFyUk3DL4v0W2bKWIoiU4w5CT+GxgKat8VZqhdbNWNB4ewd+Ffu+sDNFGoBVvQaUNtcXvmlbFFU+KBBCnH+QB19/OmU7dhoHOR8lhZSN21AdoSHiYs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROWtk61m; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROWtk61m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728100738; x=1759636738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a0wlXcQRqfMHf8vs0EoolLj01U6bRRNu5k54XiU7gY0=;
  b=ROWtk61mfGwG+8Ypvo8XzJcjlAMgZya2vD2c0xOyd2T1iDtIg4xqnvei
   5Z3/HjC4pcgHpVEAKFYdjXrcyEhbTGMoB94RiIBf9ilEtGcegQPwODD+E
   CEQzfZkNxKTSaj9WqpvGvhHh+SOPhyb6K0+/pEj82P8kpJ7L9rarAYc9V
   5YbpCO88VAoUq2HfGyVbHDwsofp1PY1qI/2DUkU+HATi71tulPWcRKVbX
   qKCOPsutwTpQzIlSDyZOkMom93FRzUQuoKgNR3GE8BW5vjSL9xD2wt/Gz
   +el4WUP3b5EJ/KRdVh0VunEVcVBoLLM8NMQiqH803AfXF4dVKah8iw/OU
   Q==;
X-CSE-ConnectionGUID: xaQ6nMDtRHytekORJt8LEA==
X-CSE-MsgGUID: ljldYChtRJ+fetP0za/vxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="44855840"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="44855840"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 20:58:57 -0700
X-CSE-ConnectionGUID: aAzApmCrTu6OoAoqQx6ExQ==
X-CSE-MsgGUID: 0R9hWbQvTLmatetu2TJ/tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74882841"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2024 20:58:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swvwR-0002XW-27;
	Sat, 05 Oct 2024 03:58:51 +0000
Date: Sat, 5 Oct 2024 11:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11997/12031] kernel/sysctl.c:1964:5: sparse:
 sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be
 static?
Message-ID: <202410051113.ARgT0WJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: db44c11cddf0fc44d68950c9a428511637445aa4 [11997/12031] rue/mm: add priority reclaim support
config: x86_64-randconfig-123-20241005 (https://download.01.org/0day-ci/archive/20241005/202410051113.ARgT0WJv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051113.ARgT0WJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051113.ARgT0WJv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:1003:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1003:47: sparse:     expected void *buffer
   kernel/sysctl.c:1003:47: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:990:5: sparse: sparse: symbol 'proc_dointvec_max_map_count' was not declared. Should it be static?
   kernel/sysctl.c:1163:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1163:45: sparse:     expected void *buffer
   kernel/sysctl.c:1163:45: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1915:15: sparse: sparse: symbol 'security_switch_min' was not declared. Should it be static?
   kernel/sysctl.c:1916:15: sparse: sparse: symbol 'security_switch_max' was not declared. Should it be static?
   kernel/sysctl.c:1924:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1924:52: sparse:     expected void *buffer
   kernel/sysctl.c:1924:52: sparse:     got void [noderef] __user *buffer
   kernel/sysctl.c:1918:5: sparse: sparse: symbol 'security_switch_handler' was not declared. Should it be static?
   kernel/sysctl.c:1976:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1976:52: sparse:     expected void *buffer
   kernel/sysctl.c:1976:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:1964:5: sparse: sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be static?
   kernel/sysctl.c:1997:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:1997:52: sparse:     expected void *buffer
   kernel/sysctl.c:1997:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:1991:5: sparse: sparse: symbol 'memory_qos_sysctl_highest_reclaim_prio_handler' was not declared. Should it be static?
   kernel/sysctl.c:2015:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *buffer @@     got void [noderef] __user *buffer @@
   kernel/sysctl.c:2015:52: sparse:     expected void *buffer
   kernel/sysctl.c:2015:52: sparse:     got void [noderef] __user *buffer
>> kernel/sysctl.c:2007:5: sparse: sparse: symbol 'memory_qos_sysctl_prio_reclaim_ratio_handler' was not declared. Should it be static?
   kernel/sysctl.c:2045:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2045:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2045:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2054:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2054:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2054:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2063:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2063:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2063:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2072:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2072:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2072:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2081:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2081:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2081:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2090:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2090:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2090:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2099:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2099:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2099:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2108:36: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2108:36: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2108:36: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2267:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2267:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2267:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2736:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2736:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2736:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2902:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2902:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2902:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2911:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2911:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2911:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2920:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:2920:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:2920:35: sparse:     got int ( * )( ... )
   kernel/sysctl.c:353:66: sparse: sparse: self-comparison always evaluates to false

vim +/memory_qos_sysctl_handler +1964 kernel/sysctl.c

  1962	
  1963	#ifdef CONFIG_MEMCG
> 1964	int memory_qos_sysctl_handler(struct ctl_table *table, int write,
  1965			void __user *buffer, size_t *lenp, loff_t *ppos)
  1966	{
  1967		int error;
  1968	
  1969		mutex_lock(&rue_mutex);
  1970		if (write && !READ_ONCE(rue_installed)) {
  1971			error = -EBUSY;
  1972			pr_info("RUE: rue kernel module is not enabled or installed.");
  1973			goto out;
  1974		}
  1975	
  1976		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  1977		if (error)
  1978			goto out;
  1979	
  1980		if (write)
  1981			memory_qos_update();
  1982	
  1983		mutex_unlock(&rue_mutex);
  1984		return 0;
  1985	
  1986	out:
  1987		mutex_unlock(&rue_mutex);
  1988		return error;
  1989	}
  1990	
> 1991	int memory_qos_sysctl_highest_reclaim_prio_handler(struct ctl_table *table,
  1992					int write, void __user *buffer,
  1993					size_t *lenp, loff_t *ppos)
  1994	{
  1995		int error;
  1996	
  1997		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  1998		if (error)
  1999			return error;
  2000	
  2001		if (write)
  2002			memory_qos_update();
  2003	
  2004		return 0;
  2005	}
  2006	
> 2007	int memory_qos_sysctl_prio_reclaim_ratio_handler(struct ctl_table *table,
  2008					int write, void __user *buffer,
  2009					size_t *lenp, loff_t *ppos)
  2010	{
  2011		int error;
  2012		unsigned int old;
  2013	
  2014		old = sysctl_vm_qos_prio_reclaim_ratio;
  2015		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
  2016		if (error)
  2017			return error;
  2018	
  2019		if (old == sysctl_vm_qos_prio_reclaim_ratio)
  2020			return 0;
  2021	
  2022		if (write) {
  2023			error = memory_qos_prio_reclaim_ratio_update();
  2024			if (error) {
  2025				sysctl_vm_qos_prio_reclaim_ratio = old;
  2026				return -EINVAL;
  2027			}
  2028		}
  2029	
  2030		return 0;
  2031	}
  2032	#endif
  2033	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
