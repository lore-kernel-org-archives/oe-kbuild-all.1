Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F026BA3C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 15:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efwM9Wrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697123179; x=1728659179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Mn+K7eiANeGu+62nxmXcFjF8FYQ8OVgbp2ZBKqwL0zM=;
  b=efwM9WrpUvTPWkA1cKUjj1apPHSTSMoSwQdQXrI3LMZ/WCHn9LEqupav
   g9Qikw9xy3oU5HOakgesTdhNbX74/dal+rKHq5oWpVcUV+Y75EztSC35j
   KQIiKTy92ELzl4Udd24fGBz1uvsAxfpL/OibBzTMKHLBossATH7dZV89W
   6L3kL0jrw+TV9xCKEaef147qQJxZXt5kYgRPyYyQAooiI9RoVxLmPZlbf
   xwAS6WzUAVY7H8JUn1xsGzoqrzlkmICwoWlt75WamDo6Sr2DjXA/tWpdG
   mYnM+4nrgyPwME+A6+cjJHEgTmDNLL1uNeJ/KlPU0IIKCFT7korkocd+0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388814190"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388814190"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 08:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1001566257"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1001566257"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Oct 2023 08:06:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqxGQ-0003Yd-0b;
	Thu, 12 Oct 2023 15:06:14 +0000
Date: Thu, 12 Oct 2023 23:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: Li zeming <zeming@nfschina.com>, tj@kernel.org, jiangshanlai@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Li zeming <zeming@nfschina.com>
Subject: Re: [PATCH] kernel/workqueue: =?utf-8?Q?Re?=
 =?utf-8?B?bW92ZSB1bm5lY2Vzc2FyeSDigJgw4oCZ?= values from hash
Message-ID: <202310122246.FzszMZbr-lkp@intel.com>
References: <20230829181755.3204-1-zeming@nfschina.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829181755.3204-1-zeming@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tj-wq/for-next]
[also build test WARNING on linus/master v6.6-rc5 next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-zeming/kernel-workqueue-Remove-unnecessary-0-values-from-hash/20230828-095048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
patch link:    https://lore.kernel.org/r/20230829181755.3204-1-zeming%40nfschina.com
patch subject: [PATCH] kernel/workqueue: Remove unnecessary ‘0’ values from hash
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20231012/202310122246.FzszMZbr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310122246.FzszMZbr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310122246.FzszMZbr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'wqattrs_hash':
>> kernel/workqueue.c:3777:16: warning: 'hash' is used uninitialized [-Wuninitialized]
    3777 |         hash = jhash_1word(attrs->nice, hash);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:3775:13: note: 'hash' was declared here
    3775 |         u32 hash;
         |             ^~~~


vim +/hash +3777 kernel/workqueue.c

5de7a03cac1476 Tejun Heo           2023-08-07  3771  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3772  /* hash value of the content of @attr */
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3773  static u32 wqattrs_hash(const struct workqueue_attrs *attrs)
226223ab3c4118 Tejun Heo           2013-03-12  3774  {
dd46423224bbdf Li zeming           2023-08-30  3775  	u32 hash;
226223ab3c4118 Tejun Heo           2013-03-12  3776  
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02 @3777  	hash = jhash_1word(attrs->nice, hash);
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3778  	hash = jhash(cpumask_bits(attrs->cpumask),
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3779  		     BITS_TO_LONGS(nr_cpumask_bits) * sizeof(long), hash);
9546b29e4a6ad6 Tejun Heo           2023-08-07  3780  	hash = jhash(cpumask_bits(attrs->__pod_cpumask),
9546b29e4a6ad6 Tejun Heo           2023-08-07  3781  		     BITS_TO_LONGS(nr_cpumask_bits) * sizeof(long), hash);
8639ecebc9b179 Tejun Heo           2023-08-07  3782  	hash = jhash_1word(attrs->affn_strict, hash);
6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  3783  	return hash;
d55262c4d16475 Tejun Heo           2013-04-01  3784  }
226223ab3c4118 Tejun Heo           2013-03-12  3785  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
