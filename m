Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6C01ED51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690281220; x=1721817220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZEPSwQu940UNHDbngEHnM7Am5JyrRVpayKrmBmTFnm8=;
  b=bo6xIwIUyh6dn7yicZ0rl/6EyI6lJmoTwqUfYjmW1Fdxw+f24sQyIKg4
   xvrO2zw6UF3os00b6ZMLD05FS8oTA5GD7a0cziY9WxVOzZ6EhnM24/hsb
   9SPZC7udqVB7AdGcesqwgI9opYp8VhD1gaMTwIoAxnIgRdu3B+jTrV1oy
   xAHArNVRLk+SWeR9cnAff0TobuFer4OW58XGUtl4W4wH7CxSHfnirqkF5
   INe4DxGvUhgZlO39Oxf7EQlqWxzWCnRbxcLAPRpNzJN1wR9LvMJiC6eWd
   5jMoLnEVta9YeSbA6YRMK41gRPm0rkrhY0SttOKjutO4w836GfWYQxPLf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352581853"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="352581853"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791328008"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791328008"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 03:33:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOFMD-000AXa-1a;
	Tue, 25 Jul 2023 10:33:33 +0000
Date: Tue, 25 Jul 2023 18:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Rix <trix@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: arch/powerpc/platforms/cell/spu_base.c:229: warning: expecting
 prototype for Given an array of @nr_slbs SLB entries, @slbs, return non().
 Prototype was for __slb_present() instead
