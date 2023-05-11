Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F5206B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683835001; x=1715371001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1q9/w5RSjOHa0gm5vbl9RKiJPQAt6jIigfgBjKuBEd8=;
  b=QZNIM+CFRlVFB6iPvsbd1xkAnag+daNXixGrjBFSnGPWZfp15tTEL96k
   K/Yv5gF9iQpP3GeiiSqCeE+HSI4wfil+tcFZVYbuF6USihwGT+1HAolkN
   t0+kdw6VwSNHkLMs5cIhV28ipbcJ4tqj5cvbuAYgsU14NkfFAX7ne/qRE
   hPjUJFmmy5aezjQRGEfbHLjA1yKisCIFNeSvXO4KE+Xm9J1h4OPy9aKLA
   RtK28olxY/J7NODDMSOZ6ucmLL9wpjSswBtUYRUFSOBBfXxMybhvzyD3k
   /6/G+oStp3VtbtNOEdJECwzHD+Dxxe4cmwzJMkoVQJkj1NrFH+sSw5tGa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="413975605"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="413975605"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 12:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="732736891"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="732736891"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 May 2023 12:56:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxCP1-0004EC-1U;
	Thu, 11 May 2023 19:56:39 +0000
Date: Fri, 12 May 2023 03:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14939/29506]
 kernel/power/qos.c:306:5: warning: stack frame size (32888) exceeds limit
 (8192) in 'pm_qos_update_target'
Message-ID: <202305120304.wklStiyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lina,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   7cf5d82154dcd64ff75b69f3dc8dbff4ed2d2816
commit: 723feab600f71b3104a10de5b372bd1d9adf5943 [14939/29506] ANDROID: GKI: QoS: Enhance framework to support cpu/irq specific QoS requests
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230512/202305120304.wklStiyw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout 723feab600f71b3104a10de5b372bd1d9adf5943
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/power/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120304.wklStiyw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/qos.c:306:5: warning: stack frame size (32888) exceeds limit (8192) in 'pm_qos_update_target' [-Wframe-larger-than]
   int pm_qos_update_target(struct pm_qos_constraints *c, struct plist_node *node,
       ^
   1 warning generated.
   kernel/power/qos.c:630: warning: Function parameter or member 'new_value' not described in 'pm_qos_update_request'
   kernel/power/qos.c:630: warning: Excess function parameter 'value' description in 'pm_qos_update_request'


vim +/pm_qos_update_target +306 kernel/power/qos.c

723feab600f71b kernel/power/qos.c     Lina Iyer           2014-05-21  294  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  295  /**
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  296   * pm_qos_update_target - manages the constraints list and calls the notifiers
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  297   *  if needed
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  298   * @c: constraints data struct
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  299   * @node: request to add to the list, to update or to remove
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  300   * @action: action to take on the constraints list
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  301   * @value: value of the request to add or update
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  302   *
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  303   * This function returns 1 if the aggregated constraint value has changed, 0
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  304   *  otherwise.
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  305   */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25 @306  int pm_qos_update_target(struct pm_qos_constraints *c, struct plist_node *node,
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  307  			 enum pm_qos_req_action action, int value)
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  308  {
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  309  	unsigned long flags;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  310  	int prev_value, curr_value, new_value;
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  311  	int ret;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  312  
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  313  	spin_lock_irqsave(&pm_qos_lock, flags);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  314  	prev_value = pm_qos_get_value(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  315  	if (value == PM_QOS_DEFAULT_VALUE)
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  316  		new_value = c->default_value;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  317  	else
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  318  		new_value = value;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  319  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  320  	switch (action) {
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  321  	case PM_QOS_REMOVE_REQ:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  322  		plist_del(node, &c->list);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  323  		break;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  324  	case PM_QOS_UPDATE_REQ:
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  325  		/*
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  326  		 * to change the list, we atomically remove, reinit
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  327  		 * with new value and add, then see if the extremal
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  328  		 * changed
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  329  		 */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  330  		plist_del(node, &c->list);
fe43e2ce526979 kernel/power/qos.c     Gustavo A. R. Silva 2018-03-30  331  		/* fall through */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  332  	case PM_QOS_ADD_REQ:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  333  		plist_node_init(node, new_value);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  334  		plist_add(node, &c->list);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  335  		break;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  336  	default:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  337  		/* no action */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  338  		;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  339  	}
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  340  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  341  	curr_value = pm_qos_get_value(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  342  	pm_qos_set_value(c, curr_value);
723feab600f71b kernel/power/qos.c     Lina Iyer           2014-05-21  343  	pm_qos_set_value_for_cpus(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  344  
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  345  	spin_unlock_irqrestore(&pm_qos_lock, flags);
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  346  
247e9ee034b044 kernel/power/qos.c     Sahara              2013-06-21  347  	trace_pm_qos_update_target(action, prev_value, curr_value);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  348  	if (prev_value != curr_value) {
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  349  		ret = 1;
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  350  		if (c->notifiers)
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  351  			blocking_notifier_call_chain(c->notifiers,
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  352  						     (unsigned long)curr_value,
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  353  						     NULL);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  354  	} else {
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  355  		ret = 0;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  356  	}
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  357  	return ret;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  358  }
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  359  

:::::: The code at line 306 was first introduced by commit
:::::: abe98ec2d86279fe821c9051003a0abc43444f15 PM QoS: Generalize and export constraints management code

:::::: TO: Jean Pihet <j-pihet@ti.com>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
