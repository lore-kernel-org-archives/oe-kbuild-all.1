Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600B4693
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 03:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A1YmKaOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702610310; x=1734146310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5ikQqFbUDuQmUJU3xgU2dF22sow/XaY3Vu7BAuwrmk=;
  b=A1YmKaOAZWMSydhFQeQGR3mKXUpqtio5988yYEw1tJWi6lmWhrGDG6lb
   /vDvY+oBmjuMPibhwmIZgGRvJixB8I125sTs+Ld2z6lwLnF14dekFGdQl
   5m60U2cceNCyeW3Iucs5gXpY7hEdBEfOopSpvqy5ZSM2bJKctN0aFH2NS
   J5dcFoSX5thb2eMOYvHwNTOGFp6ZryHzmHlrEPTIw8fAGgKp5wlCk+mq1
   0CEmg69l4JMTvbrggg7v8XcAnfm4uwR417VoAhExm9udrK/15la3uZMyE
   V5swk8SrBGw+WZRZ2yD9Ib0RP3W+AfKab15p/7RrVruakxlkKSAbMtfkT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380218425"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="380218425"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 19:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892735393"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="892735393"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2023 19:18:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDyiX-000N2F-1W;
	Fri, 15 Dec 2023 03:18:25 +0000
Date: Fri, 15 Dec 2023 11:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/sched/core.c:4854:6:
 error: no previous prototype for '__balance_callbacks'
Message-ID: <202312151124.zRL9H2Ph-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ab6f88aebe2fc11299ab6da38ff960cdf785b050
commit: fdaddcab764a1219457d72273a96e2afb30b8824 [1/2] ANDROID: GKI: vendor code needs __balance_callbacks access
config: x86_64-sof-customedconfig-atom-defconfig (https://download.01.org/0day-ci/archive/20231215/202312151124.zRL9H2Ph-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151124.zRL9H2Ph-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151124.zRL9H2Ph-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:3543:6: error: no previous prototype for 'sched_set_stop_task' [-Werror=missing-prototypes]
    3543 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/core.c:4854:6: error: no previous prototype for '__balance_callbacks' [-Werror=missing-prototypes]
    4854 | void __balance_callbacks(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/__balance_callbacks +4854 kernel/sched/core.c

  4853	
> 4854	void __balance_callbacks(struct rq *rq)
  4855	{
  4856		do_balance_callbacks(rq, __splice_balance_callbacks(rq, false));
  4857	}
  4858	EXPORT_SYMBOL_GPL(__balance_callbacks);
  4859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