Message-ID: <202307251857.yclzmxrO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b5547c51827e053cc754db47d3ec3e6c2c451d2
commit: da5311a4b852eaf2c0feac8b28884a8d8a801dfc powerpc/spufs: remove unneeded if-checks
date:   2 months ago
config: powerpc-cell_defconfig (https://download.01.org/0day-ci/archive/20230725/202307251857.yclzmxrO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251857.yclzmxrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251857.yclzmxrO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/cell/spu_base.c:229: warning: Function parameter or member 'slbs' not described in '__slb_present'
   arch/powerpc/platforms/cell/spu_base.c:229: warning: Function parameter or member 'nr_slbs' not described in '__slb_present'
   arch/powerpc/platforms/cell/spu_base.c:229: warning: Function parameter or member 'new_addr' not described in '__slb_present'
>> arch/powerpc/platforms/cell/spu_base.c:229: warning: expecting prototype for Given an array of @nr_slbs SLB entries, @slbs, return non(). Prototype was for __slb_present() instead
>> arch/powerpc/platforms/cell/spu_base.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Setup the SPU kernel SLBs, in preparation for a context save/restore. We


vim +229 arch/powerpc/platforms/cell/spu_base.c

58bd403c3c79dd Jeremy Kerr      2007-12-05  222  
684bd614015188 Jeremy Kerr      2007-12-05  223  /**
684bd614015188 Jeremy Kerr      2007-12-05  224   * Given an array of @nr_slbs SLB entries, @slbs, return non-zero if the
684bd614015188 Jeremy Kerr      2007-12-05  225   * address @new_addr is present.
684bd614015188 Jeremy Kerr      2007-12-05  226   */
73d16a6e0e5199 Ian Munsie       2014-10-08  227  static inline int __slb_present(struct copro_slb *slbs, int nr_slbs,
684bd614015188 Jeremy Kerr      2007-12-05  228  		void *new_addr)
684bd614015188 Jeremy Kerr      2007-12-05 @229  {
684bd614015188 Jeremy Kerr      2007-12-05  230  	unsigned long ea = (unsigned long)new_addr;
684bd614015188 Jeremy Kerr      2007-12-05  231  	int i;
684bd614015188 Jeremy Kerr      2007-12-05  232  
684bd614015188 Jeremy Kerr      2007-12-05  233  	for (i = 0; i < nr_slbs; i++)
684bd614015188 Jeremy Kerr      2007-12-05  234  		if (!((slbs[i].esid ^ ea) & ESID_MASK))
684bd614015188 Jeremy Kerr      2007-12-05  235  			return 1;
684bd614015188 Jeremy Kerr      2007-12-05  236  
684bd614015188 Jeremy Kerr      2007-12-05  237  	return 0;
684bd614015188 Jeremy Kerr      2007-12-05  238  }
684bd614015188 Jeremy Kerr      2007-12-05  239  
58bd403c3c79dd Jeremy Kerr      2007-12-05  240  /**
58bd403c3c79dd Jeremy Kerr      2007-12-05 @241   * Setup the SPU kernel SLBs, in preparation for a context save/restore. We
58bd403c3c79dd Jeremy Kerr      2007-12-05  242   * need to map both the context save area, and the save/restore code.
684bd614015188 Jeremy Kerr      2007-12-05  243   *
027dfac694fc27 Michael Ellerman 2016-06-01  244   * Because the lscsa and code may cross segment boundaries, we check to see
684bd614015188 Jeremy Kerr      2007-12-05  245   * if mappings are required for the start and end of each range. We currently
684bd614015188 Jeremy Kerr      2007-12-05  246   * assume that the mappings are smaller that one segment - if not, something
684bd614015188 Jeremy Kerr      2007-12-05  247   * is seriously wrong.
58bd403c3c79dd Jeremy Kerr      2007-12-05  248   */
684bd614015188 Jeremy Kerr      2007-12-05  249  void spu_setup_kernel_slbs(struct spu *spu, struct spu_lscsa *lscsa,
684bd614015188 Jeremy Kerr      2007-12-05  250  		void *code, int code_size)
58bd403c3c79dd Jeremy Kerr      2007-12-05  251  {
73d16a6e0e5199 Ian Munsie       2014-10-08  252  	struct copro_slb slbs[4];
684bd614015188 Jeremy Kerr      2007-12-05  253  	int i, nr_slbs = 0;
684bd614015188 Jeremy Kerr      2007-12-05  254  	/* start and end addresses of both mappings */
684bd614015188 Jeremy Kerr      2007-12-05  255  	void *addrs[] = {
684bd614015188 Jeremy Kerr      2007-12-05  256  		lscsa, (void *)lscsa + sizeof(*lscsa) - 1,
684bd614015188 Jeremy Kerr      2007-12-05  257  		code, code + code_size - 1
684bd614015188 Jeremy Kerr      2007-12-05  258  	};
684bd614015188 Jeremy Kerr      2007-12-05  259  
684bd614015188 Jeremy Kerr      2007-12-05  260  	/* check the set of addresses, and create a new entry in the slbs array
684bd614015188 Jeremy Kerr      2007-12-05  261  	 * if there isn't already a SLB for that address */
684bd614015188 Jeremy Kerr      2007-12-05  262  	for (i = 0; i < ARRAY_SIZE(addrs); i++) {
684bd614015188 Jeremy Kerr      2007-12-05  263  		if (__slb_present(slbs, nr_slbs, addrs[i]))
684bd614015188 Jeremy Kerr      2007-12-05  264  			continue;
58bd403c3c79dd Jeremy Kerr      2007-12-05  265  
684bd614015188 Jeremy Kerr      2007-12-05  266  		__spu_kernel_slb(addrs[i], &slbs[nr_slbs]);
684bd614015188 Jeremy Kerr      2007-12-05  267  		nr_slbs++;
684bd614015188 Jeremy Kerr      2007-12-05  268  	}
58bd403c3c79dd Jeremy Kerr      2007-12-05  269  
c92a1acb675058 Arnd Bergmann    2008-02-28  270  	spin_lock_irq(&spu->register_lock);
684bd614015188 Jeremy Kerr      2007-12-05  271  	/* Add the set of SLBs */
684bd614015188 Jeremy Kerr      2007-12-05  272  	for (i = 0; i < nr_slbs; i++)
684bd614015188 Jeremy Kerr      2007-12-05  273  		spu_load_slb(spu, i, &slbs[i]);
c92a1acb675058 Arnd Bergmann    2008-02-28  274  	spin_unlock_irq(&spu->register_lock);
58bd403c3c79dd Jeremy Kerr      2007-12-05  275  }
58bd403c3c79dd Jeremy Kerr      2007-12-05  276  EXPORT_SYMBOL_GPL(spu_setup_kernel_slbs);
58bd403c3c79dd Jeremy Kerr      2007-12-05  277  

:::::: The code at line 229 was first introduced by commit
:::::: 684bd614015188561197342fd336292e9e2ce196 [POWERPC] cell: handle SPE kernel mappings that cross segment boundaries

:::::: TO: Jeremy Kerr <jk@ozlabs.org>
:::::: CC: Arnd Bergmann <arnd@arndb.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
