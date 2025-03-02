Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7148D1C3BE9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740952350; cv=none; b=OpSGH0RTXxAvoXKuw5ATOgr/CpwTT9Mxt0c9rK1/Bj8odpT79FkqYc3WsP5FCbVyp3FbE8lXag8Cx4fBzsg0fh05he/9AaurklLX1v+BDWxsHI2JIKlF1JSiI1MSdBb8/UjkKmVc0Pf9lK3h+Dmj6E1VCiyEZajQJ9+NstmYIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740952350; c=relaxed/simple;
	bh=qVf9ajUSSG/SzLlPpmv5ZFOTPOvtRi/G33Nxmrs1kcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyiQxI7U4jk7eAOOI0RF/1m5L52qydkomVjglvA5P52gL6uHP+VnGA8t4IhzXBkXv4toXV2CXDv7KYpq+mV++CpxSVqHSLwtq6M8IVMwgCRKIKqS1hNOQYTID0CZ0TBkP8gn+VlBXvgCLhZsVke8zVxgwhFmox7wvoZlgtSAEIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DypyCu9z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DypyCu9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740952349; x=1772488349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVf9ajUSSG/SzLlPpmv5ZFOTPOvtRi/G33Nxmrs1kcY=;
  b=DypyCu9z1MQ/pgH7cB07qbw3CTq34Us4c4BSi2DROVvgWnWMLsbpioKw
   CXW/djC1MR+G+pPZ2G/b7/EAct87TeyeTefzhDEaLlfwRLVR4KJBofQBx
   jQlmUTjwrLiclKCLwPZUn0CN+xOoPolFKKfFVESrIUEi8aRd5ibORmbtY
   iz4+QPHIKMT3B97FNi8OkWY20hZClqNXtzTVL9Vvj+T7Slw0E5tzAsBJh
   62I9hWwfz4scJNqdimGxhQqLDjR0YnggrYNh+SSb6QghuqIHmv05TEepc
   Ti9lkdIPeH4nvYMkWs6oBSZYIbptB53cTh1MCE94YZ8myCkB9fwZ6HP9Q
   Q==;
X-CSE-ConnectionGUID: CL8poOycR7+7t/L1DtSDog==
X-CSE-MsgGUID: j7pHHYN1Sx+LwS8CM0mlfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="52803258"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="52803258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 13:52:29 -0800
X-CSE-ConnectionGUID: BoazgMfMSPSuwB18ugnfKg==
X-CSE-MsgGUID: 9bU7dJczSiW/Q+l/X6spjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="141055126"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2025 13:52:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1torEW-000HfK-2F;
	Sun, 02 Mar 2025 21:52:24 +0000
Date: Mon, 3 Mar 2025 05:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:futex/scope 12/18] kernel/futex/core.c:1504:58:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202503030522.Ogx0fFgZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   b37932a2988afdd932334774c6e7536f5f5e1f70
commit: 83d48a9734a39cb50e09755ee421e16b86a64a7e [12/18] futex: Allow to re-allocate the private local hash.
config: arc-randconfig-r111-20250303 (https://download.01.org/0day-ci/archive/20250303/202503030522.Ogx0fFgZ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250303/202503030522.Ogx0fFgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503030522.Ogx0fFgZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/futex/core.c:1504:58: sparse: sparse: Using plain integer as NULL pointer
   kernel/futex/core.c:814:9: sparse: sparse: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit

vim +1504 kernel/futex/core.c

  1496	
  1497		futex_queues = alloc_large_system_hash("futex", sizeof(*futex_queues),
  1498						       hashsize, 0, 0,
  1499						       &futex_shift, NULL,
  1500						       hashsize, hashsize);
  1501		hashsize = 1UL << futex_shift;
  1502	
  1503		for (i = 0; i < hashsize; i++)
> 1504			futex_hash_bucket_init(&futex_queues[i], 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
