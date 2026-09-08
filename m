Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCD629D291
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876952; cv=none; b=pWZXcEmn1MujYPS0vK3beR+g+CWG8YPCXskOL/NTlhA0VNYC6kG0ayMa1tvaTLegPLzhkUlSlLKc+83SSzKvXLsiP8Nt8Gata1OA93vJdM/T5wzOupSYohh0TBJ4jjBjeQvSEzrNg7kHayEiLapoXwCCbIDSDCz/kzER3FJzCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876952; c=relaxed/simple;
	bh=QxMtGNEbaachJNE36a7BV22syz5sMpcLnLyxCVMWH68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DDW6ruAEd6kAFjs/O6wW7DGHIsn5Yns5oEvDw+fbrk3n3+skfOgBYqvr9/qRAHZ89TYjth26sJoc92FeXxNdFuINWz5FpIVquWavjNmtFJbDAYrP3gr691ibMEHYV9H8nNySHICUgkK0yDBXujysuAjyv01qDS+E5hPQC9bBbno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOcnoni8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOcnoni8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788876941; x=1820412941;
  h=date:from:to:cc:subject:message-id;
  bh=QxMtGNEbaachJNE36a7BV22syz5sMpcLnLyxCVMWH68=;
  b=YOcnoni8XgPu+PA61Scf8b55U56hwv9KKkadFkqVvGat0yx0kLdd/zy/
   wAIQBVV6/wAwRS2PSXIgOZDm1nOTcxVCDXqMa8RgH36PB6kNkHsXLAOLn
   a4ScDf2craAEoOjoan6g/IX/nt2G/N1DsciQAFY+7lO7IeMbmc3QSSFpo
   ngEEIF+a+N10IU61YTT/wTn2tGKRQ0xasc4FDYi3amu5B9+8O1l+AsPTh
   UEUYKk4msbXp1O7EPwu2HbIAi2HYfbl4vpLjHkisN6bLp4eLPDVF76nk1
   x9lwpuHKsopAw5WPKnreNgap7cea1rvAZM+aGet/Vs1cZgw0qNqqz1TnV
   w==;
X-CSE-ConnectionGUID: PVKQLjXRQ/qcGaejpyaS3g==
X-CSE-MsgGUID: 8VC13fg8TeSccrFpgfvbRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99873117"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99873117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 07:15:39 -0700
X-CSE-ConnectionGUID: s236bymaQEC9ug5tmfKeTg==
X-CSE-MsgGUID: u+SLrrAfRfOb8O7tZFmAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="266692860"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 08 Sep 2026 07:15:38 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3wbo-000000000jQ-2fZq;
	Tue, 08 Sep 2026 14:15:36 +0000
Date: Tue, 08 Sep 2026 16:15:03 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1019/1019]
 mm/memcontrol.c:8380:9: error: implicit declaration of function
 'mem_cgroup_attach_unevictable'
Message-ID: <202609081655.HELc1BBu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b4ec01ca5aac08347802786e2513d22bcc37d843
commit: 9f95c5d2e9cad8cbf1712aadceb8268703e0eff7 [1019/1019] anolis: mm/unevictable: move cgroup migration arm/disarm from can_attach to attach
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609081655.HELc1BBu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081655.HELc1BBu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081655.HELc1BBu-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_attach':
>> mm/memcontrol.c:8380:9: error: implicit declaration of function 'mem_cgroup_attach_unevictable' [-Wimplicit-function-declaration]
    8380 |         mem_cgroup_attach_unevictable(tset);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_fork':
   mm/memcontrol.c:8386:9: error: implicit declaration of function 'unevict_task_fork'; did you mean 'exit_task_work'? [-Wimplicit-function-declaration]
    8386 |         unevict_task_fork(task);
         |         ^~~~~~~~~~~~~~~~~
         |         exit_task_work


vim +/mem_cgroup_attach_unevictable +8380 mm/memcontrol.c

  8356	
  8357	#ifdef CONFIG_LRU_GEN
  8358	static void mem_cgroup_attach(struct cgroup_taskset *tset)
  8359	{
  8360		struct task_struct *task;
  8361		struct cgroup_subsys_state *css;
  8362	
  8363		/* find the first leader if there is any */
  8364		cgroup_taskset_for_each_leader(task, css, tset)
  8365			break;
  8366	
  8367		if (!task)
  8368			return;
  8369	
  8370		task_lock(task);
  8371		if (task->mm && READ_ONCE(task->mm->owner) == task)
  8372			lru_gen_migrate_mm(task->mm);
  8373		task_unlock(task);
  8374	
  8375		mem_cgroup_attach_unevictable(tset);
  8376	}
  8377	#else
  8378	static void mem_cgroup_attach(struct cgroup_taskset *tset)
  8379	{
> 8380		mem_cgroup_attach_unevictable(tset);
  8381	}
  8382	#endif /* CONFIG_LRU_GEN */
  8383	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
