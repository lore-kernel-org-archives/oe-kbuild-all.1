Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8EA22324
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 19:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4JkBce/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697830591; x=1729366591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4wFJkM61MeevXbMoCakYqk0pIiTXq1zVyFhMFw2D0gQ=;
  b=N4JkBce/YlyNV9GfFlbhwSWMPvPVexyliCINhzxwW9FjsgkiEhB+J/N3
   axapler3MYlBu7cwzGM6kCjkeyR/83Iq000g7lKyEz0NiLdCZne/0tueh
   wW/99n8WVBBJNpVBUMDN3BBP2eeRYBLMfboXU9G94tu4UBKk+3+GQJkGx
   q8fDmYXBfioZ0mXkVdrGA5JZgGPgDdcgWw91k5IZ/j1Y4bznxVKbmxjd0
   MpY8rzX3ZrwSXAIfRHFnZ3qn9NazTlxgx3tamhqXdmhRPLPE7h3kLOAyU
   McRxF6t5L9fDcek7LSa3rUrx2s+9wSAFLMZ0CZnPwq29SYkAYkqTIHufe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="371629429"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="371629429"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 12:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="823357893"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="823357893"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 12:36:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtvIG-0003uU-3A;
	Fri, 20 Oct 2023 19:36:24 +0000
Date: Sat, 21 Oct 2023 03:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Tu <yu.tu@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: [linux-next:master 4327/13906] s4-pll.c:undefined reference to
 `meson_clk_hw_get'
Message-ID: <202310210303.l1aGutr9-lkp@intel.com>
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
commit: e787c9c55edadb5d9d6c75ce5080dd3c64bd996b [4327/13906] clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
config: arm64-buildonly-randconfig-r005-20211115 (https://download.01.org/0day-ci/archive/20231021/202310210303.l1aGutr9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231021/202310210303.l1aGutr9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210303.l1aGutr9-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: drivers/clk/meson/s4-pll.o: in function `meson_s4_pll_probe':
>> s4-pll.c:(.text+0x164): undefined reference to `meson_clk_hw_get'
   aarch64-linux-ld: drivers/clk/meson/s4-pll.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `meson_clk_hw_get' which may bind externally can not be used when making a shared object; recompile with -fPIC
   s4-pll.c:(.text+0x164): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: s4-pll.c:(.text+0x168): undefined reference to `meson_clk_hw_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
