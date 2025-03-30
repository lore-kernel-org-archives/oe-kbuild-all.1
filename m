Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70298F9CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Mar 2025 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743322800; cv=none; b=usMdJt9FunYiVp+pSx5Nkm57/vYWXWot62b/dUXhUhpvmrD3gJhkPLVTCvym4JYiPfq8akAuCZ/bpxk4Xr3FYOo3PCvsIwmWOx8etIIMqn177nk+bt0tvjcIXjTFLWnMselBb0Is6GbhzLy+gAEiFo7thDJIEMsTd8wyJdLzuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743322800; c=relaxed/simple;
	bh=2TrXA7a+JgrBwDf5j+Jd08BALt78wVB+UqOL1rk2JEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVB6HUPw8563RJO6MOgDMInReTgL/CtzJRkchieyNMbD7qUSKmtQXKMdogRWu/qvRnpESQG1Jmz4BzqtyoFSgoh0MlPeuzuzyE0lxdeB/NslP6pwIw0gbVXAzCHzI/Kg9F9ASTUrVdpOm9JBcgoIx8D4BIwtua4E+KGfEyWIO2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ajpd4wSa; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ajpd4wSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743322798; x=1774858798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2TrXA7a+JgrBwDf5j+Jd08BALt78wVB+UqOL1rk2JEM=;
  b=Ajpd4wSayNUU2wUbQP+rp6KVbmxxAPYD+NRqtFZxf39Ld8GXQ6TzJDnJ
   12LWnV5M75M2dhsCFm3XCT68jWRF2F7w3QY4+7iP7ym/kIDFsl4ujIgDT
   rqzQdQxmrbjUMNtq62qeNAYXMGE0cEzIKfJVkd4SdC3Bs+zaULybOF46C
   e+V2e7QGjet8v+Ofw5cLEy7OvGuAjCmPH1YKTz+0d6IRs/rBSRewgA4xD
   B80PyMZrFns4vvMcllEohSD7o1JSvxVyJafYlKj1IorGYkIWxr8zlmDl+
   yhEMjiaIF24BzRbK9q0VCqu2bZjfreqAoZS8uvX0s27UCbo82HGbWFkZN
   Q==;
X-CSE-ConnectionGUID: m5I55cqARWayD6V91gBobg==
X-CSE-MsgGUID: aSKN3VFhRiSFNijSmxjwyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44518669"
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="44518669"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 01:19:58 -0700
X-CSE-ConnectionGUID: rCh50Z3ST7argJ+9CCGeSw==
X-CSE-MsgGUID: 3wzbZMTORsmriJIULFFhqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,287,1736841600"; 
   d="scan'208";a="156748724"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2025 01:19:57 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tynta-0008b0-24;
	Sun, 30 Mar 2025 08:19:54 +0000
Date: Sun, 30 Mar 2025 16:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1531/1531] kernel/trace/ring_buffer.o:
 warning: objtool: rb_get_reader_page()+0x4d2: unreachable instruction
Message-ID: <202503301602.HqBUoFWQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: ac59b83e5b01ef06262e927dc7207adf8553c823 [1531/1531] ring-buffer: Fix race between reset page and reading page
config: x86_64-buildonly-randconfig-005-20250329 (https://download.01.org/0day-ci/archive/20250330/202503301602.HqBUoFWQ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503301602.HqBUoFWQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503301602.HqBUoFWQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/ring_buffer.c:5013:6: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
    5013 |         int cnt;
         |             ^
   1 warning generated.
   kernel/trace/ring_buffer.c:1116: warning: Function parameter or member 'cpu_buffer' not described in 'rb_check_list'
   kernel/trace/ring_buffer.c:1116: warning: Function parameter or member 'list' not described in 'rb_check_list'
   kernel/trace/ring_buffer.c:1356: warning: Function parameter or member 'key' not described in '__ring_buffer_alloc'
   kernel/trace/ring_buffer.c:2329: warning: Function parameter or member 'cpu_buffer' not described in 'rb_update_event'
   kernel/trace/ring_buffer.c:2329: warning: Function parameter or member 'info' not described in 'rb_update_event'
   kernel/trace/ring_buffer.c:2329: warning: Excess function parameter 'type' description in 'rb_update_event'
   kernel/trace/ring_buffer.c:2329: warning: Excess function parameter 'length' description in 'rb_update_event'
   kernel/trace/ring_buffer.c:4381: warning: Function parameter or member 'cpu' not described in 'ring_buffer_size'
   kernel/trace/ring_buffer.c:4560: warning: Function parameter or member 'cpu' not described in 'ring_buffer_swap_cpu'
>> kernel/trace/ring_buffer.o: warning: objtool: rb_get_reader_page()+0x4d2: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
