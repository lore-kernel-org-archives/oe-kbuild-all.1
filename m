Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4748825A62B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 04:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738555289; cv=none; b=CFJ3W8jRD55w57z/dpu08drxoM4gYiRmhWEvSrQNbp/bcSNxr8797vMZEC33XdyIk3tlBAwVAh3+ZRpiVFJh+3pXyTY2j4xVcoAjcUIgf/tNAQfASD6ZSHiAauaeKoulhyV2jQVgTEXACdseH+d3S53tkje2dMr/eoRiU6GgLzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738555289; c=relaxed/simple;
	bh=DL3sV6njScczSUvUxSeSTCBBrLNtPeIeXYvg/MAJx3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+Rg0oojSVTKD9M8QRti1LR/ARV3nZSOPToHoo00NiX5UX4PwiK7m97Ir4xoUlnXFlyWXaiLdDREiKS9mAUaEIvWdY2IHHXEypwrw6jv3AS9gf97lQxI5NxJveQqptJ9c+3NDkjOW+ZHjdbnHrvAGzTfMfm/k5dgmktXALlGAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTxX55nh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTxX55nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738555288; x=1770091288;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DL3sV6njScczSUvUxSeSTCBBrLNtPeIeXYvg/MAJx3w=;
  b=RTxX55nhfn1qOpi/geP8YV9ZyC87qkoYCJPx4jsb5tUkXUI4Vm9JnH8F
   UWA9FQVPxknxL3XaE6uuy+Cgs6j3rWNO14bL8Lg4iELs3CdH0uOqihTBu
   k8h4pl+biZm4pjTsQYFRJ1qpCSvTfM2m/EAMdikr7vZPHyF6il0n4622O
   +7lJKm8Ibt09gjNa1Uq6vxbPjWOiid89nYR+GPSP2ISSBKPWRk2q7j43M
   6FmjnEDqYHK71b1Yn+bSELa/sfHqIUpNmbgdXzsgOVX4CCKi2aMXlBpoZ
   x24SRuEoYsAFfvp4NcFEbquuwsuVv2jnl9R8l4waUTex5TQCdCcJMw0Kv
   g==;
X-CSE-ConnectionGUID: CoEO8HQMRaGjZQKkIFRFtg==
X-CSE-MsgGUID: RqcS/N0GTjG6TYEFV/MfDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38930135"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38930135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 20:01:27 -0800
X-CSE-ConnectionGUID: ytfDOOKyS+iLvlIRoMyUBw==
X-CSE-MsgGUID: Sstzbc3QRMuHObm50pZjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114198132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Feb 2025 20:01:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teneF-000qTb-0x;
	Mon, 03 Feb 2025 04:01:23 +0000
Date: Mon, 3 Feb 2025 12:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [broonie-ci:v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
 7/11] sound/soc/intel/avs/tgl.c:10:10: fatal error: asm/cpuid.h: No such
 file or directory
Message-ID: <202502031109.nRD4UNlc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20250123_cezary_rojewski_asoc_intel_avs_add_support_for_maliboulake_configuration
head:   3318c70b5b94baa4e764ab05fa97c74643e7dc35
commit: de555b6bab20afcb0f7ba2b2ac3ba9877fa77a5c [7/11] ASoC: Intel: avs: Configure basefw on TGL-based platforms
config: arc-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502031109.nRD4UNlc-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031109.nRD4UNlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031109.nRD4UNlc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/intel/avs/tgl.c:10:10: fatal error: asm/cpuid.h: No such file or directory
      10 | #include <asm/cpuid.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +10 sound/soc/intel/avs/tgl.c

     8	
     9	#include <linux/pci.h>
  > 10	#include <asm/cpuid.h>
    11	#include "avs.h"
    12	#include "messages.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
