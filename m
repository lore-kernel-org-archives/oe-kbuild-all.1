Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3410EBE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693542924; x=1725078924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jS16O0FPDW4kQCxYvckhEPHdmweLzIRk8W6cJSBZlAY=;
  b=W24WVd1eLh58eamo9wzClqqFU0NcR1ivYryxGSsagwrV5xJYHoQO7KtI
   re1dUXd1PzzC815jTQXuTaTmdmzKWBBb8529YTaSY7dEKBcEOLIKtQZ2L
   3PrHU+oGsrE5BJATLc6Pj537+s4cCeChceRcioty/BJcaKGTmHgWD1UPF
   dIOuOUJN0a/ssv1BA2Rf3VZ4cFlHVhlZgUehDXTigQN8bua1Axh8vvz32
   NH8pDFYslAQX9GrT4jTo1AczNwxyoAwH5HlkCvJoUl9CF/He7F3THIMQ+
   UxeScB5qIx5SBxzysCthvwx+hxMfJUAd0yLnrFFIgvAvh/u+lN/dhqyxJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="356447407"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="356447407"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 21:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="913563369"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="913563369"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2023 21:35:22 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbvsN-0000sR-3B;
	Fri, 01 Sep 2023 04:35:19 +0000
Date: Fri, 1 Sep 2023 12:34:41 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3830/24603]
 drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc
 cvac,%rax'
Message-ID: <202309011250.ub5MW0VA-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-004-20230831 (https://download.01.org/0day-ci/archive/20230901/202309011250.ub5MW0VA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309011250.ub5MW0VA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309011250.ub5MW0VA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
>> drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc cvac,%rax'
>> drivers/soc/fsl/dpio/qbman-portal.c:1495: Error: no such instruction: `dc cvac,%r8'
>> drivers/soc/fsl/dpio/qbman-portal.c:717: Error: no such instruction: `dc cvac,%rdx'
   drivers/soc/fsl/dpio/qbman-portal.c:874: Error: no such instruction: `dc cvac,%rdx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rdi'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rax'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rax'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rcx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rcx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rax'
>> drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%rsi'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%rdx'


vim +1140 drivers/soc/fsl/dpio/qbman-portal.c

  1107	
  1108	/**
  1109	 * qbman_swp_pull_direct() - Issue the pull dequeue command
  1110	 * @s: the software portal object
  1111	 * @d: the software portal descriptor which has been configured with
  1112	 *     the set of qbman_pull_desc_set_*() calls
  1113	 *
  1114	 * Return 0 for success, and -EBUSY if the software portal is not ready
  1115	 * to do pull dequeue.
  1116	 */
  1117	static
  1118	int qbman_swp_pull_direct(struct qbman_swp *s, struct qbman_pull_desc *d)
  1119	{
  1120		struct qbman_pull_desc *p;
  1121	
  1122		if (!atomic_dec_and_test(&s->vdq.available)) {
  1123			atomic_inc(&s->vdq.available);
  1124			return -EBUSY;
  1125		}
  1126		s->vdq.storage = (void *)(uintptr_t)d->rsp_addr_virt;
  1127		if ((s->desc->qman_version & QMAN_REV_MASK) < QMAN_REV_5000)
  1128			p = qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR);
  1129		else
  1130			p = qbman_get_cmd(s, QBMAN_CENA_SWP_VDQCR_MEM);
  1131		p->numf = d->numf;
  1132		p->tok = QMAN_DQ_TOKEN_VALID;
  1133		p->dq_src = d->dq_src;
  1134		p->rsp_addr = d->rsp_addr;
  1135		p->rsp_addr_virt = d->rsp_addr_virt;
  1136		dma_wmb();
  1137		/* Set the verb byte, have to substitute in the valid-bit */
  1138		p->verb = d->verb | s->vdq.valid_bit;
  1139		s->vdq.valid_bit ^= QB_VALID_BIT;
> 1140		dccvac(p);
  1141	
  1142		return 0;
  1143	}
  1144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
