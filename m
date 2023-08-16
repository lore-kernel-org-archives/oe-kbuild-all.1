Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3E41844
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692152798; x=1723688798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2tRf3naf2c5ctxT7q+HHdzbvlkfLOsIUa5+Agb4rgas=;
  b=EepEgqQyPisCHQT0vVhuemrSXPf1EBflswLAWcp0a6AB4R5VX6NxLeh/
   MWKE6h2/rgSpZfmzIE85zszmT83zQVTey6AuT3y7miISWjcN58/4vWRjz
   mHeGK8kgW/+iKZa39dLqd65gfmiSM9CXI+siqK7qkoljLx6qIkdWNmDrN
   zprCMNKnHWrHz8CzgDcnWqiWU352UJopu3p28R5Uru09WitRFpJnOHH0o
   1OgJBN/2VygkoE7IJRya2uGwDVW9VZ1dSPWn9cfkMgtePWi2CAkT7NQkU
   RCn25KsIBCfasb/UInygUufxZQ3O5qYOIp+puVKwbE+BC9R2U0i9h6Rkd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="458775787"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="458775787"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 19:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877585273"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2023 19:26:40 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qW6F1-0001Q7-1w;
	Wed, 16 Aug 2023 02:26:35 +0000
Date: Wed, 16 Aug 2023 10:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2023.08.14a 48/51] kernel/rcu/tree_stall.h:11:10:
 fatal error: linux/rcu_notifier.h: No such file or directory
Message-ID: <202308161041.0EOMbdcX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.14a
head:   a90c4cbc91475bd5df35f712a954972fbfff40a1
commit: 815c9a53ab6b20e0dc90e733336151310a05cba2 [48/51] rcu: Add RCU CPU stall notifier
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230816/202308161041.0EOMbdcX-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161041.0EOMbdcX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161041.0EOMbdcX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5066:
>> kernel/rcu/tree_stall.h:11:10: fatal error: linux/rcu_notifier.h: No such file or directory
      11 | #include <linux/rcu_notifier.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 kernel/rcu/tree_stall.h

  > 11	#include <linux/rcu_notifier.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
