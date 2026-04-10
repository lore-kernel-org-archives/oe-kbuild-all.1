Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DCE3A6F1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 21:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856616; cv=none; b=TurhCUHvqiclv7KPUhYejskdpLWDh1yTIwySCLse8iVIzMV7kZyAUJl72lyGEnSssFky9c9tchFx5uEmroRWH9BgcK7SkVROgQvqoz2b//wq6A9Y9ts53zHYMY18X+eXKbEBdF7SOcX0m6UgPur5oERyRm26mKKtMUZ4uKys5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856616; c=relaxed/simple;
	bh=+VmwVBmN7JoZtp/jRR36dZuqLq7AWEYjUXS7plOiJlk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HdawXJ8CsQeT7aGe0Keo2qkkvObAvmfm83wRqRZmA68QPCY0fC16IgSsURuS+en/vi+vuqNOZBBktLS+9VJhYxG1OPniLWrXKLRzEmE8lUygg2CB39TqNxLGtzhe17vPh4tYCBq+eUynJb6ZMDkyvrCXrfRLF/O5sRFNfBhQa30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4rFai+T; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4rFai+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775856615; x=1807392615;
  h=date:from:to:cc:subject:message-id;
  bh=+VmwVBmN7JoZtp/jRR36dZuqLq7AWEYjUXS7plOiJlk=;
  b=Q4rFai+TWy03gU4+Ru8qkLpt9Ro1A7A+e+WsaaSPy6pkVPJGeTY2NZRc
   lzeFR9/wekZWsha8qlIHNQVyqfRkcXCnlLsrcXs1ATOb81sNYV8CnNGQ4
   Wxt4Nfi/v6SQKxUYSg6kvlGL/3+3lBLHBeM2DLqaPMxGIgMGNnSjVe8O9
   PkjE/LEj24NJQlIMBMiwXV0fMW7C1JbB9OGrJrUBqsIyiUcgSDmNMqbmo
   SoEOtzxyfxDOkyxQn3daVEy9vJaFpGj+1nQ4GK4WimIUladX8J4mAjmVr
   eNOFx6vBiUZsoJcrgAtPPcLlPee7JFbEEWh7U9YHSjiTsnPl9yWgfo38k
   Q==;
X-CSE-ConnectionGUID: mWeydDPLQCSyf8pyaLbslQ==
X-CSE-MsgGUID: x2+71EseSoarrAByWgsCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87173743"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87173743"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:30:15 -0700
X-CSE-ConnectionGUID: FeSu8vdcTGqFNKJtotZpCA==
X-CSE-MsgGUID: j8n9d8lfScyvAURYJLK+vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="222707455"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Apr 2026 14:30:13 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJQY-000000000Dd-3w5t;
	Fri, 10 Apr 2026 21:30:10 +0000
Date: Sat, 11 Apr 2026 05:29:36 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] Warning: mm/slub.c:5289 function
 parameter 'DECL_TOKEN_PARAM(token' not described in '_kmalloc_nolock'
Message-ID: <202604110515.q5gbpBP1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   7914486e5e0321d516984b5816163611a86ba838
commit: 7914486e5e0321d516984b5816163611a86ba838 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260411/202604110515.q5gbpBP1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110515.q5gbpBP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110515.q5gbpBP1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/slub.c:5289 function parameter 'DECL_TOKEN_PARAM(token' not described in '_kmalloc_nolock'
   Warning: mm/slub.c:5289 expecting prototype for kmalloc_nolock(). Prototype was for _kmalloc_nolock() instead
>> Warning: mm/slub.c:6683 function parameter 'DECL_TOKEN_PARAM(token' not described in 'krealloc_node_align'
>> Warning: mm/slub.c:6855 function parameter 'DECL_TOKEN_PARAM(token' not described in 'kvrealloc_node_align'
>> Warning: mm/slub.c:6683 function parameter 'DECL_TOKEN_PARAM(token' not described in 'krealloc_node_align'
>> Warning: mm/slub.c:6855 function parameter 'DECL_TOKEN_PARAM(token' not described in 'kvrealloc_node_align'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
