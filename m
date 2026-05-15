Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CA1EEA3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778815292; cv=none; b=sNJde8jTLSPTWt5ndQWeRe9qBfgtKmoQ1WSGP860VMQ/eN1zjPwRi2RKFb4PjRddoQUFZ8v6cqpwUfcoN1HrAQcM73wwhU4GGx6wK1+sGQF+3Lmw9dGL4Apn+541Oq1VHr6xqbqPIac6DUNhvQTqtiQmlw6bjIFymcThiiqEPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778815292; c=relaxed/simple;
	bh=N/8yb0A/BbnaMtt8A+R96LkfjZ6A2OCd1LWsiX6DOG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLUQAxZVrZv7aMVbl10Yrqfsw4C7oGfVrmiAdvRAOKvfT8qk1mmPEa+5PvlAhfL6GI9yBKniYvT7xK3o8apVGvq6/ViYlOdR1037lerKJ8bavJ0A3CDT8ie42pf5Y94+c+dxl7ChvDNyd6w1xhzY/Yna5EYd0OCSrQmuh5kp2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IU/pMzmA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IU/pMzmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778815291; x=1810351291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=N/8yb0A/BbnaMtt8A+R96LkfjZ6A2OCd1LWsiX6DOG4=;
  b=IU/pMzmAfWsrgvxscMiamYvGJh/vBraeh9nxMWHXCZXVHeYnLfNmgn4q
   fSV+h9u+Q6uRC5wFLITpyaBBl6nMsbRGyCZF/+zcwOQSYrsvqlolpiMlD
   dIDZlcg/EzubMBIe0Kkj0wOPWscD49oUkdV9HSJN6aIorgVGOmNi3Tj7n
   DIA7A+vcv7K0n07lCJ2hLN/T+tuJ8XOQPsd6gdlMAiVvzUaPl4sblnsMy
   BgWq6y2bG7/XkQqhggjlNUULQHmejQbVXHdY9e+ZRhtRQcG+y5AFA7Ozw
   Pq+DfURBHc8Ty1bheOj/PZWNiTv5Ar8xAo0iudnVO2Q0nbT7nFO81jLw7
   Q==;
X-CSE-ConnectionGUID: neY2L9I9Q7KnXOkyTQPHMQ==
X-CSE-MsgGUID: wGQoD3LwTHusTV7xoyPqjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91150693"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="91150693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 20:21:31 -0700
X-CSE-ConnectionGUID: lMpQNfPqR5+oJkGArwd0yg==
X-CSE-MsgGUID: LXJ6MsJHSRyNFKkq6f8daw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="238448610"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2026 20:21:29 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNj60-000000000jF-2NWz;
	Fri, 15 May 2026 03:20:24 +0000
Date: Fri, 15 May 2026 11:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: wangxuewen <18810879172@163.com>, akpm@linux-foundation.org,
	david@fromorbit.com, qi.zheng@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, wangxuewen <18810879172@163.com>
Subject: Re: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using
 guard()
Message-ID: <202605151100.lH0pRo2I-lkp@intel.com>
References: <20260512085546.368911-1-18810879172@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512085546.368911-1-18810879172@163.com>

Hi wangxuewen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v7.1-rc3]
[also build test WARNING on linus/master next-20260508]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangxuewen/mm-shrinker-simplify-shrinker_memcg_alloc-using-guard/20260515-014803
base:   v7.1-rc3
patch link:    https://lore.kernel.org/r/20260512085546.368911-1-18810879172%40163.com
patch subject: [PATCH v1] mm/shrinker: simplify shrinker_memcg_alloc() using guard()
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151100.lH0pRo2I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151100.lH0pRo2I-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shrinker.c: In function 'shrinker_memcg_alloc':
>> mm/shrinker.c:218:17: warning: unused variable 'ret' [-Wunused-variable]
     218 |         int id, ret = -ENOMEM;
         |                 ^~~


vim +/ret +218 mm/shrinker.c

96f7b2b9bbb1d68 Qi Zheng      2023-09-11  215  
48a7a0996a0089f Qi Zheng      2023-09-11  216  static int shrinker_memcg_alloc(struct shrinker *shrinker)
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  217  {
96f7b2b9bbb1d68 Qi Zheng      2023-09-11 @218  	int id, ret = -ENOMEM;
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  219  
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  220  	if (mem_cgroup_disabled())
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  221  		return -ENOSYS;
03375203e1da8f4 Michal Koutný 2026-02-25  222  	if (mem_cgroup_kmem_disabled() && !(shrinker->flags & SHRINKER_NONSLAB))
03375203e1da8f4 Michal Koutný 2026-02-25  223  		return -ENOSYS;
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  224  
5ce02a6f6282d95 wangxuewen    2026-05-12  225  	guard(mutex)(&shrinker_mutex);
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  226  	id = idr_alloc(&shrinker_idr, shrinker, 0, 0, GFP_KERNEL);
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  227  	if (id < 0)
5ce02a6f6282d95 wangxuewen    2026-05-12  228  		return id;
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  229  
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  230  	if (id >= shrinker_nr_max) {
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  231  		if (expand_shrinker_info(id)) {
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  232  			idr_remove(&shrinker_idr, id);
5ce02a6f6282d95 wangxuewen    2026-05-12  233  			return -ENOMEM;
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  234  		}
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  235  	}
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  236  	shrinker->id = id;
5ce02a6f6282d95 wangxuewen    2026-05-12  237  	return 0;
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  238  }
96f7b2b9bbb1d68 Qi Zheng      2023-09-11  239  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
