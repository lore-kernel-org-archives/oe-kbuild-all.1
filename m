Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE1286D6F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Aug 2025 16:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015234; cv=none; b=bbIKTAaSn50TpGgSMiGswWb8QaEpICLgZQnj0LUDj6IHlTuOXh3Zf0c22XVPvSjWvNYRVVNQNQf2eFGKbXAHz0f4g42ndc5oVmTXdPNb4hfvW2kaGaXSe2FhSA9ihvpmx+Vy5MsZHEe0jX6L8qN82D/Q2QDrItfE2aOdS/WmyJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015234; c=relaxed/simple;
	bh=xQRXUuYqMUggD98pjJ49qcExpreiIO5KzdAWWVC/DuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QOxIN7dR0D2mDJTDoL5iNDskfTv9xNH3DrdQ/PCiJEkdsEmTbGcV3DAbzNkjgZREP6c0Ln8S7by/efYE/K8xqp/uRCwqUEuwj2bXtUl6Kob8oAhyICxn6KOg+gSxf/GlpwpzJcxKRqp7xX55MwF2Cz53ocmiaRbUxm1dtX3puT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+yJnEzo; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+yJnEzo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755015233; x=1786551233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xQRXUuYqMUggD98pjJ49qcExpreiIO5KzdAWWVC/DuE=;
  b=G+yJnEzo8GbJT1Ug02ZIqXx3026pggRxiiqnvSeNKfUeTEoFA36/eW0d
   vqdhqIG7nrD6javKJLGkWGLXDkscYT3QJFx2lq2VfVm98fKOaQSuD+AcX
   KycQ0sRcXYAjaTPVrfBI+2/ev+AZpMC7hqbIkULPN2DOp8FIez1kidpwP
   Tnyrfu99tvWBLk5X1XOUHPNxz7+C8M/S+YHUrPDvnMfcYmPyxVKJ+jDzT
   t5vv0/Z+XvEOl2XYWaTDkdJ4yYExW1Zht9cV8lQx2XmGK0qAa32jlgw/R
   UVHoZZ6lrh8phbB6bfZojUAVutPhQ1E9sr+1cYKTO/0bg/UF5OJH6aAIl
   g==;
X-CSE-ConnectionGUID: weDdUyKFR5mbd6E3/T1ijQ==
X-CSE-MsgGUID: TGtAqF2YSOyVSxJq+C3/FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44873522"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="44873522"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 09:13:49 -0700
X-CSE-ConnectionGUID: WB8/E2W8SI6OFkVKcAQ4Xg==
X-CSE-MsgGUID: GN/EDzooRVaBDw6XTlVjTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170438240"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2025 09:13:48 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulrdC-0006yD-00;
	Tue, 12 Aug 2025 16:13:46 +0000
Date: Wed, 13 Aug 2025 00:12:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2673/2673] kernel/sched/bpf_sched.c:213:17:
 warning: no previous prototype for function 'bpf_sched_set_task_prefer_nid'
Message-ID: <202508130030.33T0AvPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   aa3c277f9483def562baa4e43778762d2a8141c2
commit: 4e47cb331dc0bc7e1e2161f946842f9df3f3f44f [2673/2673] sched/ebpf: Add kfunc to set the preferred NUMA node for the task
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250813/202508130030.33T0AvPU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130030.33T0AvPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508130030.33T0AvPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:73:
   kernel/sched/debug.c:102:12: warning: no previous prototype for function 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^
   kernel/sched/debug.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | int __weak is_prefer_numa(void)
         | ^
         | static 
   In file included from kernel/sched/build_utility.c:113:
   kernel/sched/bpf_sched.c:186:17: warning: no previous prototype for function 'bpf_sched_entity_is_task' [-Wmissing-prototypes]
     186 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |                 ^
   kernel/sched/bpf_sched.c:186:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     186 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |             ^
         |             static 
   kernel/sched/bpf_sched.c:194:33: warning: no previous prototype for function 'bpf_sched_entity_to_task' [-Wmissing-prototypes]
     194 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |                                 ^
   kernel/sched/bpf_sched.c:194:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     194 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |             ^
         |             static 
   kernel/sched/bpf_sched.c:202:18: warning: no previous prototype for function 'bpf_sched_tag_of_entity' [-Wmissing-prototypes]
     202 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |                  ^
   kernel/sched/bpf_sched.c:202:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     202 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |             ^
         |             static 
>> kernel/sched/bpf_sched.c:213:17: warning: no previous prototype for function 'bpf_sched_set_task_prefer_nid' [-Wmissing-prototypes]
     213 | __bpf_kfunc int bpf_sched_set_task_prefer_nid(struct task_struct *task, int nid)
         |                 ^
   kernel/sched/bpf_sched.c:213:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     213 | __bpf_kfunc int bpf_sched_set_task_prefer_nid(struct task_struct *task, int nid)
         |             ^
         |             static 
   5 warnings generated.


vim +/bpf_sched_set_task_prefer_nid +213 kernel/sched/bpf_sched.c

   212	
 > 213	__bpf_kfunc int bpf_sched_set_task_prefer_nid(struct task_struct *task, int nid)
   214	{
   215		if (!task)
   216			return -EINVAL;
   217	
   218		if ((unsigned int)nid >= nr_node_ids)
   219			return -EINVAL;
   220	
   221		return set_prefer_cpus_ptr(task, cpumask_of_node(nid));
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
