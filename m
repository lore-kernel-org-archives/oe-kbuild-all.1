Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39F26A0A7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 08:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595401; cv=none; b=ni0+sX68/u1lMKBA0eaLCDHYpi3AQjmBRhLyBfKYZ35BoMVGF/Y7mHqNLDmNokpTgcldDb40SUCsjWq4qZBqQRburBRidfjcwTgNP29nVfd5e1nIOu2GBdPBO7QCMl31HmG1YbRryctu3eORiFTEVWSkW2lHx3jdVIaScPS5Lao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595401; c=relaxed/simple;
	bh=R42RIDsTntuv+s3A6dgJ86LP2ybzAkbehUalDCAM7gI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FKfA7k/36eRbhpYrdqJrqc/6DyljCMd/yMF1c1wnN5tHZTaBLP827+zvvJ9mzWN6/ap6xds8+mMlva346U7MXHDsJYev5baCy8y5OEupfGjdFOucJL8y26IE31WWxT28mPxgoP2OwYwlh3e9LRdl4FenRc5CHhCLDjicMbGlTsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkK6qqev; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkK6qqev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788595399; x=1820131399;
  h=date:from:to:cc:subject:message-id;
  bh=R42RIDsTntuv+s3A6dgJ86LP2ybzAkbehUalDCAM7gI=;
  b=FkK6qqevwmmwarevWT2Al/INqv+mlpkzNCSbnMYR59ly2m20mcbzKVDa
   jX8EreCjEY7inu6JQOOv/B63vi0qlivAbYWwp51VRypAetxU+LNzYDa76
   sxqzx66qbN93zBX4m1f8yZlzS6/PuTWrT2EFZj4rCRzHJdwfYsoyE7zqj
   2+umKI+jWKLkNy5TEJRfvwz021GBRQhN/XCCihxQ1XzTgFum7efD3vcEH
   3ACeHytVtAbqCwPbouNfHTtBUGR4hKEm2JujoRNPXIb/v2yXaapeuc4hj
   v29hNGLc8PtA5X1IdBYvL/aNPZdZLO1zRHxuhL1jC1d8f4bk+mRf0UJJ6
   Q==;
X-CSE-ConnectionGUID: zpNe6GqESWSLdTe/MgjNIg==
X-CSE-MsgGUID: 1jOCMWFLS26Kp/5LHImQEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100246461"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="100246461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 01:03:19 -0700
X-CSE-ConnectionGUID: am/29cqqTeW3OF68/W0UNQ==
X-CSE-MsgGUID: VRU6FGHQTkGE7NFob7RpOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="268943373"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Sep 2026 01:03:17 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2lMo-000000000H5-3437;
	Sat, 05 Sep 2026 08:03:14 +0000
Date: Sat, 05 Sep 2026 16:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-msp-fixes 5/10]
 sound/soc/ux500/ux500_msp_i2s.h:150:38: warning: suggest parentheses around
 arithmetic in operand of '^'
Message-ID: <202609051547.G9SJp8UQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-msp-fixes
head:   2f95df02f538f1fca7974cb317d05bea56b96a82
commit: a68d4e15f02ffb40f55509d32630a549168d1b5d [5/10] ASoC: ux500: Validate MSP DAI configuration
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260905/202609051547.G9SJp8UQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051547.G9SJp8UQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051547.G9SJp8UQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
   sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
>> sound/soc/ux500/ux500_msp_i2s.h:150:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     150 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro 'MSP_TX_CLKPOL_BIT'
     204 |         temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~
   sound/soc/ux500/ux500_msp_i2s.h:149:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     149 | #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:208:21: note: in expansion of macro 'MSP_RX_CLKPOL_BIT'
     208 |         temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~


vim +150 sound/soc/ux500/ux500_msp_i2s.h

3592b7f69a54388 Ola Lilja 2012-05-08  145  
3592b7f69a54388 Ola Lilja 2012-05-08  146  #define RCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  147  #define TCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  148  #define SPICKM_MASK		(BIT(1) | BIT(0))
3592b7f69a54388 Ola Lilja 2012-05-08  149  #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08 @150  #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08  151  

:::::: The code at line 150 was first introduced by commit
:::::: 3592b7f69a5438812381ff0aacdea1725ffa1c1c ASoC: Ux500: Add MSP I2S-driver

:::::: TO: Ola Lilja <ola.o.lilja@stericsson.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
