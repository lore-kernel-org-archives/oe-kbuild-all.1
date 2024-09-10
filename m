Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235C5195980
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981710; cv=none; b=TSQcvrp8FpU8fAmL2njFzT5CxTH2/xRUEqL8BoKs4t9TWwsMQ1PN3HAIaBre+g/r+6RRJsJx/C1s/jVRuGG4/M0H7hsVq3KB/DI0I4+nayXCSB2KSUm+dCytp+ZBGyN+oVbKhB1eQVhgI9QrLRePqtDvGHBIDIdBMBvetvHueI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981710; c=relaxed/simple;
	bh=W6eGTfECuMCueVT0cwNwqmVphUEBuHFRAM4/cCfFXsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R15qZLoKNfKDpMLgKDpdvIWdnGPdvK1Aa2TjNb37BrsoGeJqb0b3HIo0xFRBnNOrH7t4VLG7wrjwdZ4RXvGF7aC883pWcm+7j/nGXRJDK7mo1X3DEa34VKMTrquo2lm4g4rf5BziT6DkvFm15ybLeb9jOsRl/eaqLI9gfbZjF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+jnkpvD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+jnkpvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725981708; x=1757517708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W6eGTfECuMCueVT0cwNwqmVphUEBuHFRAM4/cCfFXsM=;
  b=a+jnkpvDOEZjETvOJEjUh4a/X/yefG9s12nM1UFZeS6dvlwnNNQ0CaK8
   XFsuFfn49uGWPafkDKRvhC9XYqi+upJlTdQGMLc3iBbBrsnCSV6kpgPPt
   8PLxqBXysYZ8wlprmSz7lhmyj8o4XdHd2UIG0FeKWRk1erk6VHeePmSbD
   uy9pM4HL32HYCPjJb0E/993P6iV+kFQdOWD2GNZKEh1/SuD+qzGxUZxt2
   Mq1rsuRUvcrWuWdWherctf8NOmx5MU9tmycKx3AAdIVlyIBwqGTVL2Cjt
   eiA4SNHNQCGyA2ps117dFDma1df4hkcWHwHdHvJExVJZXe4AvWCoI89zL
   w==;
X-CSE-ConnectionGUID: IfQ2jz4kRmOKtMeuvKr8fg==
X-CSE-MsgGUID: Uw7kKlITTyiePM5vXYeWvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28516991"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="28516991"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 08:21:47 -0700
X-CSE-ConnectionGUID: FQ9qrwCdRBOr2RoaruXxbQ==
X-CSE-MsgGUID: Si9kmb1STE6N4iv6kK0jug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67017226"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Sep 2024 08:21:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so2gZ-0002Fy-33;
	Tue, 10 Sep 2024 15:21:43 +0000
Date: Tue, 10 Sep 2024 23:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5704/30000] include/linux/blk-mq.h:620:18:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202409102355.6lrxEzuT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   cbfb00d89c3b9971c3f0732b4f34d4e674bff5d8
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [5704/30000] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-122-20240910 (https://download.01.org/0day-ci/archive/20240910/202409102355.6lrxEzuT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409102355.6lrxEzuT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409102355.6lrxEzuT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
