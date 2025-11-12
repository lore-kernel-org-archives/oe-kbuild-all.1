Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFC27B348
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762911890; cv=none; b=iSS++uXLIZ38Tn4gHcUBrls479l/snUHMrcWf52gtkZ9XmJhHFuBMIVYMqkXtTbtDX/1qiPxQsySuLaX+VSbhg03Rc7Qb1vFGBgyG1PySZtAH9R59c+va46+n8k2X+37hLuxKwDR8nhJdOAModtiPloTNGSy0FFGPnddMLJ174U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762911890; c=relaxed/simple;
	bh=djp+GIcSp9MmieDmK3NihXEBHFDpO8bgUSAsls2uYTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRWaBxMM3w4jIOQPteOAZXt1JdbhIA8TrWKWK2wt0mY8tM+a4KwD+RuXx+zqtdMfjC1iVjKQKm3iyjeDAoywi5keaHEPFSHMHvLE7tXaHMUtCVbzNSOGqLrnO1l4xKY25MQaULiD9VFmqZhjsi9tJ/YwdbEl3I8ET0YXdBbIA0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFBpVGkb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFBpVGkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762911888; x=1794447888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djp+GIcSp9MmieDmK3NihXEBHFDpO8bgUSAsls2uYTI=;
  b=JFBpVGkbMSAHBm58I13g0DRZGbhHviyKC7HO30SP6JkpK2ejgLXgCkZG
   F7ZeeJv3k5Xim9ZIApOZxIpcPzSH/w4N1QoxQd1eH+3RmCKIiDTQUD91a
   2rzfOhBFskqD5cAdpCzaE1ry/8Hh2AXclbNrhdfZkYWqvamlK+aZzmDq5
   UasGDAbVKCk5hYaqfI+vJMnoH+CN/F1sqmTYFLEFYJaCZ7yDDt6Gt/mZ9
   R2v7F/QU3wj8ryfN+TXlitbjNw+cvsWw97++hD+CPMYjaTtdE5K6Pb8m0
   h4v3NM31BMj0CpSDvs1wYbY0rq7k6yE+FJKau7CVQazyIDk5bm8mHfiyA
   w==;
X-CSE-ConnectionGUID: 31wyR404Sm+H9RC6NYeaLQ==
X-CSE-MsgGUID: GylzcEpfQAONtnqdE6JNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="63977713"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="63977713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 17:44:47 -0800
X-CSE-ConnectionGUID: W2G5Vnu4Rm6W6LQpBkSj1A==
X-CSE-MsgGUID: q0f3jG7oT2eoeif5sft0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188934443"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2025 17:44:47 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIzue-0003jv-0N;
	Wed, 12 Nov 2025 01:44:44 +0000
Date: Wed, 12 Nov 2025 09:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangjian <zhangjian496@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3135/3135] mm/gmem.c:190:26: error: 'struct
 task_struct' has no member named 'mems_allowed'; did you mean
 'nr_cpus_allowed'?
Message-ID: <202511120955.BR23qSft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   70ffcfd5ec3049df518d1359b0189b4dd16e0e56
commit: 380709c322aaa306b5ac3c278a0700043f7d33e2 [3135/3135] gmem: prepare config, boot parameter, vma flag and basic GMEM related structs
config: arm64-randconfig-003-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120955.BR23qSft-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120955.BR23qSft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120955.BR23qSft-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/gmem.h:15:0,
                    from mm/gmem.c:10:
   mm/gmem.c: In function 'gm_as_attach':
>> mm/gmem.c:190:26: error: 'struct task_struct' has no member named 'mems_allowed'; did you mean 'nr_cpus_allowed'?
      node_set(nid, current->mems_allowed);
                             ^
   include/linux/nodemask.h:128:50: note: in definition of macro 'node_set'
    #define node_set(node, dst) __node_set((node), &(dst))
                                                     ^~~


vim +190 mm/gmem.c

   144	
   145	int gm_as_attach(struct gm_as *as, struct gm_dev *dev,
   146				bool activate, struct gm_context **out_ctx)
   147	{
   148		struct gm_context *ctx;
   149		int nid;
   150	
   151		ctx = kmem_cache_alloc(gm_ctx_cache, GFP_KERNEL);
   152		if (!ctx)
   153			return -ENOMEM;
   154	
   155		ctx->as = as;
   156		ctx->dev = dev;
   157	
   158		INIT_LIST_HEAD(&ctx->gm_dev_link);
   159		INIT_LIST_HEAD(&ctx->gm_as_link);
   160	
   161		if (!list_empty(&as->gm_ctx_list)) {
   162			struct list_head *old_node;
   163			struct gm_context *old_ctx;
   164	
   165			old_node = as->gm_ctx_list.prev;
   166			list_del_init(old_node);
   167			old_ctx = list_entry(old_node, struct gm_context, gm_as_link);
   168			kfree(old_ctx);
   169		}
   170	
   171		list_add_tail(&dev->gm_ctx_list, &ctx->gm_dev_link);
   172		list_add_tail(&ctx->gm_as_link, &as->gm_ctx_list);
   173	
   174		if (activate) {
   175			/*
   176			 * Here we should really have a callback function to perform the context switch
   177			 * for the hardware. E.g. in x86 this function is effectively
   178			 * flushing the CR3 value. Currently we do not care time-sliced context switch,
   179			 * unless someone wants to support it.
   180			 */
   181			dev->current_ctx = ctx;
   182		}
   183		*out_ctx = ctx;
   184	
   185		/*
   186		 * gm_as_attach will be used to attach device to process address space.
   187		 * Handle this case and add hnodes registered by device to process mems_allowed.
   188		 */
   189		for_each_node_mask(nid, dev->registered_hnodes)
 > 190			node_set(nid, current->mems_allowed);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
