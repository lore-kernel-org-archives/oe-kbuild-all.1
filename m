Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8181DA22
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYs//dcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701324750; x=1732860750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQ+Sf3M4Ee5GekbzNrVdx4Rbxrs3SAlcJ9NMQZloQn4=;
  b=gYs//dcQbFlmLPmuJMngW5VlAbtsc6uhnKrWHWwfbUkMW6tScJUYhpGl
   TTI4wjVBJ/Fkz/5y/c9QbOZnDxm7hRpHLCXDSvu8ydXPin+ChAMcz4Czp
   N3VeoNI0N9RK5KjZVsk44BQqsV7G9EXfEH7SSDV0c7GUvx5zLyNz2QANM
   pmsEj/KAezdH/xa99y+EtU98BiU2lucrGM5eKxipPMd2toVhnoX0FTWKZ
   4irzlk+fHH791+hs2rIjGrDwdcxutCz06xf/ZvxZ3ZN2hyR5ZquGqc9Zo
   9vtzdhlL22AmVZKE5NFd0Ed90Gps2PDJNVfsQ2ULdQWUmsn272jKABdHW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="479474818"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="479474818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 22:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="17274939"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Nov 2023 22:12:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8aHi-0001QS-0J;
	Thu, 30 Nov 2023 06:12:26 +0000
Date: Thu, 30 Nov 2023 14:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2487/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc
 cvac,%r13'
