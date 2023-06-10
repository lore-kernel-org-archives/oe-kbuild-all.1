Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFCB33D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 16:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686415253; x=1717951253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lyFPlqd2MNBk9iE3K8B3ZfZZrjEUSny0Ie1rU5UTEVQ=;
  b=VbTSfbK3Vzf7Y25HtAYyB+M9PahY2Kx2gQw/sH4aQi9WaLuCpX9TCSv8
   VyxQ+nmUZZHATQbzefwPJSFuODZep4GxQBPoazEY069PtOMGs/+ZMvQOq
   zqC73/g/vhDk2vdG37XskWVlLH2uFnuuJAD5iWLoUVPfW4hWpLXF2pTpJ
   gLbFEhELOlHDAQ18n4vW8BOOC95gr9smbzncVc9ldSthHDNOA72SRwu89
   d4c0MAuuHmmMv0mhMjFSOHmrPbj8J3jhzVZleOS9a/t0/WZ0Wzp4ti9sk
   WwqvPJ/UaF5tSLJCL29MHkA2peisudMNuofhdOeouJg3A2wkX0Wc2Yqrv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="360265160"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="360265160"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 09:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="704877344"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="704877344"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Jun 2023 09:40:52 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q81dz-000AGW-14;
	Sat, 10 Jun 2023 16:40:51 +0000
Date: Sun, 11 Jun 2023 00:40:29 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS
 without recursion
Message-ID: <202306110008.dL9Nj6Li-lkp@intel.com>
References: <20230610091320.1054554-9-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230610091320.1054554-9-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on next-20230609]
[cannot apply to masahiroy-kbuild/fixes arnd-asm-generic/master rafael-pm/linux-next linus/master v6.4-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/Revert-PATCH-uml-export-symbols-added-by-GCC-hardened/20230610-171620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy%40kernel.org
patch subject: [PATCH v8 08/11] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20230611/202306110008.dL9Nj6Li-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add masahiroy-kbuild https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
        git fetch masahiroy-kbuild for-next
        git checkout masahiroy-kbuild/for-next
        b4 shazam https://lore.kernel.org/r/20230610091320.1054554-9-masahiroy@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash M=arch/riscv

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110008.dL9Nj6Li-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** No rule to make target 'arch/riscv/kvm/kvm.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
   make[2]: *** No rule to make target 'crypto/seqiv.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/echainiv.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'crypto/hmac.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'crypto/sha256_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/sha512_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/sha3_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/blake2b_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/cbc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/ctr.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/gcm.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'crypto/aes_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/authenc.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/authencesn.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/xxhash_generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/drbg.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/jitterentropy_rng.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/ghash-generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'crypto/xor.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/clk/starfive/clk-starfive-jh7100-audio.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/clk/starfive/clk-starfive-jh7110-aon.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/clk/sunxi-ng/sun8i-de2-ccu.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
   make[2]: *** No rule to make target 'drivers/dma/virt-dma.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/dma/sun6i-dma.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/i2c/algos/i2c-algo-bit.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/i2c/busses/i2c-mv64xxx.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/i2c/i2c-core.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/input/keyboard/sun4i-lradc-keys.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
   make[2]: *** No rule to make target 'drivers/net/mdio/mdio-mux.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/pcs/pcs_xpcs.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/stmmac.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/stmmac-platform.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/net/ethernet/stmicro/stmmac/dwmac-generic.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/ipvlan/ipvlan.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/dummy.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/macvlan.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/mii.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/veth.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/net/vxlan/vxlan.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/phy/allwinner/phy-sun4i-usb.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'drivers/phy/allwinner/phy-sun6i-mipi-dphy.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'drivers/video/backlight/backlight.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/cfbfillrect.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/cfbcopyarea.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/cfbimgblt.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/sysfillrect.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/syscopyarea.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/sysimgblt.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'drivers/video/fbdev/core/fb_sys_fops.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'lib/crypto/libaes.ko', needed by '__modfinal'.
   make[2]: *** No rule to make target 'lib/crypto/gf128mul.ko', needed by '__modfinal'.
>> make[2]: *** No rule to make target 'lib/crypto/libsha256.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
--
>> make[2]: *** No rule to make target 'lib/lzo/lzo_compress.ko', needed by '__modfinal'.
   make[2]: Target '__modfinal' not remade because of errors.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
