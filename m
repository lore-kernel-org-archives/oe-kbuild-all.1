Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6162A10E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 01:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710465059; cv=none; b=fvVPdglP07eiFDdgZcErin8G0EAnxEYoQ0CejzUMHWcXfVtqAdRYDWVVz5zc5X3SLCGxwWQWMgW2qHTVVv0/jREbLLAaZjN5TDxKkzGD9qrh00199cnPUhVE/XBzPuyNW5jTCInu3dD1AGrvcxBMonhaZKjMnrKwrxKm0+oK48w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710465059; c=relaxed/simple;
	bh=lb9STamwbnxtV9/dmP0VtLaOM8TB7Uwf2C4CO0KMt1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gzSg4hzKcVNfiHiDhOyJwl4W3oDjolAzc/ES/OhJe4kbYgEotOM9heiiR7FvRZ7U1AsSP1QWNLb09sWk/HVMPBgdSgkzMUIryGV+5yooTtK1A2WwqjG+9QFGKbyGc6kgJoQiucQfd/ZhKGOEVW7ZGyE7Thtv9bMnSurgw5sCYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eN2lex8H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eN2lex8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710465054; x=1742001054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lb9STamwbnxtV9/dmP0VtLaOM8TB7Uwf2C4CO0KMt1I=;
  b=eN2lex8HzYNS7r1jwnBJsXv5t1TjL0zqRGqbJ6cR06OwKw1/Qy/RB9ry
   BMzKemZh7k2bGA/3Akzx7DxYYKb2L7xb0dlJor2d87LJEfyTqq9ep6kdv
   WsG5Bi6f20r3VsR65h1JkNvRdu1yHRBwgD3zXIQk8UY12W2aQJ7Vo0MTU
   1NnKPy6/Xl5gOm4PrRWzjty4zql0WFO9d8deRF1XCc258TfXbm7kzrWJ3
   qe1/C7b9l3GzOv9FnidsOuNA0nLh/4QqFFuEJws7pOlYI9gj8/zewynHW
   /XwrxK4zxTsAHfdC8BPK8PO2hVfseR58pDJaY+kWghoWAOp1+WFXho9R1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="16045519"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="16045519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 18:10:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="12571077"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Mar 2024 18:10:50 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkw5w-000Dx7-1K;
	Fri, 15 Mar 2024 01:10:48 +0000
Date: Fri, 15 Mar 2024 09:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26632/27507] kernel/sysctl.c:342:5:
 sparse: sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should
 it be static?
Message-ID: <202403150930.utGZWfMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 803e8e5b27a39f179bfd081bee59e10090a90fe5 [26632/27507] rue/mm: add priority reclaim support
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240315/202403150930.utGZWfMj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150930.utGZWfMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150930.utGZWfMj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sysctl.c:328:49: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __user * @@     got void *buffer @@
   kernel/sysctl.c:328:49: sparse:     expected void [noderef] __user *
   kernel/sysctl.c:328:49: sparse:     got void *buffer
>> kernel/sysctl.c:342:5: sparse: sparse: symbol 'memory_qos_sysctl_handler' was not declared. Should it be static?
>> kernel/sysctl.c:369:5: sparse: sparse: symbol 'memory_qos_sysctl_highest_reclaim_prio_handler' was not declared. Should it be static?
>> kernel/sysctl.c:385:5: sparse: sparse: symbol 'memory_qos_sysctl_prio_reclaim_ratio_handler' was not declared. Should it be static?
   kernel/sysctl.c:1542:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sysctl.c:1542:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sysctl.c:1542:33: sparse:     got int ( * )( ... )
   kernel/sysctl.c:2871:5: sparse: sparse: symbol 'setup_pagecache_limit' was not declared. Should it be static?
   kernel/sysctl.c:2617:66: sparse: sparse: self-comparison always evaluates to false
--
>> mm/memcontrol.c:2684:15: sparse: sparse: symbol 'prio_reclaim_bytes' was not declared. Should it be static?
   mm/memcontrol.c:2792:5: sparse: sparse: symbol 'mem_cgroup_notify_prio_change' was not declared. Should it be static?
   mm/memcontrol.c:4528:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4528:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4528:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4530:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4530:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4530:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4687:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4687:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4687:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4781:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4781:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4781:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6831:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6831:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6831:23: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:773:9: sparse: sparse: context imbalance in 'lock_page_lruvec' - wrong count at exit
   include/linux/memcontrol.h:773:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irq' - wrong count at exit
   include/linux/memcontrol.h:773:9: sparse: sparse: context imbalance in 'lock_page_lruvec_irqsave' - wrong count at exit
   mm/memcontrol.c:2155:19: sparse: sparse: context imbalance in 'lock_page_memcg' - wrong count at exit
   mm/memcontrol.c:2217:17: sparse: sparse: context imbalance in '__unlock_page_memcg' - unexpected unlock
   mm/memcontrol.c:6678:28: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   mm/memcontrol.c:6879:36: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/memory_qos_sysctl_handler +342 kernel/sysctl.c

   340	
   341	#ifdef CONFIG_MEMCG
 > 342	int memory_qos_sysctl_handler(struct ctl_table *table, int write,
   343			void __user *buffer, size_t *lenp, loff_t *ppos)
   344	{
   345		int error;
   346	
   347		mutex_lock(&rue_mutex);
   348		if (write && !READ_ONCE(rue_installed)) {
   349			error = -EBUSY;
   350			pr_info("RUE: rue kernel module is not enabled or installed.");
   351			goto out;
   352		}
   353	
   354		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   355		if (error)
   356			goto out;
   357	
   358		if (write)
   359			memory_qos_update();
   360	
   361		mutex_unlock(&rue_mutex);
   362		return 0;
   363	
   364	out:
   365		mutex_unlock(&rue_mutex);
   366		return error;
   367	}
   368	
 > 369	int memory_qos_sysctl_highest_reclaim_prio_handler(struct ctl_table *table,
   370					int write, void __user *buffer,
   371					size_t *lenp, loff_t *ppos)
   372	{
   373		int error;
   374	
   375		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   376		if (error)
   377			return error;
   378	
   379		if (write)
   380			memory_qos_update();
   381	
   382		return 0;
   383	}
   384	
 > 385	int memory_qos_sysctl_prio_reclaim_ratio_handler(struct ctl_table *table,
   386					int write, void __user *buffer,
   387					size_t *lenp, loff_t *ppos)
   388	{
   389		int error;
   390		unsigned int old;
   391	
   392		old = sysctl_vm_qos_prio_reclaim_ratio;
   393		error = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   394		if (error)
   395			return error;
   396	
   397		if (old == sysctl_vm_qos_prio_reclaim_ratio)
   398			return 0;
   399	
   400		if (write) {
   401			error = memory_qos_prio_reclaim_ratio_update();
   402			if (error) {
   403				sysctl_vm_qos_prio_reclaim_ratio = old;
   404				return -EINVAL;
   405			}
   406		}
   407	
   408		return 0;
   409	}
   410	#endif
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
