Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF560433A4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 23:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753659216; cv=none; b=bzo4qQCWFQbxv0SdOPNMjP8X8rXu1QWmanvdkJhjqYHr58idE8hWTXGCL10Zz2Q6lnp55EjCjPFKlmcNmaXmK6i/cu6BexodR6vhqy8oaPPWlAHExzdWqM+tanuyVT6VhaeMscbhGW9gvVaUdsS5EqggKHC4HdAXbVrViHW7X5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753659216; c=relaxed/simple;
	bh=HyIYnMgVaPMc8h/9Erp33zLIpVQsAvZCAnk9MngSA+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MBJkUyGRnvyrAVqFdWcd6czxhJ74i1/DuPtAa+xzwfvP2rT05GscytNcyPYGRQJiI5TtsuUHSLo9/HvyITD4403EL7ozwSy9bRQYmQK+qcm9RQs51EldI+s36W9jwGL7bK99UTADtlFF0Q1CO+RRLnDhb4XUZI4/c3Ydf3sPrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQSeGHt0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQSeGHt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753659215; x=1785195215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HyIYnMgVaPMc8h/9Erp33zLIpVQsAvZCAnk9MngSA+E=;
  b=QQSeGHt0Vrgml39Y2iK6dvW0uaBGe07YLJyNWw9U8sPUIQrD+nV65918
   Ovp/+g0BnMws+4Rlx8z2bGeKtrTeq/+dyp0FTa7QOkhHXAJo7+qvrURoA
   dv+FT3rpHj3lHwd0eNWF3LO7IcPj6G+XSDJtxjhW0+vHRmsZ+NRcF5GWe
   jvLwAfl3ti2YqvnC38NjNSYyrGCOhUadPLiMZwRBcgyIAH3wFU5H2BidZ
   nKAgjvFSgVCzOzlSB7AE7ZJK+hlI0f/S8TSIQGHnXDtPia9zfgIQLEI4y
   tOYWPFZqr1PjSsJBHzRgl6MTQBb1nlNGAwagp+8B1xEjzdXrgO4Yp/Jud
   w==;
X-CSE-ConnectionGUID: 2WC5X4LITQKeq1Jwa8JxPQ==
X-CSE-MsgGUID: oE1pLW1CSweVn3rpT9pvtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="54983634"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="54983634"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 16:33:34 -0700
X-CSE-ConnectionGUID: DiJ97G0YS9KJ47vVcGOnmg==
X-CSE-MsgGUID: p/pBBf0qROWXGtylnSYdeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166442223"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2025 16:33:33 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugArz-0000Sx-1K;
	Sun, 27 Jul 2025 23:33:31 +0000
Date: Mon, 28 Jul 2025 01:32:46 +0200
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 92/92] mm/oom_kill.c:318:14: warning: no
 previous prototype for 'bpf_oom_evaluate_task'
Message-ID: <202507280132.QYGdMX3c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chuyi,

FYI, the error/warning still remains.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   c71e88ad12bfbc44f855b681ef923e1acc2e984a
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [92/92] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: arm64-randconfig-2005-20250719 (https://download.01.org/0day-ci/archive/20250728/202507280132.QYGdMX3c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280132.QYGdMX3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280132.QYGdMX3c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:318:14: warning: no previous prototype for 'bpf_oom_evaluate_task' [-Wmissing-prototypes]
     318 | noinline int bpf_oom_evaluate_task(struct task_struct *task, struct oom_control *oc)
         |              ^~~~~~~~~~~~~~~~~~~~~


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
