Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E2C15B4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 04:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694232290; x=1725768290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oN4XVv4bc4b1RU52erRulnkd4NmCkFdQ/iAwQ9JWx/I=;
  b=nayZegOTZ9Ir9SWfiQYt0SYVaLj6x6svVZGu006t0qziTETahWTWZxkx
   w5za5Pj0lTo8TUQrluhvCklJpWxz5ZPNgcUD8vGDfZKt7hc4HQYS6QsOy
   wFfrfQbVXPwgkfaoOwRXR0NdclEZT0UONh3W3n3C4jJWh6QaYQ5a9GTqy
   hyne/hNC1VQih44Djssm8y1g9I+VWR8QOHOcPIDB0oeSJaQoxB6X21I6t
   KuSCazsyCsIQfY5MLEsxL1EaJ4xQhIxe/PDFt4VgcKMrC2rh+kkwBLxtq
   lO8SQu37H4RP0JFUNNpSvDnfv+rVypfNU/u8aDT6RI2oh4cpe1dM49z8e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="376698902"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="376698902"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 21:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="857635726"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="857635726"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2023 21:04:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qepD7-0002uO-1A;
	Sat, 09 Sep 2023 04:04:41 +0000
Date: Sat, 9 Sep 2023 12:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 57/88]
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no
 previous prototype for 'nv50_instmem_dtor'
Message-ID: <202309091144.TAxnSgVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   dcd62291d3f1ba328303b1617495fa4542117fc1
commit: c3960b6f161b81617f2da25b588b01263a42e43d [57/88] drm/nouveau/imem/tu102-: prepare for GSP-RM
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230909/202309091144.TAxnSgVU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091144.TAxnSgVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091144.TAxnSgVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:399:1: warning: no previous prototype for 'nv50_instmem_dtor' [-Wmissing-prototypes]
     399 | nv50_instmem_dtor(struct nvkm_instmem *base)
         | ^~~~~~~~~~~~~~~~~


vim +/nv50_instmem_dtor +399 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

   397	
   398	void *
 > 399	nv50_instmem_dtor(struct nvkm_instmem *base)
   400	{
   401		return nv50_instmem(base);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
