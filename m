Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6638833E4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749308401; cv=none; b=ApdKGOhIPWWTdsAmxysNFWP/TMcpsxuJw55bGVP7hp9ZWlE6RFXYn3Ukg6JDceZ41Ct6pa8Qq3eiaPHhWXgePObegZVopF1XFUI3vljaJHcccZceyUoxtp/R3Q3oAu/9Ih/HdisK+M51VNFG297cW9Ro5V6yt3Tb4Jo0X61GCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749308401; c=relaxed/simple;
	bh=ICACn0M7Jhu6vERNds9+fR3wtxhCSFR32lgvS3ym6DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwa8lRHV6LrhmS6eZGXkRXjp+6Lu1+AnRKFgXjylLgZHR0q0wOycP4/GLdZ2PTjS4mQxdMY43XQwcBpDga4xT5IzefyAKrGunylfPFgaMUogbkFFkw8vFY4HL69dXcPNP1Yo7CmPMHcocDEcQ+lwQZE7Tc+f+Kojr1RtluufQb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkvHLzf5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkvHLzf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749308400; x=1780844400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ICACn0M7Jhu6vERNds9+fR3wtxhCSFR32lgvS3ym6DA=;
  b=BkvHLzf5Sp/B8lKF6OY3V1P2fRMYgMI0otrM60cq7HZvG6CcZs736be5
   /SwCuSPlR3zm2Lquyamhzsx8ab2oMNR7/IZSW8jwPT2Onu8LIpKakTAfJ
   K/C0k8L0gsQiQzSMz69aMBVeFsttsZo2ZDzA6PCpmjiLv28ngS9UKPO+j
   uriMVAX8UjgknBCWkhzQHt2FqOzHVMPsqilhbj/5sajch8I3SH53TOSV4
   sinSnvvxnJBiZe59dOO1s5kKRQFvAL8w1XjE7qAsYR5FrPcQlSQFyHAcQ
   m+Ww8LHpdmGeH0M44FuuKjU3hT6gLOxH0AjFmvSzQST4YZ6lXNGDPo+ns
   g==;
X-CSE-ConnectionGUID: SrBLFByzQyO/dFBr/nacBQ==
X-CSE-MsgGUID: kbRv9ghwSdSbLD5PTSE2SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="62795258"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="62795258"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 07:59:59 -0700
X-CSE-ConnectionGUID: qswjz2ULTf6j9YIH4TD3CQ==
X-CSE-MsgGUID: y6PiEMwDQeSZZdfWLjXJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="149909673"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jun 2025 07:59:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNv1X-0005qX-37;
	Sat, 07 Jun 2025 14:59:55 +0000
Date: Sat, 7 Jun 2025 22:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vsyrjala:flipq_3 15/30] drivers/gpu/drm/i915/display/intel_dmc.c:
 intel_display_types.h is included more than once.
Message-ID: <202506072244.cuEnJLVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/vsyrjala/linux.git flipq_3
head:   c259bcbe1b44f19fb55361ab7c5f53a270af7db8
commit: bc7611ac212dbbb05fa7ee3c2e94636c56ecaabd [15/30] drm/i915/flipq: Provide the nuts and bolts code for flip queue
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506072244.cuEnJLVe-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dmc.c: intel_display_types.h is included more than once.

vim +33 drivers/gpu/drm/i915/display/intel_dmc.c

    28	
    29	#include "i915_drv.h"
    30	#include "i915_reg.h"
    31	#include "intel_crtc.h"
    32	#include "intel_de.h"
  > 33	#include "intel_display_types.h"
    34	#include "intel_display_rpm.h"
    35	#include "intel_display_power_well.h"
  > 36	#include "intel_display_types.h"
    37	#include "intel_dmc.h"
    38	#include "intel_dmc_regs.h"
    39	#include "intel_flipq.h"
    40	#include "intel_step.h"
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
