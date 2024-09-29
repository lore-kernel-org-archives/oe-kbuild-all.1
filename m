Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE442263A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727633871; cv=none; b=NYRZw6WDwSDyc7CwEF1M/t0NxpgPkHoNo822hJOEdxuNCXNYnnh/qkPeKyQsaJxGpFJnmdsiKjadMQ929zAtvU3zVjfdk+tLllh8kmjE/49dzig8qmCW4zuk3xTskBYKy6usbHn0cLQFs+bs1Lwj1mTOFthFWKd2iqzI98ZluEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727633871; c=relaxed/simple;
	bh=a4w9+WTWG4zIvvokw90jcsEw2WbRB8NHY4Lwx4rCl5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kN1+U/fPRTr+1STr3cjOtjQnzFu2sqb4yczY90tfiIfPsIYcdDiOHOnvFqiAvvVYjDgdcIhGNZFCaNskSjTrsDE3e0S1BoEHSTQRrniSflSofMXltd3BDsZWTlIXzjIHSQVdJEO6lD5PFYct8bRFPhZ8SuiK6ot16Wu+fDaONsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnCmreIu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnCmreIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727633869; x=1759169869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4w9+WTWG4zIvvokw90jcsEw2WbRB8NHY4Lwx4rCl5E=;
  b=fnCmreIud76AAJl1jOhhhx6tVFluk/9kGbGyenuw1zNCLUB8Z/6fdeqQ
   9Smze3cE67OpQv7R8I4WKhPjOnK52AFtB9CE7/Yh0mWRoK6vrCkAWbWZx
   pm9BpJRi0f0ZI2Wmagfwo06hxVIeDmCTU8IQJ2fOwwNCsbyyQt4lsV8m1
   XwH5S8vXuR6p/rn8pnQGBZEpjGqsAq/yDI5EztdrSR4EKa/2Zk1nl629Y
   v8EfLG0Xi8bOK6DMUpmr5Tnmm+ltRh98F5Buw1GtAW08A4Tk3JEQYvIme
   pkPGn3pBaeL3LQBJ5tnRtf2I8K0jhopfHOPk/SLsx+Xen30WL/s97cGqq
   A==;
X-CSE-ConnectionGUID: LUZfybSsSdWEbhIjAWsn6w==
X-CSE-MsgGUID: gRJeOMraRG6ozRIExxBjDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26846704"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26846704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 11:17:48 -0700
X-CSE-ConnectionGUID: rrb3NES+RnWzlRS0md/Pqw==
X-CSE-MsgGUID: FYwnB3gJTb+QCnWctRwpCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="103866341"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2024 11:17:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suyUJ-000OZB-0D;
	Sun, 29 Sep 2024 18:17:43 +0000
Date: Mon, 30 Sep 2024 02:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 11997/12031] kernel/sysctl.c:1964:5: warning: no
 previous prototype for 'memory_qos_sysctl_handler'
Message-ID: <202409300256.RAybhLQs-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240930/202409300256.RAybhLQs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300256.RAybhLQs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300256.RAybhLQs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sysctl.c:990:5: warning: no previous prototype for 'proc_dointvec_max_map_count' [-Wmissing-prototypes]
     990 | int proc_dointvec_max_map_count(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c:1918:5: warning: no previous prototype for 'security_switch_handler' [-Wmissing-prototypes]
    1918 | int security_switch_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sysctl.c:1964:5: warning: no previous prototype for 'memory_qos_sysctl_handler' [-Wmissing-prototypes]
    1964 | int memory_qos_sysctl_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sysctl.c:1991:5: warning: no previous prototype for 'memory_qos_sysctl_highest_reclaim_prio_handler' [-Wmissing-prototypes]
    1991 | int memory_qos_sysctl_highest_reclaim_prio_handler(struct ctl_table *table,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sysctl.c:2007:5: warning: no previous prototype for 'memory_qos_sysctl_prio_reclaim_ratio_handler' [-Wmissing-prototypes]
    2007 | int memory_qos_sysctl_prio_reclaim_ratio_handler(struct ctl_table *table,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
>> mm/memcontrol.c:2731:6: warning: no previous prototype for 'memory_qos_update' [-Wmissing-prototypes]
    2731 | void memory_qos_update(void)
         |      ^~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:2746:5: warning: no previous prototype for 'memory_qos_prio_reclaim_ratio_update' [-Wmissing-prototypes]
    2746 | int memory_qos_prio_reclaim_ratio_update(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:2851:5: warning: no previous prototype for 'mem_cgroup_notify_prio_change' [-Wmissing-prototypes]
    2851 | int mem_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
