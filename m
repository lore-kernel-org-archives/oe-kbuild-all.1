Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9D5383
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 00:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749084116; cv=none; b=HZYNWBN6oNUqvCTbULXoveJfpVIWuDqBw0JxXohMGov7woqVFkYQ0XJSA4Brp8pf8fFp9D5n2GgEe+XB2ZtiJR2ZwP1g4Jjj6c98kcneT1/vQhcxyDsnRZYmmKFOR88yxEhF1gVc1yY59wz5U1qTAQgOLD/S2qL/TZgFT8itAL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749084116; c=relaxed/simple;
	bh=kwHl8OvC0S+XLIBpvN/Lk3HLm1Eb/1rFZWl1lb15BMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iu4fsM9nDxxkj9IVdN3oX/gh1JKEG+FdMF3NiqmP07HYwIf+JyziFyeOdQn6pOgpKlAYhMBCEn57LGE/XZTkNDk1XCITwBY/+R4LCiLRrMRHnwBTdFbwabX2gLkipmDngT0tOUBrP/tTy9baFeiRK3o9wxaNWYcOwY0lABFFpUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VyQpz1tk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VyQpz1tk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749084116; x=1780620116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwHl8OvC0S+XLIBpvN/Lk3HLm1Eb/1rFZWl1lb15BMs=;
  b=VyQpz1tk94MVvuCAUfxv+oK8CuZ435Kv2yxkHIv/qVeNsysH4OdG2Hhu
   zJGA889Sas3sTjsa8RA5FB8TzvjPzAIAhlR3LeFRaGmvh6BGc3/9Tvrop
   UsTu8QGI3a08Ed8aidBNIJHn1RFu9tnIicUX9/3ydQiOBQzE/MwEEeMP+
   OmebkpUxx0gSe17RzP4IJ81YvmPRm09ravhhOr4EjDqgBJzTS+LfTEryY
   yvBvyowC8BmrcagCeRNlR+R4wtOmST7jk36huDIVsYTaaURiqer8va8Sd
   uKviQthG8oTtMcr37YrAgv9nZQmQnxTAErQxCK106MMkmjOwRrrVbm66s
   Q==;
X-CSE-ConnectionGUID: 537wpFTjTSe/W2Yij1TLSQ==
X-CSE-MsgGUID: qxICI1p9SFWy3czaKnrGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51187579"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51187579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:41:53 -0700
X-CSE-ConnectionGUID: MV1o3ZTYT+W/3droJRDV6g==
X-CSE-MsgGUID: pFlQ88ZtSNOM4O1Zxq8qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="176222860"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 17:41:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMyg1-0003Zx-2d;
	Thu, 05 Jun 2025 00:41:49 +0000
Date: Thu, 5 Jun 2025 08:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [linux-next:master 13769/14339] drivers/clk/clk-rp1.c:16:10: fatal
 error: 'dt-bindings/clock/raspberrypi,rp1-clocks.h' file not found
Message-ID: <202506050803.IIBuzodB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   911483b25612c8bc32a706ba940738cc43299496
commit: 5610966e6503870d1d6fc63bb194f613c496e095 [13769/14339] clk: rp1: Add support for clocks provided by RP1
config: arm-randconfig-r071-20250605 (https://download.01.org/0day-ci/archive/20250605/202506050803.IIBuzodB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050803.IIBuzodB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050803.IIBuzodB-lkp@intel.com/

Note: the linux-next/master HEAD 911483b25612c8bc32a706ba940738cc43299496 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/clk/clk-rp1.c:16:10: fatal error: 'dt-bindings/clock/raspberrypi,rp1-clocks.h' file not found
      16 | #include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +16 drivers/clk/clk-rp1.c

    15	
  > 16	#include <dt-bindings/clock/raspberrypi,rp1-clocks.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
