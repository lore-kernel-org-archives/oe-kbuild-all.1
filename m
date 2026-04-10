Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63703DBD70
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838363; cv=none; b=fnecGgFYubWcayWWdEdsu+2pOQXeKtjHQ4CBDfGjZxxqqSUzQMw+tSC1Bqj+rJrJkJuj93Iqkm+ZkCa5VaDjIRS1secto5g74m0cekLfUQ53G5K2SVplE1tmGluOaLoWukfVOOoIMHuzunKTbeelknU7OKCdWIGPZy1Uy8MvwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838363; c=relaxed/simple;
	bh=8LKEWDB7rSqhQ4F8vG5dVSz8B44Fs1Gnc2oXFkYWPRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Stvrp81RgvdZ8LXK6umcE3cjtVDrtBTopp0dzs7NIstSQ2Pxa1hGgGjqg1wcAFyIFrXxt4RE0oC6LseyE/drAR6508m5R0VCfL70SzHcGAvgBG4ROrtubOLO7JRJvZkfHMVEBRcdPpj8/GFuDh1m1zsUjntNIR6gb7ecDF3OSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caaYCOV2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caaYCOV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775838361; x=1807374361;
  h=date:from:to:cc:subject:message-id;
  bh=8LKEWDB7rSqhQ4F8vG5dVSz8B44Fs1Gnc2oXFkYWPRk=;
  b=caaYCOV2CHyCVBRq2SSCm4ohovZE0ZedqgUb/5FOUboOEMqK711J/9CZ
   n3wZXw6ttoDfa55V7HtSqc4tJwY817r4/9kWMUX594LwbjYDBzpqRZcm1
   ALy7n3D19FBWVgsGl89BiK9wAzsal6stWbVW+NkES15x13Jjgw0LU/z0z
   Mu1JgQrWHkDUgASQo9KMjB9xjpdFjik8dsUWFPcBNiiJZv5dcB8bjisb2
   l1LHL5SS22T/PD33XetDvQFVrjBC3mxtACHg1+98BA7CNgSeXznMqx4oG
   VGQr/rCtvnPtsb8Jv2SlNgjH6pDYtPI34M6WDYD5+WwPJAZwT3rBrbBra
   Q==;
X-CSE-ConnectionGUID: czkX+SoOS6CvwqpmMWy4Yg==
X-CSE-MsgGUID: EBzzTaAtS/udA2cAZWvp6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76739600"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76739600"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 09:26:01 -0700
X-CSE-ConnectionGUID: 2s6PuzdQTkaV4YHHL572sg==
X-CSE-MsgGUID: CAIIa0jwTLOUnasn6Yt55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="229011200"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Apr 2026 09:26:00 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBEg8-000000003yH-3312;
	Fri, 10 Apr 2026 16:25:56 +0000
Date: Sat, 11 Apr 2026 00:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 14/104]
 drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202604110026.xSh0j0cZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   26aa722b76b3bc075b01f86981e17206cfbe9af5
commit: f28c5171542f5109193fdabe2a7e7b807cfdb78f [14/104] net: pcs: airoha: add PCS driver for Airoha SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110026.xSh0j0cZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110026.xSh0j0cZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110026.xSh0j0cZ-lkp@intel.com/

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
