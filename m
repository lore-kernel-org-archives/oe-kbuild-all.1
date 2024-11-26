Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B690BE65
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 03:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732590037; cv=none; b=E5/V8Ln7T6gxEvTpdrOAfrsf0ObA2wXbaa4l1FE5TavyLrOXhdqsoH2pf5ZXURX4Tud80GdHGre90M3n5xJxjGcGiwOoWf7IXMUXrj+WVlAunGuoEu/24RtJIIp9oINql5SlUCxz+HQP/sKH4k1jRQINcw2A9ktQ5z6d2rfMPis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732590037; c=relaxed/simple;
	bh=FgA+drFmdFLuM03ddinS8mLRfyE+3ieElOVVcOnDvA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lmdhyYnH6k04SedMN1jpeJfdbtdzMzeDA5kFllBArVIvmqs7lmYshJTbFCBf9zsqMEiTHmkwNCphIN1G8ErE927tRZHlL2moPQDJUzbq0YO9er8Zx0az0YyG+jlnxnWWlyYP6Dpnox8A1EuCKgfbkxrd+67kviPQo14P2tsIzY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdKVC8AA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdKVC8AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732590036; x=1764126036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FgA+drFmdFLuM03ddinS8mLRfyE+3ieElOVVcOnDvA0=;
  b=MdKVC8AAW/EmEvuNHR60ygOXyiwLchvgITo5hnk4UD9Zf4hmDcBS7lID
   bfzgp9rfscv3hZPon2f07m8rekIhaSU67Mlxy/QLuL9ayZepUog28PLNk
   4vrxVqX1XxO4SK/w7nRyByLyfjc8cu4ZJ+XsQxRBcuyqQw8L2P5QcZgCl
   t2PV4YWErCkKo9btYnX00LHyuGXy4Zr1neqc7/CetH8csj+Ta8bjfZ18h
   YBLHPy15/97NSSNp5X5165wlz2ZcUsEsV7vfpZXwRbktG1cIxY+xz46ZN
   7HUKtIm0y/VwcMPokOxxL1MAg9B6jbTvQx0ssz6r3QshteCh9OEn9fEte
   w==;
X-CSE-ConnectionGUID: 3Vk2yR/JQXejH7xXvzQrkA==
X-CSE-MsgGUID: PyZNA9X5RsaaT9u0/uypyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32668434"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32668434"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 19:00:35 -0800
X-CSE-ConnectionGUID: +/O31R2vRseR8g5sbkwdtQ==
X-CSE-MsgGUID: P0Qjn+wwQFWbi2bDFF74wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96526186"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Nov 2024 19:00:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFloV-000713-0k;
	Tue, 26 Nov 2024 03:00:31 +0000
Date: Tue, 26 Nov 2024 10:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2415/2415] include/linux/blk-mq.h:620:18:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202411261052.IHgWOk06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5d73ae1b79c0e467e87e2f0494211ff38732900d
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [2415/2415] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-121-20241111 (https://download.01.org/0day-ci/archive/20241126/202411261052.IHgWOk06-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261052.IHgWOk06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261052.IHgWOk06-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   block/blk-sysfs.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
   block/blk-mq-tag.c: note: in included file:
>> include/linux/blk-mq.h:620:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu *[noderef] __rcu *
   include/linux/blk-mq.h:620:18: sparse:    struct blk_mq_hw_ctx [noderef] __rcu **
--
>> block/blk-mq-sysfs.c:339:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
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
>> block/blk-mq.c:485:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   block/blk-mq.c:485:19: sparse:     expected struct blk_mq_hw_ctx *hctx
   block/blk-mq.c:485:19: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *
>> block/blk-mq.c:3270:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct blk_mq_hw_ctx **hctxs @@     got struct blk_mq_hw_ctx [noderef] __rcu **queue_hw_ctx @@
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
