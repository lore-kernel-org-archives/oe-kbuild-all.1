Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B3C204C36
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 22:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761258755; cv=none; b=rLwVgpuomOYr+kSXYntW+Rwpe48JEXWF9JJuu9s4hLVmB6JKhCvdATWRnslxhQMqF+L5h43qRNTlKQzb96zHD7EkqaYakR6CmRta/O9nrSIx7PuSEGnteTHMSM0WOAzaA93z+YCQQVS0bpauAKrGyS1cTb9EQH+zhrOaYdvZRjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761258755; c=relaxed/simple;
	bh=lodO9arEN/02fO4SFbBPIxOUh36ZCMum/GLK8cVrHLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PsvKs0gAhH0R+QfUu+eRlYN2u5OkuUkmWv94csnPucPJ6X8vsS7MFhcUakLbkAyxL/L/8Jz8bXo8MWKZizH6DgfX5OrmN8kHkgjXQb9khwGMha0VEvN4JByDplP5QftNfLf//1hmAjTrcj6ppzm6ALj4enKGPdaQ/OZIrnExWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izlRtijK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izlRtijK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761258754; x=1792794754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lodO9arEN/02fO4SFbBPIxOUh36ZCMum/GLK8cVrHLQ=;
  b=izlRtijKRGMqrRg3yjbKw5H+/Ajk7cyCOcjMRuMuGMcV9p/JIdoupcl8
   unlFGYJAYVUMUxqs7quabtsdZAG13/9OFWFq5oYkXVKwGtmK4eTCZeX0G
   y7dA5E/qETQEtW5NZnp8VHyw+6mPcHCiUYgjT+Yf26ESpHmh31xForDDT
   E99NV6laoeffaEgPx3+OxcZEoH7tGBBKBhyff2Cyh06NCrh9qRixmaJQ8
   P3Y6lvBQi+p0knPGL7K7mIorSVEP/13564RBGKkSCTaRFCqJKRvn6rHsl
   7D2O/xafgTgveL8n2wpKBGlFtTUFoHDt8odcAthKDO3Sw2hybVgMiOeml
   A==;
X-CSE-ConnectionGUID: AZ/HRe/DQ62lW2olLL3ddw==
X-CSE-MsgGUID: GOvUN7IsR4Gej9nICgb3qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63344967"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63344967"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 15:32:34 -0700
X-CSE-ConnectionGUID: h+6bql3pRcuDkPU3M8GETw==
X-CSE-MsgGUID: GxqkVma2Tz+n3/rCNkbfuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="184346289"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Oct 2025 15:32:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC3rC-000Dwn-2j;
	Thu, 23 Oct 2025 22:32:30 +0000
Date: Fri, 24 Oct 2025 06:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.8 11/23] Warning: mm/bpf_memcontrol.c:109
 function parameter 'idx' not described in 'bpf_mem_cgroup_page_state'
Message-ID: <202510240625.ZMbbr1qc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.8
head:   e5c404471ca9d0bd6c628804602002c6478a610f
commit: 7edb84e2490a0e71b5e668d2da3e7897c098aba3 [11/23] mm: introduce BPF kfuncs to access memcg statistics and events
config: x86_64-buildonly-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240625.ZMbbr1qc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240625.ZMbbr1qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240625.ZMbbr1qc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/bpf_memcontrol.c:109 function parameter 'idx' not described in 'bpf_mem_cgroup_page_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
