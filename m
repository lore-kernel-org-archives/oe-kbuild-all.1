Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5867F1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Sep 2023 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694076124; x=1725612124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RSUJ+2VU7IcMcwoPYDLlsKqxB1mrKDljnBy0a7V4GyI=;
  b=CrkBOZszQoNzLWghoIKxThigS4176QnGfWt7nE26ieCNTOifLCrzc11c
   kbhRyFoygLavBxPTODOPrC2Jq5X6KCC9v0hMSdseHspwtvjc7P2sPXum+
   KsyDO6q0afZZLPPY0238mVSvgVyu2BM/wft4zk6AWfEpjaDwJFRYbJosP
   gHRcxLtrv0cSwyFcI0HVbHilNrK1sVMW1qYv4hhv7jWGhhVNe1HFG63u4
   kap00IBziWfv1BVYX4Rxc+Xkao4hXc1Qs5cFaZAvf1oNm1YEb4es8OXgZ
   9I9gGNN66UYBrePPaWd6E/x4lMC1ntsppP3hQDcQl0KGFk3Mlsx20X071
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374688533"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="374688533"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072795081"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="1072795081"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Sep 2023 01:41:57 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeAaI-00013D-1d;
	Thu, 07 Sep 2023 08:41:54 +0000
Date: Thu, 7 Sep 2023 16:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3830/24606]
 drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc
 cvac,%ecx'
Message-ID: <202309071645.CfT0M7gt-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230907/202309071645.CfT0M7gt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071645.CfT0M7gt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071645.CfT0M7gt-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/soc/fsl/dpio/qbman-portal.c:724:1: warning: unsupported size for integer register
     724 | }
         | ^
   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
>> drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc cvac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:1495: Error: no such instruction: `dc cvac,%edi'
   drivers/soc/fsl/dpio/qbman-portal.c:717: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:874: Error: no such instruction: `dc cvac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%esi'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%ebx'
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'


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
