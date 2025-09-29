Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370421A2C0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 02:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759114190; cv=none; b=cQ0P1RX1GW6Dq0G9SyvBIGek9I92jTpUSkRCuUcfn3lQkdu0pa5EoRx77zlrUhB7usGCbPP1DiH3UeAzo2EpD/VnbhgWy/JVqKyuliATBj1VlbjAOKguyY34i1TgE+ByLxURE+I/PFE/XAmspLc3vLBp/9nZnUfr3cpKyzEIio8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759114190; c=relaxed/simple;
	bh=OW0N4Gyinm7nmL5fm56wMH1UV0P1vVWdFsDedmtdHE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OGEXAUFkYfc4RCKPPFjLPPQ5Sck9pMxdS7pC6E2cZOsXYKtE5eCwvb73SFNzDclrbhC8MAzv/IkSMqtVNUtOz0BceUIVeDb6iEcGC2f2XIbvurDmTJ3jS2oE0ZnQLP9MT67AN8du2C7Kcv0fMsdta3IAmUvGtjCIRqnNZymb0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlSLRlTR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlSLRlTR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759114188; x=1790650188;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OW0N4Gyinm7nmL5fm56wMH1UV0P1vVWdFsDedmtdHE4=;
  b=mlSLRlTREsuqc2PMPqgTpD+pi03Js8Xc6nD014BbKvu5XK+GwnIoK6C2
   c1yv1VlHC/fLYPlzAH2NOgMg8vUCmUlW1VpeX1VNc39isGqm6PyuWKSvm
   J8EDQhYxnR4+u1FgfTKecAoakOEbcZvhBwrNKY9UI2xJqLeKInpQtI6+s
   WWkftrjZiZQF2pXAGRTDU9NxINRuXrUg3QFJVvwj1rL7mwgOaRluYzZa+
   wmnluA1jyZYE81CBQ1bTcIgcvMJh1b0v9MJTzgBpivOTk8d5e3Yu5+gum
   aXPsKtMm8hVO9OKKkqvggvw6mtobSqEsab3Fvx4aFVl9ACb+nvbI9j1a9
   g==;
X-CSE-ConnectionGUID: w17l2kc4ThKohmvCCgkpHw==
X-CSE-MsgGUID: tIIeRW6BQQWOxZ1nAzMpUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="65200281"
X-IronPort-AV: E=Sophos;i="6.18,300,1751266800"; 
   d="scan'208";a="65200281"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 19:49:47 -0700
X-CSE-ConnectionGUID: 9XY6K0LXQcOvU8YhC5QeKw==
X-CSE-MsgGUID: shm1IseSRoy3ONIairYeCA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Sep 2025 19:49:47 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v33xN-0008Af-06;
	Mon, 29 Sep 2025 02:49:41 +0000
Date: Mon, 29 Sep 2025 10:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rmk-arm:zii 157/172]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:954:31: error: initialization of
 'void (*)(struct phylink_config *, phy_interface_t)' from incompatible
 pointer type 'void (*)(struct phylink_config *)'
Message-ID: <202509291022.cvRDmyGJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   a17735e3c7127b536617528d8149b429bbdfc612
commit: 4b06c58a5e11927d403319e087b1cf8ff9816497 [157/172] net: phylink: pass PHY interface mode into MAC LPI methods
config: x86_64-buildonly-randconfig-002-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291022.cvRDmyGJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291022.cvRDmyGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291022.cvRDmyGJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:954:31: error: initialization of 'void (*)(struct phylink_config *, phy_interface_t)' from incompatible pointer type 'void (*)(struct phylink_config *)' [-Wincompatible-pointer-types]
     954 |         .mac_disable_tx_lpi = mtk_mac_disable_tx_lpi,
         |                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:954:31: note: (near initialization for 'mtk_phylink_ops.mac_disable_tx_lpi')
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:955:30: error: initialization of 'int (*)(struct phylink_config *, phy_interface_t,  u32,  bool)' {aka 'int (*)(struct phylink_config *, phy_interface_t,  unsigned int,  _Bool)'} from incompatible pointer type 'int (*)(struct phylink_config *, u32,  bool)' {aka 'int (*)(struct phylink_config *, unsigned int,  _Bool)'} [-Wincompatible-pointer-types]
     955 |         .mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
         |                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:955:30: note: (near initialization for 'mtk_phylink_ops.mac_enable_tx_lpi')


vim +954 drivers/net/ethernet/mediatek/mtk_eth_soc.c

952d7325362ffbe Qingfang Deng         2025-02-17  946  
b8fc9f30821ec0c René van Dorst        2019-08-25  947  static const struct phylink_mac_ops mtk_phylink_ops = {
51cf06ddafc91e0 Daniel Golle          2025-04-27  948  	.mac_prepare = mtk_mac_prepare,
14a44ab0330d290 Russell King (Oracle  2022-05-18  949) 	.mac_select_pcs = mtk_mac_select_pcs,
b8fc9f30821ec0c René van Dorst        2019-08-25  950  	.mac_config = mtk_mac_config,
0e37ad71b2ff772 Russell King (Oracle  2022-05-18  951) 	.mac_finish = mtk_mac_finish,
b8fc9f30821ec0c René van Dorst        2019-08-25  952  	.mac_link_down = mtk_mac_link_down,
b8fc9f30821ec0c René van Dorst        2019-08-25  953  	.mac_link_up = mtk_mac_link_up,
952d7325362ffbe Qingfang Deng         2025-02-17 @954  	.mac_disable_tx_lpi = mtk_mac_disable_tx_lpi,
952d7325362ffbe Qingfang Deng         2025-02-17 @955  	.mac_enable_tx_lpi = mtk_mac_enable_tx_lpi,
b8fc9f30821ec0c René van Dorst        2019-08-25  956  };
b8fc9f30821ec0c René van Dorst        2019-08-25  957  

:::::: The code at line 954 was first introduced by commit
:::::: 952d7325362ffbefa6ce5619fb4e53c2159ec7a7 net: ethernet: mediatek: add EEE support

:::::: TO: Qingfang Deng <dqfext@gmail.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
