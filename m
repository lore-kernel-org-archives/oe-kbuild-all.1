Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8D46E2C7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 11:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707391484; cv=none; b=Efn8EpgVxcDE5Yp4/INr9PdOhvzuaELQWwJVLRyzhwcbFwVkhHc7imgbHnf1h41UmjJr7Kqa0yY2NtuFMTh2+9IM7BLR6P+R0WwpaUv6JNASZAFNeiX/B29rgiUPala1hhFZZicq/lxRGA7EvZ9a4zgpLJ+QCYGUWTOzrxrLKX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707391484; c=relaxed/simple;
	bh=82QtHP3FcEShBK2bBwQWbB2HcpWS3XT9dsf9twLwhAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LQcXIYXBdRtefHPssr7CK0m2RM6SYfT2AzirWdDo7h3EWCusTBkEAP/mGDywCQJ1xoqk53m+OzU93tIMv13T0DEbtsGXuxUwrNKpP1bFQthKWkpB2rEj3GPAEHN2Pv1FUwDsmvVBcTxOGV5N/1tgEf3l9/d86YKDSXqCziw9OrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gatn5Nge; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gatn5Nge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707391481; x=1738927481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=82QtHP3FcEShBK2bBwQWbB2HcpWS3XT9dsf9twLwhAk=;
  b=gatn5NgeO35wyBXFsYJiONNuW/qoW+wyu8ge/GAlebYRA2rv7IyV7k0Y
   hL/kR8T8u7WhuUAaPO+81caPFrepT4/h5NZvjVTSB6YaDzAMVUl8xO/S3
   sYlYK33kvjZLWGyJO6kM98FU1pKVizZNOpXhBWRTrY47TmO10Ps80G1Pw
   lvz8qqMTIqncjb2XU91cq/ISg+Za7cc0JZIiAcGnwCvadXggw6IsdXpcD
   zS6SzhX4yOFjrXtaPagbKIGmKz657jke/krtio6bWZNRqOWOU/hh/TcLr
   vAi6haZz75yMsA6LUrYyoewAQgo0pbDLHJLSlxPN4PE+MLF+hBJk3NP2Q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="23678730"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="23678730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 03:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1990707"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2024 03:24:40 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY2WD-0003ha-06;
	Thu, 08 Feb 2024 11:24:37 +0000
Date: Thu, 8 Feb 2024 19:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 490/17898]
 drivers/clk/imx/clk-lpcg-scu.c:51:21: warning: variable 'reg1' set but not
 used
Message-ID: <202402081934.lE3RzeAx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: e1f2eeec5c72a0a3dd925db402f41a82fc0ab56c [490/17898] LF-446 clk: imx: lpcg-scu: SW workaround for errata (e10858)
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240208/202402081934.lE3RzeAx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081934.lE3RzeAx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081934.lE3RzeAx-lkp@intel.com/

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
