Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125C53939D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779228317; cv=none; b=Pxbeikoie9RPlLvh6Ho9V/Jqm9KGWWxYbfBLbzVvIQuxHv00I8vki1vkINoYuvOS/l+C0C+mP7clKZ/yyPrkKIzT3sODU6RF2AP5uyE2TNcfX/UQ34bi/6cM083we8mBWF7N/Wi8ZRmNmC6gNRwIJ+G5Zeuku2sbSFvalZXtU3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779228317; c=relaxed/simple;
	bh=uFKBnhoFwk+2dJIw0FY3B9R0EPcKqvSzt5ODlPMtzf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CDhh/ZWCnFNQdhNurrqjqfqSfr9v/D5k+fmro/REuzoNIAZwnDX+42B5ymw7PNSYtXBWgxxxUPlYvJ4ybzk3leytKR8OiaNB8OOyKXUj3iy+khRMbWnXffYC9h5lA2hthfntS56Ci4WxslhLsLGaYLwIEajQoJMio2Cza6v7hxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXrmeHGR; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXrmeHGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779228317; x=1810764317;
  h=date:from:to:cc:subject:message-id;
  bh=uFKBnhoFwk+2dJIw0FY3B9R0EPcKqvSzt5ODlPMtzf0=;
  b=dXrmeHGRRHB5DhschoLMHk+YEz/vbdHSa4s34P3FAV9fptcMLLaCE/FK
   2UBVIc468xInIT5RBMy9lD7PFbsE8/3DlVnfKmd9e+DIZT4hG65IGUKNu
   AE7+5aEKe8kAdGECZ7cZ2UtckA/nXy6HUByzhBnnx7a/eOXxxj7GKbKYo
   DR5FoiCSQrdWRk/eEJvpmks5IFLZBl4HKY+nGMRID7ym6UtZmIG9mzV+r
   bG+wIJKqgA6GVWcosvvQnKDB7Whd3NckazX5I5iSRvbRd0AiAAL0sh7tI
   s+WHJnUgtnCyrRvHXwbV90BphWbtVwyizOeaCCLeDTXtTKk6kuy+cUFsg
   Q==;
X-CSE-ConnectionGUID: dqaKbOOkTWek3p9KCp4BcA==
X-CSE-MsgGUID: QmZM5+FTTm6B2MFq4hB8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80293582"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="80293582"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 15:05:16 -0700
X-CSE-ConnectionGUID: 8fqJ+RdAQfaEGSUWr4Draw==
X-CSE-MsgGUID: QgrdGI1/SaSpGUjVztCuyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="233540725"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2026 15:05:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPSYc-0000000020N-0pZI;
	Tue, 19 May 2026 22:05:00 +0000
Date: Wed, 20 May 2026 06:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:arena_slab 63/63] Warning: mm/slub.c:5466 function
 parameter 's' not described in 'kmem_cache_alloc_nolock'
Message-ID: <202605200638.HlCrmUK1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git arena_slab
head:   cb83f972bd005841d18f7bbff6e50d9bcbf0adf8
commit: cb83f972bd005841d18f7bbff6e50d9bcbf0adf8 [63/63] bpf,slab: Add slub-backed allocator for bpf_arena
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260520/202605200638.HlCrmUK1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200638.HlCrmUK1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605200638.HlCrmUK1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5466 function parameter 's' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'gfp_flags' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'node' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 's' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'gfp_flags' not described in 'kmem_cache_alloc_nolock'
>> Warning: mm/slub.c:5466 function parameter 'node' not described in 'kmem_cache_alloc_nolock'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
