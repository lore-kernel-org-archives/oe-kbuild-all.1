Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794F0ED4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 01:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685496297; x=1717032297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3PG05Xi0MYCOnR5T32lh9fDqacHB+/dGJjDWbGD1dM=;
  b=ZpE+KvaiU35yenhSYqkR5RBMQEFU5KW5WgwU2iaOI0/NORWUQzT51lCK
   yNjXhjxS5FL/mNKsxIn86c69kW1UL2Cy+mcupW7X0VJpl7T+7QSkVXLM0
   bH83bePYdMU8GAa+FOl91r7E9zgCsEnrNG5DCtjjx4YmDZc5Wca9eySNf
   tyWPpJ3yvgTfZJ/hg5kmgANnnSDPWHzhqmQmz/0l+2EsXdjRJs+dbCxvP
   wmACU+/dwtXzi7OBT4KRJ9wdq1QDjdvPpd0pS8GAxW8zmt8zpmQl54SyH
   mZJkIJo6aLGdQTjkPhldw2VHa24/LbZwYQUx201w3YWE09srSAtuyFmDz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="355107756"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="355107756"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 18:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="953399018"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="953399018"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 May 2023 18:24:52 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Aa3-0000xj-2C;
	Wed, 31 May 2023 01:24:51 +0000
Date: Wed, 31 May 2023 09:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: [ammarfaizi2-block:testing/af/home 3/8] kernel/workqueue.c:4421:5:
 warning: no previous prototype for 'set_workqueue_cpumask'
Message-ID: <202305310934.bM5gW0SL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block testing/af/home
head:   51fb2efd62ae52dc061dbca301fb823357fb3f80
commit: 6436622d20b564a334e4bc0bc5019c82a592dd08 [3/8] workqueue: Add set_workqueue_cpumask() helper function
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230531/202305310934.bM5gW0SL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/6436622d20b564a334e4bc0bc5019c82a592dd08
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block testing/af/home
        git checkout 6436622d20b564a334e4bc0bc5019c82a592dd08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310934.bM5gW0SL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/workqueue.c:4421:5: warning: no previous prototype for 'set_workqueue_cpumask' [-Wmissing-prototypes]
    4421 | int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/set_workqueue_cpumask +4421 kernel/workqueue.c

  4420	
> 4421	int set_workqueue_cpumask(struct workqueue_struct *wq, const cpumask_var_t mask)
  4422	{
  4423		struct workqueue_attrs *tmp_attrs;
  4424		int ret;
  4425	
  4426		tmp_attrs = alloc_workqueue_attrs();
  4427		if (!tmp_attrs)
  4428			return -ENOMEM;
  4429	
  4430		apply_wqattrs_lock();
  4431		copy_workqueue_attrs(tmp_attrs, wq->unbound_attrs);
  4432		cpumask_copy(tmp_attrs->cpumask, mask);
  4433		ret = apply_workqueue_attrs_locked(wq, tmp_attrs);
  4434		apply_wqattrs_unlock();
  4435		free_workqueue_attrs(tmp_attrs);
  4436		return ret;
  4437	}
  4438	EXPORT_SYMBOL_GPL(set_workqueue_cpumask);
  4439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
