Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DC73EA7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718346165; cv=none; b=U3dny1SoBihAO4KtjP6HGwGNhl2ObKLhui59sOb5kaXL1YgLEHKhAFTy/r03sELMLFDAGI2KDOY23CogK4yXQZ89K4iADvZcMt7YrUoAufnf36u+5ygdfSdiPMOUEBVIffsQjxtpfm2FXEtSYMpQ0SXQUACbaan24BYmQJuUVZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718346165; c=relaxed/simple;
	bh=RV53ivKrT+au/IOWfZukYMGQU0VeGOV7MEktSngDwjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZM98q+1EvKoflzVbxqR4JJQVPk7CKJ0S59TDlFNx7YlyYo77ZN5falyxbe/NzukXimLu/bPsxKKyZA27fJfaQ0g0W5fCRN7YSjVFV95Z2ElDAogy5dwNpm3Z6OOw1aOXS7YWE+tHYG3kyICvaB2CaWO3NHLaMiTYtH6HxnO6Q5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQlCB1u4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQlCB1u4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718346164; x=1749882164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RV53ivKrT+au/IOWfZukYMGQU0VeGOV7MEktSngDwjk=;
  b=RQlCB1u4C88j167vmxkkp5k2mF6D8ktT89iNOEKknLUvaFgsFZs5zRQa
   KdbSVz240i9O81DhhwEvamU9fyloo1PrKaagfBo7hWUhaQOCCLojA2VNj
   8NYRwvFPeiJ0RL+TbFADGpQVv/t+249iC93FlGNbChio+PRfOkiVirn7f
   vaRORItgDR64bVR9JO2itZG0bfl3RIepM/DG2SO9YJKI109iwIaCMhGdy
   3nw7Z4Ob/UEeXKV6e9eXGYqj837lYNePASWO2oVbYmxDPQM6HrxoTt2fn
   37et5uxK6Mq02jG7TPSp/snjGec+272T22Ue/mXjZTJOkN58oGAU7RFhG
   A==;
X-CSE-ConnectionGUID: 8BTwAtxeTbqMdiUK25ywTA==
X-CSE-MsgGUID: vAz6RrM/T9WZCZVSTuksZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18140394"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="18140394"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 23:22:43 -0700
X-CSE-ConnectionGUID: +N4A3AwORgK19aqKZKJ8Gg==
X-CSE-MsgGUID: fw1rUyOQSkeK7mInA4gIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="41125595"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Jun 2024 23:22:40 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI0Kc-0000vG-1O;
	Fri, 14 Jun 2024 06:22:38 +0000
Date: Fri, 14 Jun 2024 14:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/7880] kernel/cgroup/../sched/sched.h:3581:25:
 warning: variable 'cpumask' set but not used
Message-ID: <202406141455.XqWSj1QT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ca7064b2308b42201419e17b030e6a9347be29cd
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/7880] sli: backport sli function from tk3
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240614/202406141455.XqWSj1QT-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141455.XqWSj1QT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141455.XqWSj1QT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/cgroup/sli.c:14:
   kernel/cgroup/../sched/sched.h: In function 'mm_cid_get':
>> kernel/cgroup/../sched/sched.h:3581:25: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3581 |         struct cpumask *cpumask;
         |                         ^~~~~~~
   kernel/cgroup/sli.c: At top level:
>> kernel/cgroup/sli.c:642:16: warning: no previous prototype for 'get_cgroup_from_task_id' [-Wmissing-prototypes]
     642 | struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~


vim +/cpumask +3581 kernel/cgroup/../sched/sched.h

af7f588d8f7355 Mathieu Desnoyers 2022-11-22  3577  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3578  static inline int mm_cid_get(struct rq *rq, struct mm_struct *mm)
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3579  {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3580  	struct mm_cid __percpu *pcpu_cid = mm->pcpu_cid;
223baf9d17f25e Mathieu Desnoyers 2023-04-20 @3581  	struct cpumask *cpumask;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3582  	int cid;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3583  
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3584  	lockdep_assert_rq_held(rq);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3585  	cpumask = mm_cidmask(mm);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3586  	cid = __this_cpu_read(pcpu_cid->cid);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3587  	if (mm_cid_is_valid(cid)) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3588  		mm_cid_snapshot_time(rq, mm);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3589  		return cid;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3590  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3591  	if (mm_cid_is_lazy_put(cid)) {
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3592  		if (try_cmpxchg(&this_cpu_ptr(pcpu_cid)->cid, &cid, MM_CID_UNSET))
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3593  			__mm_cid_put(mm, mm_cid_clear_lazy_put(cid));
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3594  	}
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3595  	cid = __mm_cid_get(rq, mm);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3596  	__this_cpu_write(pcpu_cid->cid, cid);
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3597  	return cid;
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3598  }
223baf9d17f25e Mathieu Desnoyers 2023-04-20  3599  

:::::: The code at line 3581 was first introduced by commit
:::::: 223baf9d17f25e2608dbdff7232c095c1e612268 sched: Fix performance regression introduced by mm_cid

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
