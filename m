Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098500;
	b=qRHdbPs0dfGWsXISFRSJeRFFZXiyybaW/VRs19ZXuEBPxack6zRTdmUAPPQgAyjZI8ZU
	 gnqs1FxhBhKhb0VdlYsb/iZ6CuL/2LisVeZokPi50SHCJ0q/BDv3CE00KAPXUv0rxvjbG
	 e2xI85WQPwm0Fw4CqgMNN6eU9DYfXASKjqpu3e5vbE6d5rxwBy0znebPTWKO8XJfczqpk
	 w+YJ1U9OWTpqJsxm7qFxozK2TYes1ZClSq94rRe+/PnIHVNWXce0haAtEkuGmjaCqYhwd
	 4lW4lJ13ttNzcRPvn8py74plR+HdouHxOtoXuYlbRl6UUDKur5mG4bNGZ+VouKmnn0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098500;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mkGn9FuH9MQOrL7Cdo54J7xbcYz+n2CDJjlJqbA6lb4=;
	b=H09KCVGke07PtLBufYty8nzu0lTTAzX9yQbynwYj800ywnqI3wXjB3rPA2aMunjki8lX
	 dW6rzlTXZlevmoEWa7jvfbI7u8RXJeGade2bb1y00MlGsb8VC0mtCvBC45lkl6TFiDuFD
	 0WzrVgpKIS6y76YGPttff6OcAtvwywFRA7cBLfNc35EWqUOXvQafYNSXwxhrIp/rGppBN
	 sNIug11SlsYCO+e/rAhTKa4AFHugb0hx7T7gvk7czPo3VINRBnuhuCxQaMq/I5lUd/3aI
	 6cbu7W2TC0m7glQV/A+TpavtdqWNtw5yUMIWuXdB3tcew1Fhw/jR+KyQ2+cRzV3Nqqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGNMVSkp;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AD1606A325
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Nov 2026 14:28:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76AD1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kGNMVSkp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795098499; x=1826634499;
  h=date:from:to:cc:subject:message-id;
  bh=WUoijuKQfpfoGqb2i1jAKizgFmciPmQNQZc8uoH8epw=;
  b=kGNMVSkpxOjLjota1PQxbQ4lqll3yBHi6oc42UAMBBUwx9JCE6gN2RUh
   LBxn/jDfwlc3BZhFW2kEMscSfKo8eaZoTaLXYuc/978rqqYe4JxU2gHhS
   5B9GwtTn4gCgZBiB0aftvnoIBChWKDPeLnPqwHl4URZEFGjpztuQpvKn5
   ycp/iW7nBRpaG8m4sldDtVv/lv5MQiUrNBIVNktjHH3x9j1JeLkbxiWfY
   Zg5k82ON8DSCm3mjLoF6HD4g0YJcCXjEqw2P3yjFG/ZuZVuWLasEmOXhg
   1aKZ7qpzpCQ736Mrzp/egf/8ICi9OlMpa4CtKxSMnnKDiGuJaY9CrwqyA
   Q==;
X-CSE-ConnectionGUID: uLkZA2lwTh2/jKXFNFABIg==
X-CSE-MsgGUID: 3PtWculPRPu9P43QHLAb5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3798048"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3798048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:28:18 -0800
X-CSE-ConnectionGUID: w5VEHed8Te6078OSsFSisA==
X-CSE-MsgGUID: g7a1EQZaTxqNNNcSyF0rOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10352881"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Nov 2026 06:28:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU37V-00000001FvW-3h5D;
	Thu, 19 Nov 2026 14:28:13 +0000
Date: Thu, 19 Nov 2026 22:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 2/2]
 sound/soc/ux500/ux500_msp_i2s.h:152:38: warning: suggest parentheses around
 arithmetic in operand of '^'
Message-ID: <202611192217.VJiUUNzC-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   2bb8202ab6272d47b6e380f53f01ff95f6fdc50e
commit: eef9bbcab498891d862d3b79f8ea190f6cdae9d2 [2/2] ASoC: ux500: Validate MSP DAI configuration
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261119/202611192217.VJiUUNzC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/202611192217.VJiUUNzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611192217.VJiUUNzC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:16,
                    from sound/soc/ux500/ux500_msp_i2s.c:13:
   include/linux/mmzone.h: In function 'movable_only_nodes':
   include/linux/mmzone.h:1136:13: warning: variable 'nid' set but not used [-Wunused-but-set-variable=]
    1136 |         int nid;
         |             ^~~
   In file included from sound/soc/ux500/ux500_msp_i2s.c:22:
   sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
>> sound/soc/ux500/ux500_msp_i2s.h:152:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     152 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:206:21: note: in expansion of macro 'MSP_TX_CLKPOL_BIT'
     206 |         temp_reg |= MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~
   sound/soc/ux500/ux500_msp_i2s.h:151:38: warning: suggest parentheses around arithmetic in operand of '^' [-Wparentheses]
     151 | #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
   sound/soc/ux500/ux500_msp_i2s.c:210:21: note: in expansion of macro 'MSP_RX_CLKPOL_BIT'
     210 |         temp_reg |= MSP_RX_CLKPOL_BIT(protdesc->rx_clk_pol ^
         |                     ^~~~~~~~~~~~~~~~~
   sound/soc/ux500/ux500_msp_i2s.c: At top level:
   sound/soc/ux500/ux500_msp_i2s.c:751:1: error: expected identifier or '(' before '{' token
     751 | {
         | ^
   sound/soc/ux500/ux500_msp_i2s.c:749:12: warning: 'ux500_msp_i2s_of_init_msp' used but never defined
     749 | static int ux500_msp_i2s_of_init_msp(struct platform_device *pdev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CURVE25519_NEON
   Depends on [n]: CRYPTO [=y] && ARM_CRYPTO [=y] && KERNEL_MODE_NEON [=y] && !CPU_BIG_ENDIAN [=y]
   Selected by [y]:
   - WIREGUARD [=y] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y]) && ARM [=y] && KERNEL_MODE_NEON [=y]


vim +152 sound/soc/ux500/ux500_msp_i2s.h

3592b7f69a54388 Ola Lilja 2012-05-08  147  
3592b7f69a54388 Ola Lilja 2012-05-08  148  #define RCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  149  #define TCKPOL_MASK		BIT(0)
3592b7f69a54388 Ola Lilja 2012-05-08  150  #define SPICKM_MASK		(BIT(1) | BIT(0))
3592b7f69a54388 Ola Lilja 2012-05-08  151  #define MSP_RX_CLKPOL_BIT(n)     ((n & RCKPOL_MASK) << RCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08 @152  #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
3592b7f69a54388 Ola Lilja 2012-05-08  153  

:::::: The code at line 152 was first introduced by commit
:::::: 3592b7f69a5438812381ff0aacdea1725ffa1c1c ASoC: Ux500: Add MSP I2S-driver

:::::: TO: Ola Lilja <ola.o.lilja@stericsson.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
