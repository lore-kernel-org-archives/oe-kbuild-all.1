Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792855993;
	b=RTZQWfpcIvwvkQ8SaC36mcDn2o9GhqcVlaL1o2Py3OpqxZTnFAjt1I51FqX6JlXk5OWN
	 UaWHaOGUtjCl+9/fkTrmuRtsX91UzizH5ukPsPVYxRUTL3YGfsiHJZFMlBVoEPcfJjWuk
	 V3lfnWkpMkHrczwV4aFr85YCcmL+cS3396A6FZH0QC3/eigkiK3CVAqOf9aV2VNWFI+Sw
	 X2VXS0U1QsHmGRtSUHvdKGb0Ihf9+3mINbDrgs8olezpOr0beFUmc+6Tqu/jPuBi3X9MF
	 hnPJmuvNlbDxAgTmNxzbVuR/Oiq9SvJjPv774Lx6adGSpNMELHRNMwE6yc5Lw3XIy3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792855993;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NCrZ6SeYrYNQHcJ2/e5HpJkyKCaCLGUnl9WjoKy5r6g=;
	b=4RXguZx8Mi2/3Jz0P0Usrxso6y98wOE1pnzn4jO3HTvNa8K/zOy0+/lmcyCMJwiMG+Pq
	 K7AgDp0LRFYMpPL+m/chS4Nv3CCJCqAQka2751TfCiHCieF6nfBerl3nttSal98Dl9TCN
	 WRui3ufv83PHHspD7a3nmO7bM4YKfGjZ7FektCznTITXoNs0MgEM9OXB6Q3BNdI2B/ojJ
	 zcTwW7H7jdwBFy3nsYYguFbKShq5qm8kP/P5PkunSWJe9ph4RskX9hUFMCQNRV/PmbFJC
	 P0nJZBsMsGZn0XWge+4ov7fDgB2UN76BMOQWF20wCRDvIKN875bxAwsijSE7pTznDmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DVgKfVb9;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAE606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 15:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBAE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DVgKfVb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792855991; x=1824391991;
  h=date:from:to:cc:subject:message-id;
  bh=q5A9BeJJbdxRb1e1Ti5AhowFjxQmCmAvWt5DGhodbCk=;
  b=DVgKfVb91hUrzHdAGao6BmP805pSvbYoX3X9Gc22XTeXAt8w2SnZR1YY
   Dyf98pdkjRpAmhTORq4JzwOzDFwkN8mLozBcIUeoZtFqf2iVJ4adtFw/x
   5kPiuspSa0kHAcdFBpAs+X5Y3fGmvOMY9vCEAHQnqV9diy7/I9+41mtWm
   aQqjBXAZJfzzafWSjDCvgpMVzzBnWmGoQ3eoazsvClP5KdM6LVvY/1AQJ
   aXb6aTQRUKakQad0EkahGOAIMzuMgATaV/rbtXCfy8naxbGk06U/H3zoI
   ES5V/b97hAGvrrdLwGviVnDoPwO+69ju3ZqnsJ9GtzwkhnBIgUaOXLixB
   Q==;
X-CSE-ConnectionGUID: McSx64fORg2vJBqoQz2HPg==
X-CSE-MsgGUID: 3RCoDJpPRrCAG+FkJ1KwDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1604702"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1604702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 08:33:10 -0700
X-CSE-ConnectionGUID: E9nOKlWHS2GbedmULrqqEA==
X-CSE-MsgGUID: kqJYK9m3SICSb0sXdSOPPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4284250"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2026 08:33:09 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKdk0-00000000TyE-3Q5L;
	Sat, 24 Oct 2026 15:33:05 +0000
Date: Sat, 24 Oct 2026 23:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member
 'refcount' not described in 'dma_heap'
Message-ID: <202610242315.OcK1zdF8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi John,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   60cf931c5a95dacbbd86483d5d0978e80a756ccd
commit: c700bdd2233e000f089ce54556f987acfc391c7b [1/1] ANDROID: dma-heap: Add proper kref handling on dma-buf heaps
config: arm-randconfig-1002-20261020 (https://download.01.org/0day-ci/archive/20261024/202610242315.OcK1zdF8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610242315.OcK1zdF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610242315.OcK1zdF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'minor' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'refcount' not described in 'dma_heap'


vim +45 drivers/dma-buf/dma-heap.c

c02a81fba74fe34 Andrew F. Davis 2019-12-03  25  
c02a81fba74fe34 Andrew F. Davis 2019-12-03  26  /**
c02a81fba74fe34 Andrew F. Davis 2019-12-03  27   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe34 Andrew F. Davis 2019-12-03  28   * @name:		used for debugging/device-node name
c02a81fba74fe34 Andrew F. Davis 2019-12-03  29   * @ops:		ops struct for this heap
c02a81fba74fe34 Andrew F. Davis 2019-12-03  30   * @heap_devt		heap device node
c02a81fba74fe34 Andrew F. Davis 2019-12-03  31   * @list		list head connecting to list of heaps
c02a81fba74fe34 Andrew F. Davis 2019-12-03  32   * @heap_cdev		heap char device
c02a81fba74fe34 Andrew F. Davis 2019-12-03  33   *
c02a81fba74fe34 Andrew F. Davis 2019-12-03  34   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe34 Andrew F. Davis 2019-12-03  35   */
c02a81fba74fe34 Andrew F. Davis 2019-12-03  36  struct dma_heap {
c02a81fba74fe34 Andrew F. Davis 2019-12-03  37  	const char *name;
c02a81fba74fe34 Andrew F. Davis 2019-12-03  38  	const struct dma_heap_ops *ops;
c02a81fba74fe34 Andrew F. Davis 2019-12-03  39  	void *priv;
c02a81fba74fe34 Andrew F. Davis 2019-12-03  40  	dev_t heap_devt;
c02a81fba74fe34 Andrew F. Davis 2019-12-03  41  	struct list_head list;
c02a81fba74fe34 Andrew F. Davis 2019-12-03  42  	struct cdev heap_cdev;
c700bdd2233e000 John Stultz     2020-07-25  43  	int minor;
c700bdd2233e000 John Stultz     2020-07-25  44  	struct kref refcount;
c02a81fba74fe34 Andrew F. Davis 2019-12-03 @45  };
c02a81fba74fe34 Andrew F. Davis 2019-12-03  46  

:::::: The code at line 45 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
