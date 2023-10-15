Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B920F9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWlQjc+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697357737; x=1728893737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QLJD3KRNI8npkwI018cYbGUrJyCYDLopDvyxXMBAoa0=;
  b=hWlQjc+9NxQg9TGh76leFrLcApzVUzgB/pzKGwF1kRmN5/AlY681nJaf
   nVNkvxZAR8nOLKSVapb+d4kOlAhWjCWbKTeIsgWfahGwPKGYz925hx6NP
   z8S4Z1YQY6F8qeil2Wy4lrKU1IPdxAowMSR0+Zf6srHwzBQYFM3i4RYtd
   P2rr9QyUCowTyw+poTu3TEn62Fi1I6CC2lzZXjPcCCBv5HD109Io++cn9
   FksMS/4GqKt3/7483npzAUZevX/kVq3FvlRFDk4oCWrB8ZHw8zwKRIn7+
   nQIzd9vje7kOHyeK3nNp2lCe6v1GxcEszTndaZ6iN0U39O42OVBXZ2nGw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364736078"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364736078"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="846027166"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="846027166"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2023 01:15:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwHa-0007Cy-0w;
	Sun, 15 Oct 2023 08:15:30 +0000
Date: Sun, 15 Oct 2023 16:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2561/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:770:1: warning: unsupported size for
 integer register
Message-ID: <202310151640.3BEgyREt-lkp@intel.com>
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
commit: 9329f333eb17203694d0b851bedbcca1cd96ed69 [2561/30000] soc: fsl: dpio: Replace QMAN array mode by ring mode enqueue.
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151640.3BEgyREt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151640.3BEgyREt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151640.3BEgyREt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:918:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     918 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
   drivers/soc/fsl/dpio/qbman-portal.c:920:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     920 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:58: note: in definition of macro 'dccvac'
     173 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_direct':
>> drivers/soc/fsl/dpio/qbman-portal.c:770:1: warning: unsupported size for integer register
     770 | }
         | ^
   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
   drivers/soc/fsl/dpio/qbman-portal.c:1183: Error: no such instruction: `dc cvac,%ecx'
   drivers/soc/fsl/dpio/qbman-portal.c:1533: Error: no such instruction: `dc cvac,%edi'
   drivers/soc/fsl/dpio/qbman-portal.c:763: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:920: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%esi'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:177: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_MXC
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_MXC
   Selected by [y]:
   - GPIO_MXC_PAD_WAKEUP [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && IMX_SCU [=y]


vim +770 drivers/soc/fsl/dpio/qbman-portal.c

321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  685  
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  686  /**
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  687   * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  688   * using one enqueue descriptor
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  689   * @s:  the software portal used for enqueue
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  690   * @d:  the enqueue descriptor
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  691   * @fd: table pointer of frame descriptor table to be enqueued
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  692   * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  693   * @num_frames: number of fd to be enqueued
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  694   *
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  695   * Return the number of fd enqueued, or a negative error number.
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  696   */
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  697  static
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  698  int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  699  				      const struct qbman_eq_desc *d,
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  700  				      const struct dpaa2_fd *fd,
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  701  				      uint32_t *flags,
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  702  				      int num_frames)
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  703  {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  704  	uint32_t *p = NULL;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  705  	const uint32_t *cl = (uint32_t *)d;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  706  	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  707  	int i, num_enqueued = 0;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  708  	uint64_t addr_cena;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  709  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  710  	spin_lock(&s->access_spinlock);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  711  	half_mask = (s->eqcr.pi_ci_mask>>1);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  712  	full_mask = s->eqcr.pi_ci_mask;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  713  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  714  	if (!s->eqcr.available) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  715  		eqcr_ci = s->eqcr.ci;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  716  		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  717  		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  718  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  719  		s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  720  					eqcr_ci, s->eqcr.ci);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  721  		if (!s->eqcr.available) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  722  			spin_unlock(&s->access_spinlock);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  723  			return 0;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  724  		}
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  725  	}
9a499cc1e7316e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  726  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  727  	eqcr_pi = s->eqcr.pi;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  728  	num_enqueued = (s->eqcr.available < num_frames) ?
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  729  			s->eqcr.available : num_frames;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  730  	s->eqcr.available -= num_enqueued;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  731  	/* Fill in the EQCR ring */
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  732  	for (i = 0; i < num_enqueued; i++) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  733  		p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  734  		/* Skip copying the verb */
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  735  		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  736  		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  737  		       &fd[i], sizeof(*fd));
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  738  		eqcr_pi++;
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  739  	}
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  740  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  741  	dma_wmb();
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  742  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  743  	/* Set the verb byte, have to substitute in the valid-bit */
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  744  	eqcr_pi = s->eqcr.pi;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  745  	for (i = 0; i < num_enqueued; i++) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  746  		p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  747  		p[0] = cl[0] | s->eqcr.pi_vb;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  748  		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  749  			struct qbman_eq_desc *d = (struct qbman_eq_desc *)p;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  750  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  751  			d->dca = (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  752  				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  753  		}
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  754  		eqcr_pi++;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  755  		if (!(eqcr_pi & half_mask))
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  756  			s->eqcr.pi_vb ^= QB_VALID_BIT;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  757  	}
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  758  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  759  	/* Flush all the cacheline without load/store in between */
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  760  	eqcr_pi = s->eqcr.pi;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  761  	addr_cena = (size_t)s->addr_cena;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  762  	for (i = 0; i < num_enqueued; i++) {
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  763  		dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  764  		eqcr_pi++;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  765  	}
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  766  	s->eqcr.pi = eqcr_pi & full_mask;
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  767  	spin_unlock(&s->access_spinlock);
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  768  
9329f333eb1720 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  769  	return num_enqueued;
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04 @770  }
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  771  

:::::: The code at line 770 was first introduced by commit
:::::: 6a74b3766942efaff185457d8b426f5d007e1ac5 soc: fsl: dpio: QMAN performance improvement. Function pointer indirection.

:::::: TO: Youri Querry <youri.querry_1@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
