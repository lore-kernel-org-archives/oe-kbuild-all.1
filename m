Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E53CDDCD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 03:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781579605; cv=none; b=QK+XEubVClXfO1xOrZpeLiO4ZrVaigX1TAPFzQlFV4Y9bzHfsmSsrK+qAlJFye0NEnDYiai2PNHOTmIoniAClSxteGMB6ruDzqrq7OrpCKnA1osWHtqK9K+yc6d1BRrSKCLOJPHhoatYC8NXt45ErUu4DuYoLklMpR6qB4wT7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781579605; c=relaxed/simple;
	bh=+L4tdxTYVeGZloxG7k56wXRTF+QIPpgDQ2NbD/T/4Ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LlxcyPKWRtgJ9aTx2rxwNUsLD+I4x8/5QzJxmfrweoTdjwJWwGF0ZqL7CGZl3xbHfNifGUBh6PfHMsZ1zqFa1c0fV/7yA5jeKAcWI0q+niiQsi4zHxhpb2AsTu3uXwwRzi0CEaDuBNWebTnW4wzKh15HsBDJwk7DxzLwYy17nXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUcpx6PQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUcpx6PQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781579603; x=1813115603;
  h=date:from:to:cc:subject:message-id;
  bh=+L4tdxTYVeGZloxG7k56wXRTF+QIPpgDQ2NbD/T/4Ug=;
  b=AUcpx6PQUP3wNNaLzKcubJWua5toZXtkDeTWs5jNF0SrA80PpiPBJr0W
   pUTLwUuxWbWPmEZc/6v2cfScCReOKlwNGJluxb1whA4hxXSGPPj3n+9rj
   70fqTbF+ejZkK/49UHhbNGU0xPFYOoQVoXIsJnq+tURWzHZPm0z+Ak7Ej
   x4o45DU88pPC3osa6VHootl2iNpEDJ6MCNkLlZHq2HkwcIDnPbVC2RX/S
   WzQN1/Fwi47xgoazIUs2fB3hpP85DVvXi+Ja5hqvPEiFAS2XsCA1HfcT3
   BLlFgBqqu3lBCdxA988tUstLbeTUCzgby9G2rVUuX8ZQJPGli4wwMLG47
   w==;
X-CSE-ConnectionGUID: f0DiU/nXSsSBEd5DWl9Deg==
X-CSE-MsgGUID: SB5X6dy7Suqq1OgCEuc0jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="69879221"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="69879221"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:13:22 -0700
X-CSE-ConnectionGUID: jeREqOIhS6aO1Ztl/TupnA==
X-CSE-MsgGUID: gOYGVa0iTcudMuVvzz8bMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="244752970"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 20:13:21 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKEo-00000000Sem-3tTI;
	Tue, 16 Jun 2026 03:13:18 +0000
Date: Tue, 16 Jun 2026 11:13:11 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 166/166]
 drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype
 for 'mtk_xfi_tphy_valid_ctle'
Message-ID: <202606161100.uH9Uqjp1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   c95b3b76f17fc39ff9ed52ee3e3f0bccc707f586
commit: 93d09f4f4b72a6b829135dfad3eac1c1684ccbe6 [166/166] phy: mtk-xfi: add mtk_xfi_tphy_valid_ctle for use in usxgmii driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161100.uH9Uqjp1-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161100.uH9Uqjp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161100.uH9Uqjp1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/mediatek/phy-mtk-xfi-tphy.c:75:6: warning: no previous prototype for 'mtk_xfi_tphy_valid_ctle' [-Wmissing-prototypes]
      75 | bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/mtk_xfi_tphy_valid_ctle +75 drivers/phy/mediatek/phy-mtk-xfi-tphy.c

    74	
  > 75	bool mtk_xfi_tphy_valid_ctle(struct phy *phy)
    76	{
    77		struct mtk_xfi_tphy *xfi_tphy = phy_get_drvdata(phy);
    78		unsigned int val, ctle;
    79	
    80		writel(0x00000404, xfi_tphy->base + 0x00);
    81		writel(0x00d600d5, xfi_tphy->base + 0x10);
    82	
    83		val = readl(xfi_tphy->base + 0xd0);
    84	
    85		ctle = FIELD_GET(GENMASK(12, 8), val);
    86		if (ctle > 10)
    87		       return false;
    88	
    89		return true;
    90	}
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
