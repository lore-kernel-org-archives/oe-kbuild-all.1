Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5C370AC2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jun 2026 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990040; cv=none; b=j0wsdpD6k8CQrrr4vBIEqnbB73wHXvLctjs52iFpLJHyPjKPpkzxhwNF7aEbpbwZT/oZeZJW9l5hbJ9acr6G6IgXhijD5YVzycQQI43BhnRYJrIkhW9PHm9Th6Y10oGki2pNdQcJyufQS8Qru83e/9nq1b48MbR5YVeOQeqhAtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990040; c=relaxed/simple;
	bh=Uk4/UbuirfGSvTIylaSrTvqPVAA8E8aa0aUayYuffQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=roG0/yx+UiR1Mn1chI+pJeiXY4wk6LVWGO0PP0RgG2NEhhiy4c0hk+XFAu/p8NyOawOaHCq2QtP+Vijr/3hsjPaAep06/j6tdhvDB8MaqQiixhJO7Tb0A/cABOvxaiKWBtmpfQYIuF4JN63GiNACNjatzdbvzJgx27az2lZ6q8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7hEVQQD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7hEVQQD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780990039; x=1812526039;
  h=date:from:to:cc:subject:message-id;
  bh=Uk4/UbuirfGSvTIylaSrTvqPVAA8E8aa0aUayYuffQE=;
  b=l7hEVQQDyF8o5q2udKmv+JPP/eU7Dfjox4XLvocwo7W2DYdRQJnBkmo9
   K0CnU2oJd3LJKbBrogpAXoIAYdnRq2FHsAfpG5seOz3xaQf25tr+Zz5dS
   MEKnWfJzta80lLQzd7VhAE68BLcSkjJW1WZAslwj8eOR/gZVopoYN8TIr
   wZ7PjJQbd64JVhHm2r9A+Wpf4rOsoO+s9bFrnhlojps+I9bZBM4no86s5
   XYyzxw5JW+YavfFEgCMSki7p+VMzkO30qV4pxe+HTo0Bw9HN4xuOw1Cni
   kAGNO2AeN/y8Gj94H77gDmVydM6tIj1cpk/Bc2wlJosSs1YLyEAlqjYuC
   Q==;
X-CSE-ConnectionGUID: W/skaBxyTfmjIv+20Me56Q==
X-CSE-MsgGUID: 9S/JsYqmRr2axzHGxlVbmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81489214"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81489214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:27:18 -0700
X-CSE-ConnectionGUID: LbdSWyZ5Q5CZsbY3DU1Lbw==
X-CSE-MsgGUID: cfEgUizLTc24rH9DXnP1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="249705934"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2026 00:27:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWqri-000000003QL-2nJn;
	Tue, 09 Jun 2026 07:27:14 +0000
Date: Tue, 09 Jun 2026 09:27:07 +0200
From: kernel test robot <lkp@intel.com>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/bpf/arraymap.c:273:16: warning: cast from pointer to
 integer of different size
Message-ID: <202606090909.TMZDeRdW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Leon-Hwang/bpf-Drop-duplicate-blank-lines-in-verifier/20260608-233454
head:   a7ef4d11654fb50cefd814ffd633716a81162cab
commit: 990c3b195b0558afe66bdad9d07d745e7cb588a9 bpf: Introduce global percpu data
date:   16 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260609/202606090909.TMZDeRdW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260609/202606090909.TMZDeRdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606090909.TMZDeRdW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/arraymap.c: In function 'percpu_array_map_direct_value_addr':
>> kernel/bpf/arraymap.c:273:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     273 |         *imm = (u64) array->pptrs[0];
         |                ^
   kernel/bpf/arraymap.c: In function 'percpu_array_map_direct_value_meta':
   kernel/bpf/arraymap.c:280:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     280 |         u64 base = (u64) array->pptrs[0];
         |                    ^


vim +273 kernel/bpf/arraymap.c

   261	
   262	static int percpu_array_map_direct_value_addr(const struct bpf_map *map, u64 *imm, u32 off)
   263	{
   264		struct bpf_array *array = container_of(map, struct bpf_array, map);
   265	
   266		if (map->max_entries != 1)
   267			return -EOPNOTSUPP;
   268		if (off >= map->value_size)
   269			return -EINVAL;
   270		if (!bpf_jit_supports_percpu_insn())
   271			return -EOPNOTSUPP;
   272	
 > 273		*imm = (u64) array->pptrs[0];
   274		return 0;
   275	}
   276	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
