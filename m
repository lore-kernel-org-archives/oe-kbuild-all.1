Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10868D2EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 23:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IoW8zhG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697152297; x=1728688297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jniiOPXapuhUzHOOyBQAi6t/JPUky2327H9I2x2sAoE=;
  b=IoW8zhG50Y4avVrlfFRYPB6pAwPow0Np+fKMx6pMZlmJgx+Wsj1MQGNj
   WTvgH0cylcaxawb5zGgRv7+A2bqRHKybTPI28aGCq2q499XH4s859YMKF
   a7eRh1dEGMnLgKKKeD2e4MLD93jvp/VerocMCditps1eYftJ70DyQ0oBd
   EUpfMQjlyx6k+7JzLjTYf86TD/4u0PqWiJPRb7Pe0VLRVpOqQgGbGM7Q/
   Cb1aAmU+xrlhFO8oDnjqtsJEgSvQJ3FUCc3Uc1Jw1Cw6nx+PbNTEexdsm
   PXLlUeKhSkANXL94V4KtlSkC0aRrm7H8oIHGxOc8lUw1fNQQ5HPZDL09X
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416110346"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="416110346"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 16:11:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783904493"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783904493"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 12 Oct 2023 16:11:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr4q4-00040l-0K;
	Thu, 12 Oct 2023 23:11:32 +0000
Date: Fri, 13 Oct 2023 07:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 547/25021]
 drivers/clk/imx/clk-lpcg-scu.c:51:21: warning: variable 'reg1' set but not
 used
Message-ID: <202310130706.V3ez54Em-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: f64615de14a6b4d910a1b8f0c2663c0a1498ead4 [547/25021] LF-446 clk: imx: lpcg-scu: SW workaround for errata (e10858)
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231013/202310130706.V3ez54Em-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130706.V3ez54Em-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130706.V3ez54Em-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-lpcg-scu.c: In function 'do_lpcg_workaround':
>> drivers/clk/imx/clk-lpcg-scu.c:51:21: warning: variable 'reg1' set but not used [-Wunused-but-set-variable]
      51 |                 u32 reg1;
         |                     ^~~~


vim +/reg1 +51 drivers/clk/imx/clk-lpcg-scu.c

    44	
    45	/* e10858 -LPCG clock gating register synchronization errata */
    46	static void do_lpcg_workaround(u32 rate, void __iomem *reg, u32 val)
    47	{
    48		writel(val, reg);
    49	
    50		if (rate >= 24000000 || rate == 0) {
  > 51			u32 reg1;
    52	
    53			/*
    54			 * The time taken to access the LPCG registers from the AP core
    55			 * through the interconnect is longer than the minimum delay
    56			 * of 4 clock cycles required by the errata.
    57			 * Adding a readl will provide sufficient delay to prevent
    58			 * back-to-back writes.
    59			 */
    60			reg1 = readl(reg);
    61		} else {
    62			/*
    63			 * For clocks running below 24MHz, wait a minimum of
    64			 * 4 clock cycles.
    65			 */
    66			ndelay(4 * (DIV_ROUND_UP(1000000000, rate)));
    67		}
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
