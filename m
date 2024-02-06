Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E0B7FBDB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707199976; cv=none; b=HrVk0Uq7ugennI//LZpboLiG69T/g+qigFhNs2FNuFBBTQMsFW2O2ytteMgf9Apw605Rk+Fcpv02pHgYSZUuyqHpcDlhGrObvKYqZR49pLANub4/Vq7MlzGX5rUCkKQbFwZeHyCVySFdjpQNSmJzqCboMKK3iKodQdlvOFL0z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707199976; c=relaxed/simple;
	bh=w/j/A27NNVPvlhfL4hrCqUCOyaDq7IqhhuAaOXnHXc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8EYCmfhddNCFur6IvDONn6pTR8ARh+SoYNMLZoycFh6KXBnZxqtbQGr47Z5oUump3Ud0x3+6x00JNsEl6rF6qVRY4Z7uvDS18cnlZiLn76x04aqIG+iaJ9GXutMElImPZWoKZt3G73y8lGFNIl4N1gYyAGNNFNrhQ+XffWaWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMPzX2WV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMPzX2WV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707199975; x=1738735975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/j/A27NNVPvlhfL4hrCqUCOyaDq7IqhhuAaOXnHXc8=;
  b=aMPzX2WV5wBaUvp0slWdPwkThPAm3Resz2CGv0U2IPAOQA/NSLrYst42
   V18FmwQdR5iY+/5H84WWYDfhpdb8NYUY+zNxRwpzxYxSxvTMK5UgkLoWW
   HiyaXEI85bvvnVqlHtMVazcOKa+VGFEpvI8lDP4KLJfELImpucDmKI+kv
   yga5SeaeGxVovbTiRWfMFFL18CbLyJo8n8c7Aq7NDceemZI2CrMppIPkt
   M+x4tie1mTUBniGUhWjS+lIPgq8y+Jp/2+Wq1QkkeTyj4Yx4LIYdXaJPk
   bYgDZbN4XaRf7JDuFPsmTZxLp3xCfh496t9nn2AnLaChjzWM32H0bPxQj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="832552"
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="832552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 22:12:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,246,1701158400"; 
   d="scan'208";a="5540664"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2024 22:12:53 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXEhO-00017g-1f;
	Tue, 06 Feb 2024 06:12:50 +0000
Date: Tue, 6 Feb 2024 14:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-wq:for-next 32/33] kernel/workqueue.c:6495:41: error:
 '__WQ_ORDERED_EXPLICIT' undeclared
Message-ID: <202402061438.IgDqj9u5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-next
head:   40911d4457f288da21b45437a52e1b0cbe5b8508
commit: 3bc1e711c26bff01d41ad71145ecb8dcb4412576 [32/33] workqueue: Don't implicitly make UNBOUND workqueues w/ @max_active==1 ordered
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240206/202402061438.IgDqj9u5-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061438.IgDqj9u5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061438.IgDqj9u5-lkp@intel.com/

Note: the tj-wq/for-next HEAD 40911d4457f288da21b45437a52e1b0cbe5b8508 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/workqueue.c: In function 'workqueue_apply_unbound_cpumask':
>> kernel/workqueue.c:6495:41: error: '__WQ_ORDERED_EXPLICIT' undeclared (first use in this function)
    6495 |                         if (wq->flags & __WQ_ORDERED_EXPLICIT)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   kernel/workqueue.c:6495:41: note: each undeclared identifier is reported only once for each function it appears in


vim +/__WQ_ORDERED_EXPLICIT +6495 kernel/workqueue.c

