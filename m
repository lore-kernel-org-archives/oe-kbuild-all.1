Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C91E00AF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 17:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725472000; cv=none; b=ZZyO0MgATn7q4kt0ucghVEoByCM8Z4utkq1//OT4vzF4UGe6pVgoflNdB8Eprvskj++GFiwM/L2ZatHzJs3xLr17KAatm7b9msn2LxE9wG2a13o+gpy7HRw65OLdi699pNjf/XLo1dH4ZNup/uY+g9QuQSXR1LRllNOgAAc/tXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725472000; c=relaxed/simple;
	bh=KCY8yoAEiPOVTaS/zZyQuYF4JJg0CIVRfk3Bo1xjX9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Msa/zcva7RHPQMkzx3xf6B8YO+HavTvlgTBWGUBRxfFSPC3rFlwVcN1IZvj6g/UqbMwVUoy0c+PUzBM379keKC5xQ3mPiLaveJB4e1OxbjSNWrEupuV0XwLNeibLaSmNe9UbCmbjXLW/QH2nxPC46dXibOklG0mrSx+K1ZGaxuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfrDO2/r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfrDO2/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725471998; x=1757007998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCY8yoAEiPOVTaS/zZyQuYF4JJg0CIVRfk3Bo1xjX9E=;
  b=EfrDO2/ry/kfTgqxiubPb5FaA7/bMdCmxE782ZBC945DYC5NlSEr/7oN
   HiTYlq90WXD2/qEGcUzirhtqOVbmh+reh/nOO+K5F8607J4fI6rxyHcKG
   FWiO3IJP90yD2vbX63ag6W4IiCCGvv7FF2WF5J7mUKycmI787+jyTr64B
   cPRVp4ivrbHbZf7BLLAt7WI/CLDpjtqpukP+Y4JqJT7u+QXliXvFY+rL/
   u3KyuGQ+emwmpj8NZPvS2HFpiHdtMzp7DRND7pkxDKB0RWsBAP23cvH7P
   w3K1KpCp0ctfomOXzxDh9VlAxBeqqy2fAwTUkFXIOCLXmtMbdBruYk0lQ
   g==;
X-CSE-ConnectionGUID: mZ8HYGEjQj2NY3sRhkj9CA==
X-CSE-MsgGUID: Az7yggBSQiyHEa74hh6Mtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34755616"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="34755616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 10:46:36 -0700
X-CSE-ConnectionGUID: ElXsZpeASLC0h4lQn8plFQ==
X-CSE-MsgGUID: fcC4aBYFTWelnq3CDKjYRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="65564834"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Sep 2024 10:46:35 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slu5Q-0008P9-1j;
	Wed, 04 Sep 2024 17:46:32 +0000
Date: Thu, 5 Sep 2024 01:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 15/120]
 sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but
 not used
Message-ID: <202409050140.lKRyuCWZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   8bb0ee8e8fd75aa60a4bb4efe074711f2c35ca5c
commit: 8abf78049fc87a9a4b8e8a7a668b855ff35a7490 [15/120] wip: ASoC: cs42l84: Start new codec driver
config: xtensa-randconfig-002-20240904 (https://download.01.org/0day-ci/archive/20240905/202409050140.lKRyuCWZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050140.lKRyuCWZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050140.lKRyuCWZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/cs42l84.c:1019:34: warning: 'cs42l84_of_match' defined but not used [-Wunused-const-variable=]
    1019 | static const struct of_device_id cs42l84_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/cs42l84_of_match +1019 sound/soc/codecs/cs42l84.c

  1018	
> 1019	static const struct of_device_id cs42l84_of_match[] = {
  1020		{ .compatible = "cirrus,cs42l84", },
  1021		{}
  1022	};
  1023	MODULE_DEVICE_TABLE(of, cs42l84_of_match);
  1024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
