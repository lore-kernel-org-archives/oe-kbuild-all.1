Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730915CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HdQeAMSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697339606; x=1728875606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PcYDvxVSHHf8q9GucJpEBCaTsMCyWCgvUh3M9WiG/kU=;
  b=HdQeAMSPzH3eskyBl+NR1PSh46dehM3n+P+jKL3pr1qkMSgJFbq+IICY
   LrBCYQLJ24dthn1wK9kPXSnwBn9Ji8KeLThznTErPB3xmk6TYf536Af/u
   gSqiXfyRs5Sxt38yOJZm2oIWBJeR+oUmlUv8hjwinAAhtbBwEhBhiZvoN
   9FVZnWSXVlKtvn/WUayNUSXirCrV0/qyDFuPWfTiVH9Sd30i7koP4zMPM
   R7MJgzRGdBJiTbS39Yqa+RfZSYARrs/iSXn8X4QNOtol6i8uImmTv1Ofd
   KPo/94qtsXQOX5aGN3pV5s97Ga9zxIDsO0UJZrY1IW1KvbOnIOnnLcKp1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471592120"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="471592120"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 20:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705148034"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705148034"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Oct 2023 20:13:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrrZ8-0006yX-0F;
	Sun, 15 Oct 2023 03:13:18 +0000
Date: Sun, 15 Oct 2023 11:13:06 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2492/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:535: Error: no such instruction: `dc
 cvac,%eax'
Message-ID: <202310151137.yREiS8b1-lkp@intel.com>
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
commit: 7650abf2ec6a51b8db230d6971cc76d5c792f7e7 [2492/30000] soc: fsl: dpio: aligned access of qbman cacheable region
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151137.yREiS8b1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151137.yREiS8b1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151137.yREiS8b1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:535: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:732: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%ecx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:965: Error: no such instruction: `dc cvac,%ecx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:91: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:334: Error: no such instruction: `dc cvac,%edx'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_MXC
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_MXC
   Selected by [y]:
   - GPIO_MXC_PAD_WAKEUP [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && IMX_SCU [=y]


vim +535 drivers/soc/fsl/dpio/qbman-portal.c

5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  496  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  497  /**
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  498   * qbman_swp_enqueue() - Issue an enqueue command
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  499   * @s:  the software portal used for enqueue
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  500   * @d:  the enqueue descriptor
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  501   * @fd: the frame descriptor to be enqueued
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  502   *
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  503   * Please note that 'fd' should only be NULL if the "action" of the
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  504   * descriptor is "orp_hole" or "orp_nesn".
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  505   *
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  506   * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  507   */
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  508  int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  509  		      const struct dpaa2_fd *fd)
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  510  {
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  511  	struct qbman_eq_desc *p;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  512  	u32 eqar = qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  513  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  514  	if (!EQAR_SUCCESS(eqar))
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  515  		return -EBUSY;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  516  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  517  	p = qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  518  	/* This is mapped as DEVICE type memory, writes are
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  519  	 * with address alignment:
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  520  	 * desc.dca address alignment = 1
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  521  	 * desc.seqnum address alignment = 2
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  522  	 * desc.orpid address alignment = 4
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  523  	 * desc.tgtid address alignment = 8
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  524  	 */
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  525  	p->dca = d->dca;
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  526  	p->seqnum = d->seqnum;
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  527  	p->orpid = d->orpid;
7650abf2ec6a51 drivers/soc/fsl/dpio/qbman-portal.c            Bharat Bhushan 2018-03-07  528  	memcpy(&p->tgtid, &d->tgtid, 24);
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  529  	memcpy(&p->fd, fd, sizeof(*fd));
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  530  
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  531  	if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  532  		/* Set the verb byte, have to substitute in the valid-bit */
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  533  		dma_wmb();
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  534  		p->verb = d->verb | EQAR_VB(eqar);
166290c21079e1 drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang   2017-04-13 @535  		dccvac(p);
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  536  	} else {
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  537  		p->verb = d->verb | EQAR_VB(eqar);
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  538  		dma_wmb();
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  539  		qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge     2019-04-05  540  	}
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  541  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  542  	return 0;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  543  }
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge     2017-03-13  544  

:::::: The code at line 535 was first introduced by commit
:::::: 166290c21079e1ae6c20592d3a252df0ece8588e soc: fsl: dpio: enable qbman CENA portal memory access

:::::: TO: Haiying Wang <Haiying.Wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
