Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1BA30F930
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761656325; cv=none; b=hmlf9mRzhdvQHc7DUwKqekMlk5wdPdf1j+O7Fxa8N9ytz0WruHycy1Va8BVNE45xdO0o98YPijMxtyZuF+5WTkbu6tMUYYIZuuMkQgKKz9eGHyU6sUe2dJuRMjOz+puZppqhJIrVOwxK5p0Nvhe1JH0u6IMLrL55wu1XXFUNsVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761656325; c=relaxed/simple;
	bh=NEH56MmQURQRCM+yokjcJ7vpf5Zom+uR0pDIMEtdzqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jzrimcJX/O1QYBuM7NlQtlMxZanqYpGxvPG4287Wb8IOYUrAOqyHMbyuma+rqkfCppNBCw0X2OicSyjeywqkalZ12eOXzgqYjAp8ppey/j+fQW/gNBSGddTokxqbFHwNelNeqqKt17r5Mn51jWHjW43mp5pPFJvWSgCm8adVD7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/srvWMO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/srvWMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761656323; x=1793192323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEH56MmQURQRCM+yokjcJ7vpf5Zom+uR0pDIMEtdzqY=;
  b=h/srvWMOCpdzNygaegguJlBU60doHnF2rl48nh9OrDu9a4owZJcgiY08
   m5gE8FtbKa52pv6XfTOCx7R5+63LYNmFcyB9Mgwh7mVjioIsQMiOVQUL0
   AZ6YywIdTiW035iEa7bl+L5s9DT1c1cRWGcehuYRcq1Tz3tZ5Yu29mX7k
   Oo9O8xbhEJt2sS8QpArQbrTmVOZCaR+io7JeyFO7FGvTOSPOYzO8yEuoC
   5COMEHARUjgwbkmQH/fWHwlXr+Ex7LZeqyDWAo0F55MMeB2aYxS73IV3k
   OmU3EaLezw7MXtsG0kF5TIF9D8hhQQlPncqFE5wpr4i4cFILi83MLWP1G
   g==;
X-CSE-ConnectionGUID: 10m1QMG6RFuusHTHg6spOw==
X-CSE-MsgGUID: xhdTO1DxSiWF7Zo1iO/CkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63456802"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63456802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 05:58:43 -0700
X-CSE-ConnectionGUID: GGxbBeujQNCSQdVGeHbm/A==
X-CSE-MsgGUID: yqsDuqXrT9GjsON17Dg/IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="190461721"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Oct 2025 05:58:42 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDjHb-000J9h-28;
	Tue, 28 Oct 2025 12:58:39 +0000
Date: Tue, 28 Oct 2025 20:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 3505/4391]
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202510282030.nzq0BTFH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7d2388eeec24966fc4d5cf32d706f0514f29ac5
commit: 1ff1f0db6aec80eae1639eff31b5875632d539c0 [3505/4391] pmdomain: mediatek: Add support for MFlexGraphics
config: riscv-randconfig-r131-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282030.nzq0BTFH-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282030.nzq0BTFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282030.nzq0BTFH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned long @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:418:26: sparse:     got unsigned long
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] magic @@     got unsigned int [usertype] ipi_magic @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     expected restricted __le32 [usertype] magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:458:20: sparse:     got unsigned int [usertype] ipi_magic
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:472:19: sparse: sparse: restricted signed int degrades to integer
>> drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [assigned] [usertype] base @@     got unsigned long long [usertype] shared_mem_phys @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     expected restricted __le64 [assigned] [usertype] base
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:490:31: sparse:     got unsigned long long [usertype] shared_mem_phys
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [assigned] [usertype] size @@     got unsigned int shared_mem_size @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     expected restricted __le32 [assigned] [usertype] size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:491:31: sparse:     got unsigned int shared_mem_size
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:509:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] power_state @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     expected restricted __le32 [usertype] power_state
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:510:27: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] cmd @@     got int @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     expected restricted __le32 [usertype] cmd
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:523:17: sparse:     got int
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] gpu_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     expected restricted signed int [usertype] gpu_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:524:38: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted signed int [usertype] stack_oppidx @@     got unsigned int opp_idx @@
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     expected restricted signed int [usertype] stack_oppidx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:525:40: sparse:     got unsigned int opp_idx
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:578:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:579:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:593:44: sparse: sparse: restricted __le32 degrades to integer
   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c:594:46: sparse: sparse: restricted __le32 degrades to integer

vim +490 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c

   479	
   480	static int mtk_mfg_init_shared_mem(struct mtk_mfg *mfg)
   481	{
   482		struct device *dev = &mfg->pdev->dev;
   483		struct mtk_mfg_ipi_msg msg = {};
   484		int ret;
   485	
   486		dev_dbg(dev, "clearing GPUEB shared memory, 0x%X bytes\n", mfg->shared_mem_size);
   487		memset_io(mfg->shared_mem, 0, mfg->shared_mem_size);
   488	
   489		msg.cmd = CMD_INIT_SHARED_MEM;
 > 490		msg.u.shared_mem.base = mfg->shared_mem_phys;
   491		msg.u.shared_mem.size = mfg->shared_mem_size;
   492	
   493		ret = mtk_mfg_send_ipi(mfg, &msg);
   494		if (ret)
   495			return ret;
   496	
   497		if (readl(mfg->shared_mem + GF_REG_MAGIC) != GPUEB_MEM_MAGIC) {
   498			dev_err(dev, "EB did not initialise shared memory correctly\n");
   499			return -EIO;
   500		}
   501	
   502		return 0;
   503	}
   504	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
