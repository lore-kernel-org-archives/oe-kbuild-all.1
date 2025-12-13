Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0E1DED63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642504; cv=none; b=df82ibKfsosdgwZkYUCNMVl/6xiom5krXIlWtCXNKuvYt8LVnk5K+IXo/dzjrF27QyQa2DLG/pUzH8OLG0xGKjgLZAytvv+/7pKq09Ov8qi3Y421dA54rvayfSXAMFbu28CkEn+/p7rKhum3JS+T4jtiCrYGKROhne3m4P6Emq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642504; c=relaxed/simple;
	bh=426+WSMGpcB8qEFHuvRYSuXoLrldoYzOslMhru8gRpo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoFq9NBvec9ZeffAcDP6AfdXjJjAwuN3eUMb3adkhUfxiCU6D7IRxvNFMmgX3rT5dRt7u0uxmDIkYwkPdgxnNEFd2/8TanSRHVLIR89GjO+C+kTo43dZtTORQVlTzguHgBTAuL1k9ysb3NrRERFQehZuIh1oj9116bujCRdI7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdUmpAHq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdUmpAHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765642501; x=1797178501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=426+WSMGpcB8qEFHuvRYSuXoLrldoYzOslMhru8gRpo=;
  b=AdUmpAHqPeEi+8Fl1yv4Sb/mTe4at+0cCHYiANSnsdqN81uGGmB7xYuE
   o5+Od8XOmjsqAnjy9tHEH7py48MPuT1+xg3ZI/iMGlrcH/UClEghNZdvh
   GH9NqKw6wboLlIvSdPjP0qsZmn2RJ0gFR45cak4wk83VwJoFaLat6uFAa
   Yyt7h5i7Jlr9WPp4jcIXy896qAcTOo6aCjlFb1MwNZf+4t3vuFHR/H97r
   y50b11r3tnSZUGET90THA514gfPqKnumkGMJPdKYBdtcW7NbKc0SyZ09W
   V7d7fvGHBaZIKNCaneM78oZLZ4Y8NooOMRip49W18uBmf1z5KzDaakBeu
   Q==;
X-CSE-ConnectionGUID: PLiDTOfBQJaBi84UgSpGtA==
X-CSE-MsgGUID: h3fM/W8zQnCrBj/qF90NsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67497505"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67497505"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:15:00 -0800
X-CSE-ConnectionGUID: NH8gEkVsRimcaltuWu0zJQ==
X-CSE-MsgGUID: tA5qNzADQGabv4h8IP3Vaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="234726992"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2025 08:14:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSGm-000000007sq-36fF;
	Sat, 13 Dec 2025 16:14:56 +0000
Date: Sun, 14 Dec 2025 00:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuan Can <yuancan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541] mm/memcontrol.c:3147:6: warning: no
 previous prototype for 'hisi_oom_recover'
Message-ID: <202512140001.gwqxcHHh-lkp@intel.com>
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
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: b498d9f1bacd40d583c0970cab02ad522127a7e7 [3541/3541] arm64/ascend: Add new enable_oom_killer interface for oom contrl
config: arm64-randconfig-r113-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140001.gwqxcHHh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140001.gwqxcHHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140001.gwqxcHHh-lkp@intel.com/

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
