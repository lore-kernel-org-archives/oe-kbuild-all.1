Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7B7522A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 02:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714528926; cv=none; b=b0rDWeo3jInMNW+09fRkRc3/pXgE+5eo3GxyaPv6kV0S8BQHR0EL+GuVyoq+7JSOBz5Crocz8wTh3BotqrLB4A025hgo7xrwCoxI0yTN/ET82GtnlCAne+tsD51bBvMYmQokrVwjaAs6dschFkxSZyZD+zLNFjndd34/ussG3Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714528926; c=relaxed/simple;
	bh=/dBGKupXZ/khHcTYjccN0jbn/rFJQ/T61+tz4jf++Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+HVwygvlD9/glHgj3cWd7kl0NSTrvuMoGdjSK82tJNo2iVTNT7pl1iqgtuks43w/gHBuKKzxH17ri+EYz+j6GJdKoWsYk6DhF4Jt2jNH6UQqMt5vqguOjpMIjBUZMI5Kkdh2QIHRsA4DTBxYehhHJ6t7Utal5lvQrPJ91PzElI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DKLRSs+6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DKLRSs+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714528924; x=1746064924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dBGKupXZ/khHcTYjccN0jbn/rFJQ/T61+tz4jf++Ag=;
  b=DKLRSs+6Osd8xIFiZSJ1DfKle3iPZtx3kOySYCHLq3O5gSFaMjW6bshA
   SzOqwFejtkX33zutX4U/9FKrYi9K9o7hrEl9l4Zxy64Nj8OhjEI5M198O
   MeQfKfS5DEOQZeGdvDGAir3JMWEgw9k1LST43XlZXoDGHN6g/CX4ePD+i
   k0cNkVysyY+YZ4vEZrrX/SQXk5umGHQqijSLgKUqIBHPnyLEmO8/1F12q
   37r61zmPwll2SMu/ygiCnMufxX3EqECu0eF6DC6vTs1Cl3MVytU6TVwHO
   ufG7IbdxEud06FTHem5gTDZtf1sx5Z9ayiNo1DXVV1ET9YDbmI6spxoZf
   Q==;
X-CSE-ConnectionGUID: K8O+4tLCTgycAVZ02quKtA==
X-CSE-MsgGUID: rctESlWmQR+2ip4XBFH1tA==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10193350"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="10193350"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 19:02:03 -0700
X-CSE-ConnectionGUID: w04Bob9/TcSEN0Uwn0f/QA==
X-CSE-MsgGUID: A0UGCG33TSiIcshMxejsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="26742032"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Apr 2024 19:02:02 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1zIF-0008kl-1n;
	Wed, 01 May 2024 02:01:59 +0000
Date: Wed, 1 May 2024 10:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4741/11730]
 drivers/soc/fsl/dpio/qbman-portal.c:722:3: error: invalid instruction, did
 you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
