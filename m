Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC92E6CD2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246807; cv=none; b=GOqvmDoeiZJ1jrNGjq41XhSxE/IQyewY3dxMyp2NiZtYvKfoVTKGdPa+n0+FIZ98cLpdYIfYuNqwHSKuLSJGwQLxGVdC0Ti+jYBvb2dlhAGj5zL5Mfovm61gjDhbnw7ucRkgSJjqPVmH7PPLXmZT/lG10RUIuyK1o0sThU4U/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246807; c=relaxed/simple;
	bh=83YBn/aLUjX5yn9SCEUsBeQPz17QbTleYXDKvT5qx8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZcdi2iwTblEJCTJ86oeKrtc8u6w01FNPbKDKl6e3w2uckXTvALHNiR8v5y5VA0YXxkLmtnBe1tnlN19QI9NWQQO6AdJMI37DioRNUfbMjL7BlrFQbl29IJhTWdDTbVgc+ZkDJRYWS3q4qbP2FwQTvAUs9+W63ciSu/NFTpkOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFYV2tyx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFYV2tyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246805; x=1797782805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83YBn/aLUjX5yn9SCEUsBeQPz17QbTleYXDKvT5qx8k=;
  b=ZFYV2tyxk+Ka17yyt14k3CcdVgeBBtGFRt7wOOhWBEGCmciZnMMh8H93
   ypSRVWVlTV2pTe3zsMg0clyH6VdqLpjZ/WnS1cq6ZrncEKsqBiPbPPEXa
   ZctNfBnJx8f7h3IP1Kr2Btb+cQpARVy8FxDPdMSFMdEtDW+IR3DK2fRdg
   XMnor/L/Qu20A0A6roOE9U0r1GOQgxeZYNT0b9reb6ts3Fjz5Bx5+mbyB
   yQA2NwJqVNUB3t1yddabz3FTHA8zjxIq0njy8ne85db/Id3gpIT4FMPJE
   SRFD09gvXuI00Iogwxlz2qmEknzLFWAOUoyYSFpdyGEgVToHuQW58/oGk
   Q==;
X-CSE-ConnectionGUID: Pj+SkJRzSpybdpg66qYLxw==
X-CSE-MsgGUID: pdoVg+buSrORpbiyjo+I/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72023969"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72023969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:06:45 -0800
X-CSE-ConnectionGUID: Pmf1T//4RUmkeOFDfU4wlQ==
X-CSE-MsgGUID: CPJykMbYQa2E6/MnndhamA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204185000"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 08:06:44 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzTd-000000004hc-1w3d;
	Sat, 20 Dec 2025 16:06:41 +0000
Date: Sat, 20 Dec 2025 17:06:16 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1/1] kismet: WARNING: unmet direct dependencies
 detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
Message-ID: <202512201749.27PpuBNb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [1/1] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-kismet-CONFIG_ARM64_ERRATUM_845719-CONFIG_ARCH_MXC-0-0 (https://download.01.org/0day-ci/archive/20251220/202512201749.27PpuBNb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512201749.27PpuBNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512201749.27PpuBNb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719 when selected by ARCH_MXC
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
     Depends on [n]: AARCH32_EL0 [=n]
     Selected by [y]:
     - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
