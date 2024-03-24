Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793315491
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Mar 2024 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272217; cv=none; b=AySFfx93NdpFxI+GogtddAZBkjFw71Kue5ZWPjxrCZOf8tSWDB/Rzby7sqvRrlKW2SdGSh1luhjV72DL17umRWBvPSXbMHjnn6viP+/za23S33U0FucO8g+95kaMlwgumxcCiiYncEBjt8b19oKGK8FNU7ZZbsMZPDs9ar0QeIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272217; c=relaxed/simple;
	bh=3L9kh4stoEvqinl0wjcyk+o16t872ZZGNYGgjbhzpRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBPJ+XZvmW6CT9NY2URKoKD2jyiw0Uu2anlejgspoK1m+lZX6xrs/MOdaGaiVD7WQI1iLy+XhzNi62cobZtibpSeNRgT4ZOMXoes0mp8Z4VTP5aD4bWLqsjRMhAbvysv78ih18y/7LdJ4PiVMAVn6TTTu//1fRPRzVYTuDELJ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBesYt1h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBesYt1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711272213; x=1742808213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3L9kh4stoEvqinl0wjcyk+o16t872ZZGNYGgjbhzpRA=;
  b=kBesYt1hsw/ACHVpArvBYvuNAQwawd+u8NMw9L+fkoCE9puZdSIr4Qfc
   hk0znU3jDHOqztcXw89VlUrHFIdrxBaLgfo9u60WbwSlqp6N5GBilJXcL
   pKUOJLlRwk49FiVjY2fk7WNfmkUT1+PUMPZXu5zRf8L2xpfVA2RIdF/nt
   vhTmkHSJDNekaLfSCUg8VGPpoRbBj8IcIJvcaG6O4s5IvFlmLt2TRrjS7
   e5uA11JNwD0iQwPP5wj9348bI1fmhUhW+3Z6Fxal2wfCgDVeFCJJr/4K8
   C2UhifmOdGxSD2B3w5h2cuAK/9Y4afvBte1Be6s0OFb4/qdLxjYluMNOe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="17711822"
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="17711822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 02:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,151,1708416000"; 
   d="scan'208";a="19811069"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2024 02:23:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roK4d-000Ljz-2x;
	Sun, 24 Mar 2024 09:23:27 +0000
Date: Sun, 24 Mar 2024 17:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 18499/30000] kernel/sched/bpf_sched.c:158:5:
 warning: "CONFIG_FAIR_GROUP_SCHED" is not defined, evaluates to 0
Message-ID: <202403241751.4Yb0jkMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b670dd901cbbf97745380d373b1d2607b3235590
commit: 28b91df0178b108df4cc6ded1dfb68b8c39f5476 [18499/30000] sched: programmable: Add convenient helper functions to convert sched entity
config: x86_64-randconfig-012-20240323 (https://download.01.org/0day-ci/archive/20240324/202403241751.4Yb0jkMA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240324/202403241751.4Yb0jkMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403241751.4Yb0jkMA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/bpf_sched.c: In function '____bpf_sched_entity_to_tg':
>> kernel/sched/bpf_sched.c:158:5: warning: "CONFIG_FAIR_GROUP_SCHED" is not defined, evaluates to 0 [-Wundef]
     158 | #if CONFIG_FAIR_GROUP_SCHED
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_sched.c: In function '____bpf_sched_set_tg_tag':
   kernel/sched/bpf_sched.c:247:5: warning: "CONFIG_CGROUP_SCHED" is not defined, evaluates to 0 [-Wundef]
     247 | #if CONFIG_CGROUP_SCHED
         |     ^~~~~~~~~~~~~~~~~~~


vim +/CONFIG_FAIR_GROUP_SCHED +158 kernel/sched/bpf_sched.c

   155	
   156	BPF_CALL_1(bpf_sched_entity_to_tg, struct sched_entity *, se)
   157	{
 > 158	#if CONFIG_FAIR_GROUP_SCHED
   159		if (!entity_is_task(se)) {
   160			struct task_group *tg = group_cfs_rq(se)->tg;
   161	
   162			return (unsigned long)tg;
   163		}
   164	#endif
   165	
   166		return (unsigned long)NULL;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
