Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FD823DD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 08:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RROiRilU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699001602; x=1730537602;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOc2pRp9sXw3S58o/9A/jLIWym+MKiS2PndvycFDjQs=;
  b=RROiRilUvXlaBKXUx05y6oS8O5rt1pEgo2z8x8U39IKdMoxgU1N8TmfP
   dVZC2pKo+3WgBoLs1x5Azji3so1LAJsqUmhBpxK0zylt3rhcpcINl6+Y+
   3rRhYwVKtpyFvA/hOiw5WNcucE3W90B5gdWa3GyBrzxJ8N0614PYhiRuz
   tiAWsohWiEPYQIIUARAtvf/Tfm5j4YdmTmUEBod3P+SYOnijaolSoOcmj
   GO0Pr7p4c66ppK6O9J937s/sb9pduY1FQ+DjNc7TSdFR8vPHroNeiMm1H
   7lOebOHSBZMYWRZwh8SKwQEQVoBWdCaPXrZfhSS9dmyqL8uTWUduFMBFy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455396663"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="455396663"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 01:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="761551500"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="761551500"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 01:53:21 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qypva-0002OG-1X;
	Fri, 03 Nov 2023 08:53:18 +0000
Date: Fri, 3 Nov 2023 16:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1398/14864]
 drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member
 'refcount' not described in 'dma_heap'
Message-ID: <202311031645.YEOTipwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   131de563f6277046086249d812efa8cce7efb7ef
commit: c700bdd2233e000f089ce54556f987acfc391c7b [1398/14864] ANDROID: dma-heap: Add proper kref handling on dma-buf heaps
config: i386-buildonly-randconfig-001-20231102 (https://download.01.org/0day-ci/archive/20231103/202311031645.YEOTipwn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311031645.YEOTipwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311031645.YEOTipwn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'heap_cdev' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'minor' not described in 'dma_heap'
>> drivers/dma-buf/dma-heap.c:45: warning: Function parameter or member 'refcount' not described in 'dma_heap'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +45 drivers/dma-buf/dma-heap.c

c02a81fba74fe3 Andrew F. Davis 2019-12-03  25  
c02a81fba74fe3 Andrew F. Davis 2019-12-03  26  /**
c02a81fba74fe3 Andrew F. Davis 2019-12-03  27   * struct dma_heap - represents a dmabuf heap in the system
c02a81fba74fe3 Andrew F. Davis 2019-12-03  28   * @name:		used for debugging/device-node name
c02a81fba74fe3 Andrew F. Davis 2019-12-03  29   * @ops:		ops struct for this heap
c02a81fba74fe3 Andrew F. Davis 2019-12-03  30   * @heap_devt		heap device node
c02a81fba74fe3 Andrew F. Davis 2019-12-03  31   * @list		list head connecting to list of heaps
c02a81fba74fe3 Andrew F. Davis 2019-12-03  32   * @heap_cdev		heap char device
c02a81fba74fe3 Andrew F. Davis 2019-12-03  33   *
c02a81fba74fe3 Andrew F. Davis 2019-12-03  34   * Represents a heap of memory from which buffers can be made.
c02a81fba74fe3 Andrew F. Davis 2019-12-03  35   */
c02a81fba74fe3 Andrew F. Davis 2019-12-03  36  struct dma_heap {
c02a81fba74fe3 Andrew F. Davis 2019-12-03  37  	const char *name;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  38  	const struct dma_heap_ops *ops;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  39  	void *priv;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  40  	dev_t heap_devt;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  41  	struct list_head list;
c02a81fba74fe3 Andrew F. Davis 2019-12-03  42  	struct cdev heap_cdev;
c700bdd2233e00 John Stultz     2020-07-25  43  	int minor;
c700bdd2233e00 John Stultz     2020-07-25  44  	struct kref refcount;
c02a81fba74fe3 Andrew F. Davis 2019-12-03 @45  };
c02a81fba74fe3 Andrew F. Davis 2019-12-03  46  

:::::: The code at line 45 was first introduced by commit
:::::: c02a81fba74fe3488ad6b08bfb5a1329005418f8 dma-buf: Add dma-buf heaps framework

:::::: TO: Andrew F. Davis <afd@ti.com>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
