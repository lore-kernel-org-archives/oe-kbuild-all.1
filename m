Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3D328D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+zTZIP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699553065; x=1731089065;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JKwIIelmRFfbkMA4WylBoxQ9S7KxYJ64zxZkh8yU8UQ=;
  b=M+zTZIP2+Lddua+MSlBqM9dHSjLatDIBirzES4Zq3TP/5t3GDTQL1CeS
   EVriQ9pSHLNFt8Z9nqXg2NGLvZjDAj3VpzrzXBmmw6QGkyz+jjjbGzSO0
   dMNEYyQtMZH587UJCB+xTHHuREpY9KlY/oYFo8s3IFQOqODO4ahjVPzRo
   QSvwbIU+9c0JO2zgx20ZF3s4arByrmaGMMdtaEnhTWjFvF81bCUc6NYSl
   b1y9ktPwDi20ZGwwf4ghD/2jYpPykPuif5XSUUCyKsgCfa0kfeU51VUzl
   MrL2K04stWKgm2sklNT7aamGiLTIVboCQur0TH/mjkKQz8RhqBsXT5Ylo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="389847388"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="389847388"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="713396896"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="713396896"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Nov 2023 10:04:21 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r19O6-00091u-35;
	Thu, 09 Nov 2023 18:04:19 +0000
Date: Fri, 10 Nov 2023 02:04:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tycho Andersen <tycho@tycho.pizza>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] misc: introduce misc_cg_charge()
Message-ID: <202311100146.ydtzwawu-lkp@intel.com>
References: <20231108002647.73784-4-tycho@tycho.pizza>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108002647.73784-4-tycho@tycho.pizza>

Hi Tycho,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 13d88ac54ddd1011b6e94443958e798aa06eb835]

url:    https://github.com/intel-lab-lkp/linux/commits/Tycho-Andersen/fs-count_open_files-count_possible_open_files/20231108-083733
base:   13d88ac54ddd1011b6e94443958e798aa06eb835
patch link:    https://lore.kernel.org/r/20231108002647.73784-4-tycho%40tycho.pizza
patch subject: [RFC 3/6] misc: introduce misc_cg_charge()
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231110/202311100146.ydtzwawu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100146.ydtzwawu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100146.ydtzwawu-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/misc.c: In function 'misc_cg_charge':
>> kernel/cgroup/misc.c:151:41: error: passing argument 2 of 'atomic_long_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
     151 |                 atomic_long_add(amount, &res->usage);
         |                                         ^~~~~~~~~~~
         |                                         |
         |                                         atomic64_t *
   In file included from include/linux/atomic.h:82,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/misc.c:10:
   include/linux/atomic/atomic-instrumented.h:3230:40: note: expected 'atomic_long_t *' {aka 'atomic_t *'} but argument is of type 'atomic64_t *'
    3230 | atomic_long_add(long i, atomic_long_t *v)
         |                         ~~~~~~~~~~~~~~~^
   cc1: some warnings being treated as errors


vim +/atomic_long_add +151 kernel/cgroup/misc.c

   123	
   124	/**
   125	 * misc_cg_charge() - Charge the cgroup, ignoring limits/capacity.
   126	 * @type: Misc res type to charge.
   127	 * @cg: Misc cgroup which will be charged.
   128	 * @amount: Amount to charge.
   129	 *
   130	 * Charge @amount to the misc cgroup. Caller must use the same cgroup during
   131	 * the uncharge call.
   132	 *
   133	 * Context: Any context.
   134	 */
   135	void misc_cg_charge(enum misc_res_type type, struct misc_cg *cg, u64 amount)
   136	{
   137		struct misc_res *res;
   138		struct misc_cg *i;
   139	
   140		if (!(valid_type(type) && cg && READ_ONCE(misc_res_capacity[type]))) {
   141			WARN_ON_ONCE(!valid_type(type));
   142			return;
   143		}
   144	
   145		if (!amount)
   146			return;
   147	
   148		for (i = cg; i; i = parent_misc(i)) {
   149			res = &i->res[type];
   150	
 > 151			atomic_long_add(amount, &res->usage);
   152		}
   153	}
   154	EXPORT_SYMBOL_GPL(misc_cg_charge);
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
