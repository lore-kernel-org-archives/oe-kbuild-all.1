Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826281FDC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9i+H6um"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704522502; x=1736058502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXewp1R6rT2JUYVPhPOHGswAA1sIrrUJORGHSJWL1TY=;
  b=k9i+H6um2s0H1WmVksYDEBiJXJQUpNg3UnIMr4zNoOl9OaplH4bZHTeI
   Mf1WsXhLzJ3hZwKpIjGoW0bJwVUClpif+JQqYZ6VOCBMQiwNQuCpi/5V1
   w8bGbbKgquTgZBpOdyLgPtHDCyq0oshhz0SpZjNB+m0nLgVFfve2/Mqx9
   WdYifq4NiahSXQGYdeOFoTe2sv8pvm3G7yNVHhUoB39ptspvQkSJ3ydov
   XDQ6Qq9k9DlK+42Ix4OyfrAAh4NgYLmyBMTWPhnpzkDpuoFjAup6I3Jio
   I8vE0Sktra9IMhiW/+yxn0rLyUs1mdUv0I8Ja0mPdBq/m3WAZVzwsifX1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="377129598"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="377129598"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 22:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="924405584"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="924405584"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2024 22:28:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM0AM-00027M-2P;
	Sat, 06 Jan 2024 06:28:18 +0000
Date: Sat, 6 Jan 2024 14:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 3/5]
 drivers/dma-buf/st-dma-fence-unwrap.c:125:6: warning: variable 'err' set but
 not used
Message-ID: <202401061459.eFlwgf9A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   ad827d850df10d62fe9d07269c1fcf7b86c43895
commit: 169630111a051b0f07c69a71ca25895e0f4df83e [3/5] BACKPORT: dma-buf: add dma_fence_unwrap v2
config: i386-buildonly-randconfig-004-20240106 (https://download.01.org/0day-ci/archive/20240106/202401061459.eFlwgf9A-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061459.eFlwgf9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061459.eFlwgf9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_array':
>> drivers/dma-buf/st-dma-fence-unwrap.c:125:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     int err = 0;
         ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain':
   drivers/dma-buf/st-dma-fence-unwrap.c:167:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     int err = 0;
         ^~~
   drivers/dma-buf/st-dma-fence-unwrap.c: In function 'unwrap_chain_array':
   drivers/dma-buf/st-dma-fence-unwrap.c:209:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     int err = 0;
         ^~~


vim +/err +125 drivers/dma-buf/st-dma-fence-unwrap.c

   120	
   121	static int unwrap_array(void *arg)
   122	{
   123		struct dma_fence *fence, *f1, *f2, *array;
   124		struct dma_fence_unwrap iter;
 > 125		int err = 0;
   126	
   127		f1 = mock_fence();
   128		if (!f1)
   129			return -ENOMEM;
   130	
   131		f2 = mock_fence();
   132		if (!f2) {
   133			dma_fence_put(f1);
   134			return -ENOMEM;
   135		}
   136	
   137		array = mock_array(2, f1, f2);
   138		if (!array)
   139			return -ENOMEM;
   140	
   141		dma_fence_unwrap_for_each(fence, &iter, array) {
   142			if (fence == f1) {
   143				f1 = NULL;
   144			} else if (fence == f2) {
   145				f2 = NULL;
   146			} else {
   147				pr_err("Unexpected fence!\n");
   148				err = -EINVAL;
   149			}
   150		}
   151	
   152		if (f1 || f2) {
   153			pr_err("Not all fences seen!\n");
   154			err = -EINVAL;
   155		}
   156	
   157		dma_fence_signal(f1);
   158		dma_fence_signal(f2);
   159		dma_fence_put(array);
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
