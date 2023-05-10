Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244B114ABB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683744946; x=1715280946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFhkhzPiouhcTq8Zf3rdVTdFY2eObU+N9bduVF5SaVo=;
  b=hJkSa1zmVJONPn/dhwCBXxn0vMYHp1qkJxpKIqs3MxZoWn2ot/dG5Z8x
   07uuqcLir95zlA1SFZ16mvLP9/NZo4cS7a//pc8o6udmsk+zKz9AuDCh1
   4cdsr/cheJWVHiOCT+kp6m17/F64j7ijAyLZ0bDUZt4rHR1AvWiJBb3zN
   4B2ap0rShg1egd6s0oJZv7zt0emtTqZkIyb9ZCC2tO+P9pTXpPJZ5nFmf
   QdJuMrBO/fvxr1gfqN8CLdUoHBkxPMsnJxtoeZRpFn18P2JAhGXLbrw9w
   Qtap+raB74gt14O4DylVM8qMfN36eFRg4OKIBc1F1/z0VFLJG5QzH8tVm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436618925"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436618925"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 11:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="732255845"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="732255845"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2023 11:55:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwoyV-0003W6-1n;
	Wed, 10 May 2023 18:55:43 +0000
Date: Thu, 11 May 2023 02:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] workqueue: support pausing ordered workqueues
Message-ID: <202305110243.2OKGEFEb-lkp@intel.com>
References: <20230510175846.85cb30389c22.Ia49f779e11c2814294ea7f8bb29f825fb840be51@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510175846.85cb30389c22.Ia49f779e11c2814294ea7f8bb29f825fb840be51@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main tj-wq/for-next linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/workqueue-support-pausing-ordered-workqueues/20230511-000621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230510175846.85cb30389c22.Ia49f779e11c2814294ea7f8bb29f825fb840be51%40changeid
patch subject: [RFC PATCH 1/4] workqueue: support pausing ordered workqueues
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230511/202305110243.2OKGEFEb-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2053f0ebc109c7389b2e04f03af65dac874ee632
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Johannes-Berg/workqueue-support-pausing-ordered-workqueues/20230511-000621
        git checkout 2053f0ebc109c7389b2e04f03af65dac874ee632
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110243.2OKGEFEb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/workqueue.c: In function 'pwq_adjust_max_active':
>> kernel/workqueue.c:3866:13: warning: variable 'new_max_active' set but not used [-Wunused-but-set-variable]
    3866 |         int new_max_active;
         |             ^~~~~~~~~~~~~~


vim +/new_max_active +3866 kernel/workqueue.c

  3852	
  3853	/**
  3854	 * pwq_adjust_max_active - update a pwq's max_active to the current setting
  3855	 * @pwq: target pool_workqueue
  3856	 *
  3857	 * If @pwq isn't freezing, set @pwq->max_active to the associated
  3858	 * workqueue's saved_max_active and activate inactive work items
  3859	 * accordingly.  If @pwq is freezing, clear @pwq->max_active to zero.
  3860	 */
  3861	static void pwq_adjust_max_active(struct pool_workqueue *pwq)
  3862	{
  3863		struct workqueue_struct *wq = pwq->wq;
  3864		bool freezable = wq->flags & WQ_FREEZABLE;
  3865		unsigned long flags;
> 3866		int new_max_active;
  3867	
  3868		/* for @wq->saved_max_active and @wq->flags */
  3869		lockdep_assert_held(&wq->mutex);
  3870	
  3871		if (wq->flags & __WQ_PAUSED)
  3872			new_max_active = 0;
  3873		else
  3874			new_max_active = wq->saved_max_active;
  3875	
  3876		/* fast exit for non-freezable wqs */
  3877		if (!freezable && pwq->max_active == wq->saved_max_active)
  3878			return;
  3879	
  3880		/* this function can be called during early boot w/ irq disabled */
  3881		raw_spin_lock_irqsave(&pwq->pool->lock, flags);
  3882	
  3883		/*
  3884		 * During [un]freezing, the caller is responsible for ensuring that
  3885		 * this function is called at least once after @workqueue_freezing
  3886		 * is updated and visible.
  3887		 */
  3888		if (!freezable || !workqueue_freezing) {
  3889			bool kick = false;
  3890	
  3891			pwq->max_active = wq->saved_max_active;
  3892	
  3893			while (!list_empty(&pwq->inactive_works) &&
  3894			       pwq->nr_active < pwq->max_active) {
  3895				pwq_activate_first_inactive(pwq);
  3896				kick = true;
  3897			}
  3898	
  3899			/*
  3900			 * Need to kick a worker after thawed or an unbound wq's
  3901			 * max_active is bumped. In realtime scenarios, always kicking a
  3902			 * worker will cause interference on the isolated cpu cores, so
  3903			 * let's kick iff work items were activated.
  3904			 */
  3905			if (kick)
  3906				wake_up_worker(pwq->pool);
  3907		} else {
  3908			pwq->max_active = 0;
  3909		}
  3910	
  3911		raw_spin_unlock_irqrestore(&pwq->pool->lock, flags);
  3912	}
  3913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
