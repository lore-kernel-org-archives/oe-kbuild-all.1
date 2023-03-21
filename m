Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B91078E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 23:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679440874; x=1710976874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a4qOyNtTyweB+56XIbpoPVJ1xFY8AZ6xLtwD3BEz5Og=;
  b=ZRjBD/4F9jTik3+6YXW3F+CaVnO5ctQvEcn1XCxJMwfyL2m7R159ivfI
   ylVpdXsA4iupHWozpthdPKsO5sW0s8IxahrbWw8GLIifDRyshe/Ou7og2
   nU9SP1ARTxccz0W0YArmUPTtWVfrXYz8wkbFPdgAkyEsyry0ni6eVYeYL
   Zm7huhSBeDewGCksDKG5OjnyS4s3FfCJfKKgOvi1w5+CH2A/hkoeiivbr
   hVQrZaojB+IiCHkD0cArcHt9UPVAwKtkvHPeYvEtn4VeiYY5TyZ/1ZQKf
   TXrvz5D3tqZBUwhW/Glu8/fh2erfhbaguPoWd5xIT33rDe5xiZ5wy5m2C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="327460200"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="327460200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 16:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792307078"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="792307078"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 16:21:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pelHn-000CX8-2b;
	Tue, 21 Mar 2023 23:20:59 +0000
Date: Wed, 22 Mar 2023 07:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/fixmap/cleanup 1/2] arch/arm64/mm/fixmap.c:199:24:
 warning: variable 'bm_pudp' set but not used
Message-ID: <202303220723.YWDuOSbu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/fixmap/cleanup
head:   fcd13b4affdf2ed9d27efcf97edb97ad3a708bfc
commit: c8b639d4c72d33cd15c5a9d97fbc9eee29edb874 [1/2] arm64: mm: move fixmap code to its own file
config: arm64-randconfig-c023-20230319 (https://download.01.org/0day-ci/archive/20230322/202303220723.YWDuOSbu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=c8b639d4c72d33cd15c5a9d97fbc9eee29edb874
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark arm64/fixmap/cleanup
        git checkout c8b639d4c72d33cd15c5a9d97fbc9eee29edb874
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220723.YWDuOSbu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/fixmap.c: In function 'fixmap_copy':
>> arch/arm64/mm/fixmap.c:199:24: warning: variable 'bm_pudp' set but not used [-Wunused-but-set-variable]
     199 |                 pud_t *bm_pudp;
         |                        ^~~~~~~


vim +/bm_pudp +199 arch/arm64/mm/fixmap.c

   182	
   183	/*
   184	 * Copy the fixmap region into a new pgdir.
   185	 */
   186	void __init fixmap_copy(pgd_t *pgdir)
   187	{
   188		if (!READ_ONCE(pgd_val(*pgd_offset_pgd(pgdir, FIXADDR_START)))) {
   189			/*
   190			 * The fixmap falls in a separate pgd to the kernel, and doesn't
   191			 * live in the carveout for the swapper_pg_dir. We can simply
   192			 * re-use the existing dir for the fixmap.
   193			 */
   194			set_pgd(pgd_offset_pgd(pgdir, FIXADDR_START),
   195				READ_ONCE(*pgd_offset_k(FIXADDR_START)));
   196		} else if (CONFIG_PGTABLE_LEVELS > 3) {
   197			pgd_t *bm_pgdp;
   198			p4d_t *bm_p4dp;
 > 199			pud_t *bm_pudp;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
