Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B016A79FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 16:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725120135; cv=none; b=KLEsW3QUbCeetqndV4C5ikP1Uu3PaDoxUc5i66EIRuE4C5S5RibhkFYDQ8uWQPJChXJNgnpO7WC0sP5/ny9AQ08ex6f48YYEA9gGP4pj5Zq0vxikx2a6UR33MDlca08qYiRDIvHC2kPLmxbCqvVThciT3VzUXGnNKzv7xakDXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725120135; c=relaxed/simple;
	bh=joX2uGdgO6ZOG6TY1dVE20q6RX1vuXXhwERhmA/DqnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FchL/bdYih3V5DojSrAB790YzHus6aNx38wVUoXAM6AcxTq2FfHfW9xJA9x+Xl38jDJkGr6DKgOwx+ZKEW3T6mOv2IlTPf1yC6ThhjZDzs54FiSbOMNKbORSakCEfO303RtkdLbJtQPQkUPeO+Biu1Wuys0fJJU5HsOCCLG8Mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkJphmeH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkJphmeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725120134; x=1756656134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=joX2uGdgO6ZOG6TY1dVE20q6RX1vuXXhwERhmA/DqnU=;
  b=jkJphmeHAfT4pba9sZXDFHIHw9KQhFVGHLt4c6mAGU16PLPuc3I1rYSQ
   +vfVLLlA2KYKFV+kYAtzNZ92zAb/4Rt3IVCgI1WszcFRrvxoBBQyWCvKk
   lbYhrd4hJT5moCzb/tWoX3dYE9Ab3TNA2mByNxMFYHJf/+Momwm3vC3Wt
   bRUdY8p/s/wKjpOVkwcloEisGl/PhINL2d6zv5zL9IWjX0uLBljQqzIGq
   1IiyDf+xbEibXHeB0d/l0jJ+qKtb3HEDsKGxty0ketFoEk3od+xQwXied
   Os+OwcuteoSxU+Z5o1rKf2YtKuAyZ9VsNDm1Lp+Nt/n9s6EsAKZdLtwbD
   Q==;
X-CSE-ConnectionGUID: ukpJDdpDRGmAYCcQj2Yd9A==
X-CSE-MsgGUID: pAUjMY79T0G8jClkc0OPHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34416417"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34416417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:02:14 -0700
X-CSE-ConnectionGUID: vDFOTLCASHKn146cq0r2mg==
X-CSE-MsgGUID: T2eJBscDSymJKwviNFK5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="69069989"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Aug 2024 09:02:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skQYD-0002ta-1X;
	Sat, 31 Aug 2024 16:02:09 +0000
Date: Sun, 1 Sep 2024 00:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, wu.zheng@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 23105/23944] kernel/sched/fair.c:1432:14:
 warning: no previous prototype for 'bpf_should_numa_migrate'
Message-ID: <202408312356.R40wmGN9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   114077d3641f55e0727e810a4f1277a658f703b7
commit: 8ab508cd4a0d43a39fb35ed59cc74b23bc2ec452 [23105/23944] bytedance: mm: numa-balance: Introduce new numa balance bpf hook
config: x86_64-bytedance-5.15-velinux (https://download.01.org/0day-ci/archive/20240831/202408312356.R40wmGN9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312356.R40wmGN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312356.R40wmGN9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:1432:14: warning: no previous prototype for 'bpf_should_numa_migrate' [-Wmissing-prototypes]
    1432 | noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:2138:14: warning: no previous prototype for 'bpf_disable_migrate_preferred' [-Wmissing-prototypes]
    2138 | noinline int bpf_disable_migrate_preferred(struct task_struct *p)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11451:6: warning: no previous prototype for 'task_vruntime_update' [-Wmissing-prototypes]
   11451 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/bpf_should_numa_migrate +1432 kernel/sched/fair.c

  1431	
> 1432	noinline int bpf_should_numa_migrate(struct task_struct *p, int nodes)
  1433	{
  1434		return BPF_MIGRATE_DEFAULT;
  1435	}
  1436	ALLOW_ERROR_INJECTION(bpf_should_numa_migrate, ERRNO);
  1437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
