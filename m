Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A64F19066D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734335079; cv=none; b=amZYo5aEHMToEwyex9WFMDIHATXP9HF/6WOuVoOpblPpUiaR2mKAyLJu6XIykUSbQyVkPttnAXmKw9cA9RvK+JWAuQiAe4XTUhUw9pxrgDoNGE4x6XZTvWavBgY59+PEcBdhXRQhtxewgGpqjU7wAuUcAhzH7xC6W86Aoou2+Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734335079; c=relaxed/simple;
	bh=iryD4vW9XoOTNCbDZatdZgi0C3WhpEkS6kCo5UCXrK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjkluzdwAgWulba/BtrPPBLOdVyJ4M4UuCp/q1t0EM6B8l//3ApyMWSXvfmR5UxhcpsCqZZ1LMMovos+3RsHS7YffLi3f6UQ5WAFRxzoXcUL/W178awE4TsIH/a+jaI+2S5ehuvIF42BerBIWuhRReygniTBIXAvYkXRDA+sTSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwtVPdYg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwtVPdYg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734335077; x=1765871077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iryD4vW9XoOTNCbDZatdZgi0C3WhpEkS6kCo5UCXrK4=;
  b=KwtVPdYg1AxU//7bzMo3hdGHXfGUY448rdNP/SDGpjNh2ETvjhouVKOm
   Q9sXJrV4dZPzEjZPLPwxeZPRlNYyNwd+E7qT8cCj635T5RH4aqM2fYf/C
   GuknaN5zgnfrxgjsCqpKjBTOy/FVRU/Ph5rDW+gn56rxh21mA4rxTpY4o
   CoOAC+ISkkI7gQAW2rI9X+M/ZyDj4a0C2FnOVMpzPNVySgNqkMPFOyGCh
   VtzmsnblQAawsXg8mzlwQ4v7pKdGetSlkG2d9k5NdxcbjllyfA48M6knk
   sx+tky7jsmqGOKi5c18sCG3O2tpGChEC5xyLguwXwuSg5gZch6ljnHXk1
   g==;
X-CSE-ConnectionGUID: FcabAO5XS1CA4JsvrKfpqA==
X-CSE-MsgGUID: 16P7eJ85Sran1fMV+p7UnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="37557917"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="37557917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 23:44:37 -0800
X-CSE-ConnectionGUID: t+cFpqgsQ1WC6HvvJoLHpQ==
X-CSE-MsgGUID: Wo9Q0V0RQqy1/dDshdhgfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102103019"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Dec 2024 23:44:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN5mK-000E60-2o;
	Mon, 16 Dec 2024 07:44:32 +0000
Date: Mon, 16 Dec 2024 15:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1327/1327] mm/vmscan.c:3257:28: error:
 implicit declaration of function 'kernel_swap_enabled'; did you mean
 'kernfs_ns_enabled'?
Message-ID: <202412161514.E1aRqHqY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   098a595b2caf96f57cda68f082b4dc0019d7814d
commit: 44983705e56ab22fda801d66e2a6bd0d1be7ca0b [1327/1327] etmem: add original kernel swap enabled options
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241216/202412161514.E1aRqHqY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412161514.E1aRqHqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161514.E1aRqHqY-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/vmscan.c: In function 'kernel_swap_check':
>> mm/vmscan.c:3257:28: error: implicit declaration of function 'kernel_swap_enabled'; did you mean 'kernfs_ns_enabled'? [-Werror=implicit-function-declaration]
    3257 |         if (sc != NULL && !kernel_swap_enabled())
         |                            ^~~~~~~~~~~~~~~~~~~
         |                            kernfs_ns_enabled
   cc1: some warnings being treated as errors


vim +3257 mm/vmscan.c

  3250	
  3251	/*
  3252	 * Check if original kernel swap is enabled
  3253	 * turn off kernel swap,but leave page cache reclaim on
  3254	 */
  3255	static inline void kernel_swap_check(struct scan_control *sc)
  3256	{
> 3257		if (sc != NULL && !kernel_swap_enabled())
  3258			sc->may_swap = 0;
  3259	}
  3260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
