Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412B272E44
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776984; cv=none; b=VqK4AGp41RrZSX3+73IJj4qlD88zfzGLHBUCpJ427sxgY98DetrJ9AyCBF4TEGV5Xo5jdfdRpd4bJpnEtl0ESDU4ePYamRfS1gx7Ro6kFkL2d9GPie2MpC7xgsKwbOhyknTSUIXg4FpXIm2XyIkBXdZt/kfQEUMBqeaOHm6u1TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776984; c=relaxed/simple;
	bh=T5OXpibthlj3gCQnpi2z3fDSm8kUvqL7EqE0JHK+xJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKCx2Aais9ZzA13nYlJ91SuvXHxmof93j+kFOpJUlp+xxstU74/yQ3TxDSnPj778xWKCdC7yxPDcRJV6CJ+TejzVXBe6yr3YdHa4DdpakWdRpeU+MJAHc341koM2LJK3FjA4WPKNGR/H3d1YQm+9T5MMM1dx/8RR7P/7dzQDSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kW8vJFRY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kW8vJFRY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746776983; x=1778312983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5OXpibthlj3gCQnpi2z3fDSm8kUvqL7EqE0JHK+xJ8=;
  b=kW8vJFRYAy7GSHpn+xy3EOJ0YJc79npir95wCa983ZW6cQktV/ME4v7O
   T89i0Yy9sQT7sKnZoI/716Pm58BnBT31KjcAsSxiw6sHYuPYuDRRELjs6
   rr+XH2jQrdOvgFnuR4SQeaRHNbqkRSxWZJ4DZDOaZ1TgjwTMuR6GrULKn
   uFRPnISCQD2wk7FaKVMQMhAgERI5ZidCxIqMAT2Ap3yzVN/UbHxZ1L8fP
   QjVbi+PCJIRx38YuAzq313oiCleHFnZT8Tue09bncaBLXQvfA36ExD5+p
   Gay6gbIJmvfAmtY/H9IPfXMhIA68YX2ymhXJHwbLEnunnogT9mF3zjuPo
   Q==;
X-CSE-ConnectionGUID: GXOn5eFRRZKt/8j3ncSfFQ==
X-CSE-MsgGUID: 7bxspu8xQ+CrMkGoWa0lIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48749067"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48749067"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:49:42 -0700
X-CSE-ConnectionGUID: AiNlDxybT5akQo4zfyQXeQ==
X-CSE-MsgGUID: Yj7l19kHT1ybQXJ/3mOFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136246099"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 00:49:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIUE-000Bm1-1A;
	Fri, 09 May 2025 07:49:38 +0000
Date: Fri, 9 May 2025 15:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/oom_kill.c:318:14: sparse: sparse:
 symbol 'bpf_oom_evaluate_task' was not declared. Should it be static?
Message-ID: <202505091533.hztHmiLK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [0/1] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: x86_64-randconfig-123-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091533.hztHmiLK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091533.hztHmiLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091533.hztHmiLK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/oom_kill.c:318:14: sparse: sparse: symbol 'bpf_oom_evaluate_task' was not declared. Should it be static?
   mm/oom_kill.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/oom.h):
   include/linux/rcupdate.h:737:9: sparse: sparse: context imbalance in 'find_lock_task_mm' - wrong count at exit
   mm/oom_kill.c:225:28: sparse: sparse: context imbalance in 'oom_badness' - unexpected unlock
   mm/oom_kill.c:435:9: sparse: sparse: context imbalance in 'dump_task' - unexpected unlock
   include/linux/rcupdate.h:737:9: sparse: sparse: context imbalance in '__oom_kill_process' - unexpected unlock
   mm/oom_kill.c:1243:20: sparse: sparse: context imbalance in '__se_sys_process_mrelease' - unexpected unlock

vim +/bpf_oom_evaluate_task +318 mm/oom_kill.c

   317	
 > 318	noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
   319	{
   320		return NO_BPF_POLICY;
   321	}
   322	ALLOW_ERROR_INJECTION(bpf_oom_evaluate_task, ERRNO);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
