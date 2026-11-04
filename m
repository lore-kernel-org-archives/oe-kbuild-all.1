Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811366;
	b=et6zWhrMLiLjX8B5JeGIj9tz9F06sg7li0AVGFGSsuDeaYJpLMNxrGFbnbrJWVPf4IMp
	 s0qRp6rh+hlW/QCMkJKzDG9sgDowX7hryuZTBh5O+vNfXeNp67eo3xBacEZr0Ky8gQ2e3
	 h8HUb0PGbhei9kR6bhgALadYaYFZfMTzdqGmyumtBvfaBrflZgv3JDIpWD7OtTvfqhfy0
	 CnaNmzTqPDBH7oY/FkJ+gg+RLe9vFOZnGGXAUdLFAaV/zP/6FMXIZopqosUmQxkPHFZV5
	 pIPkbcJMbXbPWcF+f5yJaOAv7F3wKw/coCYHpIKSo30WADo7+gdwvzcYGfE6Pz5zylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811366;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rTYY4RWnIRldJZoDVGjwOS5uBIyVoUj+qR1HuaFTpec=;
	b=NWdK2iOYLNjPz92iopl5qdxIDSKDNc4k4j7cYCprMS1MHSyyarM4vqhUCjeXW4WcF0Yl
	 Ezx7UPpdFNl2sr/ZsNjfeEugrqwx9ZQEr2gvN+k7pUuANdz/xla+JDCZz6GxCyszkEv2J
	 GuKwtgk4nx+4vzQCx4UkXzqWeFXTFdGERTzHNd+YMup2Wn/CANAiiPWv638px6VEwAxtY
	 8HuwTuD55NaLVAOnzROymDL/jgmUYZSVPusg70LpAYsTh6jJj8jF37EKMBesVwfQo5rvw
	 7JlnODOQ7Vk/ssaRvfFvvJIDCDfQWDoPHxXWaVe4rSPBlVdRet8p3wiGNRGJ5jhNV1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IqKo505c;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF11C606A333
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Nov 2026 16:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF11C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IqKo505c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811365; x=1825347365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ieRIZPJOiTomwY6iWiMQzZWVZGvJqPw6vN29iKGdlcs=;
  b=IqKo505cqEJMJVRXIwkFO0ni7gHmA814stKADz8fP7mm8LUvy9cuLtu6
   /85r5UyZAYvL0EqycwNHPBmuYRqGdOttYFsnHTRja0IFI/GtWM7b4v0JE
   2e88/QefAYiTEgVrQFAgGe7JKwMu/AFrdEcLrYylaaQKIynXBuG20jchq
   zeLTpKUFQKVKr3kG5jq3o9C5ef/Nq1GrZT4/r3MAEhO44z86AAnf4k0YU
   8YQKEOj3m7Qt6AUzZsCGrQ/MoJHC9jA1mBXjN0eWLdAyv2T2kVFHAiug9
   36r2uP3oE+3FtDvAbAfJT26LciAvWTC3+ZTs8pxv28U8sNkhQidBleIYm
   w==;
X-CSE-ConnectionGUID: NimJeYwNSuqQ6gCOcexEkg==
X-CSE-MsgGUID: mRBdFZwFSc6OH5/C7lW0rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2589114"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2589114"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:56:04 -0800
X-CSE-ConnectionGUID: aC05x764QI6dBc++Z2jGEA==
X-CSE-MsgGUID: 6U9JhzckSRukgpXTzZw6pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6594867"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 08:56:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOeHJ-00000000kiR-2NI7;
	Wed, 04 Nov 2026 16:56:01 +0000
Date: Thu, 5 Nov 2026 00:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/6] dma-buf: dma-fence: Add flags parameter to
 dma_fence_init()
Message-ID: <202611050036.9EVRF8cz-lkp@intel.com>
References: <20261029095542.1526750-4-phasta@kernel.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029095542.1526750-4-phasta@kernel.org>

Hi Philipp,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/dma-buf-dma-fence-Add-flags-parameter-to-dma_fence_init/20261029-105538
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261029095542.1526750-4-phasta%40kernel.org
patch subject: [RFC PATCH 1/6] dma-buf: dma-fence: Add flags parameter to dma_fence_init()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611050036.9EVRF8cz-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050036.9EVRF8cz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050036.9EVRF8cz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/dma-buf/dma-fence.c:1115 function parameter 'init_flags' not described in 'dma_fence_init'
>> Warning: drivers/dma-buf/dma-fence.c:1115 function parameter 'init_flags' not described in 'dma_fence_init'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
