Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604801C3BFC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167176; cv=none; b=bJEjEsFgkHuRuwBXqVYoc8a1q8fOyW9YpPARC87g5W25KyZhG1kMWIdMaIKmTCexYi6pdEL2rPaozAlDL6xevtrWtXQiStMthsrlXR6ZMqyGFxfgD/wucL8rJuLCH3B7eMTXVw4GVQCb45X40BEb2OnCDJ9gGHNNup5JC3lKO8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167176; c=relaxed/simple;
	bh=9ViDNBSBi/hZr25O/FqL+EhlNLlo+f2Dq0bNQg08P7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bY1ptpzi4PBiLvDJ0LvWFc3ISJVT1Fy2GvJ0pb3BIE5//ATmjHu+1EL0uSSeYirI9kE79Bgy0xr9XHyoz2Qb/OWJFSoPelRX5s6+gfHmMh9BSx0GALQj+Nb+9xE2iseaDNKwLL/V0XsukEfytkt1OH5eYhHU337W0FPtji6Mxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+AVwMsV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+AVwMsV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747167174; x=1778703174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ViDNBSBi/hZr25O/FqL+EhlNLlo+f2Dq0bNQg08P7M=;
  b=m+AVwMsVCvDS12OMay8ZUVOMN0wBoAGPhGibXorqyo7yVxYdyX7S5HZZ
   49chgajpelJY20w+i99adJaKRHZgSxHFXTHP3bpQweKI5CMXwY6JrcaST
   yS0MyVSxAFiGbviesjJRkvNTlLZWqCJquxA17HrT/bQdEM0DocWoZzbiZ
   ClAAAhbDM9nScrK/7ldPNnPVl6U125fXcJ8++JR7NVGSCTNtfikA2H9YS
   z7lDiXYrKs1/HNtLBqHUyhaNCAegWeBiANsi/ydVDhgvDMmv3wYhrq8BI
   V2IWhS5co9owcU2TRLzgEhHVEUDHDZjFS+n3BjXmnGmfEraIYCe46fxEU
   w==;
X-CSE-ConnectionGUID: +8oO+0m0Rhihe1krWhduhQ==
X-CSE-MsgGUID: LBgDhSjIRIyulj8bv8DNKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66585586"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="66585586"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 13:12:53 -0700
X-CSE-ConnectionGUID: 8TapMhKPSiiVQFoWZN1PKQ==
X-CSE-MsgGUID: LOOAkPjCSlm1lnPj9YucHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; 
   d="scan'208";a="137734191"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 13:12:51 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEvzc-00012w-39;
	Tue, 13 May 2025 20:12:48 +0000
Date: Wed, 14 May 2025 04:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 9170/10774]
 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb:
 nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
Message-ID: <202505140434.eVLVb8DW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: 0d57ac1f92c7558b5d1b8f9780b9eb2f0d06b284 [9170/10774] Merge tag 'socfpga_dts_updates_for_v6.15' of https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into soc/dt
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140434.eVLVb8DW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140434.eVLVb8DW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140434.eVLVb8DW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dtb: nand-controller@10b80000 (cdns,hp-nfc): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mtd/cdns,hp-nfc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
