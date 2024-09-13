Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE134CD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726260685; cv=none; b=GMUMSks4PUg7H6/Kbny8+D4g3uJAnhu336I0vSzQrJoQG4vm01RQ3JAUtyJv1ZxIAAPbujhiUpAOsEKPew1I8SlMppaYe25Tb9a4478OVP6DZMs2BvgXfurWHn+Z2JsoVANrnjZgHXj+43yG6eUzseppTaABBd2SFDv8KaPnGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726260685; c=relaxed/simple;
	bh=WrEUo3AtXPe6F7M+QOxhj2WzUtXwmbkth9pv8wflcXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IIQkDPRMDARXDMm9oLAGJySH5fhTZQGHnag9V36GzF7SOXweNecS6UxnPsIbMq3aXy8umPtU7ltegbqG1ioPIpusuMUk+PKXpu344olvTx163NVHQPZnuD3nKlumF3oV8tG6TxXOGWvbiQ9jZZYBHysJ7i+t76RuDX5oz9Qq0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQhBG+N5; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQhBG+N5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726260683; x=1757796683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrEUo3AtXPe6F7M+QOxhj2WzUtXwmbkth9pv8wflcXQ=;
  b=RQhBG+N5xT4A4oGNCaqwRosofDGxNwPEJmY8/v9rUKSVObwXqnHZWv8W
   iN4zWTPxZeqiSR96omk3LVbTuFYLMJCN4pl68JyMkYgkQ0kDos7WjKn1B
   VmD7fJ9OqOy+woYnBmgNsUu+/Fmei9FEAEeM4S76pUvxbBQwDZ5qyJNUy
   IlCy2vRhe4H4e7ccD6JYH1o6wzwqO5x6eXOHbMPzLlRwc6DVoLjr1XCBc
   FSYfukDdekAqmMJ+kBbqfc8n2fOOndWUzpRGHPywM0kziTsyr+DBLHEfn
   Ajtb/W5UdedIzYzDlZ9hVMB4RRe2VpZpdRnPGgSzNgGExGTiON2dteCXx
   g==;
X-CSE-ConnectionGUID: Wox7ct0SSXWYmcX2wznMjw==
X-CSE-MsgGUID: 5COWfMWeSpil3iIZFfX7Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25112370"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25112370"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:51:23 -0700
X-CSE-ConnectionGUID: Id87AW2qTn2VweEDYY5q7Q==
X-CSE-MsgGUID: WHONATCWRveaU0ypsu2Hzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72785710"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Sep 2024 13:51:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spDGB-000704-31;
	Fri, 13 Sep 2024 20:51:19 +0000
Date: Sat, 14 Sep 2024 04:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14594/23707]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct
 sched_info' has no member named 'run_delay'
Message-ID: <202409140415.hpdzSPWA-lkp@intel.com>
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
head:   c46f803e3465bd0ca66716804a4d3e20f586ac0d
commit: b94fc31d4e16ff65dc2141f0a1a3af6a3aac5bb2 [14594/23707] kvm: debugfs: aarch64 export cpu time related items to debugfs
config: arm64-randconfig-004-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140415.hpdzSPWA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140415.hpdzSPWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140415.hpdzSPWA-lkp@intel.com/

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
