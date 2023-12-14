Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577852DB61
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0wz8mIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702596392; x=1734132392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A4Lh7nE7BSE17fL2uX90VjGQh6wz8O3kgMV7SoGz0AE=;
  b=k0wz8mIqFyrYblkLPTF5mGyvPP6VQ1IungrmLe6Vu1l63y7pkeqoh7Tp
   4xvBrv+a49EuU1KLyYP7qmjFwM31DlD+62t3LfQHld4G6iuTJhlN2CWSD
   lo/pvUP7mwjBoXA35kk0gFQtxqfOK139iI0UnjLvDKRLfrtao+E7FL8Sj
   OqcwelZB9Z4QrPvs2MWRwpN0ZAn4szX8mnren9oCTk3w3wEfgGvi+yaCN
   mXiFPpqt/MN6I32rw4jlGKc/tKoy4TW3rfa+2brCR5BlJDoZLnsamtz1r
   MKw6uJNsrKwZ5g5vEcQhyUkzaoCBsdt78heKmkFdsVU3ubkm/2AcLPQ7S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461665337"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="461665337"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 15:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="1105909710"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="1105909710"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Dec 2023 15:26:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDv63-000Mjp-3D;
	Thu, 14 Dec 2023 23:26:27 +0000
Date: Fri, 15 Dec 2023 07:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 13549/30000]
 kernel/power/qos.c:358:1: warning: the frame size of 33144 bytes is larger
 than 8192 bytes
Message-ID: <202312150759.NpHgo3Hr-lkp@intel.com>
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
head:   cf192765644ad5c02b878bbd303fc8b30f6398b4
commit: 723feab600f71b3104a10de5b372bd1d9adf5943 [13549/30000] ANDROID: GKI: QoS: Enhance framework to support cpu/irq specific QoS requests
config: x86_64-randconfig-072-20230926 (https://download.01.org/0day-ci/archive/20231215/202312150759.NpHgo3Hr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150759.NpHgo3Hr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150759.NpHgo3Hr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/qos.c: In function 'pm_qos_update_target':
>> kernel/power/qos.c:358:1: warning: the frame size of 33144 bytes is larger than 8192 bytes [-Wframe-larger-than=]
     358 | }
         | ^
   kernel/power/qos.c:630: warning: Function parameter or member 'new_value' not described in 'pm_qos_update_request'
   kernel/power/qos.c:630: warning: Excess function parameter 'value' description in 'pm_qos_update_request'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]


vim +358 kernel/power/qos.c

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
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  306  int pm_qos_update_target(struct pm_qos_constraints *c, struct plist_node *node,
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
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04 @358  }
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  359  

:::::: The code at line 358 was first introduced by commit
:::::: d82b35186eaa816267f044bd70cc0acb3c7971a3 pm qos infrastructure and interface

:::::: TO: Mark Gross <mgross@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
