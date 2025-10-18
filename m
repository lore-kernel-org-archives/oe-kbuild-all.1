Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B026023EABB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782215; cv=none; b=Dj6z8iCwAjlGAMCN9WF3fr0cfFOgksowPwTVUY1qs9U4+Dw4QIEUoaSlOmMtcM9USQlsUaf6+HXwyo2nOa5ih1iL9n1FBFSVne7iAIzpepi+cJhzAbAESPpO31dl0cx8SQKVNFak4bvH7lNJwBYUYFqQ5l0sSZLa4yXCYnQsF9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782215; c=relaxed/simple;
	bh=mAR0PycSnIIK0X+zW1PmhBy1o1qb/M1TltWEYkmpNQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O2yn/YNEqjlLm1OEwavIxUqGYvqL7wDy5FFK4gNJexupqq8EoUzmwwt1ah5Nd73bVCV7PFz2QmK0KFJHrqa/jc349D7TOIwSxaZJw7p9eKioHEJDD4RKStjlMd8+3tDrBWpL8yIE8b3VquTCZIPw+pL5ApvB3DVD9BTcRfiuKO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEso6L72; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEso6L72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760782212; x=1792318212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mAR0PycSnIIK0X+zW1PmhBy1o1qb/M1TltWEYkmpNQA=;
  b=GEso6L72gbNnLNJ1DgYnrSt7zcpJueATzQdwb8dp/DyxAelUiUvTCab5
   QH+kzRtp3Kkkoo06dfknmhSJ9K96FFu185S7D7ShVWnTOB7jrsXgB4pI8
   3nYv6W12721aJheOnWfYx/Jg1K+7eZ4nNmKzwDCWLn11k/Jv8foY5rLtn
   ScBDlYh80x5mN3ns1/s/rHvTMZYb2vvV2IFtn7CZ2bJGQhWp49vVIJodk
   WZXCA0V5mcOMDCKjhDsEGJqZ+eLcLRU9N8WWcAkKd5iKCavzGJvhtfiAv
   Gf0Au4u/v2cp2KXYnyXDOrV8MwdDICEgCeCfn5TCB4I6kK8Fti9jKSjQx
   A==;
X-CSE-ConnectionGUID: 8mf73oE9RHiqKFENlj5+xQ==
X-CSE-MsgGUID: AnoDxD+aRKaE90K08XME/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73586455"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="73586455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 03:10:12 -0700
X-CSE-ConnectionGUID: eymJXhwoQguyvHmgJ1tSHQ==
X-CSE-MsgGUID: MjGe+6U5QweK1e6lJVhwGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182481286"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Oct 2025 03:10:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA3t3-0008DC-0L;
	Sat, 18 Oct 2025 10:10:09 +0000
Date: Sat, 18 Oct 2025 18:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.6 19/21] ld.lld: error: undefined symbol:
 bpf_psi_cgroup_online
Message-ID: <202510181700.mAtYHi4l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.6
head:   3f3d45da5408178ed67987b86fa78d5706771389
commit: 87528dbb6f12e6c89f6545260cfcc51833e5e004 [19/21] sched: psi: implement bpf_psi struct ops
config: x86_64-buildonly-randconfig-006-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181700.mAtYHi4l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181700.mAtYHi4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181700.mAtYHi4l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_psi_cgroup_online
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(cgroup_bpf_lifetime_notify)
--
>> ld.lld: error: undefined symbol: bpf_psi_cgroup_offline
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(cgroup_bpf_lifetime_notify)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
