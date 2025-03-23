Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95171FC0E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 01:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742692174; cv=none; b=T3k2zLMNI3JAYl5TOJ9NUb3NKjzYzpvLEAToW0U/ae6dOjfanY8aW5ciuP3oirQs7mGnAVaFXkgd97EL9Xw6BrVaqZKotXm1hKOOzT58o/ZDvngoximSYEiwef915fPVQJUfvVf4V7HuGkC1yABPz6ha4F3BCpkDHkjNHUhYQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742692174; c=relaxed/simple;
	bh=Qhyc/RAAYI2BPBQ60qyyhcNjc+Xr++f3JYr8LDfMIIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+wAgXg6htjkpgKj529qWr2v8CIe/G/hLR7fxTGgzf+cU6JKYe/vbbPDZaNXdo9rLfW+VDIzERzruOX37su7+H1/JZco7kaTCaGDO0V0iAXaeBbrYpsMPDIVh0RBbAYWPUlTJGmlN7a7Uu1fATcuKbmSQVcpfdx6/ijUzcELEeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIBTpY8K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIBTpY8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742692173; x=1774228173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qhyc/RAAYI2BPBQ60qyyhcNjc+Xr++f3JYr8LDfMIIw=;
  b=eIBTpY8KPZeVA3hd8nyBg3punQnAERpJf5zrSCppwx3uCh9r19GhpirB
   wxad6K/+iLyJ4KfnM84xYOMgsbcPsE7MsJEa8ZSN0W2E1wmnLV3GAmM/y
   cX4wj+qd7jNwsmk20aG+Upsp8VGNlcrYdbb5NFF+ATCuLVLJpwbMKbNmF
   hIhvRdtsyA/v1zSUl4V/HGmuR4IhnQxJfx92nTsOmqfbb58LH1P9y5kuo
   wx+oIUoV7+1c9rmvZGMavnKfZ4tO+NJ/4xrVGQkPlWUEBEud6l4AS/qdO
   3tYd69LwV9EXWG+wOU1Fh9/7r95Vltv7vNRMBBQKwqB3aQydfqteI+l0S
   w==;
X-CSE-ConnectionGUID: nHuo/6U/SgqmN5TAhjYzRA==
X-CSE-MsgGUID: QFm5WxBSS7GiVcjlLOg81Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="55303356"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="55303356"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 18:09:32 -0700
X-CSE-ConnectionGUID: H9HcYnagS92eIwvGedpXmw==
X-CSE-MsgGUID: vqxBytAzQA65VS1WSjE52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="127866025"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Mar 2025 18:09:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw9qA-0002VM-26;
	Sun, 23 Mar 2025 01:09:27 +0000
Date: Sun, 23 Mar 2025 09:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2051/2051] mm/mem_reliable.c:345:2: error:
 implicit declaration of function 'mem_reliable_ctrl_bit_disable' is invalid
 in C99
Message-ID: <202503230912.NNxJbHgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6f6f173b2b8fa65e1ef7ebc6e43b0b02c2a52759
commit: 425771499c0742a996ab28df143d7a5123102686 [2051/2051] mm: mem_reliable: Introduce proc interface to disable memory reliable features
config: arm64-randconfig-r061-20250323 (https://download.01.org/0day-ci/archive/20250323/202503230912.NNxJbHgI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230912.NNxJbHgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230912.NNxJbHgI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mem_reliable.c:345:2: error: implicit declaration of function 'mem_reliable_ctrl_bit_disable' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           mem_reliable_ctrl_bit_disable(idx);
           ^
   mm/mem_reliable.c:345:2: note: did you mean 'mem_reliable_ctrl_bit_disabled'?
   mm/mem_reliable.c:320:13: note: 'mem_reliable_ctrl_bit_disabled' declared here
   static void mem_reliable_ctrl_bit_disabled(int idx) {}
               ^
   1 error generated.


vim +/mem_reliable_ctrl_bit_disable +345 mm/mem_reliable.c

   322	
   323	static void mem_reliable_feature_disable(int idx)
   324	{
   325		char *str = NULL;
   326	
   327		switch (idx) {
   328		case MEM_RELIABLE_FALLBACK:
   329			reliable_allow_fallback = false;
   330			str = "fallback";
   331			break;
   332		case MEM_RELIABLE_SHMEM:
   333			shmem_reliable = false;
   334			str = "shmem";
   335			break;
   336		case MEM_RELIABLE_PAGECACHE:
   337			pagecache_reliable = false;
   338			str = "pagecache";
   339			break;
   340		default:
   341			pr_err("unknown index: %d", idx);
   342			return;
   343		}
   344	
 > 345		mem_reliable_ctrl_bit_disable(idx);
   346		pr_info("%s is disabled\n", str);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