Message-ID: <202311301412.oCq6PaJk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Haiying,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 166290c21079e1ae6c20592d3a252df0ece8588e [2487/30000] soc: fsl: dpio: enable qbman CENA portal memory access
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311301412.oCq6PaJk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301412.oCq6PaJk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301412.oCq6PaJk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%r13'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r12'
>> drivers/soc/fsl/dpio/qbman-portal.c:494: Error: no such instruction: `dc cvac,%rbx'
>> drivers/soc/fsl/dpio/qbman-portal.c:691: Error: no such instruction: `dc cvac,%rbp'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%rax'
   drivers/soc/fsl/dpio/qbman-portal.c:924: Error: no such instruction: `dc cvac,%r14'
   drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%rbx'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%rbp'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%rbp'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
>> drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%r15'
>> drivers/soc/fsl/dpio/qbman-portal.c:97: Error: no such instruction: `dc ivac,%r13'
   drivers/soc/fsl/dpio/qbman-portal.c:340: Error: no such instruction: `dc cvac,%rbp'

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
   348	/*
   349	 * Checks for a completed response (returns non-NULL if only if the response
   350	 * is complete).
   351	 */
   352	void *qbman_swp_mc_result(struct qbman_swp *p)
   353	{
   354		u32 *ret, verb;
   355	
   356		if ((p->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
   357			qbman_inval_prefetch(p, QBMAN_CENA_SWP_RR(p->mc.valid_bit));
   358			ret = qbman_get_cmd(p, QBMAN_CENA_SWP_RR(p->mc.valid_bit));
   359			/* Remove the valid-bit - command completed if the rest
   360			 * is non-zero.
   361			 */
   362			verb = ret[0] & ~QB_VALID_BIT;
   363			if (!verb)
   364				return NULL;
   365			p->mc.valid_bit ^= QB_VALID_BIT;
   366		} else {
   367			ret = qbman_get_cmd(p, QBMAN_CENA_SWP_RR_MEM);
   368			/* Command completed if the valid bit is toggled */
   369			if (p->mr.valid_bit != (ret[0] & QB_VALID_BIT))
   370				return NULL;
   371			/* Command completed if the rest is non-zero */
   372			verb = ret[0] & ~QB_VALID_BIT;
   373			if (!verb)
   374				return NULL;
   375			p->mr.valid_bit ^= QB_VALID_BIT;
   376		}
   377	
   378		return ret;
   379	}
   380	
   381	#define QB_ENQUEUE_CMD_OPTIONS_SHIFT    0
   382	enum qb_enqueue_commands {
   383		enqueue_empty = 0,
   384		enqueue_response_always = 1,
   385		enqueue_rejects_to_fq = 2
   386	};
   387	
   388	#define QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT      2
   389	#define QB_ENQUEUE_CMD_IRQ_ON_DISPATCH_SHIFT 3
   390	#define QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT     4
   391	
   392	/**
   393	 * qbman_eq_desc_clear() - Clear the contents of a descriptor to
   394	 *                         default/starting state.
   395	 */
   396	void qbman_eq_desc_clear(struct qbman_eq_desc *d)
   397	{
   398		memset(d, 0, sizeof(*d));
   399	}
   400	
   401	/**
   402	 * qbman_eq_desc_set_no_orp() - Set enqueue descriptor without orp
   403	 * @d:                the enqueue descriptor.
   404	 * @response_success: 1 = enqueue with response always; 0 = enqueue with
   405	 *                    rejections returned on a FQ.
   406	 */
   407	void qbman_eq_desc_set_no_orp(struct qbman_eq_desc *d, int respond_success)
   408	{
   409		d->verb &= ~(1 << QB_ENQUEUE_CMD_ORP_ENABLE_SHIFT);
   410		if (respond_success)
   411			d->verb |= enqueue_response_always;
   412		else
   413			d->verb |= enqueue_rejects_to_fq;
   414	}
   415	
   416	/*
   417	 * Exactly one of the following descriptor "targets" should be set. (Calling any
   418	 * one of these will replace the effect of any prior call to one of these.)
   419	 *   -enqueue to a frame queue
   420	 *   -enqueue to a queuing destination
   421	 */
   422	
   423	/**
   424	 * qbman_eq_desc_set_fq() - set the FQ for the enqueue command
   425	 * @d:    the enqueue descriptor
   426	 * @fqid: the id of the frame queue to be enqueued
   427	 */
   428	void qbman_eq_desc_set_fq(struct qbman_eq_desc *d, u32 fqid)
   429	{
   430		d->verb &= ~(1 << QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT);
   431		d->tgtid = cpu_to_le32(fqid);
   432	}
   433	
   434	/**
   435	 * qbman_eq_desc_set_qd() - Set Queuing Destination for the enqueue command
   436	 * @d:       the enqueue descriptor
   437	 * @qdid:    the id of the queuing destination to be enqueued
   438	 * @qd_bin:  the queuing destination bin
   439	 * @qd_prio: the queuing destination priority
   440	 */
   441	void qbman_eq_desc_set_qd(struct qbman_eq_desc *d, u32 qdid,
   442				  u32 qd_bin, u32 qd_prio)
   443	{
   444		d->verb |= 1 << QB_ENQUEUE_CMD_TARGET_TYPE_SHIFT;
   445		d->tgtid = cpu_to_le32(qdid);
   446		d->qdbin = cpu_to_le16(qd_bin);
   447		d->qpri = qd_prio;
   448	}
   449	
   450	#define EQAR_IDX(eqar)     ((eqar) & 0x7)
   451	#define EQAR_VB(eqar)      ((eqar) & 0x80)
   452	#define EQAR_SUCCESS(eqar) ((eqar) & 0x100)
   453	
   454	static inline void qbman_write_eqcr_am_rt_register(struct qbman_swp *p,
   455							   u8 idx)
   456	{
   457		if (idx < 16)
   458			qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT + idx * 4,
   459					     QMAN_RT_MODE);
   460		else
   461			qbman_write_register(p, QBMAN_CINH_SWP_EQCR_AM_RT2 +
   462					     (idx - 16) * 4,
   463					     QMAN_RT_MODE);
   464	}
   465	
   466	/**
   467	 * qbman_swp_enqueue() - Issue an enqueue command
   468	 * @s:  the software portal used for enqueue
   469	 * @d:  the enqueue descriptor
   470	 * @fd: the frame descriptor to be enqueued
   471	 *
   472	 * Please note that 'fd' should only be NULL if the "action" of the
   473	 * descriptor is "orp_hole" or "orp_nesn".
   474	 *
   475	 * Return 0 for successful enqueue, -EBUSY if the EQCR is not ready.
   476	 */
   477	int qbman_swp_enqueue(struct qbman_swp *s, const struct qbman_eq_desc *d,
   478			      const struct dpaa2_fd *fd)
   479	{
   480		struct qbman_eq_desc *p;
   481		u32 eqar = qbman_read_register(s, QBMAN_CINH_SWP_EQAR);
   482	
   483		if (!EQAR_SUCCESS(eqar))
   484			return -EBUSY;
   485	
   486		p = qbman_get_cmd(s, QBMAN_CENA_SWP_EQCR(EQAR_IDX(eqar)));
   487		memcpy(&p->dca, &d->dca, 31);
   488		memcpy(&p->fd, fd, sizeof(*fd));
   489	
   490		if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000) {
   491			/* Set the verb byte, have to substitute in the valid-bit */
   492			dma_wmb();
   493			p->verb = d->verb | EQAR_VB(eqar);
 > 494			dccvac(p);
   495		} else {
   496			p->verb = d->verb | EQAR_VB(eqar);
   497			dma_wmb();
   498			qbman_write_eqcr_am_rt_register(s, EQAR_IDX(eqar));
   499		}
   500	
   501		return 0;
   502	}
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
