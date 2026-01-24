Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487DC27E049
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 21:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769288863; cv=none; b=ZA6PWdkZ+dZD/UGvo0Y/mVX7pgxcwoB2rHRTv/H4SuGMHWAKWRnKcXU5pY0bcD2YVEVqHQR6xnHLulqEBV3SuwULiGiNfaUoeaRzKbHd4/TUsJIC0cFmU3NJLI398ip8uHaMC7akNJ50nsnzMQ1E5NDZdTTDfD/dHxrWoWM0PaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769288863; c=relaxed/simple;
	bh=V4lyEl76VOHuZkQnthKutGxRfXyETjHKcg2YIo0FwXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iFm1oEsskATqKLALsEvAmGpwauTk2PUsb+dwWZvnKGsJpswGXgttoTfwgvRW2mntWDC09k5d3EK1WiCX+RbvDL57kqTWsncsnPeWHAkmcGWm5vMJu76cAkqpTCflHaGVWTTKsoAEk4N2s62WsXdFOnMl/DCfIr95OeZhNJRZS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVxddFej; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVxddFej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769288861; x=1800824861;
  h=date:from:to:cc:subject:message-id;
  bh=V4lyEl76VOHuZkQnthKutGxRfXyETjHKcg2YIo0FwXc=;
  b=YVxddFejILzCENUgOgOvaFcBUNzaAMPvZIftZVwN1Gbc8Sv8Y1tlYhFW
   CAUteyMi7TiPDJw/V4zFskrL91y8x6amZ2wSDZDqjSglH43NfO3UyXYKj
   KkuLTHL6NIIVrJYGlxuywY+ZlpEDOOQq2Xja85zKLkjVgvQ92vn3nvBX0
   xPr/MMX2+OjM7+bIkwsjJz7oxq4uhWzW/jFReh2c17DETWtW/gLTZlo6c
   aIdiBDE7GMYz+6WLko1tmNW0uHGr+aoE3bHHkEhfgkEEpV+r3fsqmM2Pw
   t9SxmslSJoCtjSOFR+S/zsKlaBaZ+LIlFPKPPQb/8AL02GoMM7YAW0Std
   w==;
X-CSE-ConnectionGUID: xw36vd88SiOTxCGa1pDN/w==
X-CSE-MsgGUID: jpfxl457RHewPFbft2U6rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70565276"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="70565276"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 13:07:37 -0800
X-CSE-ConnectionGUID: Szr/Gnp0SE+Gq8aJlX3nCQ==
X-CSE-MsgGUID: wHekf+bNRNW0MsszICg5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="237978419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jan 2026 13:07:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjkqz-00000000VXo-39xR;
	Sat, 24 Jan 2026 21:07:33 +0000
Date: Sun, 25 Jan 2026 05:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.19-rc 131/131]
 utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by
 one of the .gitignore files
Message-ID: <202601250528.RopSxGyE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

FYI, the error/warning still remains.

tree:   https://github.com/frank-w/BPI-R2-4.14 6.19-rc
head:   b99e3f4753537bac1067bdaa28a34cdb01cc5308
commit: 7d5f4d88b9e2fba57a61e8d5436dfa7f525578d2 [131/131] firmware: add firmware for mt7987/BPI-R4Lite phy
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260125/202601250528.RopSxGyE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250528.RopSxGyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601250528.RopSxGyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
