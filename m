Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD711721
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693493099; x=1725029099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EXsPB+Ws8ZkkmFZw1l3fiDDRyNf50faIEgKK9Y+TPFc=;
  b=EApgTtlEH8Ou2PLHGjy8dNstWuPnbNputeMC/r5JyqZ19ZPQmjcuNgle
   ZtNvB3brUJ/gLzPY8OXa7NfXntlLoi2mnsOVW8RT4QhutWjTFYFzXnFEz
   1ADO+cFe8VLMCoD5T4ti/99Lmy9XZj8XQlrIm1nwCymF/LSTYzsQegc1T
   /eqeNvcYubAqmavKPTkjl84Ur/w4wxd19uiR6gnXvSkqBrJfvkbxZK2PA
   WVGebpqn9NyN0bqIyAn3w0QfnIn1EhqZpzDAZQ5g6rVUerJrqzYFpEoru
   rYPopVeM4MUQA230LOYoMiKv7dVSccvwTvrz6qrHLNtBkKzQ4FyeuS4Na
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442357769"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="442357769"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 07:44:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070339312"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="1070339312"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 Aug 2023 07:44:53 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbiuh-0000Ff-09;
	Thu, 31 Aug 2023 14:44:51 +0000
Date: Thu, 31 Aug 2023 22:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3830/24603]
 drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc
 ivac,%ecx'
Message-ID: <202308312231.gfKkmRwC-lkp@intel.com>
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
config: i386-buildonly-randconfig-006-20230831 (https://download.01.org/0day-ci/archive/20230831/202308312231.gfKkmRwC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308312231.gfKkmRwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308312231.gfKkmRwC-lkp@intel.com/

Note: the freescale-fslc/pr/639 HEAD 857fbf7cebaba3b1ffccc558deee1d13ac0e11d7 builds fine.
      It only hurts bisectability.

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
>> drivers/soc/fsl/dpio/qbman-portal.c:176: Error: no such instruction: `dc ivac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:1140: Error: no such instruction: `dc cvac,%ebx'
>> drivers/soc/fsl/dpio/qbman-portal.c:1495: Error: no such instruction: `dc cvac,%esi'
>> drivers/soc/fsl/dpio/qbman-portal.c:717: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:874: Error: no such instruction: `dc cvac,%eax'
>> drivers/soc/fsl/dpio/qbman-portal.c:470: Error: no such instruction: `dc cvac,%edx'


vim +176 drivers/soc/fsl/dpio/qbman-portal.c

   130	
   131	static int qbman_swp_release_direct(struct qbman_swp *s,
   132					    const struct qbman_release_desc *d,
   133					    const u64 *buffers,
   134					    unsigned int num_buffers);
   135	static int qbman_swp_release_mem_back(struct qbman_swp *s,
   136					      const struct qbman_release_desc *d,
   137					      const u64 *buffers,
   138					      unsigned int num_buffers);
   139	
   140	/* Function pointers */
   141	int (*qbman_swp_enqueue_ptr)(struct qbman_swp *s,
   142				     const struct qbman_eq_desc *d,
   143				     const struct dpaa2_fd *fd)
   144		= qbman_swp_enqueue_direct;
   145	
   146	int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
   147					      const struct qbman_eq_desc *d,
   148					      const struct dpaa2_fd *fd,
   149					      uint32_t *flags,
   150						     int num_frames)
   151		= qbman_swp_enqueue_multiple_direct;
   152	
   153	int
   154	(*qbman_swp_enqueue_multiple_desc_ptr)(struct qbman_swp *s,
   155					       const struct qbman_eq_desc *d,
   156					       const struct dpaa2_fd *fd,
   157					       int num_frames)
   158		= qbman_swp_enqueue_multiple_desc_direct;
   159	
   160	int (*qbman_swp_pull_ptr)(struct qbman_swp *s, struct qbman_pull_desc *d)
   161				= qbman_swp_pull_direct;
   162	
   163	const struct dpaa2_dq *(*qbman_swp_dqrr_next_ptr)(struct qbman_swp *s)
   164				= qbman_swp_dqrr_next_direct;
   165	
   166	int (*qbman_swp_release_ptr)(struct qbman_swp *s,
   167				     const struct qbman_release_desc *d,
   168				     const u64 *buffers,
   169				     unsigned int num_buffers)
   170				= qbman_swp_release_direct;
   171	
   172	#define dccvac(p) { asm volatile("dc cvac, %0;" : : "r" (p) : "memory"); }
   173	#define dcivac(p) { asm volatile("dc ivac, %0" : : "r"(p) : "memory"); }
   174	static inline void qbman_inval_prefetch(struct qbman_swp *p, u32 offset)
   175	{
 > 176		dcivac(p->addr_cena + offset);
   177		prefetch(p->addr_cena + offset);
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
