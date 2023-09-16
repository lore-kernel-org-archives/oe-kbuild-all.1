Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4E86FC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 17:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694885716; x=1726421716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wMdeQXMRtZHfbWXwp3tO6jSt1XUYeRQvxUqIWocYO3A=;
  b=Y40+RebQd+rE8IaiMai8fxYwh1UVKUV3Q6KQjAZl6skops6Sm230kQoy
   8SRCCzM0ekV2yxwhFgNNlbVy65YK1Ut0tJWmoDyYYiYi/Y9s07kPvLykL
   5LVFMBRJQFttOM/rMRKigkz6wrWCGRx8fxUS+zX102qIMk9G80UH98OAo
   C80Wda2b63r/hhepnv+CiEhU7Ob+uAs95sp8sriX23QUY5PfHFL/s74rb
   y7UuL+cwVOIIcgvKAeZna8IsGSwvjpZYlQg7vu789RQify18cl1Dt4a10
   kfusDkfNSGqHl2SjTjYBcxYtNGOwwnXZGJDg53ToNcNRw8bpWoKE9HHwI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="369755730"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="369755730"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 10:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="860555550"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="860555550"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2023 10:35:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhZCK-0004WK-2p;
	Sat, 16 Sep 2023 17:35:12 +0000
Date: Sun, 17 Sep 2023 01:35:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 8602/23345]
 include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202309170103.ev6wzAXr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f9a1230327dc4d4a5a2b9e519e7bbe4289f660ad
commit: 5168caa32a196470b560403662a31cf20837626d [8602/23345] ANDROID: Add vendor hook for tk_based_time_sync
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230917/202309170103.ev6wzAXr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170103.ev6wzAXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170103.ev6wzAXr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/time/timekeeping.c: note: in included file:
>> include/trace/hooks/timekeeping.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +14 include/trace/hooks/timekeeping.h

    12	
    13	struct timekeeper;
  > 14	DECLARE_RESTRICTED_HOOK(android_rvh_tk_based_time_sync,
    15		TP_PROTO(struct timekeeper *tk),
    16		TP_ARGS(tk), 1);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
