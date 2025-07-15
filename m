Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D021922FB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752592865; cv=none; b=S1bAPiBnMrFdGZfShiFszV7IdVkUxhpIU7rEDonWnj0O8wPQ3PEOtyjrl2cLX0rHcr4R4/17cX8v+Q3aghacTd35V4IsAFGCwSc0/R8njSC36POqZNIlj1ZRlvab1uDt+td8FMu3tydUysmw/jVvL7yboNKeBYEzy0rl/L8WWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752592865; c=relaxed/simple;
	bh=70YlwvCM3n3lOaxFMD73faEMAwZP8s3S23wwWmeS3sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KtC9Wsxppd4uIxs6KB1YWd2ysfDCxx/Pm47RPjLl9WfnAUNc74gTDb3ZH/v8LsAbYL+06BoBWun7q6NjerCqqkCX7lmBRR11ACvhGvfgd6SMTz02qjZAx3g8lGfAU8S4A9id5ConhHcoSz9j23y4b6d9GZ6UX+VZI/wdgC/tEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMrMHOAO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMrMHOAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752592864; x=1784128864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=70YlwvCM3n3lOaxFMD73faEMAwZP8s3S23wwWmeS3sw=;
  b=fMrMHOAO6RmM82SWw44D/Y2h4bRdJB9dr/cvt3MEuXziefvJeqpR0sb7
   NvJb7vPAsKXyzRhPG1y+/SzRQVBuISSx1/+ErNvuXCZY1s+ivmNVgfxDv
   Sp8s6e1oKWp4FxnAlfXth54h2FE6WO+QBnIKfNcEVybcucdwT6S2Ab45+
   Lmmk4sZ7kafVI8oSBuZ0V3ZY3t35W36Oi1KmQliWfQLcwj0Gz/yHBdsQC
   TGj0P8Ifcri774nl6wuVyAKlk2XVnDgycRZt4o9WanWoxmkiqS6vCax6a
   +9/mCVkHq4I9z3Cs+Rw5NJSrFS75L4Jgjn15V33LcvkAQPQ9MFgJTLL5W
   g==;
X-CSE-ConnectionGUID: vnltWpyCSBymSOklYudpLA==
X-CSE-MsgGUID: 0TMJQLz6TRqoxnzwCQBPAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65079110"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="65079110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 08:21:03 -0700
X-CSE-ConnectionGUID: mNGvqeKqTHuQRaXs3/yYxg==
X-CSE-MsgGUID: 87EG8jpWR62Gr9qZgVznSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157604733"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 08:21:02 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubhSm-000BEl-1F;
	Tue, 15 Jul 2025 15:21:00 +0000
Date: Tue, 15 Jul 2025 23:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/92] mm/oom_kill.c:318:14: warning: no
 previous prototype for 'bpf_oom_evaluate_task'
Message-ID: <202507152338.2XY3vLhj-lkp@intel.com>
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
commit: 9cffac2e6f2df386d7cf4c2cf90d5fe2c1d6b793 [0/92] bytedance: mm, oom: Introduce bpf_oom_evaluate_task
config: x86_64-buildonly-randconfig-001-20250715 (https://download.01.org/0day-ci/archive/20250715/202507152338.2XY3vLhj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152338.2XY3vLhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152338.2XY3vLhj-lkp@intel.com/

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
