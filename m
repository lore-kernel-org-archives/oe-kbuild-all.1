Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A155381
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ecetvkhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702529992; x=1734065992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x+qW7HVFGmmJj9uVndQW8WWk6ltFQQWjy8x1mxH1S94=;
  b=Ecetvkhjfld1IJkDfg3g1ly49mDpGI+MIbdpL4o7jC6dbCHJjbOYSXlt
   y1vO1hauotY0tUJM2Q9CWkEtyf2XkQQzIL1RICX+1ZDQfknjAMPFHsxj7
   PfezNAWAGuLcza9cqgZVCTi0qT5ZgA8u+1izSSkBRNo2hG48w4vOj8srl
   AYcX+ynkmJ8ZmZag0MyCm57Rp6UnD86bUZrem7qKzhtV3jhApruZVG3JA
   JWJuOVbRlekwgE3/by4A6IGOOH0f5Xz6D/7o7jldJai4u8QXMhVPdhoPr
   syW/n3mMF8GhrGw0BqqJmhQxwBRCZ+8SEMszHs7TMMDNCr5NaxOV1b0pz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="426200871"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="426200871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 20:59:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="15703074"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2023 20:59:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDdp6-000LYv-0k;
	Thu, 14 Dec 2023 04:59:48 +0000
Date: Thu, 14 Dec 2023 12:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to
 restricted __be32
Message-ID: <202312141253.4bTcywD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 200e10f46936d95a553414f249cefb765194b235 Support to encoding decoding skb prio on IFE action
date:   8 years ago
config: i386-randconfig-063-20230903 (https://download.01.org/0day-ci/archive/20231214/202312141253.4bTcywD4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141253.4bTcywD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141253.4bTcywD4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
>> net/sched/act_meta_skbprio.c:43:25: sparse: sparse: cast to restricted __be32
   In file included from include/linux/kernel.h:11,
                    from net/sched/act_meta_skbprio.c:14:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~

vim +43 net/sched/act_meta_skbprio.c

    38	
    39	static int skbprio_decode(struct sk_buff *skb, void *data, u16 len)
    40	{
    41		u32 ifeprio = *(u32 *)data;
    42	
  > 43		skb->priority = ntohl(ifeprio);
    44		return 0;
    45	}
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
