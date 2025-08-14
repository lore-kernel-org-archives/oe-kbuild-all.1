Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6A1FCF7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 17:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755191650; cv=none; b=mi6VPK0agnIyBcUmjgHagpcXSplx75SEgMvpWDtBpRa943CL89AfCyDsbCMuzIF1nXTqrayb8fjo1uL1PmZJ9Cb0YNYhTnwIlrNRne+7gvvRSf3XSsPH5Dt9XnG2Px7k16wu+fV9sckAoajxvOFFrKw+aIb7WpKNM4NCmv2lKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755191650; c=relaxed/simple;
	bh=h/58/5MXICwzyfsFuQ9Y0uqap0n58/cHEw9OZRYyX6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YqXzSk+fPiit9d1UQAqwH+VlTaP/PmDDSlizf7t6oB3O/PnqI9cw9tH9hFGHr0IVh4mlyOq+nhZZ/R8R0N9hhzEqISSVECVPtQK0UVN/9ElO8G/yLAqSD2R3yKK9S0hY2Cp6uY8JYPwHr+Tj7wk3+tkgxq+9sFUDa0PizDa9cXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Plrfvixu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Plrfvixu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755191649; x=1786727649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h/58/5MXICwzyfsFuQ9Y0uqap0n58/cHEw9OZRYyX6c=;
  b=PlrfvixuE5gWZI4Lajwm+F8i7Nwu434pJtYVD3o33p6mifKcHSWEPPfg
   35HJU8+j1YK08WkrXOzR0aP2AMhx6Bnwd/kicSobXbe9Zt8USHuj+E2yU
   qn10xS9iWSqmi8A4OIY2/hR57EnTuNe9ccbNJcnmW33q4ei5fIoo+MLOQ
   zmjgP6fNbpu98iXt8bsbwsxCmHnqObEo2sH6ry+NAexBYXaKhtLL79B4G
   nc5WdcaKQZVEGro17lEsEVg/IDeCRzpPm4XAdHL1eAYr+lcfar7AZIjke
   NXmCxUYP1FmZZT+d/QNjqeaNrW/gtYybalBr2W6bX5jKhof2NeYgnbskZ
   A==;
X-CSE-ConnectionGUID: IY1WJrarTgOnYS8mX4dJkA==
X-CSE-MsgGUID: OUmpuojAS16z5Mz27ZcJQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68119889"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68119889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 10:14:07 -0700
X-CSE-ConnectionGUID: LwuhYWvAQYaVyxWVzZhbKA==
X-CSE-MsgGUID: U8o2N6z/QLW3FMZ9H8mONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="167176945"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2025 10:14:05 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umbWd-000BC8-1c;
	Thu, 14 Aug 2025 17:14:03 +0000
Date: Fri, 15 Aug 2025 01:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] kernel/bpf-rvi/common_kfuncs.c:24:35:
 warning: no previous prototype for function 'bpf_task_active_pid_ns'
Message-ID: <202508150150.V6YiO7Tg-lkp@intel.com>
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
commit: ef015dbb4151c10d0415045f9d0fcf3dc85063d7 [2679/2679] bpf-rvi: pidns: Add for_each_task_in_pidns and loadavg-related kfuncs
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150150.V6YiO7Tg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150150.V6YiO7Tg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150150.V6YiO7Tg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf-rvi/common_kfuncs.c:15:32: warning: no previous prototype for function 'bpf_mem_cgroup_from_task' [-Wmissing-prototypes]
      15 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |                                ^
   kernel/bpf-rvi/common_kfuncs.c:15:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      15 | __bpf_kfunc struct mem_cgroup *bpf_mem_cgroup_from_task(struct task_struct *p)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:24:35: warning: no previous prototype for function 'bpf_task_active_pid_ns' [-Wmissing-prototypes]
      24 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |                                   ^
   kernel/bpf-rvi/common_kfuncs.c:24:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      24 | __bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:29:17: warning: no previous prototype for function 'bpf_pidns_nr_tasks' [-Wmissing-prototypes]
      29 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:29:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      29 | __bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
         |             ^
         |             static 
>> kernel/bpf-rvi/common_kfuncs.c:43:17: warning: no previous prototype for function 'bpf_pidns_last_pid' [-Wmissing-prototypes]
      43 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |                 ^
   kernel/bpf-rvi/common_kfuncs.c:43:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
      43 | __bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
         |             ^
         |             static 
   4 warnings generated.


vim +/bpf_task_active_pid_ns +24 kernel/bpf-rvi/common_kfuncs.c

    19	
    20	/*
    21	 * Loadavg related kfuncs
    22	 */
    23	
  > 24	__bpf_kfunc struct pid_namespace *bpf_task_active_pid_ns(struct task_struct *task)
    25	{
    26		return task_active_pid_ns(task);
    27	}
    28	
  > 29	__bpf_kfunc u64 bpf_pidns_nr_tasks(struct pid_namespace *ns)
    30	{
    31		struct pid_iter iter = {};
    32		u32 nr_running = 0, nr_threads = 0;
    33	
    34		for_each_task_in_pidns(iter, ns) {
    35			nr_threads++;
    36			if (task_is_running(iter.task))
    37				nr_running++;
    38		}
    39	
    40		return (u64)nr_running << 32 | nr_threads;
    41	}
    42	
  > 43	__bpf_kfunc u32 bpf_pidns_last_pid(struct pid_namespace *ns)
    44	{
    45		return idr_get_cursor(&ns->idr) - 1;
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
