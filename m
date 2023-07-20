Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306E1BE60
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689880866; x=1721416866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C8sHf4p1+gs41UrYrdOL3g+lLqIGSTpUCHO6u/wusnQ=;
  b=jRxgQuJnHWJutuFZaXgTF4Ax2Cu7FhmkBXW4+SWJ7G8Tz70GM6kOPOjL
   Asg9ERMULiT5WPh6YhGu2D3RhCMTWCxpBEy/MsOv1DKn2NmGF9pXalarA
   +WlLnOJjHMaHn+vfDstIhb0CH7XfxhRWLbUB55Cy+YeWWWSkAHGYJwJOm
   0iYzQlZGTnt0LEJY04m48L4Kdgv5wHG4MhJ6kZcYW9fkOCUgQ6eNLTv47
   es0rBOtYR4QtNJJDZTwOuKyC/8AABPDxGwR1RCnZQ1xQg3zEwU2UOq2QT
   EZam4REXBA52A98IRTOKyk086U1Kl0GyfDL0iVmuGgmLGfr5IrxlC4TS1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="430639606"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="430639606"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 12:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="754156835"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="754156835"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Jul 2023 12:19:48 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMZBj-0006QN-1p;
	Thu, 20 Jul 2023 19:19:47 +0000
Date: Fri, 21 Jul 2023 03:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 3278/3762] security/selinux/hooks.c:249:41:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202307210332.4AqFZfzI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: dd51fcd42fd6bf37608f54303b974b47f73c1490 [3278/3762] selinux: introduce and use lsm_ad_net_init*() helpers
config: x86_64-randconfig-x063-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210332.4AqFZfzI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210332.4AqFZfzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307210332.4AqFZfzI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/selinux/hooks.c:249:41: sparse: sparse: Using plain integer as NULL pointer
   security/selinux/hooks.c:5392:22: sparse: sparse: restricted __be16 degrades to integer
   security/selinux/hooks.c:5393:22: sparse: sparse: restricted __be16 degrades to integer

vim +249 security/selinux/hooks.c

   244	
   245	static void ad_net_init_from_iif(struct common_audit_data *ad,
   246					 struct lsm_network_audit *net,
   247					 int ifindex, u16 family)
   248	{
 > 249		__ad_net_init(ad, net, ifindex, 0, family);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
