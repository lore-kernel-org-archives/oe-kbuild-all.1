Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AF146BF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 02:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732330259; cv=none; b=Bvejvfd0yCoxEFUif4EHC2TmJCwSqewiBgX/9NxDCNfYw6US4h2HOgkHLRaV1byn/ugdzNSfBbCcpGOWb2iWNehL0PPdxc9112m5i8Ga6/nUaLGkNIVFLVbqfLhsopZgjJ84DZFrTbz0V6lUBpnA6xQlCS5giJG6BSm8arCPbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732330259; c=relaxed/simple;
	bh=8csVKtFiuhJELnkqyaByu4VxSe7yLmazQijrcS1CIKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWlWeAyYuWBTb8JCMAvlUZOFM73VJ+4cR9NWGRPVUlpBnNd2kz5Q2FipEz1TdvENhO0t6d8npv8T5m6Si2JP9J/QTUdtOoe3VxCSK6CgBp1uHnzluT7plFCnhVDTSVysUFzAksdaT3nyP3El9FwWG91gsJH21b8IO17wo8VRruI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrYLO0Vd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrYLO0Vd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732330257; x=1763866257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8csVKtFiuhJELnkqyaByu4VxSe7yLmazQijrcS1CIKc=;
  b=TrYLO0VdiEpP9x16TJOBtzpBn1kF3cH/PzxSW4+yLpm8rGibiCGyXex5
   qLhPAtfplWmUoJE3VCNl2JJszAQqZ+CGznM+FKHwOSr6xED/iTTY/xzg4
   yvEquNQj5BHYLCAQMPYtNmJTOHflz1BrFaS6K/qQ4foiybUyLExrVn/ZZ
   CYQ4/0BprykzS5vdkEbfYso4IFeNGIVI90DQh8vA06dJRiSBaHqvv4mA6
   aubr7dwbUCWfyZHt0RNTUEFJz7gBIe3/3Elo4Kzr2dsEj7lmFuoNFBvIc
   /Zwt/Bipru5J82/UUBr9wjIOwA1WzK5syLGH60eErkO7LfXyKGiQpd6IJ
   A==;
X-CSE-ConnectionGUID: 4l+hB7REQ/SsA5djFEAVtA==
X-CSE-MsgGUID: gFGgad8mS9WF2fIsjZ36zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="43008578"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="43008578"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 18:50:56 -0800
X-CSE-ConnectionGUID: ipnJ+6M7Tu2CgkVY/2yjpg==
X-CSE-MsgGUID: upsIYNAdTHiv/iXTCX6oWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90549594"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Nov 2024 18:50:55 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEgEX-0004Mx-0i;
	Sat, 23 Nov 2024 02:50:53 +0000
Date: Sat, 23 Nov 2024 10:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-defer-tw 8/8] io_uring/io_uring.c:1212:21:
 error: implicit declaration of function 'wq_cmpxchg_list'; did you mean
 'xa_cmpxchg_irq'?
Message-ID: <202411231042.rrfVdNf3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-defer-tw
head:   3fe10ec9996723e6abc1b8e5b2b9d4ecf9eaf1b8
commit: 3fe10ec9996723e6abc1b8e5b2b9d4ecf9eaf1b8 [8/8] io_uring: add lockless LIFO list implementation for task_work
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241123/202411231042.rrfVdNf3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231042.rrfVdNf3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231042.rrfVdNf3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.h:12,
                    from io_uring/io_uring.c:82:
   io_uring/slist.h: In function 'wq_list_splice_list':
   io_uring/slist.h:91:14: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      91 |         bool ret = false;
         |              ^~~
   io_uring/io_uring.c: In function 'wq_ll_add_tail':
>> io_uring/io_uring.c:1212:21: error: implicit declaration of function 'wq_cmpxchg_list'; did you mean 'xa_cmpxchg_irq'? [-Wimplicit-function-declaration]
    1212 |                 if (wq_cmpxchg_list(&l->list_ptr, &old.list_ptr, new.list_ptr)) {
         |                     ^~~~~~~~~~~~~~~
         |                     xa_cmpxchg_irq


vim +1212 io_uring/io_uring.c

  1197	
  1198	static void wq_ll_add_tail(struct io_wq_work_node *n, struct io_wq_work_list *l)
  1199	{
  1200		n->next = NULL;
  1201		do {
  1202			struct io_wq_work_list new = {
  1203				.first	= READ_ONCE(l->first) ?: n,
  1204				.last	= n
  1205			};
  1206			struct io_wq_work_list old = {
  1207				.first	= READ_ONCE(l->first),
  1208				.last	= READ_ONCE(l->last)
  1209			};
  1210			struct io_wq_work_node *old_last = READ_ONCE(l->last);
  1211	
> 1212			if (wq_cmpxchg_list(&l->list_ptr, &old.list_ptr, new.list_ptr)) {
  1213				if (old_last)
  1214					WRITE_ONCE(old_last->next, n);
  1215				break;
  1216			}
  1217		} while (1);
  1218	}
  1219	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
