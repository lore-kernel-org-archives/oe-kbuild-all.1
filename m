Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8646A604
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 15:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189257; cv=none; b=jDRJ+21Ko9gRZOtg7E8+Wlx/tggN5kAo5k1U76q3MFGqKJH8VjsRicY8TDzUaXX/AtDS+eRWzmsscs2cgLGNh7rkB+5zZ0LT7g1YCmpESBI8JGbEj/fbitR7qPwWKp7Ie1wmyt+35GjpcEWrTlKx+fE9qneyo5A1yjLv0f90M2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189257; c=relaxed/simple;
	bh=i2eGAZ1hDFTvuS0i6VoPbv69QBZ/9uKJcpYfS0RSHbk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dUboyZ7QMb0r+qcVcrZFolzBiJtjZLRLq2tMd1HPYSrqvh4yMV8hJCH7gaih83bfpeUJmdmkrXaf6O/Yk/++m3YRcKK4py1L8RIr2JyuZSzm/R3Q1LBIr5tkkAt8Ahbirk80NKh1Mz82M+qp7UZu6S2+ZiOcFTof5VoestTC+BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZxIysDf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZxIysDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788189254; x=1819725254;
  h=date:from:to:cc:subject:message-id;
  bh=i2eGAZ1hDFTvuS0i6VoPbv69QBZ/9uKJcpYfS0RSHbk=;
  b=UZxIysDfBKU1vOcLL8St1nyJEAXaIe5o+PhZv3b4o5CZqucZxcouE939
   U+I3eXidVYJjFa2kOC0fz25C8/dRvvWqW5zEoLSeGMEW484TrLxJpRfI9
   KSOSagO7GJY5xAauQVDHM2BP1TCx0IAXhWZ85+80/JlK7e1s+ymwC1Yyw
   wcZs8/BUSMq9oCmZyux8VR8mMFnQldJa15bWJG3V3zc5K3DYhbDzMQTmn
   I5qDVA8omn4knkZpu/lw15bK4IwDuXpxEyJUTp8W+AyyN5LS423XNwg0i
   LGuGbDymdcHBLhzfQnHiGl/Puws1ESlw9Mr1K80+OZQOuB7NorLZt8zI3
   g==;
X-CSE-ConnectionGUID: BSS83Q1cSouDdH0MGxvpzw==
X-CSE-MsgGUID: 0bhFLug1QmmhdpEBjL0I6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92285949"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92285949"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:14:14 -0700
X-CSE-ConnectionGUID: iNAdkLRmTay1A7GsDwrtwg==
X-CSE-MsgGUID: LgF6tKdeTkG4wx9/9jR4FQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Aug 2026 08:14:12 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x13i6-000000000mp-1Ugx;
	Mon, 31 Aug 2026 15:14:10 +0000
Date: Mon, 31 Aug 2026 23:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-rc 213/213]
 drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202608312345.puWz9DRX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-rc
head:   8f1ae3a99f8f4bbde9c6a17df87b4585fc4eb674
commit: b6960ae531bd4aeca296d56a41af3f4b3df73e0b [213/213] net: pcs: airoha: add PCS driver for Airoha SoC
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260831/202608312345.puWz9DRX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312345.puWz9DRX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312345.puWz9DRX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2581 |         default:
         |         ^
   drivers/net/pcs/pcs-airoha.c:2581:2: note: insert '__attribute__((fallthrough));' to silence this warning
    2581 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/net/pcs/pcs-airoha.c:2581:2: note: insert 'break;' to avoid fall-through
    2581 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +2581 drivers/net/pcs/pcs-airoha.c

  2560	
  2561	static void airoha_pcs_an_restart(struct phylink_pcs *pcs)
  2562	{
  2563		struct airoha_pcs_priv *priv = phylink_pcs_to_airoha_pcs_port(pcs);
  2564	
  2565		switch (priv->interface) {
  2566		case PHY_INTERFACE_MODE_SGMII:
  2567		case PHY_INTERFACE_MODE_1000BASEX:
  2568		case PHY_INTERFACE_MODE_2500BASEX:
  2569			regmap_set_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2570					AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2571			udelay(3);
  2572			regmap_clear_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2573					  AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2574			break;
  2575		case PHY_INTERFACE_MODE_USXGMII:
  2576			regmap_set_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2577					AIROHA_PCS_USXGMII_AN_RESTART);
  2578			udelay(3);
  2579			regmap_clear_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2580					  AIROHA_PCS_USXGMII_AN_RESTART);
> 2581		default:
  2582			return;
  2583		}
  2584	}
  2585	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
