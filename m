Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC8158851
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712697368; cv=none; b=hyPq0F5sTlHvjYHARW6SFvyS2LMkMwUI67qvm2s3JqRcsiSzP915uKAN0AD2HX3o5cxvMjOisL4uE2Rn3xnCC9Nz0JYOW1Q37reWkafLUOVQxivdRjbHnXvaFZHkH1IuqiXsK8Z4n2rPsHOa7S61DmdUE3JbEPwrJl+vKLuyCxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712697368; c=relaxed/simple;
	bh=39CA0uTBXh12y46jht+PY+WNhJgeCmeLhDHekNjdLsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jP1vWmwYuViQfpU6deH0rG6HQyBcCVHoB6z7tBeo/Ip8fFZleFrHvXLoYWKKChJWoTkvQvuVE0B/0LB2SOHnNjuCDL4V7nP5sRygsmpO5W0RnPfO2bMQrazpE36w1MUJ6ezynUNKokJyy4PxHPx1lpZbxbxlq8SfXMVM5TcGFRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gD9FR/Ay; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gD9FR/Ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712697365; x=1744233365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39CA0uTBXh12y46jht+PY+WNhJgeCmeLhDHekNjdLsg=;
  b=gD9FR/AyMmGEnd3RIqp2nqNLhHk+emvpR9cFgs/h+DrErQ4hZoxeCUh/
   5FuGz1N8Awchm8migiCE5IVdclgu9gOU2HtDdEctbphgL2naQzzRWxS7n
   1+Zz9VSlO7rvI0z8K2WCPLW8l2OC9LU7rWbOFaFTIMk//30+id1tVJ/pi
   AeJidwkZAGRH8v2riEEGt4UUR4xS/udDyoqr5qARRjdWl82RExO95SnE2
   QVmtumHZkkzOl5rTyzYgIAf0JuuyKZsCanMrPgm2361loGXC2o/nhN0BA
   OEkHX43/froH3RZjofA2jBCa4LJkPDrWvGLMmLc0RkazSlgmVUdc+9Lt4
   A==;
X-CSE-ConnectionGUID: Irw093g1T86uuwV3d2JWPw==
X-CSE-MsgGUID: HrRYoT8ZS5GeqX4HnJLKUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8138438"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8138438"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 14:16:05 -0700
X-CSE-ConnectionGUID: hXl+qrCWQU2sAbYpKNvihg==
X-CSE-MsgGUID: zpnOSiX/Qfub9YIdthgy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20320491"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2024 14:16:02 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruIoy-0006Vy-1Y;
	Tue, 09 Apr 2024 21:16:00 +0000
Date: Wed, 10 Apr 2024 05:15:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Jialin <lujialin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 26896/30000] kernel/sched/psi.c:198:22: sparse:
 sparse: symbol 'psi_stat_system' was not declared. Should it be static?
Message-ID: <202404100544.ypHpNB9p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9f126942e6d283d9a0ca99f3e46dbebe8aec3afd
commit: 0ccf285cd2e038da074744e99cb916c5bcf3d55b [26896/30000] PSI: Introduce pressure.stat in psi
config: x86_64-randconfig-r132-20240409 (https://download.01.org/0day-ci/archive/20240410/202404100544.ypHpNB9p-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100544.ypHpNB9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100544.ypHpNB9p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/psi.c:198:22: sparse: sparse: symbol 'psi_stat_system' was not declared. Should it be static?
>> kernel/sched/psi.c:202:22: sparse: sparse: symbol 'to_psi_group_ext' was not declared. Should it be static?
   kernel/sched/psi.c:401:22: sparse: sparse: dereference of noderef expression
   kernel/sched/psi.c:402:38: sparse: sparse: dereference of noderef expression
   kernel/sched/psi.c:952:13: sparse: sparse: dereference of noderef expression

vim +/psi_stat_system +198 kernel/sched/psi.c

eb414681d5a07d2 Johannes Weiner 2018-10-26  194  
65479800e82741c Lu Jialin       2023-11-29  195  #ifdef CONFIG_PSI_FINE_GRAINED
65479800e82741c Lu Jialin       2023-11-29  196  /* System-level fine grained pressure and stall tracking */
cc71a821d3f13cb Lu Jialin       2023-11-29  197  static DEFINE_PER_CPU(struct psi_group_stat_cpu, system_stat_group_pcpu);
cc71a821d3f13cb Lu Jialin       2023-11-29 @198  struct psi_group_ext psi_stat_system = {
cc71a821d3f13cb Lu Jialin       2023-11-29  199  	.pcpu = &system_stat_group_pcpu,
cc71a821d3f13cb Lu Jialin       2023-11-29  200  };
65479800e82741c Lu Jialin       2023-11-29  201  
65479800e82741c Lu Jialin       2023-11-29 @202  struct psi_group_ext *to_psi_group_ext(struct psi_group *psi)
65479800e82741c Lu Jialin       2023-11-29  203  {
65479800e82741c Lu Jialin       2023-11-29  204  	if (psi == &psi_system)
65479800e82741c Lu Jialin       2023-11-29  205  		return &psi_stat_system;
65479800e82741c Lu Jialin       2023-11-29  206  	else
65479800e82741c Lu Jialin       2023-11-29  207  		return container_of(psi, struct psi_group_ext, psi);
65479800e82741c Lu Jialin       2023-11-29  208  }
65479800e82741c Lu Jialin       2023-11-29  209  #else
65479800e82741c Lu Jialin       2023-11-29  210  static inline struct psi_group_ext *to_psi_group_ext(struct psi_group *psi)
65479800e82741c Lu Jialin       2023-11-29  211  {
65479800e82741c Lu Jialin       2023-11-29  212  	return NULL;
65479800e82741c Lu Jialin       2023-11-29  213  }
65479800e82741c Lu Jialin       2023-11-29  214  #endif
65479800e82741c Lu Jialin       2023-11-29  215  

:::::: The code at line 198 was first introduced by commit
:::::: cc71a821d3f13cbd9ad3d3eec9fa394f3b2ae96b PSI: Introduce fine grained stall time collect for cgroup reclaim

:::::: TO: Lu Jialin <lujialin4@huawei.com>
:::::: CC: Lu Jialin <lujialin4@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
