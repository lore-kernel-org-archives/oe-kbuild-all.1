Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26782500AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Nov 2024 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732463738; cv=none; b=pBzPPK66+9GdfvOnnUbLF2NcgBfTpGAKLP+l2HIFH08Llt+H2h4ZOg3cRbwoPLaa8J8TvCfRzz5RvrSy+pB+Adm/4wt8CG99ieUluUaOsoWopz8NWDYs8xYlVAJ7BB2dOC8ZB9T5UxG5++C89vStNhEt/gEUy0CPQ6kuoxyEhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732463738; c=relaxed/simple;
	bh=k/g6mGjQOCauXZFIEvBuFjmkhmTSX7undI6TeFTPva4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WypsOEc0JIam5KicwEe1wEALUKufkngmZVBl72sQRoPhb0NXdlcW8PD60t16pr7IOKGjqkWZYMabzIn2Sv3AvCv5lXeT/XrvE40h6WVv2N68/j31W6XRJkj22hkYQChLG3XynK69ieR2jt75Fh69eKV6XIm1URbo4vcQ4XR+6bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jBdknVHI; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jBdknVHI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732463736; x=1763999736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/g6mGjQOCauXZFIEvBuFjmkhmTSX7undI6TeFTPva4=;
  b=jBdknVHItFOUZyyYPxqEEltpYAiQJOMTt4qLjy6ynGMSo+6d105PB5dR
   HsSPJkEM+YS1rW3MdC8xVgECckmqgkiM9EHBxMq424Db6YLXQfxwv/Y88
   zQOj/qOl1OJZiORkJkjQuS98LIgsHOPZqeKXLTpD8Ozxv1rglW03qVie4
   DREYX/rgw4CI2YCYA8uEWzltw5Ud4splVekw706xtAMW+admyLEKPrCR9
   PufqIYNHkTQox4FZY/8aJhDu3170kk191rU9Z/oC5RKw3E7cjl4MMFRkb
   4tN2XyMnfA8VnfdQNAV5bJ1MqzEV9UfIdSUBikpFGakFRn6NmE7ob0Z7E
   w==;
X-CSE-ConnectionGUID: CgL0SwNuSRiadXhpt5WtTA==
X-CSE-MsgGUID: zEWmLH+tRG2uCI2+ds5lzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32689276"
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="32689276"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 07:55:35 -0800
X-CSE-ConnectionGUID: xWlgKz12RyGbdpISciZBEg==
X-CSE-MsgGUID: 1SRAQvH/SViQN6Zyxk/DHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,181,1728975600"; 
   d="scan'208";a="91460074"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2024 07:55:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFExQ-00054j-0j;
	Sun, 24 Nov 2024 15:55:32 +0000
Date: Sun, 24 Nov 2024 23:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 4/7] block/blk-flush.c:484:65:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202411242320.mzLEc6eU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   894861d67a0f883c2fa20a8ce58634c15d0a27dd
commit: f76294a6557b6c99c9ca58d89232171cf693eac2 [4/7] ANDROID: add hooks into blk-flush.c for customized I/O scheduler
config: x86_64-randconfig-121-20241114 (https://download.01.org/0day-ci/archive/20241124/202411242320.mzLEc6eU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241124/202411242320.mzLEc6eU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411242320.mzLEc6eU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-flush.c:484:65: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int flags @@     got restricted gfp_t [usertype] flags @@
   block/blk-flush.c:484:65: sparse:     expected int flags
   block/blk-flush.c:484:65: sparse:     got restricted gfp_t [usertype] flags

vim +484 block/blk-flush.c

   469	
   470	#include <trace/hooks/block.h>
   471	struct blk_flush_queue *blk_alloc_flush_queue(int node, int cmd_size,
   472						      gfp_t flags)
   473	{
   474		struct blk_flush_queue *fq;
   475		int rq_sz = sizeof(struct request);
   476		bool skip = false;
   477	
   478		fq = kzalloc_node(sizeof(*fq), flags, node);
   479		if (!fq)
   480			goto fail;
   481	
   482		spin_lock_init(&fq->mq_flush_lock);
   483	
 > 484		trace_android_vh_blk_alloc_flush_queue(&skip, cmd_size, flags, node,
   485						       fq);
   486		if (!skip) {
   487			rq_sz = round_up(rq_sz + cmd_size, cache_line_size());
   488			fq->flush_rq = kzalloc_node(rq_sz, flags, node);
   489		}
   490		if (!fq->flush_rq)
   491			goto fail_rq;
   492	
   493		INIT_LIST_HEAD(&fq->flush_queue[0]);
   494		INIT_LIST_HEAD(&fq->flush_queue[1]);
   495		INIT_LIST_HEAD(&fq->flush_data_in_flight);
   496	
   497		lockdep_register_key(&fq->key);
   498		lockdep_set_class(&fq->mq_flush_lock, &fq->key);
   499	
   500		return fq;
   501	
   502	 fail_rq:
   503		kfree(fq);
   504	 fail:
   505		return NULL;
   506	}
   507	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
