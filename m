Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD331EF0B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749089241; cv=none; b=MJ/sTmfqbISafM1qy23fmHGutnOy36wn8BasFhI531ubHl2W7cXD0gmoeYHIdkRzSm2FEQTD+OPO3ri4cFcQcBGJqzD2FHuZB2owrlcB9qBcgT1hC6gnRiBUFUI/ZkhBkiYkGhu6swLFzi9VAFrf/sNgnBlwtMkUIebiJclVRGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749089241; c=relaxed/simple;
	bh=ywk7WiBs+Rq9/QcYnLrFt2I26n4wnDgepJDR/VIq0ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQlXR7S7WjA2Hgb3lsDrBgpjPDafYkzQm0fph2H584QLWG5irZuCUpBeVNk/K4nX09MqpdgnE6lBu2CVsoEw4Qm26MIgYv5TcidDUiYL9qblfhZZJFFK5Bgnkynok4O8ONefz/tlu4Q+qv7v8H+N5q8+17rECN2+xhG0h3D6CFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9Qu75Wu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9Qu75Wu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089239; x=1780625239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ywk7WiBs+Rq9/QcYnLrFt2I26n4wnDgepJDR/VIq0ZA=;
  b=F9Qu75WuvcNJ8Ux3FvsjKMalXCZvOTdloFdvEm9csn70dDMgARwIS2o6
   QSjOoVLBWWCx7jNQZpHVWZg1lfUWdit84MwABkBrBEfvX7ok+0Je6Dleq
   nP3vFWjO7MKSbr5jPws+cIvTy0vWtMjhYMNbb34AhA7/n9gaxEoPqVvsT
   OsK/j0fJuTeSo3U1M7YGQCwyJYhHigz163cGw0SSbufFp2XNTVtw3B403
   EF1hdaywXlGTi0fhlq9E3SeVHCnb404vous7EDO2q/ftUJIHnQEQ/+Jej
   V+4mHNTD4MyXXPrMWLpvrrx5AXZCfRmY1CMxJy7PNCHk20ql7xmlbhG81
   w==;
X-CSE-ConnectionGUID: aaUSKEsiR5agw32bARBNDA==
X-CSE-MsgGUID: haQ2UTHySRa61d0Wl7q4mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51339060"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51339060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:07:14 -0700
X-CSE-ConnectionGUID: vjSBEBBgQSKWExD+Mx+80A==
X-CSE-MsgGUID: tlg5Dq45SEa+nR4Nv+A0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150514744"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2025 19:05:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzzR-0003co-0a;
	Thu, 05 Jun 2025 02:05:57 +0000
Date: Thu, 5 Jun 2025 10:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2942/2942] include/linux/blk-mq.h:620:18:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202506050955.PTbr6QvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1dae4ad6a338fdf43f89f2937c03aa673e56b2db
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [2942/2942] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-122-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050955.PTbr6QvG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050955.PTbr6QvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050955.PTbr6QvG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-mq-tag.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-sysfs.c:339:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq-sysfs.c:339:55: sparse:     expected struct blk_mq_hw_ctx *hctx
   block/blk-mq-sysfs.c:339:55: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *
   block/blk-mq-sysfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-sysfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-sched.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-debugfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq.c:485:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq.c:485:19: sparse:     expected struct blk_mq_hw_ctx *hctx
   block/blk-mq.c:485:19: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *
   block/blk-mq.c:3270:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx [noderef] __rcu **queue_hw_ctx @@
   block/blk-mq.c:3270:41: sparse:     expected struct blk_mq_hw_ctx **hctxs
   block/blk-mq.c:3270:41: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu **queue_hw_ctx
>> block/blk-mq.c:3284:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   block/blk-mq.c:3284:17: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
   block/blk-mq.c:4033:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **

vim +620 include/linux/blk-mq.h

   614	
   615	static inline struct blk_mq_hw_ctx *queue_hctx(struct request_queue *q, int id)
   616	{
   617		struct blk_mq_hw_ctx *hctx;
   618	
   619		rcu_read_lock();
 > 620		hctx = *(rcu_dereference(q->queue_hw_ctx) + id);
   621		rcu_read_unlock();
   622	
   623		return hctx;
   624	}
   625	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
