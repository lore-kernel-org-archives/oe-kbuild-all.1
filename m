Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C307217318
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Nov 2024 18:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731005974; cv=none; b=K1eW7RCKk9hzfy/Y6LpUdpGvURfjUvxMvegTM6AvVbbc273IADWjMC9Htr+RQxG0P3sQH4CZp3AzLbrPN5dGnyrnly0lJVTERFMb3WGmML4GJ03dSfN/x9fUhyzH9+Ub9Z1vj6j4o57Qe3WyPHQo/obT/w3Dr47RVxElC05RDKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731005974; c=relaxed/simple;
	bh=GrzB7DdNzUZ3lin4BKho8I/DMRsU23tti6+pxN9dGE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ljfKgLUCawFD1qSn/QCakZLEjloX89ShQW5x1a5iNmb5nJTY7+JEC4PyFvzzroQXkfXfGjxILesYh5Adec1nRLLJ1DrbpEB7pqjOMYDa2QS0sFzFgWQvhDZOO6lmA7MvQ4A5oqd1dOcUPaMjJxWYkqXZB+z8M+mI0/19oBvTHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h5OGAFuu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h5OGAFuu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731005973; x=1762541973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GrzB7DdNzUZ3lin4BKho8I/DMRsU23tti6+pxN9dGE8=;
  b=h5OGAFuuR9QxvvyLx1OUDN5tKVi/olfhjMvg1v697O3f2OdaHir9Ceu0
   pOEAGACmYWPmvOtqS+IFlL1Oa1R9iQ3CG2AaTNn+dARUdBZYlUjqzvvD1
   wYdYjVB5xUOgD3rD4xaGMSSpoObfeQxTB/tX3U6Q2VtiPs3ZJYPzp1loV
   NyXGfnfVnryiF7m6m4lxkW8snqzF1TtV89HbN51Jh30f2SEOTJcWTGF4d
   ozRkUyLlH7c6OvsgTrUjSkhnsOrQxy6jWcADyDUAMaaJxfIPNlXxNzDyN
   kBEYoYCWQZyIuDSldxPMPJk/k6lHqxhmPfwOyIU8WMhHdWablPgshJIzO
   g==;
X-CSE-ConnectionGUID: pRRX/fOnQRGUQ0TlKroFrA==
X-CSE-MsgGUID: Fm5+aoU2SaOC0OumRivDdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="42270995"
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="42270995"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 10:59:31 -0800
X-CSE-ConnectionGUID: a7+JCXKAQmCw8QRht/3zmg==
X-CSE-MsgGUID: Nc7r6y2jRyqeF23+e8D/eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,135,1728975600"; 
   d="scan'208";a="122714722"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2024 10:59:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t97j4-000qak-1c;
	Thu, 07 Nov 2024 18:59:26 +0000
Date: Fri, 8 Nov 2024 02:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14594/24009]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct
 sched_info' has no member named 'run_delay'
Message-ID: <202411080242.G5LBGqsA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi chenjiajun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bafa65a8c91fb9c99706d2d22210690199f95779
commit: b94fc31d4e16ff65dc2141f0a1a3af6a3aac5bb2 [14594/24009] kvm: debugfs: aarch64 export cpu time related items to debugfs
config: arm64-randconfig-001-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080242.G5LBGqsA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080242.G5LBGqsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080242.G5LBGqsA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/../../../virt/kvm/arm/arm.c: In function 'update_steal_time':
>> arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct sched_info' has no member named 'run_delay'
     411 |         delta = current->sched_info.run_delay - vcpu->stat.steal;
         |                                    ^
   arch/arm64/kvm/../../../virt/kvm/arm/arm.c:412:47: error: 'struct sched_info' has no member named 'run_delay'
     412 |         vcpu->stat.steal = current->sched_info.run_delay;
         |                                               ^


vim +411 arch/arm64/kvm/../../../virt/kvm/arm/arm.c

   406	
   407	static void update_steal_time(struct kvm_vcpu *vcpu)
   408	{
   409		u64 delta;
   410	
 > 411		delta = current->sched_info.run_delay - vcpu->stat.steal;
   412		vcpu->stat.steal = current->sched_info.run_delay;
   413		vcpu->stat.st_max = max(vcpu->stat.st_max, delta);
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
