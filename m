Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA51643A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692306851; x=1723842851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mYPnHeW8q4L2WegHgapFhz6xdCRrwLB1my/sQPk17jg=;
  b=VnDXp2dIfi/aHMlxOIlqZFhY56KlkbDKZx59LMlGli/NDUjY9+khvr17
   JGwQpz8yG0X4xd9eX53v3ku+Tp+Z5+8GDTysjl23fDIE9gx36G/QnCNpS
   7/TT0LT4DOilTs4Mdvga33lZ/2jy0NEwdNeoXfGtErjnfLgKbuqOfdoGV
   ZzAuuAmnFkPNX+wdEUDP377idCQE86zxz4SLqU3Pb8XLSp0C50STjg65H
   56AJ+o6eHzu2+pzeKdFaP8bYDehjIxs0Fw38xHSCViRAYf3e/cu+N3NN3
   o5jt4AtNTDja9I6yLvziprbkrxDr71B1AjTilL0JI0/ec2NxcFi798Djr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="439311854"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="439311854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 14:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764270398"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="764270398"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 14:14:09 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWkJh-0001Tb-0s;
	Thu, 17 Aug 2023 21:14:06 +0000
Date: Fri, 18 Aug 2023 05:13:23 +0800
From: kernel test robot <lkp@intel.com>
To: Geoff Levand <geoff@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoff-ps3:ps3-queue-v6.5 5/13]
 arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or
 member 'address' not described in 'ps3_debug_setup_dabr'
Message-ID: <202308180547.AfW9ZFnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git ps3-queue-v6.5
head:   338cceda0711f69cc1626b9c63d8ac2b19dba319
commit: 42ee177ee8d89608ea2b17836f140f09b17fa3f2 [5/13] ps3-debugging: Setup DABR register
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230818/202308180547.AfW9ZFnO-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180547.AfW9ZFnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180547.AfW9ZFnO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/ps3/setup.c:194: warning: Function parameter or member 'address' not described in 'ps3_debug_setup_dabr'


vim +194 arch/powerpc/platforms/ps3/setup.c

   185	
   186	/**
   187	 * ps3_debug_setup_dabr - Setup the DABR for kernel use.
   188	 * @dabr_flags: DABR_DATA_WRITE, DABR_DATA_READ, DABR_TRANSLATION
   189	 * @dabrx: DABRX_BTI, DABRX_KERNEL, DABRX_USER
   190	 */
   191	
   192	int ps3_debug_setup_dabr(u64 address, unsigned int dabr_flags,
   193		unsigned int dabrx)
 > 194	{
   195		int result;
   196		u64 reg;
   197	
   198		BUG_ON(dabr_flags
   199			& ~(DABR_DATA_WRITE | DABR_DATA_READ | DABR_TRANSLATION));
   200	
   201		/* PS3 seems to need DABR_TRANSLATION set to work */
   202	
   203		reg = (address & -8L) | dabr_flags | DABR_TRANSLATION;
   204	
   205		printk("%s: address %016llxh, flags %xh = %016llxh\n", __func__,
   206			address, dabr_flags, reg);
   207	
   208		result = ps3_set_dabr(reg, dabrx);
   209	
   210		if (result)
   211			printk("%s: failed: %d %s\n", __func__, result,
   212				ps3_result(result));
   213	
   214		return result;
   215	}
   216	EXPORT_SYMBOL_GPL(ps3_debug_setup_dabr);
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
