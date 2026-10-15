Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4125F7A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 03:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034946; cv=none; b=mzE7I8OfiS8ZC+O8y7HwE2n0+UftnRtTb3VfyZx/2An8amFbELOmM5RjBNBOxskHkGUHnEEp2h0Jw+CMx0D74Wl7yCGoR2nuyQlUFCRScT4uHzMpmJNZxnfujGb0z+R89r10gijnxL04jqsUV4WntN7sGhY5krlx+JG8aL+/G8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034946; c=relaxed/simple;
	bh=2xCfs4Cvf5eLdXXTXSvgHVcP9WyKbAZarKlpXI7WXwA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iJWMOZ7B357Dx/rXUovXejN1B+5AifGS5E9A0yTK3F/LS5iT4aA2GJAmQHaTSvx5qaIuLCGfOt9NslKpQeg9Ay+JAc2JQgqa38b4DMEKPbZgbUKG1bvp4CPLBlpglYlCAblcNkl1ep0ha89m8eLMnbc4w/U0Or0l5ejiAvBBBso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GazW/x/M; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GazW/x/M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792034945; x=1823570945;
  h=date:from:to:cc:subject:message-id;
  bh=2xCfs4Cvf5eLdXXTXSvgHVcP9WyKbAZarKlpXI7WXwA=;
  b=GazW/x/MAMviv2aaksVHyeS/5JCBtYYOZhtBeHsDVoX8r+OT2KirKZ9T
   V23E/nwJdJqToEQ4NQ6gFIuPFhCkqJ6O5VdCt4/yzseufVgATg01hhCvu
   2T1j6tAYURiZDzRlpzyFQipNCvLRTU3CnBt9ZmFXbhVVw3Rq3wQ7sUVXY
   ZkNMNSsxrqP2yD8eEL2PKs4kiyMfXrUdwJr0RaG87rOqRcpJmiSHatLHE
   oFx3Y0WHAMb3Mklc2SyT6MXu1q0B1VXHoFTUsl3n2U8TW0d0MZkSq/2rV
   pQ8yLgsjTHLmS75jZqeK5sYDLdlPiNFxCvIvdRZyGxY7WqamsxjiPpY8l
   g==;
X-CSE-ConnectionGUID: KSh4L3l2RgSP5W3cDSLtCQ==
X-CSE-MsgGUID: /ssm1/T9TmuOEgDlXySybA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="792476"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="792476"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:29:05 -0700
X-CSE-ConnectionGUID: /FkAfd3aRwSYjyc8wziHLA==
X-CSE-MsgGUID: o2hppRIlRQa7n7zT47kGHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1470872"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Oct 2026 20:29:03 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHC9M-00000000FjL-3M6c;
	Thu, 15 Oct 2026 03:29:00 +0000
Date: Thu, 15 Oct 2026 11:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rsslro2 15/15]
 utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202610151133.6cRWoiNn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rsslro2
head:   0327d4826547afd9459f4696200a87542fa2fc41
commit: bdff6d95b1a84e9958d6ce222b67b0a07383e849 [15/15] build.sh/defconfig
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20261015/202610151133.6cRWoiNn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610151133.6cRWoiNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610151133.6cRWoiNn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-DSPBitTb.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/mediatek/mt7987/i2p5ge-phy-pmb.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
