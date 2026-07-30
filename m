Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09736493F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378239; cv=none; b=R9coLwGhpQYbqNDLGcJvRMPKym1xibZsWICEqLs4p+70Q5c07iSEYBG4nLvCMjglKwyGRpTeCkiNHsm9J8js5CFPYjE4EqyFSJNWfse2/G13kOWfm0nFmbWhZ+yeXSShxyIYS5Zj1K1N+5E8KG9CVORjkAUBCQ5dS462Br4YEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378239; c=relaxed/simple;
	bh=SVetE2LWRVprrtvTOPrIVo5Hs9f9eTotlSrHWezc0cY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n3laQeDT/AettICbQGlnurHjdoFkm/wUUHdYd4U4LGqEgRHqISDiEP5JePBBfTk2DTav0JR/tLe4vCKx7bQvgiYlEc0XR5QN4PDh3+hyoEvwQ2Iqew50otuPtn3WT+BLoKtqlVG0s3b7cv+iLAqIEEeGVCqmt/de5KVwVzn+2GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yb7yFvDB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yb7yFvDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785378237; x=1816914237;
  h=date:from:to:cc:subject:message-id;
  bh=SVetE2LWRVprrtvTOPrIVo5Hs9f9eTotlSrHWezc0cY=;
  b=Yb7yFvDBQyCvsgluedwI2lm55pzcVoE7ymEHsP9hqV5popkOn335DX3Z
   gdiNxq9QpV5osYd+JeYwjPxEFuFZwxxpPlyBBClrMZsxq4G81PTD/3lKy
   r5KeQYuKygRPeRa3o9zm5qDgBXs8nK+O8OzN3e8yCvKunnTyB4zFJqvoP
   /u3qzjSbZL/oqIC1vCPafQGSyApuIye6I/bgRTTpFiT1vieIYiB68BCei
   nlFjO5C/LRvX9F+4cgXQHzLC3np4aoQQgnk8d5KsVdpjOVEAKSRSLCj8T
   1BETXJw7k0mRJ+McWoFKCIqYCeDfX8GR16s1t2DMKTZmysWraTF7fgfxM
   Q==;
X-CSE-ConnectionGUID: 8rYPtoisTaOK+AHLcafugw==
X-CSE-MsgGUID: 0H/Lh58pTiC9dSTea45TYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103531413"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="103531413"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 19:23:56 -0700
X-CSE-ConnectionGUID: DbsIcWe2TyCxbHoL5uAA2A==
X-CSE-MsgGUID: jhs/EN+ORIKEDmlFQr89vg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2026 19:23:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpGQz-00000000fvZ-1U2K;
	Thu, 30 Jul 2026 02:23:47 +0000
Date: Thu, 30 Jul 2026 10:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [mediatek:v7.2-next/dts64 19/19] FATAL ERROR: Syntax error
 parsing input tree
Message-ID: <202607301007.06NsJjPi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.2-next/dts64
head:   75bfd9e7cdae0ae04dbaaf8dfc487adb67b7680e
commit: 75bfd9e7cdae0ae04dbaaf8dfc487adb67b7680e [19/19] arm64: dts: mediatek: mt8173: Add GPU device nodes
config: arm64-randconfig-r111-20260729 (https://download.01.org/0day-ci/archive/20260730/202607301007.06NsJjPi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301007.06NsJjPi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301007.06NsJjPi-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/mediatek/mt8173.dtsi:1010.22-33 Unexpected 'CLK_MFG_G3D'
   Lexical error: arch/arm64/boot/dts/mediatek/mt8173.dtsi:1011.15-26 Unexpected 'CLK_MFG_MEM'
   Lexical error: arch/arm64/boot/dts/mediatek/mt8173.dtsi:1012.15-26 Unexpected 'CLK_MFG_AXI'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
