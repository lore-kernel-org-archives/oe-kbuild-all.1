Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BDF35516
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8tvJQSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697845957; x=1729381957;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39AXw0/SUa8ohAIMbK/Efi1cVnwS4SyQ3fmji/em8fE=;
  b=k8tvJQSdBmimGjTnguhYaCyNA98hVO+yKt06ZYvbhuAeW4/TyFFcuiYA
   tmQoNri3Jh9Lc8+JU0m3rk6f+3rlVEsNmEWyck4SdF8JrmCQMW38Zcr1u
   IriaOXLt2HB3uP8SGeVJbpbn9ozPoAagU0/h4zTDWVXaX3VoAajhOk6N6
   5eDdJp2jCH7KhiY1Cz5DmW9UMgIOvCVG2alfRx1BG37GcfYf4oCV0rDsy
   n+zaFweIMy733pQDDUi3UHCV8psxZ+surbVjbuQi38EVlr0LsHNIuwacL
   IBuvrh9o7APVcW70H0jU7KOhZEWMr1mxFKQdUnzS+nmdlcEhISqIV02iJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="450822189"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="450822189"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 16:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="827876224"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="827876224"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Oct 2023 16:52:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtzI9-00047e-1b;
	Fri, 20 Oct 2023 23:52:33 +0000
Date: Sat, 21 Oct 2023 07:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Tu <yu.tu@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [linux-next:master 4334/13906] s4-peripherals.c:undefined reference
 to `meson_clk_hw_get'
Message-ID: <202310210706.Q7jHI1To-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2030579113a1b1b5bfd7ff24c0852847836d8fd1
commit: 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239 [4334/13906] clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller
config: arm64-buildonly-randconfig-r005-20211115 (https://download.01.org/0day-ci/archive/20231021/202310210706.Q7jHI1To-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210706.Q7jHI1To-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210706.Q7jHI1To-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
   s4-pll.c:(.text+0x164): undefined reference to `meson_clk_hw_get'
   aarch64-linux-ld: drivers/clk/meson/s4-pll.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `meson_clk_hw_get' which may bind externally can not be used when making a shared object; recompile with -fPIC
   s4-pll.c:(.text+0x164): dangerous relocation: unsupported relocation
   aarch64-linux-ld: s4-pll.c:(.text+0x168): undefined reference to `meson_clk_hw_get'
   aarch64-linux-ld: drivers/clk/meson/s4-peripherals.o: in function `meson_s4_periphs_probe':
>> s4-peripherals.c:(.text+0x12c): undefined reference to `meson_clk_hw_get'
   aarch64-linux-ld: drivers/clk/meson/s4-peripherals.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `meson_clk_hw_get' which may bind externally can not be used when making a shared object; recompile with -fPIC
   s4-peripherals.c:(.text+0x12c): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: s4-peripherals.c:(.text+0x130): undefined reference to `meson_clk_hw_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
