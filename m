Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835D6AB1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694026980; x=1725562980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMpJztN4IsMui4lBeJiJPBEC/5Wd0MUkS2R89SwKxos=;
  b=nY+bDUPGIVU4eae9NeYkrQGmSzvIavvxGaTHgGK70OKTyoY6CTFis/z4
   SCJwgMNDS0TX/k9qRo8CZnLsAhBfzZkRxN/gkrNCGeFEQQpE9cmCef1jQ
   fcXoZzgSTR9NLuWXHONpcjyeGU1OS91TiyxR14e1AapClohCnSrTlNaOq
   6UHwm/2xqgrnJk8IXCvyMNNPp0ybVzi/BMCWM6fSFf1CeDH5S1S8UdbUS
   f8jTIwobKcRPzxa8MT1HVgDvW8Y8aYd7P8PCO62tcEhc+OzRpY546qsz6
   oJ/feSlx98JdHom+ul+tUZMgNFMR+VGACN02tIzdRT6VU0k12Vf0KycQb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356638246"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="356638246"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 12:02:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="856579482"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="856579482"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2023 12:02:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdxne-0000Vj-22;
	Wed, 06 Sep 2023 19:02:50 +0000
Date: Thu, 7 Sep 2023 03:02:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3830/24606]
 drivers/soc/fsl/dpio/qbman-portal.c:717:3: error: invalid instruction, did
 you mean: adc, ldc, ldc2, ldcl?
Message-ID: <202309070225.45yGxVLl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   c099d7415137daf904adcd5fdd73a25024627587
commit: a60cf5cbad0f9b4a94b0f7b9d5af8f258593b610 [3830/24606] soc: fsl: dpio: enable qbman CENA portal memory access
config: arm-randconfig-r032-20230906 (https://download.01.org/0day-ci/archive/20230907/202309070225.45yGxVLl-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309070225.45yGxVLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309070225.45yGxVLl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/fsl/dpio/qbman-portal.c:717:3: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
                   dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
                   ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:34: note: expanded from macro 'dccvac'
   #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc cvac, r0;
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:874:3: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
                   dccvac((uint64_t *)(addr_cena +
                   ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:34: note: expanded from macro 'dccvac'
   #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc cvac, r0;
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:1140:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dccvac(p);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:34: note: expanded from macro 'dccvac'
   #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc cvac, r2;
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r2
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r0
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r0
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:1495:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dccvac(p);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:34: note: expanded from macro 'dccvac'
   #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc cvac, lr;
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r2
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r1
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);
           ^
   drivers/soc/fsl/dpio/qbman-portal.c:173:34: note: expanded from macro 'dcivac'
   #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc ivac, r0
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:470:3: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
                   dccvac(cmd);
                   ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:34: note: expanded from macro 'dccvac'
   #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
                                    ^
   <inline asm>:1:2: note: instantiated into assembly here
           dc cvac, r1;
           ^~
   drivers/soc/fsl/dpio/qbman-portal.c:176:2: error: invalid instruction, did you mean: adc, ldc, ldc2, ldcl?
           dcivac(p->addr_cena + offset);


vim +717 drivers/soc/fsl/dpio/qbman-portal.c

   637	
   638	/**
   639	 * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
   640	 * using one enqueue descriptor
   641	 * @s:  the software portal used for enqueue
   642	 * @d:  the enqueue descriptor
   643	 * @fd: table pointer of frame descriptor table to be enqueued
   644	 * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
   645	 * @num_frames: number of fd to be enqueued
   646	 *
   647	 * Return the number of fd enqueued, or a negative error number.
   648	 */
   649	static
   650	int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
   651					      const struct qbman_eq_desc *d,
   652					      const struct dpaa2_fd *fd,
   653					      uint32_t *flags,
   654					      int num_frames)
   655	{
   656		uint32_t *p = NULL;
   657		const uint32_t *cl = (uint32_t *)d;
   658		uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
   659		int i, num_enqueued = 0;
   660		uint64_t addr_cena;
   661	
   662		spin_lock(&s->access_spinlock);
   663		half_mask = (s->eqcr.pi_ci_mask>>1);
   664		full_mask = s->eqcr.pi_ci_mask;
   665	
   666		if (!s->eqcr.available) {
   667			eqcr_ci = s->eqcr.ci;
   668			p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
   669			s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
   670			s->eqcr.ci &= full_mask;
   671	
   672			s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
   673						eqcr_ci, s->eqcr.ci);
   674			if (!s->eqcr.available) {
   675				spin_unlock(&s->access_spinlock);
   676				return 0;
   677			}
   678		}
   679	
   680		eqcr_pi = s->eqcr.pi;
   681		num_enqueued = (s->eqcr.available < num_frames) ?
   682				s->eqcr.available : num_frames;
   683		s->eqcr.available -= num_enqueued;
   684		/* Fill in the EQCR ring */
   685		for (i = 0; i < num_enqueued; i++) {
   686			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   687			/* Skip copying the verb */
   688			memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
   689			memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
   690			       &fd[i], sizeof(*fd));
   691			eqcr_pi++;
   692		}
   693	
   694		dma_wmb();
   695	
   696		/* Set the verb byte, have to substitute in the valid-bit */
   697		eqcr_pi = s->eqcr.pi;
   698		for (i = 0; i < num_enqueued; i++) {
   699			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   700			p[0] = cl[0] | s->eqcr.pi_vb;
   701			if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
   702				struct qbman_eq_desc *d = (struct qbman_eq_desc *)p;
   703	
   704				d->dca = (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
   705					((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
   706			}
   707			eqcr_pi++;
   708			if (!(eqcr_pi & half_mask))
   709				s->eqcr.pi_vb ^= QB_VALID_BIT;
   710		}
   711	
   712		/* Flush all the cacheline without load/store in between */
   713		eqcr_pi = s->eqcr.pi;
   714		for (i = 0; i < num_enqueued; i++)
   715		addr_cena = (size_t)s->addr_cena;
   716		for (i = 0; i < num_enqueued; i++) {
 > 717			dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
   718			eqcr_pi++;
   719		}
   720		s->eqcr.pi = eqcr_pi & full_mask;
   721		spin_unlock(&s->access_spinlock);
   722	
   723		return num_enqueued;
   724	}
   725	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
