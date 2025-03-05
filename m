Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021116426
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 19:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201799; cv=none; b=o72BAsRWWnX3MM6vxOfATiUSJQbH0uwJ0u/bAM88am0DC/796qWNR9af2yX/nV3usxli8OhAfMSU+vR78yckBC/lQg32PRmXszIYQE/BYs4/7G22d/zWylDd+bpqsQWTO88sm6yEWd4Z5wBl8V5K5rFN2TLz/8rUY3oXEo/xWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201799; c=relaxed/simple;
	bh=HhyMPr1/ulxD9eY/1a4Br5kcx7kDyohu922je04SUAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q6vMg56s1IAz8/58aGimjBNGfMM2s/L5/kc/X8fI1kIZtJusQHPeKB7bdKO7XvJGo6lT1bBu8ocEbtgI53f09uG/YBjXGO5kxaoETfItCaQel0tZLOcaPLUZ6YvuzJlvCqOmr2OvzfE1KYlQ+rGFBB2Ux1Vy9mZeyjdcwb13Ktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JaCPFHmu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JaCPFHmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741201798; x=1772737798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhyMPr1/ulxD9eY/1a4Br5kcx7kDyohu922je04SUAI=;
  b=JaCPFHmu/NaTniuZoYrJmOjOjBWmtbtyVyL+PUnJPAPMrBwUOIv4yR9O
   ZgpiLtgAVLVi08hL9JCa4vkYYor5SBp/bMh3UVUgtXjQGkWVeSkSQDivP
   KM7PmZV44OzXZV1SbyBDpTSksfsXb+BjpevXEcXHalV4xKSyldd/pLIYn
   LZRqLlz+v2an4TP5VbgG4fVuH7/4X3bawpdbLbHLxoC7vVdSmPcv1tEwQ
   EU7MMfvMlHLHPj//XCGDvy6CF9FANuzgDIXd2gTm/LMQWhkmcEdf3mOUt
   d2lVDLP/rwpGWMovT0kqVNur89NonP7s+VFc0RJqzpPE7KORUbpvXd5tb
   w==;
X-CSE-ConnectionGUID: OijsierFR8ymqFiMsTpvFg==
X-CSE-MsgGUID: qbBxwRNCQ9eYpe5B3LRr1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44990263"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="44990263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 11:09:57 -0800
X-CSE-ConnectionGUID: EtO20SpxQGSFjF1uns7GMQ==
X-CSE-MsgGUID: HgFlj2U0SQeCS7eRaB3+Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="118949698"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2025 11:09:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpu7u-000M4u-1p;
	Wed, 05 Mar 2025 19:09:54 +0000
Date: Thu, 6 Mar 2025 03:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 0/1] ERROR: modpost:
 "snd_soc_acpi_amd_acp63_sdw_machines" [sound/soc/amd/ps/snd-pci-ps.ko]
 undefined!
Message-ID: <202503060304.toGn4niA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vijendar,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   0645625ef3982594276c7c642afddf7990ccf980
commit: 56d540befd5940dc34b4e22cc9b8ce9bb45946f7 [0/1] ASoC: amd: ps: add soundwire machines for acp6.3 platform
config: x86_64-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060304.toGn4niA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060304.toGn4niA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060304.toGn4niA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "snd_soc_acpi_amd_acp63_sdw_machines" [sound/soc/amd/ps/snd-pci-ps.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
