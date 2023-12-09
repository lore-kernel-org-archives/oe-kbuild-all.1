Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4073D748C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Dec 2023 14:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nc2yN2VN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702132000; x=1733668000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XJOlGi0C5PWDU2BoMnv08oi53DJXgvHmAimB0RPv8n0=;
  b=nc2yN2VNN0JysRXaKsZ7l+DZG16hUyrSGXFXmD9VK41b+aMvKyKQoPis
   NooaKvmXLZLKh6GRK/IroZrI0RDbjaHDxySIlmEiJ8/mqMcCTsEDnIUYL
   xEWP0BYZT86JJw1lKY0wiBLNr5+4/OMlejBcgB+M4J3ykbEgPmJ8khWw4
   FdV4Q1rhdyROymT7hWK1DQyJQ6Qt/KhZGGMiqGEHDauf+cs/UWDJlQok5
   i+xLF9rVjyL2Fz28RoW0TsHGWHbkkUPVKefeeJYdq7mPmsDTmXi9c71hF
   XYhXFIe5P3VKDDkn9cbBpQK/tEmOp/eJvuQF91PzFOTiQn0JfWakg3UTm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="1611114"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1611114"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 06:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="13799924"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2023 06:26:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rByHs-000FRZ-0s;
	Sat, 09 Dec 2023 14:26:36 +0000
Date: Sat, 9 Dec 2023 22:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/cfi 7/7] net/bpf/test_run.c:603:18: sparse:
 sparse: symbol 'bpf_kfunc_call_test_release_dtor' was not declared. Should
 it be static?
Message-ID: <202312092227.Nsr8cRgP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/cfi
head:   1b448648ec2efe567e99d4181c46349cc003bd8d
commit: 1b448648ec2efe567e99d4181c46349cc003bd8d [7/7] bpf: Fix dtor CFI
config: x86_64-randconfig-r132-20231209 (https://download.01.org/0day-ci/archive/20231209/202312092227.Nsr8cRgP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312092227.Nsr8cRgP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312092227.Nsr8cRgP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/bpf/test_run.c:603:18: sparse: sparse: symbol 'bpf_kfunc_call_test_release_dtor' was not declared. Should it be static?
>> net/bpf/test_run.c:613:18: sparse: sparse: symbol 'bpf_kfunc_call_memb_release_dtor' was not declared. Should it be static?
--
>> kernel/bpf/helpers.c:2153:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:2183:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2491:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c: note: in included file (through include/linux/workqueue.h, include/linux/bpf.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock
--
>> kernel/bpf/cpumask.c:99:18: sparse: sparse: symbol 'bpf_cpumask_release_dtor' was not declared. Should it be static?

vim +/bpf_kfunc_call_test_release_dtor +603 net/bpf/test_run.c

   602	
 > 603	__bpf_kfunc void bpf_kfunc_call_test_release_dtor(void *p)
   604	{
   605		bpf_kfunc_call_test_release(p);
   606	}
   607	CFI_NOSEAL(bpf_kfunc_call_test_release_dtor);
   608	
   609	__bpf_kfunc void bpf_kfunc_call_memb_release(struct prog_test_member *p)
   610	{
   611	}
   612	
 > 613	__bpf_kfunc void bpf_kfunc_call_memb_release_dtor(void *p)
   614	{
   615	}
   616	CFI_NOSEAL(bpf_kfunc_call_memb_release_dtor);
   617	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
