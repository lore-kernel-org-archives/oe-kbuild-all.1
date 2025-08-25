Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341825A357
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756149877; cv=none; b=oc6o83QG2/2npItHI6Uzzzd6hdCjQWxCHmiBtVDEumojKW4c215Q5q/IwCywbLqICZ3zK8qWrBOhR+JFlBxRbnHbIM3hgFnJR8UcqoK90yJP2j8CEfvj06sP0t+fyyUirnlkRuthMLMisMNsJIVEaxYAjiOPJAIx4Sv0FWL3ab8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756149877; c=relaxed/simple;
	bh=qaQnBju8kfpKFBjb6dtQ+akGSMQCcgYSQGWUCYrqBY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hg9byxde6gfQeDu++HnrkVAfrCqd311ata+OnjLbEu1EwaosxE7oqAwYDcE7/3m+1O379W/atAiRneKsv0FGMZbrsBX9MLZ6ZaOfpW6qNQCeBpBkYupPh0RrDZfpBzs7p0QK3uSyHY4uf0+f9EwJa5+25WlS8br7LWNPYrPzN4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TVEUCzj+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TVEUCzj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756149876; x=1787685876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qaQnBju8kfpKFBjb6dtQ+akGSMQCcgYSQGWUCYrqBY0=;
  b=TVEUCzj+D9p26LVmHI/T4Jwcs61w/rBfnUZJEc4jUcB3nSo1TRQ/Es/J
   GhedUm2/h2QvLQlVsVVmFPbz3Ldwht8lkDcrQ7y5qiZm9R44gOPWCdi5w
   0MhiY2rrFomFEhMoVxG/fcJ6TILVyTcFxLTcmxSLq5VV1KRHxXYBibIh0
   KPCM7ky6fWCKPITjbYBbS3qmPoeDH38gxDaliFDHsk/9ftQaYVzzbTuFx
   FFuZ1PBDCoYRWW5oL4S7SzY+5ONofGlzlTv3lzTCsrZfVQdNPh56yqsbB
   TpriwQisfxDNKkS/pTjxTADhPt2R9Yd6DXPLymtvivxI05bwMgmD5ohtJ
   g==;
X-CSE-ConnectionGUID: 5k7IVCiVSD+rVp3ybPVN4Q==
X-CSE-MsgGUID: 3yresum9TyySmjNMSYJAPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="61006252"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="61006252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 12:24:34 -0700
X-CSE-ConnectionGUID: Qf6YGPYnQweCP93N7UatLg==
X-CSE-MsgGUID: JGAD+geKTCSg44FCq2qj3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="193043776"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Aug 2025 12:24:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqcn7-000Nxf-0Y;
	Mon, 25 Aug 2025 19:24:10 +0000
Date: Tue, 26 Aug 2025 03:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2725/2725] kismet: WARNING: unmet direct
 dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
Message-ID: <202508260331.bV3mRcFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   90c9bda5f31a94a3097afa522e7d2c94de817288
commit: c5a4bf91167c714de74c47f5cd6d888c66e9860d [2725/2725] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-kismet-CONFIG_RESCTRL_FS-CONFIG_ARM64_MPAM-0-0 (https://download.01.org/0day-ci/archive/20250826/202508260331.bV3mRcFF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508260331.bV3mRcFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508260331.bV3mRcFF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for RESCTRL_FS when selected by ARM64_MPAM
   WARNING: unmet direct dependencies detected for RESCTRL_FS
     Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
     Selected by [y]:
     - ARM64_MPAM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
