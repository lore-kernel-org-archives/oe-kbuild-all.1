Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDA1219EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 04:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723608375; cv=none; b=QCDRLiCniPco6BVMdSW26egYHKoV6WPK8tZ2NFb7CJIki3e4KSLMau2HUwUE8TGMN/gCAmhJCvP02rcmQxaXvR5exewk/xFXP06oDA4HY0sFa6phuXQYNo0uCrmC7/6rVdm7nuCUlppffWfIXqevFP4JHO8Bpj/IwESh1zFj/lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723608375; c=relaxed/simple;
	bh=YAU6wBVFPmmIeo0+ApeE2YGvJZ3+D9DXsGeg4zUHYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pr+SRxd5Sdx4oLa5RAP9Yh0iwezHUkr0WD2gk449l/v02OfdjOZQ+jIKzVkjfyfinX7fd3qFnyC4oVGe4CKBqINQmD5Nio4DG3oVeo7Cb55/bGwBwsAD0j3s3TXGldgy8OD3gGGGBIcYb3RGDHIaWwgSX1w8nV56OkT3ZN2t0SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmgqfnbv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmgqfnbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723608374; x=1755144374;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YAU6wBVFPmmIeo0+ApeE2YGvJZ3+D9DXsGeg4zUHYqE=;
  b=jmgqfnbvBdq6uTmAjTfs/8R5eGlu73pvzN9MRGGNvakubpyCl6fARKJZ
   ef1hLe4Gkgi7NOOnjliyCkupPc1IJt+wQuN2FP2ohu2BZ24o9jqhsKfhM
   TAB2q58Eh2nGr442HKtzI0tT4puMi/xq2HmJjJ8F2KPwd/puPkWk3G+4w
   vQpAbAQyp10Q6SoH95e6Cl89l+Gv5QYiomW34uDPED+xcS5q+tZfufpu+
   8o3XiT5NTC/zUgZ807C3CB7IBsLc7egpQX3dzYMt5NRnyY58A25NCkZvL
   j1hC+cF35k2DvI1HFivnmkbMFfsrLCk+EuR4LvTHfwjT3KPdW6KWzUb4I
   w==;
X-CSE-ConnectionGUID: nfOd591LR4yuNAJ8okcubw==
X-CSE-MsgGUID: shE75BH/S+iB5LfBPR4lYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21445712"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="21445712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 21:06:14 -0700
X-CSE-ConnectionGUID: XHSFlHV/TKO3+HQRVPF/3A==
X-CSE-MsgGUID: ZC5H4CnHQueODsKy8Saz1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="63807648"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2024 21:06:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se5H0-000166-0l;
	Wed, 14 Aug 2024 04:06:10 +0000
Date: Wed, 14 Aug 2024 12:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19851/23490] kernel/sched/rt.o:
 warning: objtool: dequeue_rt_stack()+0x1cf: unreachable instruction
Message-ID: <202408141237.n6rFrGmd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 5635594b8e630f46bc2c98baf7f0ae95c1ad8d28 [19851/23490] nohz/full, sched/rt: Fix missed tick-reenabling bug in dequeue_task_rt()
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240814/202408141237.n6rFrGmd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141237.n6rFrGmd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141237.n6rFrGmd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rt.c:6:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   In file included from include/linux/mempolicy.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:631:6: warning: no previous prototype for function 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     631 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^
   kernel/sched/rt.c:631:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     631 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         | ^
         | static 
   In file included from kernel/sched/rt.c:6:
   In file included from kernel/sched/sched.h:52:
   In file included from include/linux/migrate.h:6:
   include/linux/mempolicy.h:329:13: warning: unused function '__do_mbind' [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
   3 warnings generated.
>> kernel/sched/rt.o: warning: objtool: dequeue_rt_stack()+0x1cf: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
