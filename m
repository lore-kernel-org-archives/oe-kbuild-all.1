Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0609527F003
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625042; cv=none; b=kS2RqspwTDM74WUyWt0BSLGbL7wdP493WMVVZuMKdeevkDBLqK6kppjIAjLWr+/2jIeaOSu3L9WS5L5f5+4JHSG06TYdkgqMMyAN1Vng+XUka9QYqS3oeSD0+Kqt92lBeZYNv1xi4JsJw5Fs4ZRV9DM+nES0EdRRlhyFMClsTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625042; c=relaxed/simple;
	bh=7nzM1Wlhh7FnNwM37fYLEaA15Pv6UbxSj/JqACircOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ev1QdMmy/kmpUZIrpRVnWazkOxqQzahSSdTbvimux6juJuN3rwhUk9IyFXchDTwpZ9XWxdiegqKWhAhmwSf/l4htxtVR0CxAQe3+KdWKJ2p07pyJkZSoZPc8sE9M5PctNa3Kt4wV/cb+OQRGlwT+G5xNOLqE7ZZiywVTqT/QFTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSEDp00X; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSEDp00X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751625040; x=1783161040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7nzM1Wlhh7FnNwM37fYLEaA15Pv6UbxSj/JqACircOk=;
  b=hSEDp00XQLSzH+/UrIBh3WJOAMQcroXiGvMYvJjNJ+PhjLW3tUj80qEJ
   +Na/2BCe2eut82t5wMs0GRT4ps6d1/XVC9wwKJwFNBZHOKfjthMPkX1KL
   pI+B1NwBurEcLQsF7vHRjuVu5Gbzf+/wCsDRmp859lWzG4G7o9EkQHNaz
   N5ByqqxuGeSYDqN+XOcdqbaalyhKR0UfuWsMAX5JFqTY4f4TdD2yqIZ45
   UBRLPE7XAbAQzltHlnnvDzwfUMOFpmyyrLnpszjYGU7xydwNtbIJJULuR
   kqggzfkDMG2aBsnZxh/cdiUBfTsqitwbEV40xXMLb6rD+t7eAcE+ZE732
   w==;
X-CSE-ConnectionGUID: PUh/04WnTuGu88zOKoQYhA==
X-CSE-MsgGUID: tXDZ5JzXRwuBqZzxWMOXzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71531330"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="71531330"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 03:30:39 -0700
X-CSE-ConnectionGUID: P6oY6gWHQ0afKt7UGYQPhw==
X-CSE-MsgGUID: 4l2sJAcQQqG9epdWAG+1+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155375681"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jul 2025 03:30:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXdgi-0003ax-1f;
	Fri, 04 Jul 2025 10:30:36 +0000
Date: Fri, 4 Jul 2025 18:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3011/3011] kernel/sched/soft_domain.c:186:24:
 error: implicit declaration of function 'cpu_util_cfs'; did you mean
 'cpu_util_irq'?
Message-ID: <202507041857.BTkVYp1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   41b7827f33a9fc1fe425b85029312de34b0f0abe
commit: dd6655291bf7230ef984e1d283a5ec05821f996f [3011/3011] sched: Attach task group to soft domain
config: arm64-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041857.BTkVYp1k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041857.BTkVYp1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041857.BTkVYp1k-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/soft_domain.c: In function 'sum_util':
>> kernel/sched/soft_domain.c:186:24: error: implicit declaration of function 'cpu_util_cfs'; did you mean 'cpu_util_irq'? [-Werror=implicit-function-declaration]
     186 |                 sum += cpu_util_cfs(cpu_rq(cpu));
         |                        ^~~~~~~~~~~~
         |                        cpu_util_irq
   kernel/sched/soft_domain.c: In function '__sched_group_set_soft_domain':
   kernel/sched/soft_domain.c:269:13: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     269 |         int cpu;
         |             ^~~
   cc1: some warnings being treated as errors


vim +186 kernel/sched/soft_domain.c

   179	
   180	static unsigned long sum_util(struct cpumask *mask)
   181	{
   182		unsigned long sum = 0;
   183		int cpu;
   184	
   185		for_each_cpu(cpu, mask)
 > 186			sum += cpu_util_cfs(cpu_rq(cpu));
   187	
   188		return sum;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
