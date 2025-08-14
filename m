Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BB1275AF8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 21:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755206784; cv=none; b=GjXEdGh5WZhKOP4xrzNk8B1HWNxrD3/HX8noH5b8cdw+DRzrNWPUHPhG+OZon2YSCa+Ft2b/kVExnvNUSYlxCSo26PFf2v2rWxtKuDezD2suiJhwhvnWwGrNWyeVIcldfhlB1FhebULZpPGPJgRCndpTM2stI9ODzZqVgfmX9qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755206784; c=relaxed/simple;
	bh=/TbXp9/iOdW5aBJ5cMqyRAuWIcZEu3amrojbxFV17Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcsFrBhXAWV0BEWaCVtaf9/pYBzyrvR2BdGYW7gwMC5Esii7+LUVNjLLJb41aInigWP3C4TPFe8nO4d95wuMXgN7EoZBjFyTUBAt5/Ve3e1dxWx+kL8rJVkKpfv3EJPb9PH4+TAiF7eyZT4cfQudDMJON5ZTHemir9ZIXFnhyQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lsdl/a40; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lsdl/a40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755206782; x=1786742782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/TbXp9/iOdW5aBJ5cMqyRAuWIcZEu3amrojbxFV17Ww=;
  b=Lsdl/a40XeBVug3oATWoKukDi58Mm8K7Zei6u7k88iDqgjpmN/hS1A61
   /QodTgM/4YIbjeFFW7QHjrOC20KIcAnDCQcCgfTenC3YrMmMDrj58UAAg
   UW+gtEsWH2DPnx89yQTPodVmZw2RIHOowwTukmsjBpmchKMqyLr5OEe2k
   6Ew3H1Pe4y9RvxPWTwJBj/r504m5SimAqoLSmLFTBj401ipp8pi9xd+M6
   A02LIXJoKqCz9xu2Qlp6BQKWeUNCsUDUhr5crl7Tuauq6T7JGCmcD/MkU
   sXs+hN5n55Ut+S2QZNqF8Maflih79pE3QG2/OGtdK8/Ge8F8HJ2M09iF9
   w==;
X-CSE-ConnectionGUID: F7QDmCEzTjKzE6ZdSvmKyg==
X-CSE-MsgGUID: oZrlav/pQdGUeuAJ8EzM+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="45112993"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="45112993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 14:26:22 -0700
X-CSE-ConnectionGUID: 3RUQDEwkShq2qmlpgPfTHQ==
X-CSE-MsgGUID: Q8dm5dfLTmCf/0Pokg98dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197705528"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 14:26:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umfSk-000BLE-1J;
	Thu, 14 Aug 2025 21:26:18 +0000
Date: Fri, 15 Aug 2025 05:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:86:27:
 warning: no previous prototype for function 'bpf_page_counter_read'
Message-ID: <202508150534.p34D4hUR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 5e4cec4acb12a17b26d4d2ae4c29eb29b017f854 [2679/2679] bpf-rvi: Add bpf_page_counter_read() kfunc
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150534.p34D4hUR-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150534.p34D4hUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150534.p34D4hUR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:19:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      19 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:19:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      19 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:28:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      28 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:28:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:33:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      33 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:33:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:47:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      47 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:47:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
   kernel/bpf-rvi/common_kfuncs.c:76:18: warning: no previous prototype for function 'bpf_si_memswinfo' [-Wmissing-prototypes]
      76 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |                  ^
   kernel/bpf-rvi/common_kfuncs.c:76:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      76 | __bpf_kfunc void bpf_si_memswinfo(struct bpf_sysinfo *bsi)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:86:27: warning: no previous prototype for function 'bpf_page_counter_read' [-Wmissing-prototypes]
      86 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |                           ^
   kernel/bpf-rvi/common_kfuncs.c:86:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      86 | __bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
         |             ^
         |             static 
   6 warnings generated.


vim +/bpf_page_counter_read +86 kernel/bpf-rvi/common_kfuncs.c

    85	
  > 86	__bpf_kfunc unsigned long bpf_page_counter_read(struct page_counter *counter)
    87	{
    88		return page_counter_read(counter);
    89	}
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
