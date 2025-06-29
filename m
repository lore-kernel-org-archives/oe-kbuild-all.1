Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC08620E71D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jun 2025 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751232515; cv=none; b=M/BZ1MrFPeBpIhWS9bXitCP0XwXV1geWdK3uTQ6O+2vnGBUpRZ9fyR2A+JOzX7txXENsPDUrWYellPNm4CeJ0eJsV0+flPhS0GvgD9Pv/PjGyPpJwfu24Vi4lOyfda8ds4srPIkoszs9cJNdrbbU0qAXmat3TLO9dmiyk+K0T0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751232515; c=relaxed/simple;
	bh=7M5SnRTsIZ2sgUREEVc4u4iPibt/o/itVAa1yPVpIFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fF8XeCUyYwPKxYQC3XiUf35bpHjtaWaZsDZF8c9Rq5C6aPfFs7qAxg8MKDfMsawOVTMQxcej+7RI/BJa3tC8W4CcRfFDoMVVoCegSIvAi1UaA1+dqRxkCdcecggsWp9Onsa4+cUOJN+rkdJhZWdlOvtccN0bkIwiBO+ZbXpvD0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlWYO6B/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlWYO6B/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751232513; x=1782768513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7M5SnRTsIZ2sgUREEVc4u4iPibt/o/itVAa1yPVpIFQ=;
  b=VlWYO6B/IyGXGniEO3fkhSz6AhVugYiVUt1PTWq7OvGPS6QIEgtC1q/l
   H6Mjtwe1HRpulzRaazJWKw3hnncvBHENRe1RILjTAiqO9dHlVXnymmnO2
   s9GwIYAERDUzpcCiZ+DGTA2odtAibMpbwvdLg01Hdwoz5YCtKI9eqVozQ
   PrLfS+nr/Io5yWsWK7LsoqNSYba4H1fA4btAXMNSTNlHsW4FtzJsjJizb
   lmEffnsxUUJfCcDJftiIEglODNSbjYfnPJu4Ar2EFMHonhJ0gJFSyZK57
   NBkUrinV2spzTYcDCEcbxhWabPEWb+ifaPmUzaQFSNasXe2mzrFxSaQ6N
   Q==;
X-CSE-ConnectionGUID: 3yPF/KGHSKG8+cs/yPagXQ==
X-CSE-MsgGUID: h8P0grJmRuKpXYjgNO48NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57261630"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57261630"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:28:33 -0700
X-CSE-ConnectionGUID: SiP3tqoMTPqjQj2KX3kmYQ==
X-CSE-MsgGUID: 2lfCS7U0QYmnsQsjpVssBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153026180"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jun 2025 14:28:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVzZd-000YFE-2j;
	Sun, 29 Jun 2025 21:28:29 +0000
Date: Mon, 30 Jun 2025 05:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3688/5998] kernel/sched/core.c:9284:36: error:
 'struct task_group' has no member named 'scx_weight'
Message-ID: <202506300552.bnOSRwMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 6e6558a6bc418f1478c5dc8609d03805364e0cb9 [3688/5998] sched_ext, sched/core: Factor out struct scx_task_group
config: sparc64-randconfig-001-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300552.bnOSRwMk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300552.bnOSRwMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300552.bnOSRwMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'tg_weight':
>> kernel/sched/core.c:9284:36: error: 'struct task_group' has no member named 'scx_weight'
     return sched_weight_from_cgroup(tg->scx_weight);
                                       ^~
   kernel/sched/core.c:9286:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +9284 kernel/sched/core.c

2480c093130f64 kernel/sched/core.c Patrick Bellasi 2019-08-22  9277  
e179e80c5d4fef kernel/sched/core.c Tejun Heo       2024-09-04  9278  #ifdef CONFIG_GROUP_SCHED_WEIGHT
41082c1d1d2bf6 kernel/sched/core.c Tejun Heo       2024-09-04  9279  static unsigned long tg_weight(struct task_group *tg)
41082c1d1d2bf6 kernel/sched/core.c Tejun Heo       2024-09-04  9280  {
052f1dc7eb0230 kernel/sched.c      Peter Zijlstra  2008-02-13  9281  #ifdef CONFIG_FAIR_GROUP_SCHED
41082c1d1d2bf6 kernel/sched/core.c Tejun Heo       2024-09-04  9282  	return scale_load_down(tg->shares);
8195136669661f kernel/sched/core.c Tejun Heo       2024-09-04  9283  #else
8195136669661f kernel/sched/core.c Tejun Heo       2024-09-04 @9284  	return sched_weight_from_cgroup(tg->scx_weight);
8195136669661f kernel/sched/core.c Tejun Heo       2024-09-04  9285  #endif
41082c1d1d2bf6 kernel/sched/core.c Tejun Heo       2024-09-04  9286  }
41082c1d1d2bf6 kernel/sched/core.c Tejun Heo       2024-09-04  9287  

:::::: The code at line 9284 was first introduced by commit
:::::: 8195136669661fdfe54e9a8923c33b31c92fc1da sched_ext: Add cgroup support

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
