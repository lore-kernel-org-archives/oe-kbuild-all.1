Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2BF1EA8A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jul 2023 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689156832; x=1720692832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgDVmDu2TN3naNsRn/WjzVncnX1dbs7SkaP5U/hT914=;
  b=bXLd7CVWNA2JO20K9Z92dbkOqhgnONCOmA64vJJSmWxD4Q5ZfdSK9H9X
   MvfzUU2TN1qlDm1vs8/i2LJT9xlId0ZyE+sXXB+ryh8dna1cO24xP9gCu
   ILYz3Nai0OFyoAkmFNvpUtlj58tTTdhf1qeeE3mzFjvTDXga/zDaZMieA
   rG65uinaMGyYjPw2JVd9iKE+I9FdK5H26LawIKamRwhhbkFbolIE7HJjr
   lquDkW3dhwDQmgcQBr1LsJSaKp4lMJgid/MaTMPTHvwZweA1ICi9Sw0iH
   KfenbX8895fLucE78TtHWeqSAbWgifCFMF5mYfr2NLIwz2pDCcFI/3+1G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430983237"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="430983237"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 03:13:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721456439"
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="scan'208";a="721456439"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Jul 2023 03:13:51 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJWr0-0005bh-2Q;
	Wed, 12 Jul 2023 10:13:50 +0000
Date: Wed, 12 Jul 2023 18:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 486/536] include/net/tc_wrapper.h:236:22:
 error: invalid use of undefined type 'const struct tc_action_ops'
Message-ID: <202307121827.j0a5wa9T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   d1ccb2b601e7279db7b279cbfb6d8792cc280299
commit: ea09157885cea63734eee783b4251d6b5935dfe0 [486/536] net/sched: add retpoline wrapper for tc
config: openrisc-randconfig-r025-20230712 (https://download.01.org/0day-ci/archive/20230712/202307121827.j0a5wa9T-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307121827.j0a5wa9T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307121827.j0a5wa9T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/sched/sch_api.c:34:
   include/net/tc_wrapper.h: In function 'tc_act':
>> include/net/tc_wrapper.h:236:22: error: invalid use of undefined type 'const struct tc_action_ops'
     236 |         return a->ops->act(skb, a, res);
         |                      ^~


vim +236 include/net/tc_wrapper.h

   232	
   233	static inline int tc_act(struct sk_buff *skb, const struct tc_action *a,
   234				   struct tcf_result *res)
   235	{
 > 236		return a->ops->act(skb, a, res);
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
