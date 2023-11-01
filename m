Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0391847
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 02:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fT2kqmCE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698804773; x=1730340773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8thT+yhZzhcOyTGwZQHs1XZqoRXK18C+etSHubc7hvc=;
  b=fT2kqmCEIei9rF2QoGyMFh85j7YkYCxBMGwxT1xLcAVVX/FFQKnYRgrR
   9mkFEMysOWr7+V0fGFpi2dk0Yk8QfMj72VHueisnhxViMk2ur/JujgXwV
   Qma1Jirgxk0dwSqsBzpF/FyDgbnQ/ZuInDXM/i1mQ2ddGr9b5SMrKwcSZ
   IVKYYq3TkW+WKUt61qS94Q2fzkl5HZqT9ORiM60nxXw81tRT/W0iOZCjb
   iq/X2VSyv3W+zMQa3J5glk8bVBIv6/A/woUBBbfJYXczYP/UVrezQudFg
   0aM8Q+7AmMDb3oatM/nS84GT1zSowUdcFoxkBUEha+Qb478mqwXG0iX2t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474656270"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="474656270"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826622566"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="826622566"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Oct 2023 19:12:47 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy0ir-0000Wu-1c;
	Wed, 01 Nov 2023 02:12:45 +0000
Date: Wed, 1 Nov 2023 10:12:17 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>
Subject: [linux-next:master 9089/15964]
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1562:undefined reference to `qmp_put'
Message-ID: <202311011054.QnycS93a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c2d379d63450ae464eeab45462e0cb573cd97d0
commit: b9986846189cea87a9d93052cfab462c9e74f447 [9089/15964] drm/msm/a6xx: Fix up QMP handling
config: arm-randconfig-r025-20230123 (https://download.01.org/0day-ci/archive/20231101/202311011054.QnycS93a-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011054.QnycS93a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011054.QnycS93a-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1027:(.text+0x2356): undefined reference to `qmp_send'
   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_remove':
>> drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1562:(.text+0x2808): undefined reference to `qmp_put'
   arm-linux-gnueabi-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_init':
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1790:(.text+0x2f1e): undefined reference to `qmp_get'


vim +1562 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

  1531	
  1532	void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
  1533	{
  1534		struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
  1535		struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
  1536		struct platform_device *pdev = to_platform_device(gmu->dev);
  1537	
  1538		mutex_lock(&gmu->lock);
  1539		if (!gmu->initialized) {
  1540			mutex_unlock(&gmu->lock);
  1541			return;
  1542		}
  1543	
  1544		gmu->initialized = false;
  1545	
  1546		mutex_unlock(&gmu->lock);
  1547	
  1548		pm_runtime_force_suspend(gmu->dev);
  1549	
  1550		/*
  1551		 * Since cxpd is a virt device, the devlink with gmu-dev will be removed
  1552		 * automatically when we do detach
  1553		 */
  1554		dev_pm_domain_detach(gmu->cxpd, false);
  1555	
  1556		if (!IS_ERR_OR_NULL(gmu->gxpd)) {
  1557			pm_runtime_disable(gmu->gxpd);
  1558			dev_pm_domain_detach(gmu->gxpd, false);
  1559		}
  1560	
  1561		if (!IS_ERR_OR_NULL(gmu->qmp))
> 1562			qmp_put(gmu->qmp);
  1563	
  1564		iounmap(gmu->mmio);
  1565		if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
  1566			iounmap(gmu->rscc);
  1567		gmu->mmio = NULL;
  1568		gmu->rscc = NULL;
  1569	
  1570		if (!adreno_has_gmu_wrapper(adreno_gpu)) {
  1571			a6xx_gmu_memory_free(gmu);
  1572	
  1573			free_irq(gmu->gmu_irq, gmu);
  1574			free_irq(gmu->hfi_irq, gmu);
  1575		}
  1576	
  1577		/* Drop reference taken in of_find_device_by_node */
  1578		put_device(gmu->dev);
  1579	}
  1580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