Message-ID: <202405010940.UwY63uc0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   776652a165f5bbf30c68a5f6213d75b02e8df11c
commit: ecf345f453d79979725e6a41fd7f8283835d1fdf [4741/11730] soc: fsl: dpio: enable qbman CENA portal memory access
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240501/202405010940.UwY63uc0-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010940.UwY63uc0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010940.UwY63uc0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/soc/fsl/dpio/qbman-portal.c:8:
   In file included from arch/powerpc/include/asm/cacheflush.h:7:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/soc/fsl/dpio/qbman-portal.c:722:3: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     722 |                 dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
         |                 ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:34: note: expanded from macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc cvac, 3;
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:876:3: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     876 |                 dccvac((uint64_t *)(addr_cena +
         |                 ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:34: note: expanded from macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc cvac, 3;
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:1142:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
    1142 |         dccvac(p);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:34: note: expanded from macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc cvac, 27;
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 27
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 3
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 3
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:1497:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
    1497 |         dccvac(p);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:34: note: expanded from macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc cvac, 26;
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 3
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 3
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);
         |         ^
   drivers/soc/fsl/dpio/qbman-portal.c:175:34: note: expanded from macro 'dcivac'
     175 | #define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc ivac, 3
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:475:3: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     475 |                 dccvac(cmd);
         |                 ^
   drivers/soc/fsl/dpio/qbman-portal.c:174:34: note: expanded from macro 'dccvac'
     174 | #define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
         |                                  ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         dc cvac, 29;
         |         ^~
   drivers/soc/fsl/dpio/qbman-portal.c:178:2: error: invalid instruction, did you mean: addc, andc, bc, dcba, dcbf, dcbi, dcbt, dcbz, dci, ld, sc, td?
     178 |         dcivac(p->addr_cena + offset);


vim +722 drivers/soc/fsl/dpio/qbman-portal.c

   642	
   643	/**
   644	 * qbman_swp_enqueue_multiple_direct() - Issue a multi enqueue command
   645	 * using one enqueue descriptor
   646	 * @s:  the software portal used for enqueue
   647	 * @d:  the enqueue descriptor
   648	 * @fd: table pointer of frame descriptor table to be enqueued
   649	 * @flags: table pointer of QBMAN_ENQUEUE_FLAG_DCA flags, not used if NULL
   650	 * @num_frames: number of fd to be enqueued
   651	 *
   652	 * Return the number of fd enqueued, or a negative error number.
   653	 */
   654	static
   655	int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
   656					      const struct qbman_eq_desc *d,
   657					      const struct dpaa2_fd *fd,
   658					      uint32_t *flags,
   659					      int num_frames)
   660	{
   661		uint32_t *p = NULL;
   662		const uint32_t *cl = (uint32_t *)d;
   663		uint32_t eqcr_ci, eqcr_pi, half_mask, full_mask;
   664		int i, num_enqueued = 0;
   665		uint64_t addr_cena;
   666	
   667		spin_lock(&s->access_spinlock);
   668		half_mask = (s->eqcr.pi_ci_mask>>1);
   669		full_mask = s->eqcr.pi_ci_mask;
   670	
   671		if (!s->eqcr.available) {
   672			eqcr_ci = s->eqcr.ci;
   673			p = s->addr_cena + QBMAN_CENA_SWP_EQCR_CI;
   674			s->eqcr.ci = qbman_read_register(s, QBMAN_CINH_SWP_EQCR_CI);
   675			s->eqcr.ci &= full_mask;
   676	
   677			s->eqcr.available = qm_cyc_diff(s->eqcr.pi_ring_size,
   678						eqcr_ci, s->eqcr.ci);
   679			if (!s->eqcr.available) {
   680				spin_unlock(&s->access_spinlock);
   681				return 0;
   682			}
   683		}
   684	
   685		eqcr_pi = s->eqcr.pi;
   686		num_enqueued = (s->eqcr.available < num_frames) ?
   687				s->eqcr.available : num_frames;
   688		s->eqcr.available -= num_enqueued;
   689		/* Fill in the EQCR ring */
   690		for (i = 0; i < num_enqueued; i++) {
   691			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   692			/* Skip copying the verb */
   693			memcpy(&p[1], &cl[1], EQ_DESC_SIZE_WITHOUT_FD - 1);
   694			memcpy(&p[EQ_DESC_SIZE_FD_START/sizeof(uint32_t)],
   695			       &fd[i], sizeof(*fd));
   696			eqcr_pi++;
   697		}
   698	
   699		dma_wmb();
   700	
   701		/* Set the verb byte, have to substitute in the valid-bit */
   702		eqcr_pi = s->eqcr.pi;
   703		for (i = 0; i < num_enqueued; i++) {
   704			p = (s->addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask));
   705			p[0] = cl[0] | s->eqcr.pi_vb;
   706			if (flags && (flags[i] & QBMAN_ENQUEUE_FLAG_DCA)) {
   707				struct qbman_eq_desc *eq_desc = (struct qbman_eq_desc *)p;
   708	
   709				eq_desc->dca = (1 << QB_ENQUEUE_CMD_DCA_EN_SHIFT) |
   710					((flags[i]) & QBMAN_EQCR_DCA_IDXMASK);
   711			}
   712			eqcr_pi++;
   713			if (!(eqcr_pi & half_mask))
   714				s->eqcr.pi_vb ^= QB_VALID_BIT;
   715		}
   716	
   717		/* Flush all the cacheline without load/store in between */
   718		eqcr_pi = s->eqcr.pi;
   719		for (i = 0; i < num_enqueued; i++)
   720		addr_cena = (size_t)s->addr_cena;
   721		for (i = 0; i < num_enqueued; i++) {
 > 722			dccvac((addr_cena + QBMAN_CENA_SWP_EQCR(eqcr_pi & half_mask)));
   723			eqcr_pi++;
   724		}
   725		s->eqcr.pi = eqcr_pi & full_mask;
   726		spin_unlock(&s->access_spinlock);
   727	
   728		return num_enqueued;
   729	}
   730	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
