Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A131A3358BC
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772976998; cv=none; b=Q8abyGQfQT6UhzJI9l5SwsNvlTz4YqFK2SlT8HEEZ2TJKZnxUELn65D7L4nKKRoFt7npfh/0gfqkFSNTe5Uc7As5Ips330Zwt5q1hMwqd2elhFuiS7uR8l5r7XNZ4XdtCkw1YEyLAnlJaw8JfdfYgYrvp9wjIQDv+puk4S8MHzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772976998; c=relaxed/simple;
	bh=SQbSG/AwI+hbhnJnFiQAhcwztfKlNNx6LgeGua9CfLc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FAODoE+2aB8AEo9Y8Obd4VD9BF6YScmIyRLJEtsgCBPfLNO6dqkopaPJWOOY8YAZNiqDxTrYXSZLnOoJNmAgqg7v6/OWaSxXEMucAOjxuttNiEqRIp1KQLpXQZVt3mBSfIbxBnIw+/2cScQ9OlLGreVF1m6Wyv6upDwdpC1DrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTAmhOMJ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTAmhOMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772976996; x=1804512996;
  h=date:from:to:cc:subject:message-id;
  bh=SQbSG/AwI+hbhnJnFiQAhcwztfKlNNx6LgeGua9CfLc=;
  b=JTAmhOMJa80u2g0BeEVZlaahCLlCoJTPQfeog6gft+IXQfM2FNsHCuTk
   Rm6fiI2a7Guq/POTX3Z9va3Xr6mA3fGgm31yM9DSt4vL0gRIm2txBXugu
   crrGFTYrt1sygcd3EvnigQSUltwSxj/yCaCaUOBuN6kdiH880Y4roJvWN
   j5XwbiyMFNeYnV+S8yOTGgS/fzP4ceweeo9TNBND9BXd4FL1isqw7eSXW
   VRQoUg/XjQzzQz34dNAp1R61Isreg1uLwKrt7M6tzCRmFMT5+T278JMAV
   aRMHxicqCSXX48TOiTj2knnNrtsC5kvrvmzSRkdElu57O3CQ/rALVoE16
   g==;
X-CSE-ConnectionGUID: C87t5OHRRgKBX1G6znTgAw==
X-CSE-MsgGUID: 7aOfCfw5QfeSVbMfIaOp6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74065439"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74065439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 06:36:36 -0700
X-CSE-ConnectionGUID: cwPwWXTISi67uo4DLZVQlQ==
X-CSE-MsgGUID: QUpo/oGwTHCyTT2Jvb9eNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="217145395"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Mar 2026 06:36:34 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzEJ6-00000000396-2RNw;
	Sun, 08 Mar 2026 13:36:32 +0000
Date: Sun, 08 Mar 2026 21:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-rc 14/81]
 drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202603082119.iwxGb3Nw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-rc
head:   dec67054e8b15479a46b90fde303a0112363c7ce
commit: f28c5171542f5109193fdabe2a7e7b807cfdb78f [14/81] net: pcs: airoha: add PCS driver for Airoha SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603082119.iwxGb3Nw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082119.iwxGb3Nw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082119.iwxGb3Nw-lkp@intel.com/

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
