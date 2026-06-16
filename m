Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50F3769F6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 03:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579665; cv=none; b=UtpvU4y0KGsi441KUz4QcnKg0yo32iojxuYUdA9Y1AIlJ2i78TiKrvAV3qOmvc84Arcq1MyrFvpQgChDdxuYD7KFTVTUxroS3kq0v4rpsTQ+gKy9XCnKyup2zsIkDfYqwXJV8giWZHMsFvBZAhTu+LbPjHvzOnDcZmQQp1pXkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579665; c=relaxed/simple;
	bh=9shi/OLXSL1ig7daRS4WmZQSutvq6jks9QcrVW8paGw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kEoKkLaQDTqOdz1aZhrU2XWuaQ63AUMpFsyHiy/uTcQKYYaOs/hW73lsJhkiD+sDfMe+KTcBfB4Zf+2VB4bIDzMlv46m8sHGc/rBKHJOoT3899H+cEddBox+PW+mx8Ex8YWVbtnYHfGUYnCEfz2MVaNITWXmai1LCULkDF8xyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SOce0zdP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SOce0zdP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781579664; x=1813115664;
  h=date:from:to:cc:subject:message-id;
  bh=9shi/OLXSL1ig7daRS4WmZQSutvq6jks9QcrVW8paGw=;
  b=SOce0zdPNZGkZUIO8pCHK6m8eGL/GWU7naPiiM0NGSylTjBt+P0IYQu+
   7gw6jl74s5ibG1J+DEFv5lcaD8j7dS+0bmhhqYz1p9YagFFdxMBH60WgZ
   S6PnK4XRLlizBIpdSPNAlHto6OCEXoKM3y1QDLK0Af68CXmSzRIiQ51dL
   O4HSpNxEKgrdiQMSuV7MjESbyAdUxaS/XPdNmMqKsfialD7VjMJEitOC2
   WYU/SvfhKgYA87ylPJSG5QQzvzMU20Lcs0sBKIAbJDyhyrfS3kDAAndSI
   9r/5+7YqDPa0RKAiuzvmbNig5udh4AGrp8o8n92KV+es0o6uT8q75etMK
   Q==;
X-CSE-ConnectionGUID: MZxGQwvSQSyowngfJWLNuw==
X-CSE-MsgGUID: VJvuTMJtSyu0sAaasnvYBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="86174011"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="86174011"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:14:22 -0700
X-CSE-ConnectionGUID: 8IMrFawlSU2+pDuYSHcN4w==
X-CSE-MsgGUID: ReMGnIlHTgGDAuKGn06Fvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="251939146"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jun 2026 20:14:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKFn-00000000Ses-02H2;
	Tue, 16 Jun 2026 03:14:19 +0000
Date: Tue, 16 Jun 2026 11:13:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 162/162]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5612:13: warning: variable
 'flags' set but not used
Message-ID: <202606161108.J1ioZmOB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   5c1d29f589046df832c7a303b9df3afd038366df
commit: 3711abad7e2e72cb061918aad080ab176db1aa8a [162/162] net: pcs: mtk-lynxi: add phya tx rx clock path
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161108.J1ioZmOB-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161108.J1ioZmOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161108.J1ioZmOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_soc.c: In function 'mtk_sgmii_init':
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5612:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable=]
    5612 |         u32 flags = 0;
         |             ^~~~~


vim +/flags +5612 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5607	
  5608	static int mtk_sgmii_init(struct mtk_eth *eth)
  5609	{
  5610		struct device_node *np;
  5611		struct regmap *regmap;
> 5612		u32 flags = 0;
  5613		int i;
  5614	
  5615		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5616			np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
  5617			if (!np)
  5618				break;
  5619	
  5620			regmap = syscon_node_to_regmap(np);
  5621			if (IS_ERR(regmap)) {
  5622				of_node_put(np);
  5623	
  5624			if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
  5625				flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
  5626	
  5627			of_node_put(np);
  5628	
  5629			if (IS_ERR(regmap))
  5630				return PTR_ERR(regmap);
  5631			}
  5632	
  5633			eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
  5634								 of_fwnode_handle(np),
  5635								 regmap,
  5636								 eth->soc->ana_rgc3);
  5637			of_node_put(np);
  5638		}
  5639	
  5640		return 0;
  5641	}
  5642	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
