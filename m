Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B72248A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 21:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780263138; cv=none; b=ikGYhOU6YbbGg/sADmnd4ja8BPkYj9dlN7YWf55o4q9eN5wcNfp1zPw6WzEFlF//PBHKXbTZra3Qt0D5360SaatisNcFBEaohEfKxt4iX5EV1KWEf/LPM9HIgrEi/+UH3Hlfn03Quv0h72Li+RApRbTFNBBiMp97hVQiGHzVtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780263138; c=relaxed/simple;
	bh=2gwHtd4mqw3c0BmSWpT76l5G1fWE3GL+ZZp/sZRcU0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=apVa5Rr6hiqdbCWBTSkP5dGvrcUpdp1feEPvdnkJXN/J5KSfc1jwE9Wlih4QctI99WzOKfI3rPUuGLsq83J8X/XZzD8bRU67+boaIJouSjKz676kUlxxCO38DWDTpsDfXuqFVKrE0k34CReqRja6Hn7bxY81YmZONp1AmrjddgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bv1z9LHP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bv1z9LHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780263135; x=1811799135;
  h=date:from:to:cc:subject:message-id;
  bh=2gwHtd4mqw3c0BmSWpT76l5G1fWE3GL+ZZp/sZRcU0U=;
  b=bv1z9LHPpjoKlGjun0ZygJn5xjNJiUisWqmaSYe/TvFTmSfd3x+/6MYE
   Tm5Nn4mR7OV5ruNH7KWMml76m5zItqpopINl0d72GSwMDtoYxivxpSrw6
   lAbpojXht8hnHv8ZJ81zZox4fdIapBm6EwA3ecFchqGoLBDENETQQCIQ4
   8hKXEqslACb/jDBfQo2R9qfsnML/jlfaxkVgUo/0gN3teooCTaN5Ann0d
   prDUOEBUpg1UENVvjDqvfh04NsTw5nWPl70ggpZQpqa4sNSPYJWGWZshg
   t6mz3wd0E5opuvAwGNINGuUicq5HpIM47haoeu5isFAtsNN690kZaDWe6
   w==;
X-CSE-ConnectionGUID: 8EuJh14nQ0uG/2mWD2RnpQ==
X-CSE-MsgGUID: oAivowzMTg6XhL+kR5rFOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92500605"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="92500605"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:32:14 -0700
X-CSE-ConnectionGUID: vWcVjKw+QkiYca2CA+cAqQ==
X-CSE-MsgGUID: TSnMg/hoTOqQIIoYPUNZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="281509924"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2026 14:32:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTnlS-000000009la-1kU0;
	Sun, 31 May 2026 21:32:10 +0000
Date: Mon, 01 Jun 2026 05:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-error-injection 3/7] block/blk-mq.c:3278:48:
 error: use of undeclared identifier 'BD_MAKE_IT_FAIL'
Message-ID: <202606010517.emcagFdk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git block-error-injection
head:   f7d922716d709e96c39fc2a0ebc67eac84deb06d
commit: 31905bce1e3e0c7d6b853dc916a0f64fdec2673e [3/7] block: refactor should_fail_bio and should_fail_request
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260601/202606010517.emcagFdk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010517.emcagFdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010517.emcagFdk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq.c:3278:48: error: use of undeclared identifier 'BD_MAKE_IT_FAIL'
    3278 |         if (q->disk && bdev_test_flag(q->disk->part0, BD_MAKE_IT_FAIL) &&
         |                                                       ^
   1 error generated.


vim +/BD_MAKE_IT_FAIL +3278 block/blk-mq.c

  3235	
  3236	#ifdef CONFIG_BLK_MQ_STACKING
  3237	/**
  3238	 * blk_insert_cloned_request - Helper for stacking drivers to submit a request
  3239	 * @rq: the request being queued
  3240	 */
  3241	blk_status_t blk_insert_cloned_request(struct request *rq)
  3242	{
  3243		struct request_queue *q = rq->q;
  3244		unsigned int max_sectors = blk_queue_get_max_sectors(rq);
  3245		unsigned int max_segments = blk_rq_get_max_segments(rq);
  3246		blk_status_t ret;
  3247	
  3248		if (blk_rq_sectors(rq) > max_sectors) {
  3249			/*
  3250			 * SCSI device does not have a good way to return if
  3251			 * Write Same/Zero is actually supported. If a device rejects
  3252			 * a non-read/write command (discard, write same,etc.) the
  3253			 * low-level device driver will set the relevant queue limit to
  3254			 * 0 to prevent blk-lib from issuing more of the offending
  3255			 * operations. Commands queued prior to the queue limit being
  3256			 * reset need to be completed with BLK_STS_NOTSUPP to avoid I/O
  3257			 * errors being propagated to upper layers.
  3258			 */
  3259			if (max_sectors == 0)
  3260				return BLK_STS_NOTSUPP;
  3261	
  3262			printk(KERN_ERR "%s: over max size limit. (%u > %u)\n",
  3263				__func__, blk_rq_sectors(rq), max_sectors);
  3264			return BLK_STS_IOERR;
  3265		}
  3266	
  3267		/*
  3268		 * The queue settings related to segment counting may differ from the
  3269		 * original queue.
  3270		 */
  3271		rq->nr_phys_segments = blk_recalc_rq_segments(rq);
  3272		if (rq->nr_phys_segments > max_segments) {
  3273			printk(KERN_ERR "%s: over max segments limit. (%u > %u)\n",
  3274				__func__, rq->nr_phys_segments, max_segments);
  3275			return BLK_STS_IOERR;
  3276		}
  3277	
> 3278		if (q->disk && bdev_test_flag(q->disk->part0, BD_MAKE_IT_FAIL) &&
  3279		    should_fail_request(blk_rq_bytes(rq)))
  3280			return BLK_STS_IOERR;
  3281	
  3282		ret = blk_crypto_rq_get_keyslot(rq);
  3283		if (ret != BLK_STS_OK)
  3284			return ret;
  3285	
  3286		blk_account_io_start(rq);
  3287	
  3288		/*
  3289		 * Since we have a scheduler attached on the top device,
  3290		 * bypass a potential scheduler on the bottom device for
  3291		 * insert.
  3292		 */
  3293		blk_mq_run_dispatch_ops(q,
  3294				ret = blk_mq_request_issue_directly(rq, true));
  3295		if (ret)
  3296			blk_account_io_done(rq, blk_time_get_ns());
  3297		return ret;
  3298	}
  3299	EXPORT_SYMBOL_GPL(blk_insert_cloned_request);
  3300	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
