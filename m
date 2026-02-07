Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8C2FDC5D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770452748; cv=none; b=deiy3FIJkL5+W7NI/tg7Mnk7wo14qcyVN/8cUK4q9knTI5UYqRPzkNfMaFZ57wxziJmmMGhrcq+/4TiLSsJPJQktoVbtzjml6Gy7mtxmoU9xw31CJmcUMV5PRJ+e3Lkgjjb3Xu5NFKeLJRy68vcsIu4CadaAD8ADxK1/qLVJtys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770452748; c=relaxed/simple;
	bh=o6z8MjwS31EuzEXJA411Uh8socK427/OxphEWgTD1n0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nokBz+EGp9UcOYNzeRtKoocsHnpvFdwiaBwGwTVMbeOdBmYF/J36K/J/KkbjT5UlEligFddtvPc081bB5dKoCFsDKH/v9gYAcXJ8Iz32YTzvYw5PTylAirdsQ8z30kHkmNE9XzWk8qFXhbxSAaSeov859g7CS748GGJExb2vyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jwm2TvHb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jwm2TvHb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770452747; x=1801988747;
  h=date:from:to:cc:subject:message-id;
  bh=o6z8MjwS31EuzEXJA411Uh8socK427/OxphEWgTD1n0=;
  b=Jwm2TvHbVUo1VYvyM20gyzcpMzfdr3w5t/lDlus4oBO/AJ0RC7XR6FXo
   pR1/cYOdHN6bK+SG+4cYc179AcmN8mNFa3YpW6UBsOpvUR6XSDTRkjceg
   4YKUGyCc3pSu8KLaYZ+5Nr2swLFLPrmCuKqIJSjCTr5X1TN4VKkD34oDT
   2ersOtlRhtQYqx7XKQxGOIaVrCl+PYuJ5aCe9xq8msP2ZvSyUkNEVX6mV
   +tVgrLs7xoMSV8S5k1rVYmdEYZzInHk1bv7O4FjfAalQuTCaOgJqn2SgV
   B0w03gHwCZy9sO0ou68NpqZME5tFJXYokVocy52UMFNh6G+FGGR+Zvnf/
   Q==;
X-CSE-ConnectionGUID: o7WzUNBRQCmALjn3BkBLKw==
X-CSE-MsgGUID: FDUfOg0fQi6tQxc4BENkPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83093114"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83093114"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 00:25:39 -0800
X-CSE-ConnectionGUID: HVwZkBWqSE2ET8X3Pti8kA==
X-CSE-MsgGUID: Jj+ctmKzSu6VUC5taAim6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210389425"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2026 00:25:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voddG-00000000lVw-1bd6;
	Sat, 07 Feb 2026 08:25:34 +0000
Date: Sat, 07 Feb 2026 16:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-as21_192 144/144]
 drivers/net/phy/as21xxx/999-ephy-as21xxx-01-update-driver-to-v1.9.2.patch:
 warning: ignored by one of the .gitignore files
Message-ID: <202602071624.o9lioEvP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-as21_192
head:   a16f3f4d09f2d008300fd2068475d5a12c3df8eb
commit: 91228580f4aa7a9bdeb1bc9332e418a82412cbe4 [144/144] net: phy: as21: add patchfile for 1.9.2
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260207/202602071624.o9lioEvP-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071624.o9lioEvP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071624.o9lioEvP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .github/workflows/build.yml: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> drivers/net/phy/as21xxx/999-ephy-as21xxx-01-update-driver-to-v1.9.2.patch: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
   utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
