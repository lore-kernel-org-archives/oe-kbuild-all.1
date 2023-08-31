Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B68F43
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693476528; x=1725012528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kU490UaKLYPsy1rsQFWbMLry0p4sxLs2C5gyUzfF8ME=;
  b=GG5o8Q8QJ73MKiZhjPxH6uCczXA6WCdG9rSsQq7iLX7bJpnBDl5o7NYt
   wK4yDzbkeH+my3ucFUmGkmo1rBZ4NHLYPfVCziBfCX8Qszy0qSC+oqRwr
   jYzZw0KlJ11vXY6wse4k/8suavIUZW5vDuHYnDba29UKMhylF54Z26lT+
   yvDk6M7or9MCVBmiRnTmkfn0Oan+/GrO4hXpQNtf8pE0Cy/xlghHO3xAC
   utK8xEIUO70OBF9aPPJB5rM4NAgkO3Wylv5kZ7wNpMzBCcGZa5ickVkBV
   zVklqB9pt3VYMt+4IvMZzBoUKofdj8qjViHNrvTOjSSOPT5m/i+wqxbzO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373290603"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="373290603"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="986178892"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="986178892"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Aug 2023 03:08:45 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbebS-00001K-0z;
	Thu, 31 Aug 2023 10:08:42 +0000
Date: Thu, 31 Aug 2023 18:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3830/24603]
 drivers/soc/fsl/dpio/qbman-portal.c:724:1: warning: unsupported size for
 integer register
Message-ID: <202308311804.Wm4gIIRd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: a60cf5cbad0f9b4a94b0f7b9d5af8f258593b610 [3830/24603] soc: fsl: dpio: enable qbman CENA portal memory access
config: i386-buildonly-randconfig-006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311804.Wm4gIIRd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311804.Wm4gIIRd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311804.Wm4gIIRd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
   drivers/soc/fsl/dpio/qbman-portal.c:872:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     872 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
   drivers/soc/fsl/dpio/qbman-portal.c:874:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     874 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:58: note: in definition of macro 'dccvac'
     172 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_direct':
>> drivers/soc/fsl/dpio/qbman-portal.c:724:1: warning: unsupported size for integer register
     724 | }
         | ^
   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
   drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%ecx'
   drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:1495: Error: no such instruction: `dc cvac,%esi'
   drivers/soc/fsl/dpio/qbman-portal.c:717: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:874: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'


vim +724 drivers/soc/fsl/dpio/qbman-portal.c

321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge    2017-03-13  637  
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  638  /**
b46fe745e4f610 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  639   * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  640   * using one enqueue descriptor
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  641   * @s:  the software portal used for enqueue
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  642   * @d:  the enqueue descriptor
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  643   * @fd: table pointer of frame descriptor table to be enqueued
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  644   * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  645   * @num_frames: number of fd to be enqueued
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  646   *
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  647   * Return the number of fd enqueued, or a negative error number.
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  648   */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  649  static
b46fe745e4f610 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  650  int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  651  				      const struct qbman_eq_desc *d,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  652  				      const struct dpaa2_fd *fd,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  653  				      uint32_t *flags,
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  654  				      int num_frames)
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  655  {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  656  	uint32_t *p = NULL;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  657  	const uint32_t *cl = (uint32_t *)d;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  658  	uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  659  	int i, num_enqueued = 0;
a60cf5cbad0f9b drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang  2017-04-13  660  	uint64_t addr_cena;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  661  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  662  	spin_lock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  663  	half_mask = (s->eqcr.pi_ci_mask>>1);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  664  	full_mask = s->eqcr.pi_ci_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  665  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  666  	if (!s->eqcr.available) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  667  		eqcr_ci = s->eqcr.ci;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  668  		p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  669  		s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
7596ac9d19a9df drivers/soc/fsl/dpio/qbman-portal.c            Ioana Ciornei 2020-05-05  670  		s->eqcr.ci &= full_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  671  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  672  		s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  673  					eqcr_ci, s->eqcr.ci);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  674  		if (!s->eqcr.available) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  675  			spin_unlock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  676  			return 0;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  677  		}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  678  	}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  679  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  680  	eqcr_pi = s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  681  	num_enqueued = (s->eqcr.available < num_frames) ?
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  682  			s->eqcr.available : num_frames;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  683  	s->eqcr.available -= num_enqueued;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  684  	/* Fill in the EQCR ring */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  685  	for (i = 0; i < num_enqueued; i++) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  686  		p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  687  		/* Skip copying the verb */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  688  		memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  689  		memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  690  		       &fd[i], sizeof(*fd));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  691  		eqcr_pi++;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  692  	}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  693  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  694  	dma_wmb();
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  695  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  696  	/* Set the verb byte, have to substitute in the valid-bit */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  697  	eqcr_pi = s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  698  	for (i = 0; i < num_enqueued; i++) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  699  		p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  700  		p[0] = cl[0] | s->eqcr.pi_vb;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  701  		if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  702  			struct qbman_eq_desc *d = (struct qbman_eq_desc *)p;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  703  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  704  			d->dca = (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  705  				((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  706  		}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  707  		eqcr_pi++;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  708  		if (!(eqcr_pi & half_mask))
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  709  			s->eqcr.pi_vb ^= QB_VALID_BIT;
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  710  	}
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  711  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  712  	/* Flush all the cacheline without load/store in between */
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  713  	eqcr_pi = s->eqcr.pi;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  714  	for (i = 0; i < num_enqueued; i++)
a60cf5cbad0f9b drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang  2017-04-13  715  	addr_cena = (size_t)s->addr_cena;
a60cf5cbad0f9b drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang  2017-04-13  716  	for (i = 0; i < num_enqueued; i++) {
a60cf5cbad0f9b drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang  2017-04-13  717  		dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  718  		eqcr_pi++;
a60cf5cbad0f9b drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang  2017-04-13  719  	}
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  720  	s->eqcr.pi = eqcr_pi & full_mask;
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  721  	spin_unlock(&s->access_spinlock);
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  722  
3b2abda7d28c69 drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  723  	return num_enqueued;
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12 @724  }
9d98809711ae0e drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry  2019-12-12  725  

:::::: The code at line 724 was first introduced by commit
:::::: 9d98809711ae0ebcfb8115a0bc54604c59908710 soc: fsl: dpio: Adding QMAN multiple enqueue interface

:::::: TO: Youri Querry <youri.querry_1@nxp.com>
:::::: CC: Li Yang <leoyang.li@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
