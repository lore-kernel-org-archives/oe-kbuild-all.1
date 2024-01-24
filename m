Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1A13C16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706065011; cv=none; b=dXfkEp+Omapxc3WNrht6hnV+8t01gd/ts+4jBOF20WLC+/LDl4dTtTPsEDX2+Emsg9ZGzSeE4iR64z0+Mi3xD2/HbxZxf6I0AkhZSoIt+Qa7QsQ64VOawEyFCcbLJAzneQ/8RPhyinWvEpAPv8l/nvHxR4L5rKcZw8dQ5+7edVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706065011; c=relaxed/simple;
	bh=YyHdukTtvncpTjR2L7W743O4qa6ESmTn3wRfjs8lUx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MOSmYXm14Y/TN0IZMFZ791CSuPD0VbsJ+f8HLrUj98jWFGp8F/s2zx84jipiGd1ooI3nNtFHKoEFxUQEy5uD/D5IpO3fTVFAFc4hSe01suxfAmG0+2SxkoFxUop5rR5BHGbmM2wKbHiF1jKIe1VZ5gh1may3e7UVilCVPKvlBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHe+jT2+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHe+jT2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706065009; x=1737601009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YyHdukTtvncpTjR2L7W743O4qa6ESmTn3wRfjs8lUx0=;
  b=XHe+jT2+wSWtCvgNqIShuo5TS8qLY+k1DCim3RLAFV1WXmpDZbuiBx0j
   cVVcjVyIEUgQbJDnFGx62/XZTTO1w0F4+yrnxaeua577S6P+UAa/m6N2l
   agWGf1jyuXAbhSzqAomwtf/eeg6MskhmaFGg2xCFPjmh+hK9BomzCR5MM
   mtzsMplaoNZtVYH57U0PMRB5RccxeSpF4RBG0oHUt6c6DJvg9I1gf7CCC
   hO/TIdO4em7eaKkjcLYc5RbJOSXeDn3cgJnV2IH9Hsq11RGuR8rWkDW49
   yO+LzXZcW4ohJZcdNJp/ZYtdq6Kr5p8zitM6E/1PuYb1GUDIs9wz4Tt8i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8837621"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8837621"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 18:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909529496"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="909529496"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2024 18:56:47 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSTRV-0007of-0y;
	Wed, 24 Jan 2024 02:56:45 +0000
Date: Wed, 24 Jan 2024 10:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14594/21565]
 arch/arm64/kvm/../../../virt/kvm/arm/arm.c:411:36: error: 'struct
 sched_info' has no member named 'run_delay'
Message-ID: <202401241044.ysvLtxVy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   fb3a7131883be36037affebc26a6597087cbd012
commit: b94fc31d4e16ff65dc2141f0a1a3af6a3aac5bb2 [14594/21565] kvm: debugfs: aarch64 export cpu time related items to debugfs
config: arm64-randconfig-001-20240123 (https://download.01.org/0day-ci/archive/20240124/202401241044.ysvLtxVy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241044.ysvLtxVy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241044.ysvLtxVy-lkp@intel.com/

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
