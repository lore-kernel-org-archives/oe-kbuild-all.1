Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838E4A46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 05:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679204585; x=1710740585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bVMNwOIail6gL6U3z5BTgEu8Q/sW+JmX652l2neSVAM=;
  b=hR6OG37KiTUVI5E+bjEtkV9W45UySAZeBRQeklUshMPEo/6V7kP6fD1x
   PFTg9qCnw6fdYFhpJ3IUPJppXd12WbyMZ+HXA+8Til0oV3A77uzNnhNXM
   BuLSbkjgJG/im5mIsvy5RllHZQ92gcPr9wp974xPIXNMxwNQozfQIcKBc
   4O8LmXGob6nbsRSkBFMToguYvNdxsix+zk0O4hGhc+WPwTWGCgheANpw4
   4Qy4JoOb+5HyMz+UKHRh7VhGo+1TlZ0Bbk05mCMIkK1spZ9XqAfDvl4lx
   1dGkri+D5B1q65gJEEGn2CQhdoGkXlRvBBwqKPDST42D4wiqSvZqfCjvi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="337194684"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="337194684"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 22:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="769820730"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="769820730"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Mar 2023 22:43:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdlor-000APs-1z;
	Sun, 19 Mar 2023 05:43:01 +0000
Date: Sun, 19 Mar 2023 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Matthias Brugger <mbrugger@suse.com>
Subject: arch/arm64/kernel/hibernate.c:202:44: sparse: sparse: cast from
 restricted gfp_t
Message-ID: <202303191326.S4gjDdQY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a3671bd86a9770e34969522d29bb30a1b66fd88a
commit: 50f53fb721817a6efa541cca24f1b7caa84801c1 arm64: trans_pgd: make trans_pgd_map_page generic
date:   2 years, 2 months ago
config: arm64-randconfig-s042-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191326.S4gjDdQY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=50f53fb721817a6efa541cca24f1b7caa84801c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 50f53fb721817a6efa541cca24f1b7caa84801c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191326.S4gjDdQY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/hibernate.c:181:39: sparse: sparse: cast to restricted gfp_t
>> arch/arm64/kernel/hibernate.c:202:44: sparse: sparse: cast from restricted gfp_t

vim +202 arch/arm64/kernel/hibernate.c

   183	
   184	/*
   185	 * Copies length bytes, starting at src_start into an new page,
   186	 * perform cache maintenance, then maps it at the specified address low
   187	 * address as executable.
   188	 *
   189	 * This is used by hibernate to copy the code it needs to execute when
   190	 * overwriting the kernel text. This function generates a new set of page
   191	 * tables, which it loads into ttbr0.
   192	 *
   193	 * Length is provided as we probably only want 4K of data, even on a 64K
   194	 * page system.
   195	 */
   196	static int create_safe_exec_page(void *src_start, size_t length,
   197					 unsigned long dst_addr,
   198					 phys_addr_t *phys_dst_addr)
   199	{
   200		struct trans_pgd_info trans_info = {
   201			.trans_alloc_page	= hibernate_page_alloc,
 > 202			.trans_alloc_arg	= (void *)GFP_ATOMIC,
   203		};
   204	
   205		void *page = (void *)get_safe_page(GFP_ATOMIC);
   206		pgd_t *trans_pgd;
   207		int rc;
   208	
   209		if (!page)
   210			return -ENOMEM;
   211	
   212		memcpy(page, src_start, length);
   213		__flush_icache_range((unsigned long)page, (unsigned long)page + length);
   214	
   215		trans_pgd = (void *)get_safe_page(GFP_ATOMIC);
   216		if (!trans_pgd)
   217			return -ENOMEM;
   218	
   219		rc = trans_pgd_map_page(&trans_info, trans_pgd, page, dst_addr,
   220					PAGE_KERNEL_EXEC);
   221		if (rc)
   222			return rc;
   223	
   224		/*
   225		 * Load our new page tables. A strict BBM approach requires that we
   226		 * ensure that TLBs are free of any entries that may overlap with the
   227		 * global mappings we are about to install.
   228		 *
   229		 * For a real hibernate/resume cycle TTBR0 currently points to a zero
   230		 * page, but TLBs may contain stale ASID-tagged entries (e.g. for EFI
   231		 * runtime services), while for a userspace-driven test_resume cycle it
   232		 * points to userspace page tables (and we must point it at a zero page
   233		 * ourselves). Elsewhere we only (un)install the idmap with preemption
   234		 * disabled, so T0SZ should be as required regardless.
   235		 */
   236		cpu_set_reserved_ttbr0();
   237		local_flush_tlb_all();
   238		write_sysreg(phys_to_ttbr(virt_to_phys(trans_pgd)), ttbr0_el1);
   239		isb();
   240	
   241		*phys_dst_addr = virt_to_phys(page);
   242	
   243		return 0;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
