Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B045D1D63E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083331; cv=none; b=OnHfHKIfYR8QTgjdH28w0VszXqq4RpLS8BGueO4EYqNtB03R/ZPmBemZDG68vPibb3jnp4iZB3sFz9uIAoxApWnjqFGaPY01XqivvjftSkQdRQNgdw7x6ML4MhBltDOjvslD+BfYNAmhhyCS2Thd9MAy1WVU65XZ5zrSV/t+WxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083331; c=relaxed/simple;
	bh=cviFP9rrvwYYJLMTAmzy67tvS/bWe4YhO1+QZmllZQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl8DksUl/4IXCyWLrtn8FR8LhfJKKAOao9kANQz5hgO6pJQj7NMtENuhfbYKNM4HXXJlNSCThadNorAImBj+RLA4hGCxNVzwrj56qu2VOwUMVyFwLZY4q93fwpReYq2f2T8M5A7SvWu++rPaWjwnm31OjKhBkiuPUzDax+NdX0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR/7S/Xq; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR/7S/Xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760083329; x=1791619329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cviFP9rrvwYYJLMTAmzy67tvS/bWe4YhO1+QZmllZQI=;
  b=mR/7S/XqsZ0jqC4qYUfjdpD3S+L3NyWfOYH0Km5NjlHl3PuXFvvbv5kH
   VNdshe5vSI0gRkkk5jn8WrXeF62vaCqtjnXYvchjz4RsRhc1wAtZANo5C
   FiVEF8ruOXu2oeKte6yiKzRFVZyD/xmDfOkCw4e0ydUbQm29qPyWJnebI
   qXM/wVQz7y5dVKdLRqpls1Rq86Lp/hIe9sIwPQxLjsOWsRjqFC5kN5yxE
   Nfq9kTh2N99g4b21SK2r27nCfJfgEi5KEhNYjbanB0DMprPu4NtJjFBAf
   TeujrC7H3b1BRwu2SJOXKBJvHfZVk20TeYmOZGIRG9J8S4xV19PS4nNAa
   A==;
X-CSE-ConnectionGUID: qcUS2x3JTAyTiF/KRoXNZA==
X-CSE-MsgGUID: xFb3irIYSRSk28yrs68fOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62328954"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62328954"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 01:02:07 -0700
X-CSE-ConnectionGUID: /RYTgAIzT/CEhVfp3X3nYg==
X-CSE-MsgGUID: gcDOIQ8rR9uxU74YowEpgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="181351750"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Oct 2025 01:02:06 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v784i-0002RR-0U;
	Fri, 10 Oct 2025 08:02:04 +0000
Date: Fri, 10 Oct 2025 16:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 1/1] mm/shrinker.c:688:6: warning: no
 previous prototype for 'register_shrinker_prepared'
Message-ID: <202510101510.04hlD5L8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   eb81fd92a9db00ec051630a8937aa93319a08d2a
commit: f1dadc895ed84d664e6d2d008be8225d3b051db7 [1/1] mm: shrinker: remove old APIs
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20251010/202510101510.04hlD5L8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101510.04hlD5L8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101510.04hlD5L8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_shrinker_prepared +688 mm/shrinker.c

314369bb029a4d Qi Zheng 2023-09-11  687  
314369bb029a4d Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
314369bb029a4d Qi Zheng 2023-09-11  689  {
314369bb029a4d Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
314369bb029a4d Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
314369bb029a4d Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
314369bb029a4d Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
314369bb029a4d Qi Zheng 2023-09-11  695  }
314369bb029a4d Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: 314369bb029a4d7f5018a64217e28d549e42fb65 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
