Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73432746B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 10:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693476526; x=1725012526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gLZ3W3tMVmiRSHTzdnamsIKrI4O+hdAfaI/5YXGMS0=;
  b=AI7E+tA+nt86h6pkoJ8gc6iN8ACkCU3wmSKa1RxsbVoKP42H+U30vfCd
   BEpz6KX9H7+LCESoLkYyHhjEw+d92CSF6kFejwMR/qqHtCPHqOUBArWnD
   hNYdD7LgwlsuwOUvUBztwmMm0kKGRKegcw4QIM00seDNY7VFYYkP9FCEy
   OXsppEyn2s37f0yrp6fJ7mxMaEKY8BcBg7x99uUKVvCPLPxYC2n2M3xwB
   8YyUBAoy15lBEGUR0LIh6u+4EVMKt/bnOGcXpbNzYgZ8whx8aHfuU1Eo5
   v5/bGbVCwiPK6cW8DPIAP4Z4wmeueAsYihBZqz9IBxkmOJXcAWWUR4tuA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="442252346"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="442252346"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 03:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="716284009"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; 
   d="scan'208";a="716284009"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Aug 2023 03:08:44 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbebS-00001D-0l;
	Thu, 31 Aug 2023 10:08:42 +0000
Date: Thu, 31 Aug 2023 18:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 3830/24604]
 drivers/soc/fsl/dpio/qbman-portal.c:872:21: warning: cast from pointer to
 integer of different size
Message-ID: <202308311713.UqVjzGqm-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   7c13adcd3af7dcd541144655102e1cdb941ad538
commit: a60cf5cbad0f9b4a94b0f7b9d5af8f258593b610 [3830/24604] soc: fsl: dpio: enable qbman CENA portal memory access
config: powerpc-randconfig-r006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311713.UqVjzGqm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308311713.UqVjzGqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308311713.UqVjzGqm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: In function 'qbman_swp_enqueue_multiple_desc_direct':
>> drivers/soc/fsl/dpio/qbman-portal.c:872:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     872 |         addr_cena = (uint64_t)s->addr_cena;
         |                     ^
>> drivers/soc/fsl/dpio/qbman-portal.c:874:24: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     874 |                 dccvac((uint64_t *)(addr_cena +
         |                        ^
   drivers/soc/fsl/dpio/qbman-portal.c:172:58: note: in definition of macro 'dccvac'
     172 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                                          ^
   {standard input}: Assembler messages:
>> {standard input}:84: Error: unrecognized opcode: `dc'
   {standard input}:468: Error: unrecognized opcode: `dc'
   {standard input}:765: Error: unrecognized opcode: `dc'
   {standard input}:1112: Error: unrecognized opcode: `dc'
   {standard input}:1334: Error: unrecognized opcode: `dc'
   {standard input}:1391: Error: unrecognized opcode: `dc'
   {standard input}:1463: Error: unrecognized opcode: `dc'
   {standard input}:1558: Error: unrecognized opcode: `dc'
   {standard input}:1617: Error: unrecognized opcode: `dc'
   {standard input}:1689: Error: unrecognized opcode: `dc'
   {standard input}:2684: Error: unrecognized opcode: `dc'
   {standard input}:2753: Error: unrecognized opcode: `dc'
   {standard input}:3630: Error: unrecognized opcode: `dc'
   {standard input}:3894: Error: unrecognized opcode: `dc'
   {standard input}:4109: Error: unrecognized opcode: `dc'
   {standard input}:4320: Error: unrecognized opcode: `dc'
   {standard input}:4548: Error: unrecognized opcode: `dc'


vim +872 drivers/soc/fsl/dpio/qbman-portal.c

   807	
   808	/**
   809	 * qbman_swp_enqueue_multiple_desc_direct() - Issue a multi enqueue command
   810	 * using multiple enqueue descriptor
   811	 * @s:  the software portal used for enqueue
   812	 * @d:  table of minimal enqueue descriptor
   813	 * @fd: table pointer of frame descriptor table to be enqueued
   814	 * @num_frames: number of fd to be enqueued
   815	 *
   816	 * Return the number of fd enqueued, or a negative error number.
   817	 */
   818	static
   819	int qbman_swp_enqueue_multiple_desc_direct(struct qbman_swp *s,
   820						   const struct qbman_eq_desc *d,
   821						   const struct dpaa2_fd *fd,
   822						   int num_frames)
   823	{
   824		uint32_t *p;
   825		const uint32_t *cl;
   826		uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
   827		int i, num_enqueued = 0;
   828		uint64_t addr_cena;
   829	
   830		half_mask = (s->eqcr.pi_ci_mask>>1);
   831		full_mask = s->eqcr.pi_ci_mask;
   832		if (!s->eqcr.available) {
   833			eqcr_ci = s->eqcr.ci;
   834			p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
   835			s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
   836			s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
   837						eqcr_ci, s->eqcr.ci);
   838			if (!s->eqcr.available)
   839				return 0;
   840		}
   841	
   842		eqcr_pi = s->eqcr.pi;
   843		num_enqueued = (s->eqcr.available < num_frames) ?
   844				s->eqcr.available : num_frames;
   845		s->eqcr.available -= num_enqueued;
   846		/* Fill in the EQCR ring */
   847		for (i = 0; i < num_enqueued; i++) {
   848			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   849			cl = (uint32_t *)(&d[i]);
   850			/* Skip copying the verb */
   851			memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
   852			memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
   853			       &fd[i], sizeof(*fd));
   854			eqcr_pi++;
   855		}
   856	
   857		dma_wmb();
   858	
   859		/* Set the verb byte, have to substitute in the valid-bit */
   860		eqcr_pi = s->eqcr.pi;
   861		for (i = 0; i < num_enqueued; i++) {
   862			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   863			cl = (uint32_t *)(&d[i]);
   864			p[0] = cl[0] | s->eqcr.pi_vb;
   865			eqcr_pi++;
   866			if (!(eqcr_pi & half_mask))
   867				s->eqcr.pi_vb ^= QB_VALID_BIT;
   868		}
   869	
   870		/* Flush all the cacheline without load/store in between */
   871		eqcr_pi = s->eqcr.pi;
 > 872		addr_cena = (uint64_t)s->addr_cena;
   873		for (i = 0; i < num_enqueued; i++) {
 > 874			dccvac((uint64_t *)(addr_cena +
   875				QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
   876			eqcr_pi++;
   877		}
   878		s->eqcr.pi = eqcr_pi & full_mask;
   879	
   880		return num_enqueued;
   881	}
   882	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
