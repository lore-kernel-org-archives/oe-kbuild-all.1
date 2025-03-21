Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B5C182B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 00:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742517269; cv=none; b=IM+zPfEhYxEcIKCGGZnRwFQ2+lbeZeirQj4G620ATzAc4fliQP968arHopl6nxIA03D35+WOGs70adGL7mlhXKc/bawr2ynEhk7j4/hPz5CRqexHNaAAkEflDzJ1204H28Lc0uXrXI8NSO/OUywRxPSuEId9GPKaSmYPiO9hxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742517269; c=relaxed/simple;
	bh=N+cEUiH1KwqoC+ZcIkBcq2SZ9R78hANwNHEI4fgtxVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MeUzF0v9iqWxvEhxktYhEEGir/jH+1Tce/h/Z+DKtQ6bJUubYiLuKO4H+maaOYVeI3QnUl0ykjCdhSjv+Klr9f+iMb2DofWzTJdv9wPuWwTQfT6QT+Q9SnlkE0G3d7grA5gPkctawCDSfm+wVSu4OsK+wUn/Cj4vvYLF9JmLYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxFgSrcB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxFgSrcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742517267; x=1774053267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N+cEUiH1KwqoC+ZcIkBcq2SZ9R78hANwNHEI4fgtxVo=;
  b=jxFgSrcBp8NNBlz7nD8MxkoXe17IC9M1PKY9uF4UDiKotKAp9C5fHUWm
   dfIZLTbiJZfAcEKo8TQPK1uRWPbPC04DIZF9qOy5ifEKe4+FrJYUG2t9i
   bUFRPZiu7ex+2po1pugrpy5DsC+dfHDnc+3kXE8wqWOwoDSzXONHDOePy
   BXX/sjE0+j4CvjX1vEKteGE6sVMinYyxKFw24cGtxmG/b4vbtFAhUBlos
   W16ICldyI7BRrQNQPyWby4cvixSF0U8ndtyx2julV635iB5IGZAsG/SC6
   vIh5UJW2Z24k2JOiEgjI3lVXeiuBfLz+dmnk25RQKTtGKQHV6v7r+s0pA
   A==;
X-CSE-ConnectionGUID: ClybWmBARp+DlCiWG9aQzg==
X-CSE-MsgGUID: nFmPJz48RJ+2zVdA2iYUiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43505525"
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="43505525"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:34:26 -0700
X-CSE-ConnectionGUID: Qve7cfS2Qnmnv55K57zZ5A==
X-CSE-MsgGUID: zUWxJCEPSKa3VU4wy70ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,263,1736841600"; 
   d="scan'208";a="123275526"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Mar 2025 17:34:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvQKv-0000tT-19;
	Fri, 21 Mar 2025 00:34:19 +0000
Date: Fri, 21 Mar 2025 08:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:gourry_vmscan_cpuset 1/1]
 kernel/cgroup/cpuset.c:4305:30: error: dereferencing pointer to incomplete
 type 'struct mem_cgroup'
Message-ID: <202503210836.5Qad4WZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux gourry_vmscan_cpuset
head:   17f6241916fff43de0664b150b9a319636071ae7
commit: 17f6241916fff43de0664b150b9a319636071ae7 [1/1] vmscan: apply cgroup.cpuset.mems_effective to reclaim demotions
config: s390-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503210836.5Qad4WZY-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210836.5Qad4WZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210836.5Qad4WZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cpuset.c: In function 'memcg_mems_allowed':
>> kernel/cgroup/cpuset.c:4305:30: error: dereferencing pointer to incomplete type 'struct mem_cgroup'
     css = cgroup_get_e_css(memcg->css.cgroup, &cpuset_cgrp_subsys);
                                 ^~


vim +4305 kernel/cgroup/cpuset.c

  4299	
  4300	bool memcg_mems_allowed(struct mem_cgroup *memcg, int nid)
  4301	{
  4302		struct cgroup_subsys_state *css;
  4303		struct cpuset *cs;
  4304	
> 4305		css = cgroup_get_e_css(memcg->css.cgroup, &cpuset_cgrp_subsys);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
