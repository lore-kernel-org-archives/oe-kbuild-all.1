Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA5E13DBB1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732773570; cv=none; b=EmbLOyS/S1GrqmSy6DvXB/jJfKWe+nDhD1ddLFpS6Gx4ZqHqk5p3x5YoXuZswh9dr1G8obE6shkPrGwT4sTiyL0dA8PZn3Uavg20+G7doPepr6YlBuY1ZrLaGrEvJcmxuOfLbtXbBbyN8iU2vXabhOJOb71kPoBWAzCURRuB5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732773570; c=relaxed/simple;
	bh=VcfLyBlHxc0gm5KccF5/WGlK10KHk9J/BdWjLBjQWSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t92l3zFRQulugUye3cB80s2A+Y/v6Ip06s/u8OrScG9oYkf60jDpQ7KjiMUSBn9xI5tiGKkC5P0MFW9LcV2O6svRaL/6mp04kCa1fWD3uz89/8Xzq0EV/55ILM6AzkXv5cJSj3lLLyR7HmTyxN4tvLs1wXTj++GmIgsVykdjOi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erMXf0em; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erMXf0em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732773568; x=1764309568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VcfLyBlHxc0gm5KccF5/WGlK10KHk9J/BdWjLBjQWSU=;
  b=erMXf0emFHk34wCI39eVWDjJHtvjbzlstBuZiZpMVmExiQBq8D6U6C1N
   skAUuNxTmZQCsAQKRGS1G07kq2U5ka54nLZpM3acPcjLvdTW/oMq13RgH
   pVNCmOmwInYD/CnwGZiHck5DbWMDjhfD8Y0Jhg+I0IsB5VuBf6KRlP8L3
   gaNkswLEkLMNyYjARIOJZqNPH0IuZUYmqgakYuuMxvVqBW34L+n5SW94V
   UTycRpzfq3OrslIWJKc9TuJWKDgnasyX3Z4p01M+XvLTvsFhxjQ506pDk
   9K/6ETRUJDxCVT/DVhi0JK0v3SP0xEVBeHb0/KsdnWsp/IwZE5HlKh2kq
   w==;
X-CSE-ConnectionGUID: 7bb4XX4SSI+C62KhiHL8CA==
X-CSE-MsgGUID: zKpmC+tTRHC354ql6LNVIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="43662840"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="43662840"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 21:59:28 -0800
X-CSE-ConnectionGUID: xQ9OdBt1QluZ2E07P8HFRQ==
X-CSE-MsgGUID: B7tX27HCR9a6J5hmtUUZcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="91751014"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2024 21:59:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGXYi-00097n-2p;
	Thu, 28 Nov 2024 05:59:24 +0000
Date: Thu, 28 Nov 2024 13:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hejingxian <hejingxian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] arch/arm64/kvm/arm.c:1037:16: error:
 'struct kvm_pmu' has no member named 'irq_level'
Message-ID: <202411281342.FMo3GAwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5d0b95afdce7e316c8df2aac1a9d83f257e09297
commit: 1182be89002c268a781bd90b25f18da76cfea732 [1540/1540] pmu: enable pmu phys irq inject for cvm
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281342.FMo3GAwH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281342.FMo3GAwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281342.FMo3GAwH-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/arm.c: In function 'update_pmu_phys_irq':
>> arch/arm64/kvm/arm.c:1037:16: error: 'struct kvm_pmu' has no member named 'irq_level'
    1037 |         if (pmu->irq_level) {
         |                ^~
   arch/arm64/kvm/arm.c:1039:17: error: implicit declaration of function 'arm_pmu_set_phys_irq' [-Wimplicit-function-declaration]
    1039 |                 arm_pmu_set_phys_irq(false);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +1037 arch/arm64/kvm/arm.c

  1031	
  1032	#ifdef CONFIG_HISI_VIRTCCA_HOST
  1033	static inline void update_pmu_phys_irq(struct kvm_vcpu *vcpu, bool *pmu_stopped)
  1034	{
  1035		struct kvm_pmu *pmu = &vcpu->arch.pmu;
  1036	
> 1037		if (pmu->irq_level) {
  1038			*pmu_stopped = true;
  1039			arm_pmu_set_phys_irq(false);
  1040		}
  1041	}
  1042	#endif
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
