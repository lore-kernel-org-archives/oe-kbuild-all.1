Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068B380FF2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 05:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785215048; cv=none; b=AZBVNORU3p+CqVDbBWW/ydUbqY8GAQB416SgdZWEaId7nFmYj9E0Y9VpnTlsp5etoYH4AyuXrQgbowFoCKGCa56Nn+j6DmW6/DtBAYduWGDsuDB5PWhuZyKxsZZceZvn6SdV07YjBiwiBH2e82l/j7g+xq3VvAOCtekfXP1TNa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785215048; c=relaxed/simple;
	bh=jf9C204ZV0xIBkrZgWvDvvnuNB5g+Q3+Saidnz7yreM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hn5May+dERl1tM2cg1fXcBgiOwGON4RQ0ujx7sAdeglxuV5sZrya34B7vok5/Grw78HpzSBcQIz7tTCeIvWDyMAgRjDjS7AsiPPyYqkm2X/9KoJIje/nyKPDZAp9Cid7QNGR8qNDwqsyuzRlK2B5nJdiPqMB6qZwbWzWLbSqQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hB7hH4fZ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hB7hH4fZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785215046; x=1816751046;
  h=date:from:to:cc:subject:message-id;
  bh=jf9C204ZV0xIBkrZgWvDvvnuNB5g+Q3+Saidnz7yreM=;
  b=hB7hH4fZYM5oz+7shbudakWjtvHoZsh9ehwO/+L1+KYj5O8PXpg1E4Ll
   THccfLlx0J6SZCmQInBGxghochvGxEASDE11qE2Sm+Aj+TJ6iVgnswaiK
   bz05CbIrptMJM/Ss+xGW70zNAW93kXXu82+ouShTC0ODAYHgO4ZLhaFbE
   t0A25S1ne7ayJeztjwfqvx2qvYbCLSwKQ6DZYVLLW74JExQOFM8TCfKV2
   62c1Pz04kj6mzUNc2tvB8EbdzNU15wHO6WofmXqG/BBhKq20pQIKQrYzh
   zGMDs9GcgPiG6znGVkEe8pPXQFNFIQMcNKUQ8HQC9VPCv/p3Y+rCxs63t
   Q==;
X-CSE-ConnectionGUID: 07WjX+ZxS3KVopYfsQOviw==
X-CSE-MsgGUID: bhzQu+oPQRW4Ph9LPXZI4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103200260"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103200260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 22:04:04 -0700
X-CSE-ConnectionGUID: t0t/LnjmSem5TJNX5Sf2uw==
X-CSE-MsgGUID: Db/quXtXQviU1dqKQIVXPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="263095701"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2026 22:04:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woZyv-00000000e0v-3dZn;
	Tue, 28 Jul 2026 05:03:57 +0000
Date: Tue, 28 Jul 2026 13:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 64/136]
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:16:13: warning:
 'mt7925_mcu_wow_pattern_old_tlv' defined but not used
Message-ID: <202607281209.FWWvdHbP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless mt76
head:   7f932e0223ee060815f66d631767412e329d4492
commit: a6317b82bddff5c838ee486ce38ec56e5415a39c [64/136] wifi: mt76: mt7925: support new WoW pattern TLV
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260728/202607281209.FWWvdHbP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281209.FWWvdHbP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281209.FWWvdHbP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:16:13: warning: 'mt7925_mcu_wow_pattern_old_tlv' defined but not used [-Wunused-function]
      16 | static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/mt7925_mcu_wow_pattern_old_tlv +16 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c

    15	
  > 16	static bool mt7925_mcu_wow_pattern_old_tlv(struct mt76_dev *dev)
    17	{
    18		const char *fw_version = dev->hw->wiphy->fw_version;
    19		const char *build_date = strrchr(fw_version, '-');
    20	
    21		if (!is_mt7925(dev))
    22			return false;
    23	
    24		if (!build_date)
    25			return false;
    26	
    27		build_date++;
    28	
    29		return strncmp(build_date, MT7925_WOW_PATTERN_NEW_FW_DATE,
    30			       strlen(MT7925_WOW_PATTERN_NEW_FW_DATE)) < 0;
    31	}
    32	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
