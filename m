Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815612;
	b=iBJrbh46tZJpEfZXLOVZF13aD4t6Kut59HkxfeV0t1w+UA0pHVTwz3ueggC9rWY77Gso
	 GddpklntdOMEu8224RB6mAwfgqVOS7YBNQvlrJp9RWdVdxUFK63P/W7MBdTPcJ+c3gfHz
	 Ks0UB8fd7Lq6b78sLfcmeOekPBx4IlFKGYX4M7NfBBAFKaZPAy3filE7z1HilLdNa6T/7
	 37h9UicxwHhHrTqX8H/w5dH51JDRH9lkh89Z2KlcxxY82bQww1paKmEjW6r9KDvpOKjri
	 K705yWCrkdRk1KOymEnThC0eVr+25VC8S7QJjJG3WB5bMF8T+mdLNVCWE3WMPVXEAeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815612;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UrNMs+uz0uGBlCVAZ9PKHabu2q6qymLqL0Hvcn82N94=;
	b=STXpEAUq2IruZLi3ZGsjJh7U0cj7yp8Q1cxfNn7eJ7pl8ewMlfqahmT6Zxp9QJzz31hX
	 JmILjOZgF9t2mP/vmrpTOaoHFeWHd59NVkKxoqn3b7qTfmeI1MAM0oaOxdA2afn/B6KZv
	 EctVpTwDxAdoXvX0VxXxv9M+Mc4/3BfpT8D/OuR0GUp342hubNGA6UwbRw/6YTRsIxvfV
	 wEfrEE9uY4R4sE8jwL/pUuWGVx3ihF+rgA2oJi3XASEogefj8VNehmvAgKWbLPPUScdCB
	 ZvEqzzbKT4fWDFrD+M+LByXlDoMs/En2mO2mMfTi6oGT+g5g6m7VG/xXgdaqvmHLzOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="OPVoGs2/";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE14606A335
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 07:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CE14606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OPVoGs2/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794815610; x=1826351610;
  h=date:from:to:cc:subject:message-id;
  bh=VqDWjJJ9nfzPlBNo3Jb5q/uhtdxVbThSajJpQjGyI4A=;
  b=OPVoGs2/9jaMzQ8cxDNnIeFyz/ybhGRkqYsesVv4a47NX74T5sxUCmfm
   AbhZzPi46Qahzp8GsJ1+rCWykMJT3OEkcPbXUNXZ+JGM/1j/wFTHi1jK3
   tD74dmxPzeIEYfNLjXJBxGucnpN31UrogmqKDLloYAGlC+Zxm6wklUVgF
   +IQ6+MeE+iHhKgosyIr2kfrcS+G8fo6yOjcY3sBDAzxvvM9BoTr++j3lq
   1Y2P1BRQVM1AZ63bado04G5sbjFV1UoS3ml2q8iZJwI0fu5LtkrsBji5t
   mrl2qqNwArRfUgGuNd++0o4vBC3LxJFklWbS7om1oyKXJUX7WYXMeN6UL
   Q==;
X-CSE-ConnectionGUID: N2+4Idt1Tj6ovZof98422w==
X-CSE-MsgGUID: bA5LEwqnR4Gp4+y4BDRWKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3555925"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3555925"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 23:53:30 -0800
X-CSE-ConnectionGUID: Rdr7xa/IRrOEHTA7iZX8Bg==
X-CSE-MsgGUID: FGIITtiSRXycR7LgwT3t6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11385233"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 15 Nov 2026 23:53:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSrWo-000000002ct-1TAL;
	Mon, 16 Nov 2026 07:53:26 +0000
Date: Mon, 16 Nov 2026 08:52:34 +0100
From: kernel test robot <lkp@intel.com>
To: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Sheetal <sheetal@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [broonie-sound:for-7.5 257/271]
 sound/soc/tegra/tegra210_ahub.c:2451:3-4: Unneeded semicolon
Message-ID: <202611160849.I2dU8hrD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5
head:   f49581b7e27e6fd6796335b69ed0ab45206209a9
commit: d796155972bb0fd411da12e472d4fddbf0afb6ec [257/271] ASoC: tegra: AHUB: Add Tegra268 support
config: parisc-randconfig-r2106-20261116 (https://download.01.org/0day-ci/archive/20261116/202611160849.I2dU8hrD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160849.I2dU8hrD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/tegra/tegra210_ahub.c:2451:3-4: Unneeded semicolon

vim +2451 sound/soc/tegra/tegra210_ahub.c

  2434	
  2435	static bool tegra268_ahub_wr_reg(struct device *dev, unsigned int reg)
  2436	{
  2437		int part;
  2438	
  2439		for (part = 0; part < TEGRA268_XBAR_UPDATE_MAX_REG; part++) {
  2440			switch (reg & ~(part << 12)) {
  2441			case TEGRA264_AXBAR_ADMAIF_RX1 ... TEGRA268_AXBAR_ADMAIF_RX5:
  2442			case TEGRA268_AXBAR_I2S1_RX1 ... TEGRA268_AXBAR_I2S5_RX1:
  2443			case TEGRA264_AXBAR_MIXER1_RX1 ... TEGRA264_AXBAR_MIXER1_RX10:
  2444			case TEGRA264_AXBAR_MVC1_RX1 ... TEGRA264_AXBAR_MVC2_RX1:
  2445			case TEGRA264_AXBAR_AMX1_RX1 ... TEGRA268_AXBAR_AMX1_RX4:
  2446			case TEGRA264_AXBAR_ADX1_RX1:
  2447			case TEGRA268_AXBAR_ASRC1_RX1 ... TEGRA264_AXBAR_ASRC1_RX7:
  2448				return true;
  2449			default:
  2450				break;
> 2451			};
  2452		}
  2453	
  2454		return false;
  2455	}
  2456	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
