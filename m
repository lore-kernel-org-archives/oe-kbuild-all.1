Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5044204C36
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 00:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770682868; cv=none; b=DgKkhJ4xZO7uppC2KT2LAMKw+/4dRl75VkdFEBh6IiyIcjKBXb+I/H/E2tBITR+mNMzcntm+iuncIg34gM29wfr2CjKUK/Vh4dzg6KpaG2C4hGt6TMx9hvFRS1YQ3cEZWVcfi/rK4XuTFWhkdlSysGCPOJhekf9H1xdIgM12/QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770682868; c=relaxed/simple;
	bh=Xr6gNQuSxCsxt++S2hp6c8T7QPlXCy+cHYsUINpV2CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KQOsXpLnboEeDTyrofz+lEsvMhaZm0Pu5TvKYRKtyGyzMI43Vhc/rDRF+7HP3qvoObIQhItfifq/D6odzm6JYwqhltfH8Ejw3gnrRLrTm1oELkJWE7/avQJ3Ypinuumqw80lW880wZ3OHHHVxfd3dce6Q/QOLzNslv2zqOHw2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGtpdzRF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGtpdzRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770682868; x=1802218868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xr6gNQuSxCsxt++S2hp6c8T7QPlXCy+cHYsUINpV2CY=;
  b=cGtpdzRFZNTtOpgmXBfXLVKoGvItHrPmX1Ftymczx5vBhNjZULrA4BnS
   tiItAXxxWGmRF1W3B1GqFUbChQFn85GdonIEV1SUt6MbcgQQiJ/Iir7+A
   VW4WR71wpjFxF8RivaVzI0PRZoZY0QN2EsQH9wvXDvy9GZj9ELjIE4qus
   1dgEmh9KjbXPOMEf0oDlQvghYGYNmc8/XaHhZ8mE2M20GMwD58Pd8zpRa
   qavWIf0BH1uI37tp1SrRxmRvFp39VWWeFRaoBqYsw7bO5oyZmtaU9Waeb
   KHVzJwW2kU96bz/IONIVhEnZP+hjVIn8X7z3cKcLCQtCM7KH9QRVULSnJ
   w==;
X-CSE-ConnectionGUID: I5SmfwXrQGqodp9HeeXH4Q==
X-CSE-MsgGUID: DgI+ADorQPeMFVVaCh0kYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82910550"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82910550"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 16:21:06 -0800
X-CSE-ConnectionGUID: BH2ucdj9SaOXsOCKYzN6Dg==
X-CSE-MsgGUID: ohA0MZYCTEa4z49J300VEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211055426"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 16:21:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpbV0-00000000oRe-2WkF;
	Tue, 10 Feb 2026 00:21:02 +0000
Date: Tue, 10 Feb 2026 08:20:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: drivers/dma-buf/dma-fence.c:1000:38: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202602100848.yaM8YnCT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
commit: ac364014fd812c8a2babe8f9dff8c909271a653e dma-buf: cleanup dma_fence_describe v3
date:   3 months ago
config: sparc64-randconfig-r113-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100848.yaM8YnCT-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100848.yaM8YnCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100848.yaM8YnCT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-fence.c:1000:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *timeline @@     got char * @@
   drivers/dma-buf/dma-fence.c:1000:38: sparse:     expected char const [noderef] __rcu *timeline
   drivers/dma-buf/dma-fence.c:1000:38: sparse:     got char *
>> drivers/dma-buf/dma-fence.c:1001:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char const [noderef] __rcu *driver @@     got char * @@
   drivers/dma-buf/dma-fence.c:1001:36: sparse:     expected char const [noderef] __rcu *driver
   drivers/dma-buf/dma-fence.c:1001:36: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1112:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1114:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1144:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1146:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     got char *

vim +1000 drivers/dma-buf/dma-fence.c

   990	
   991	/**
   992	 * dma_fence_describe - Dump fence description into seq_file
   993	 * @fence: the fence to describe
   994	 * @seq: the seq_file to put the textual description into
   995	 *
   996	 * Dump a textual description of the fence and it's state into the seq_file.
   997	 */
   998	void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
   999	{
> 1000		const char __rcu *timeline = "";
> 1001		const char __rcu *driver = "";
  1002		const char *signaled = "";
  1003	
  1004		rcu_read_lock();
  1005	
  1006		if (!dma_fence_is_signaled(fence)) {
  1007			timeline = dma_fence_timeline_name(fence);
  1008			driver = dma_fence_driver_name(fence);
  1009			signaled = "un";
  1010		}
  1011	
  1012		seq_printf(seq, "%llu:%llu %s %s %ssignalled\n",
  1013			   fence->context, fence->seqno, timeline, driver,
  1014			   signaled);
  1015	
  1016		rcu_read_unlock();
  1017	}
  1018	EXPORT_SYMBOL(dma_fence_describe);
  1019	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
