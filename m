Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F1517AE11
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260070; cv=none; b=dEzEj6mqCoOn4WCT2/GKXLokEN4io7XvTgAEH4A5dBEuxnAOHkunn8BntWoJWrnee2rvx3pcfXq1Aq88rgaep51X7gWWkDLn6LQ5eItmqhQRFrqHQdt46m/fZh1MVm9cWxTjNB+8Xn8B3xCeb98qtE8xYiX9UH7RdCqDsuNmSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260070; c=relaxed/simple;
	bh=STyK4NBXYSk5U6FhgrCODodL2flXD3N+dS5bMDB1Cbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfZzB0aTnrQmPVc6TT04G+QiwRCh84PmFJskMAjtc7TvGHE3F2MOqjnJUB+/N2qpBqrtSis7hmE/R+CRQIph70MitqeXxDrhPg8hcUGkY2/+ejlhb6zYXhWB3e7IjU85Pa1HcltTduOEsnVjxS4kZQ2ChPPjlnbXjl4GUdOifcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqC4rn19; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqC4rn19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260069; x=1797796069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STyK4NBXYSk5U6FhgrCODodL2flXD3N+dS5bMDB1Cbk=;
  b=cqC4rn19tn4BGE6njl+5gRDbR2HIEJiDkDSodBJFOOLzRCF7Sdb2e9Et
   2BdEEUs7cel4iuVc9g96G+Zkc/YGlgTcUckluKLKP18uzBP7GY5hhYI4v
   lbdqa6Yb6IGyJh7tQsBp6i5U/9d2ZQ8hwAu7ZwnFhJDjSy6dy+nHvJlMl
   DVkFolbeYm4P2WH66AhGITCBtGKp/ChhFQeTgiKKsnr1rXsRuZAw8giWy
   bRvVxUNqRWI/kGG2fqNZ8suneUV4coIVur5cgbynxhhH3858PYd7anfto
   BBBEotWNOWTbfuLEdLB3i/FhqpaqUqilo91jT69u9FqjnUDemw00ADq21
   g==;
X-CSE-ConnectionGUID: 4vYNjvLeSnygHo68J6JCwg==
X-CSE-MsgGUID: RJDxT9ilR3mt/20zVt+51g==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67381155"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67381155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:47:48 -0800
X-CSE-ConnectionGUID: ycikMU/vQRiewnliQ6RpQQ==
X-CSE-MsgGUID: Uk2+o1SITXKHw7Kxf5E7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198303272"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2025 11:47:47 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2vY-000000004lW-2BOt;
	Sat, 20 Dec 2025 19:47:44 +0000
Date: Sat, 20 Dec 2025 20:47:33 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Li Ruilin <liruilin4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for NUMA_REMOTE when selected by OBMM
Message-ID: <202512202005.B4YRvyvm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: b2b4a358c0963806835f9a6ff96c2e34d1543216 [1/1] obmm: Add Ownership Based Memory Management framework
config: arm64-kismet-CONFIG_NUMA_REMOTE-CONFIG_OBMM-0-0 (https://download.01.org/0day-ci/archive/20251220/202512202005.B4YRvyvm-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512202005.B4YRvyvm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202005.B4YRvyvm-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NUMA_REMOTE when selected by OBMM
   WARNING: unmet direct dependencies detected for PFN_RANGE_ALLOC
     Depends on [n]: MEMORY_HOTPLUG [=n]
     Selected by [y]:
     - OBMM [=y] && UB [=y] && UB_UMMU_CORE [=y] && UB_UBUS [=y] && HISI_SOC_CACHE [=y]
   
   WARNING: unmet direct dependencies detected for NUMA_REMOTE
     Depends on [n]: NUMA [=n] && ARM64 [=y] && ARM64_4K_PAGES [=y] && SPARSEMEM_VMEMMAP [=y] && ZONE_EXTMEM [=n]
     Selected by [y]:
     - OBMM [=y] && UB [=y] && UB_UMMU_CORE [=y] && UB_UBUS [=y] && HISI_SOC_CACHE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
