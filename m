Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F306E182DA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 19:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695326342; x=1726862342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JS8yJ5Q6TefjwqFy/YDZHSK1x3kb9UBrh5V0ZUk1tY8=;
  b=m7vzshhrDx+XHSeOoTNTzoMBmySOsiUbi5mulFGT6aRgMoFLRbWD8Z5J
   PecWxsiLPtW4OmNaKc92eGuhYRTvMXIQYntU7X1p4c1A5hz0OQ6Y66WJH
   TsBTWIQOVuNZEfxnGuw2+vSvP88OX7ZGFvRq9m2Fwi9nP2Vqlr63ZI9C2
   WkJcHPqZoM741iyThKM8karPK4mPQobHN+YHljCFWJPGBmW+jHolo1aAX
   xjB7TJLiyhKKQT34QyOSj4Q9qdR4O2UA/aNZ9ZXbsNFCri5/q7nY2BTdv
   Ue2kmh3ee5mKMLNR8OxSc+DPwuQBBnOhaC42colX7xN/PY6MvdJL9Eabp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="377937555"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="377937555"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 12:58:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="837425702"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; 
   d="scan'208";a="837425702"
Received: from lkp-server02.sh.intel.com (HELO b77866e22201) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2023 12:58:57 -0700
Received: from kbuild by b77866e22201 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjPox-0000L6-1k;
	Thu, 21 Sep 2023 19:58:46 +0000
Date: Fri, 22 Sep 2023 03:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] net: drop_monitor: use drop_reason_lookup()
Message-ID: <202309220317.8UvPH3sm-lkp@intel.com>
References: <20230921105129.c6e7e803398d.Idc122c3395bea9652f34ccaa678e918bfd4fae75@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921105129.c6e7e803398d.Idc122c3395bea9652f34ccaa678e918bfd4fae75@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master net/main net-next/main linus/master v6.6-rc2 next-20230921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20230922-013527
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20230921105129.c6e7e803398d.Idc122c3395bea9652f34ccaa678e918bfd4fae75%40changeid
patch subject: [RFC PATCH 3/4] net: drop_monitor: use drop_reason_lookup()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230922/202309220317.8UvPH3sm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309220317.8UvPH3sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309220317.8UvPH3sm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:134:13: warning: no previous prototype for 'drop_reason_lookup' [-Wmissing-prototypes]
     134 | const char *drop_reason_lookup(unsigned long long value)
         |             ^~~~~~~~~~~~~~~~~~


vim +/drop_reason_lookup +134 net/core/skbuff.c

071c0fc6fb919d Johannes Berg 2023-04-19  133  
f3ff481eeacc8e Johannes Berg 2023-09-21 @134  const char *drop_reason_lookup(unsigned long long value)
f3ff481eeacc8e Johannes Berg 2023-09-21  135  {
f3ff481eeacc8e Johannes Berg 2023-09-21  136  	unsigned long long subsys_id = value >> SKB_DROP_REASON_SUBSYS_SHIFT;
f3ff481eeacc8e Johannes Berg 2023-09-21  137  	u32 reason = value & ~SKB_DROP_REASON_SUBSYS_MASK;
f3ff481eeacc8e Johannes Berg 2023-09-21  138  	const struct drop_reason_list *subsys;
f3ff481eeacc8e Johannes Berg 2023-09-21  139  
f3ff481eeacc8e Johannes Berg 2023-09-21  140  	if (subsys_id >= SKB_DROP_REASON_SUBSYS_NUM)
f3ff481eeacc8e Johannes Berg 2023-09-21  141  		return NULL;
f3ff481eeacc8e Johannes Berg 2023-09-21  142  
f3ff481eeacc8e Johannes Berg 2023-09-21  143  	subsys = rcu_dereference(drop_reasons_by_subsys[subsys_id]);
f3ff481eeacc8e Johannes Berg 2023-09-21  144  	if (!subsys)
f3ff481eeacc8e Johannes Berg 2023-09-21  145  		return NULL;
f3ff481eeacc8e Johannes Berg 2023-09-21  146  	if (reason >= subsys->n_reasons)
f3ff481eeacc8e Johannes Berg 2023-09-21  147  		return NULL;
f3ff481eeacc8e Johannes Berg 2023-09-21  148  	return subsys->reasons[reason];
f3ff481eeacc8e Johannes Berg 2023-09-21  149  }
bde489a398871b Johannes Berg 2023-09-21  150  EXPORT_SYMBOL(drop_reason_lookup);
f3ff481eeacc8e Johannes Berg 2023-09-21  151  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
