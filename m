Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F31847
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 05:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688706955; x=1720242955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Lp1BKTv/W4E0zdCCH6ll+5WitGDXSH0gydccqbJ1Hw=;
  b=ivG3Fp2nblH2y9XHtXujNhLt1t75WSJChd4BbGVNp4GQOzZIZWgnqDuF
   M7cWuz3FUG18l0B17eBffifL8GQCgQyfK+VMwt08blOIZq6DkK2RqpimS
   4bOcLjO5sj59KeqB/4M7jgbh2fsERSMspCJIQNooiywqE/fX5Uy+724tr
   S7HQ/Zgn7kB35MvgI/AL1gQDHjyTaozg+K6gHM0ChEz1+mHjzY1IP1u9G
   Gl8jz2gME0vs8GVw7uAZVaHSkK8FIhBTMGVl2EpWEcO5o3WRyH8yzU6EI
   TpTIWtjigpz2amQ9CnqoZJMLrzsRNda22tnbQMdImmsnkiJGnszNPkdb6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="343391258"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="343391258"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 22:15:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="713856810"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="713856810"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jul 2023 22:15:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHdot-0001n8-1E;
	Fri, 07 Jul 2023 05:15:51 +0000
Date: Fri, 7 Jul 2023 13:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 161/224]
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1596:13: error: implicit declaration
 of function 'adreno_cmp_rev'
Message-ID: <202307071335.MxjOLLNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   f0a133b849634b4a3052fb456a980bf89a08f154
commit: eb9e2a58334f2d0671b39f6ccafb5aa29ebc43ea [161/224] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230707/202307071335.MxjOLLNH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071335.MxjOLLNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071335.MxjOLLNH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/msm/adreno/a5xx_gpu.c: In function 'a5xx_gpu_init':
>> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1596:13: error: implicit declaration of function 'adreno_cmp_rev' [-Werror=implicit-function-declaration]
    1596 |         if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
         |             ^~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/msm/adreno/a5xx_gpu.h:7,
                    from drivers/gpu/drm/msm/adreno/a5xx_gpu.c:14:
>> drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1596:48: error: 'ANY_ID' undeclared (first use in this function)
    1596 |         if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
         |                                                ^~~~~~
   drivers/gpu/drm/msm/adreno/adreno_gpu.h:43:51: note: in definition of macro 'ADRENO_REV'
      43 |         ((struct adreno_rev){ core, major, minor, patchid })
         |                                                   ^~~~~~~
   drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1596:48: note: each undeclared identifier is reported only once for each function it appears in
    1596 |         if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
         |                                                ^~~~~~
   drivers/gpu/drm/msm/adreno/adreno_gpu.h:43:51: note: in definition of macro 'ADRENO_REV'
      43 |         ((struct adreno_rev){ core, major, minor, patchid })
         |                                                   ^~~~~~~
   cc1: some warnings being treated as errors


vim +/adreno_cmp_rev +1596 drivers/gpu/drm/msm/adreno/a5xx_gpu.c

  1564	
  1565	struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
  1566	{
  1567		struct msm_drm_private *priv = dev->dev_private;
  1568		struct platform_device *pdev = priv->gpu_pdev;
  1569		struct adreno_platform_config *config = pdev->dev.platform_data;
  1570		struct a5xx_gpu *a5xx_gpu = NULL;
  1571		struct adreno_gpu *adreno_gpu;
  1572		struct msm_gpu *gpu;
  1573		unsigned int nr_rings;
  1574		int ret;
  1575	
  1576		if (!pdev) {
  1577			DRM_DEV_ERROR(dev->dev, "No A5XX device is defined\n");
  1578			return ERR_PTR(-ENXIO);
  1579		}
  1580	
  1581		a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
  1582		if (!a5xx_gpu)
  1583			return ERR_PTR(-ENOMEM);
  1584	
  1585		adreno_gpu = &a5xx_gpu->base;
  1586		gpu = &adreno_gpu->base;
  1587	
  1588		adreno_gpu->registers = a5xx_registers;
  1589	
  1590		a5xx_gpu->lm_leakage = 0x4E001A;
  1591	
  1592		check_speed_bin(&pdev->dev);
  1593	
  1594		nr_rings = 4;
  1595	
> 1596		if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
