Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB733250E5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 23:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jdorDs47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697327460; x=1728863460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tf7eWXnoFx/qoeruWexhQ9DnhJOiiNc5PZJPL1CdSLk=;
  b=jdorDs476rKKpFkapOBVS+XArDq3wJ6c2A5CZdJqHad+KheqBqsJr+0P
   e3K3G15EgoV3wzFM+NeFzTeuB5jEWgDjqE51rNo3ReqRhxG9NL2k9pdq/
   qjSmkyafvPqhFpk1+BtBWkR0zwivFSr9XY8dA0cg8SEvubvtbT1w7DvYD
   0q5FTKACKMOK2/+YsUC6MpK4Rd0ucoESnKCHDn+LVbsCPB7yMnN4KaFbi
   wGn+E9R7Nlgi9S2hdvbcEEHf2sAPapGPIAapF1BO2LVBVJDkcdVuCAVTv
   CqQ44KhbuD+uxZO/vVdvsuZM7iVCgz81O3Y+U/qU1sS8Js2E/8IfEJ+ru
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="375706667"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="375706667"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 16:50:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="928881424"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="928881424"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2023 16:50:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qroPI-0006op-1N;
	Sat, 14 Oct 2023 23:50:56 +0000
Date: Sun, 15 Oct 2023 07:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2487/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc
 cvac,%edx'
Message-ID: <202310150713.ynI9Ordl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 166290c21079e1ae6c20592d3a252df0ece8588e [2487/30000] soc: fsl: dpio: enable qbman CENA portal memory access
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150713.ynI9Ordl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150713.ynI9Ordl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150713.ynI9Ordl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:494: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:691: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:924: Error: no such instruction: `dc cvac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%ebx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%edx'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_MXC
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_MXC
   Selected by [y]:
   - GPIO_MXC_PAD_WAKEUP [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && IMX_SCU [=y]


vim +340 drivers/soc/fsl/dpio/qbman-portal.c

   328	
   329	/*
   330	 * Commits merges in the caller-supplied command verb (which should not include
   331	 * the valid-bit) and submits the command to hardware
   332	 */
   333	void qbman_swp_mc_submit(struct qbman_swp *p, void *cmd, u8 cmd_verb)
   334	{
   335		u8 *v = cmd;
   336	
   337		if ((p->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
   338			dma_wmb();
   339			*v = cmd_verb | p->mc.valid_bit;
 > 340			dccvac(cmd);
   341		} else {
   342			*v = cmd_verb | p->mc.valid_bit;
   343			dma_wmb();
   344			qbman_write_register(p, QBMAN_CINH_SWP_CR_RT, QMAN_RT_MODE);
   345		}
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
