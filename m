Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836146FC5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 23:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737935148; cv=none; b=nJLuIH4K7SvlR0Dk0F6LRDgDX22JRYMClnoXOhA+7a3PpwxZWntSylGfZU00EHbo9V6dN1sCIdWB1S2pzbtZa440T2bkRBkaz33OoAvCFl4pF/LBqwzywOnhu7eFxMFYgfaPK9LQ9MbPiT96yA4Mfif6tk9YWF+EOzpH4VrvW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737935148; c=relaxed/simple;
	bh=V9bJRYjuIf9Hgo82lAdAohMQoD+R4dcm1WMcTRddU00=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pFRG3qnLdMlN2qE+CpxfZKBIAbJ3ZuBakemvmpW/r9vaknaMYXcAHkGJcv0EPahAmVz8saW/6P+NWgYZVjdt03AGec4AR9SGOx5q1ML6D6V/c035Ox98Pv6ZOuf/230LBB+suM4Ts3Kv9BhE6qi1uAaGg8HUYvQA6Ao6YmrSKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMMlG1lU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMMlG1lU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737935147; x=1769471147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9bJRYjuIf9Hgo82lAdAohMQoD+R4dcm1WMcTRddU00=;
  b=XMMlG1lUMFgYOGc6e/xusgXvtF7OUsnpxKBrCkGE70EuRtCN1QKHX8BF
   As0IRDGEN+dq5fJFguevz9CU/ef/6SYGutWwI16/5Ki6jOzhKS8hxY4MQ
   IsPiwcGCDLJxiIgeIzuQyx9HN7CeK1B+BsMIhFJe2Dy8b+be82aovR/4S
   T//BxeEyPal9/cHru5Sn09SVShx2pOXUrJMZJnr5qm68UwjgUb5wJqCh5
   dG9EdvmbdDiMCW9NmX2cMNwhSTuMGxRGgmGo59AUHNtzjiclDTr+g0ZvA
   bk9s93ow+ZoGn3OBapUFC47PTq4vyN3bJUv3rpoX01rKEqHqC7g2vwuqf
   Q==;
X-CSE-ConnectionGUID: oYKzH7QnQOGMYtJAAmc6Kw==
X-CSE-MsgGUID: dLN5/7eiS9aKuslUsl8pdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="38530444"
X-IronPort-AV: E=Sophos;i="6.13,237,1732608000"; 
   d="scan'208";a="38530444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 15:45:46 -0800
X-CSE-ConnectionGUID: KsC6PU84Q++aXcBAN61vKA==
X-CSE-MsgGUID: WWwl5HN+Rvi7pF9VsZbZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108726197"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2025 15:45:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcCJy-000gB7-2r;
	Sun, 26 Jan 2025 23:45:42 +0000
Date: Mon, 27 Jan 2025 07:44:52 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.13.y 83/83] kernel/sched/fair.c:3810:6:
 warning: no previous prototype for 'reweight_entity'
Message-ID: <202501270725.onGGGHNq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.13.y
head:   c358c65925524fe1dfe962d59966a6aa01b5fc9b
commit: c358c65925524fe1dfe962d59966a6aa01b5fc9b [83/83] linux6.13.y-bore5.9.6
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20250127/202501270725.onGGGHNq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250127/202501270725.onGGGHNq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270725.onGGGHNq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:3810:6: warning: no previous prototype for 'reweight_entity' [-Wmissing-prototypes]
    3810 | void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
         |      ^~~~~~~~~~~~~~~


vim +/reweight_entity +3810 kernel/sched/fair.c

  3809	
> 3810	void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
  3811				    unsigned long weight)
  3812	{
  3813		bool curr = cfs_rq->curr == se;
  3814	
  3815		if (se->on_rq) {
  3816			/* commit outstanding execution time */
  3817			update_curr(cfs_rq);
  3818			update_entity_lag(cfs_rq, se);
  3819			se->deadline -= se->vruntime;
  3820			se->rel_deadline = 1;
  3821			if (!curr)
  3822				__dequeue_entity(cfs_rq, se);
  3823			update_load_sub(&cfs_rq->load, se->load.weight);
  3824		}
  3825		dequeue_load_avg(cfs_rq, se);
  3826	
  3827		/*
  3828		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
  3829		 * we need to scale se->vlag when w_i changes.
  3830		 */
  3831		se->vlag = div_s64(se->vlag * se->load.weight, weight);
  3832		if (se->rel_deadline)
  3833			se->deadline = div_s64(se->deadline * se->load.weight, weight);
  3834	
  3835		update_load_set(&se->load, weight);
  3836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