3494fc30846dce Tejun Heo     2015-03-09  6479  
99c621ef243bda Lai Jiangshan 2023-01-12  6480  static int workqueue_apply_unbound_cpumask(const cpumask_var_t unbound_cpumask)
042f7df15a4fff Lai Jiangshan 2015-04-30  6481  {
042f7df15a4fff Lai Jiangshan 2015-04-30  6482  	LIST_HEAD(ctxs);
042f7df15a4fff Lai Jiangshan 2015-04-30  6483  	int ret = 0;
042f7df15a4fff Lai Jiangshan 2015-04-30  6484  	struct workqueue_struct *wq;
042f7df15a4fff Lai Jiangshan 2015-04-30  6485  	struct apply_wqattrs_ctx *ctx, *n;
042f7df15a4fff Lai Jiangshan 2015-04-30  6486  
042f7df15a4fff Lai Jiangshan 2015-04-30  6487  	lockdep_assert_held(&wq_pool_mutex);
042f7df15a4fff Lai Jiangshan 2015-04-30  6488  
042f7df15a4fff Lai Jiangshan 2015-04-30  6489  	list_for_each_entry(wq, &workqueues, list) {
8eb17dc1a6b5db Waiman Long   2024-02-03  6490  		if (!(wq->flags & WQ_UNBOUND) || (wq->flags & __WQ_DESTROYING))
042f7df15a4fff Lai Jiangshan 2015-04-30  6491  			continue;
ca10d851b9ad03 Waiman Long   2023-10-10  6492  
042f7df15a4fff Lai Jiangshan 2015-04-30  6493  		/* creating multiple pwqs breaks ordering guarantee */
ca10d851b9ad03 Waiman Long   2023-10-10  6494  		if (!list_empty(&wq->pwqs)) {
ca10d851b9ad03 Waiman Long   2023-10-10 @6495  			if (wq->flags & __WQ_ORDERED_EXPLICIT)
042f7df15a4fff Lai Jiangshan 2015-04-30  6496  				continue;
ca10d851b9ad03 Waiman Long   2023-10-10  6497  			wq->flags &= ~__WQ_ORDERED;
ca10d851b9ad03 Waiman Long   2023-10-10  6498  		}
042f7df15a4fff Lai Jiangshan 2015-04-30  6499  
99c621ef243bda Lai Jiangshan 2023-01-12  6500  		ctx = apply_wqattrs_prepare(wq, wq->unbound_attrs, unbound_cpumask);
84193c07105c62 Tejun Heo     2023-08-07  6501  		if (IS_ERR(ctx)) {
84193c07105c62 Tejun Heo     2023-08-07  6502  			ret = PTR_ERR(ctx);
042f7df15a4fff Lai Jiangshan 2015-04-30  6503  			break;
042f7df15a4fff Lai Jiangshan 2015-04-30  6504  		}
042f7df15a4fff Lai Jiangshan 2015-04-30  6505  
042f7df15a4fff Lai Jiangshan 2015-04-30  6506  		list_add_tail(&ctx->list, &ctxs);
042f7df15a4fff Lai Jiangshan 2015-04-30  6507  	}
042f7df15a4fff Lai Jiangshan 2015-04-30  6508  
042f7df15a4fff Lai Jiangshan 2015-04-30  6509  	list_for_each_entry_safe(ctx, n, &ctxs, list) {
042f7df15a4fff Lai Jiangshan 2015-04-30  6510  		if (!ret)
042f7df15a4fff Lai Jiangshan 2015-04-30  6511  			apply_wqattrs_commit(ctx);
042f7df15a4fff Lai Jiangshan 2015-04-30  6512  		apply_wqattrs_cleanup(ctx);
042f7df15a4fff Lai Jiangshan 2015-04-30  6513  	}
042f7df15a4fff Lai Jiangshan 2015-04-30  6514  
99c621ef243bda Lai Jiangshan 2023-01-12  6515  	if (!ret) {
99c621ef243bda Lai Jiangshan 2023-01-12  6516  		mutex_lock(&wq_pool_attach_mutex);
99c621ef243bda Lai Jiangshan 2023-01-12  6517  		cpumask_copy(wq_unbound_cpumask, unbound_cpumask);
99c621ef243bda Lai Jiangshan 2023-01-12  6518  		mutex_unlock(&wq_pool_attach_mutex);
99c621ef243bda Lai Jiangshan 2023-01-12  6519  	}
042f7df15a4fff Lai Jiangshan 2015-04-30  6520  	return ret;
042f7df15a4fff Lai Jiangshan 2015-04-30  6521  }
042f7df15a4fff Lai Jiangshan 2015-04-30  6522  

:::::: The code at line 6495 was first introduced by commit
:::::: ca10d851b9ad0338c19e8e3089e24d565ebfffd7 workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()

:::::: TO: Waiman Long <longman@redhat.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
