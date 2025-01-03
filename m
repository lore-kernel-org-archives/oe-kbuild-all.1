Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC0D7464
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 00:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863759; cv=none; b=BH5HueG8heeFKsldvCnHvSPSQVm0YzIez5Pu62bRdNVgJ22waj0BpUDvfXzrI4jlNbXj5VAk4MJC9wHQerd0kg4TWxYBcYkEkEBSdwA7WDTjTThzVrHjeijB4h0pyccaGEx3/jQv2KrI2qkjHEwtyngda3kosBqJl165bzSP9/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863759; c=relaxed/simple;
	bh=TsNqirpwdPRpENV9rHV4peKy/klDvxiac2DO8+CaOxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H5SfDkARlvrsDl4SszUggRVX3DInn67A0K1kqkxC74wTQZqhpeae8nHF/gra096Fq1JAOwgkecTswWgeP4SJVmHyU/y5s5H4tl3otzVjmyRkm+jSo4ZZoZLgZbeqM3pkEZVDvswiOgSArOgQUYif4VJ5ue9snUnnoTjTLeKYu/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NTwI3Cpn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NTwI3Cpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735863758; x=1767399758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TsNqirpwdPRpENV9rHV4peKy/klDvxiac2DO8+CaOxI=;
  b=NTwI3Cpn1G0PNxX3w1ZcTXEzyw/8eTZfG38eh5r+TuJ/lSBW1UDCIFtd
   4vmOP+fTrrMPxTNSAhx1zuTjBMxoUj8cbRTePYDrlJz2n9o5yWU+wNz1o
   DiFKy98/8zEADsIVUvxSwIQ+qkn64I/3kKcGbR2KpPOoHklMdFp4LLAxy
   9VKWtVkbTi4CNta4LnRwhGdEqrtiOrg7Fs/NPv7aAWUHg643HK0cNgEcF
   MiYQ63Dh4g2ToQwc9g4TEPMYkjv4cQFvTexs3uVKi2oJwL/Vqo2y58GJ0
   tKHsnc/CjBgOABYafR2ZwHRp7Xe9Dqe5Xw18/X+DsiLwZ7/WrkglQwKCR
   Q==;
X-CSE-ConnectionGUID: aDJm6hVIQlCmD4feHm4IYw==
X-CSE-MsgGUID: dOO4PzNfRa+uvNv4DbGGYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="35990540"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="35990540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:22:37 -0800
X-CSE-ConnectionGUID: l6e8yA9kQ7GRWhlg0Kmw/A==
X-CSE-MsgGUID: IY36goOcTBW8OKSa93xgag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105688319"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Jan 2025 16:22:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTVSU-0008zK-0r;
	Fri, 03 Jan 2025 00:22:34 +0000
Date: Fri, 3 Jan 2025 08:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202501030821.i9hTzqlm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baisong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   2 years, 9 months ago
config: csky-randconfig-r022-20230522 (https://download.01.org/0day-ci/archive/20250103/202501030821.i9hTzqlm-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501030821.i9hTzqlm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501030821.i9hTzqlm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:716:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     716 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/max_rt_runtime +9 kernel/sched/rt.c

d505b8af58912ae Huaixin Chang  2020-04-25  @9  static const u64 max_rt_runtime = MAX_BW;
ce0dbbbb30aee6a Clark Williams 2013-02-07  10  

:::::: The code at line 9 was first introduced by commit
:::::: d505b8af58912ae1e1a211fabc9995b19bd40828 sched: Defend cfs and rt bandwidth quota against overflow

:::::: TO: Huaixin Chang <changhuaixin@linux.alibaba.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
