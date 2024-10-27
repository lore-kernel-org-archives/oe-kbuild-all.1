Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE98F45
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992127; cv=none; b=fQqqvM8gB8338oz++N3s1urbsoJqmg/htipxoj4CRmgVzNtw3Qs9pfpOaMTsJXEkDbs+gdMQmHCvNGWjwvStyeeVumWjvDQqoyogybakx9lkc5CAApknREloBtZBvat1+OJ4d0r1dWUOLungqk3WhwF8Z5azXBQq3jNNN8FzcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992127; c=relaxed/simple;
	bh=K/oDo89P4M2jXCiLeUR0Ap/7EpiQPm6LpUuUWkCz4H0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grG76W0oCHx/kCLZaim9AGxuOm2NLRhW7xDqlRSNb8k/rriOcxt+MR0jMc7uQW1YHrclcvBkthiJuQg8rwOImw6XDo7oH8pUNTcaVLcNeQCufeUv9AyR+FGULBAjj67jXHeAejYkOsQ3/L9bIi1iutyHiYDvUHQVQoCQDV4Tm9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtE9AL4D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtE9AL4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729992126; x=1761528126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/oDo89P4M2jXCiLeUR0Ap/7EpiQPm6LpUuUWkCz4H0=;
  b=jtE9AL4DLiOOeoZ6BcyuSL4icycZbq5x8TEsLwboxSyJP6yvP5mIN6If
   I6SMhJupsbXCJJB5atx4FhlRuH3TQktQZd2ai3rcOvfXRNYqSEs/Kcfax
   IC0TqGHYouVciGS1aaWiqO2We74F4wWAgaM6YSPNfXO0AnjkUEm7R8nR9
   buACrb69DAGhZrgMYuDK9mSzbVfEoCFAcszATNdYASwrJhjOK0ejwhhXz
   P6eI+A26hBuh19tIGZlmgFrNye2DVIteDO6po2gUGDCGWrt/cIm0byUKa
   gW/or612OD1Z5OQrwpldK7Hpvs3I8sysCVDwkC0/nAVU+7HfXncKAlF3v
   w==;
X-CSE-ConnectionGUID: NekrZsv0TdqbzbOQfp9oZg==
X-CSE-MsgGUID: Xv9M7f21Qfy1PtTLLzm0Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47087582"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47087582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 18:22:05 -0700
X-CSE-ConnectionGUID: VWlLgoD4TKSpXVoojqiCfA==
X-CSE-MsgGUID: Po1Q790LTlexrXA3DVj3jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="80857186"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2024 18:22:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4ryj-000aEw-1N;
	Sun, 27 Oct 2024 01:22:01 +0000
Date: Sun, 27 Oct 2024 09:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1683/15331] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202410270959.J8MWcOrp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Weilong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [1683/15331] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-003-20241027 (https://download.01.org/0day-ci/archive/20241027/202410270959.J8MWcOrp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410270959.J8MWcOrp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410270959.J8MWcOrp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcontrol.c:3147:6: warning: no previous prototype for 'hisi_oom_recover' [-Wmissing-prototypes]
    3147 | void hisi_oom_recover(struct obj_cgroup *objcg)
         |      ^~~~~~~~~~~~~~~~


vim +/hisi_oom_recover +3147 mm/memcontrol.c

  3145	
  3146	#ifdef CONFIG_ASCEND_OOM
> 3147	void hisi_oom_recover(struct obj_cgroup *objcg)
  3148	{
  3149		struct mem_cgroup *memcg;
  3150	
  3151		memcg = get_mem_cgroup_from_objcg(objcg);
  3152		if (!mem_cgroup_is_root(memcg))
  3153			memcg_oom_recover(memcg);
  3154		css_put(&memcg->css);
  3155	}
  3156	#else
  3157	static inline void hisi_oom_recover(struct obj_cgroup *objcg) { }
  3158	#endif
  3159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
