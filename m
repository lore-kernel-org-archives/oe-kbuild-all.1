Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C5BE4E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683898490; x=1715434490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U5Eh7syXhPJlcWRD8CbCUfGSr/btRWO84YxVIi3949E=;
  b=jtwiR6J4xoBRbPtY154ZNgzauCueyri433/Q+QTUBFyT/883QqAEZNs6
   N12CdP2eA13yup4e0cAqQiXBbEw0H3st3cubHVnymLfJ8mi9SqI6YcX5o
   S7ik25dp+HzPbL4KK1EkHO0CZE0n14IkfZJzkutDYVAuGoUgnrBEGN9ER
   N5XuiwpKGG9sdzjyc5FfPDZSMKBaurmYwd3FCCxoG8XiaMpM2rUh9Jd4m
   hMNvsbLt1Lh5OZhXpnRTzmyhdplGWZKgboUx+pLoekRAdCdtkiEeRlTe5
   5jXOIfL3Fx9lxaMJLA9VZQxDyK7S8v6SSllvUcX2e/LQJS++PUg25cfDA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="378925047"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="378925047"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 06:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844417958"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="844417958"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 06:34:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxSv2-0004tM-0F;
	Fri, 12 May 2023 13:34:48 +0000
Date: Fri, 12 May 2023 21:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [avpatel:riscv_timer_imp_v1 3/35]
 drivers/crypto/hisilicon/qm.c:621:9: warning: ISO C90 forbids mixed
 declarations and code
Message-ID: <202305122158.88fFu8uv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   32160e9f14930198623931dcab8fca27eea7b641
commit: 1c5afb87ad4f39d46b632a0b5f32763d7ebac95f [3/35] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230512/202305122158.88fFu8uv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/avpatel/linux/commit/1c5afb87ad4f39d46b632a0b5f32763d7ebac95f
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_timer_imp_v1
        git checkout 1c5afb87ad4f39d46b632a0b5f32763d7ebac95f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/crypto/hisilicon/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305122158.88fFu8uv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/hisilicon/qm.c: In function 'qm_mb_write':
>> drivers/crypto/hisilicon/qm.c:621:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     621 |         unsigned long tmp0 = 0, tmp1 = 0;
         |         ^~~~~~~~


vim +621 drivers/crypto/hisilicon/qm.c

   608	
   609	/* 128 bit should be written to hardware at one time to trigger a mailbox */
   610	static void qm_mb_write(struct hisi_qm *qm, const void *src)
   611	{
   612		void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
   613	
   614		if (!IS_ENABLED(CONFIG_ARM64)) {
   615			memcpy_toio(fun_base, src, 16);
   616			dma_wmb();
   617			return;
   618		}
   619	
   620	#if IS_ENABLED(CONFIG_ARM64)
 > 621		unsigned long tmp0 = 0, tmp1 = 0;
   622	
   623		asm volatile("ldp %0, %1, %3\n"
   624			     "stp %0, %1, %2\n"
   625			     "dmb oshst\n"
   626			     : "=&r" (tmp0),
   627			       "=&r" (tmp1),
   628			       "+Q" (*((char __iomem *)fun_base))
   629			     : "Q" (*((char *)src))
   630			     : "memory");
   631	#endif
   632	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
