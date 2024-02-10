Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98089360BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707571284; cv=none; b=uleSbyG8pWJo1eYdhqwnnOJya/oGsuB+D0Utd5izA4q906xIgTh7MLpRqjf/W2mRe1WwxiTPR9o9TNmh4GVbuUeSvrSLby/tHelsEYzfvlERksQtKGAjSLhiOUohPzcvWSpZ2fnnYt2O4mMtXYGDotcrbm1sXSF9HUId5tnprYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707571284; c=relaxed/simple;
	bh=jTHYUtNjaczAwKxQ9zQs/aC9aLTftVw9OK8SJz84Oxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9BzJFiHzYgICO26xCDGlyA1spV+1VtM97UjNyenrHxUFpNyNUUJEYTuvHItS/03MUHoajYUeXoh/80gyXUB2y90DxlhfiB9BapH61SNLOYy0HUP2JY1lJlpxXocQsw715BjPlccMrdVw4DF1Cx+D+kCitK2XtWZzw+J2IN+uU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XoKNInlg; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XoKNInlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707571281; x=1739107281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTHYUtNjaczAwKxQ9zQs/aC9aLTftVw9OK8SJz84Oxg=;
  b=XoKNInlgfl1AwSbxROViuNg882bgy4OWsy7U0gccJwX00+lpeik3Meb4
   FqGnSJ9r3Kw+6JAsLx6yF2IhWEhHVdh38F0yJ2ued5E7GSxFh94/Lcyrh
   AHDr611siSEEprZVHiRUBlfy9yDKCVqDH/fhRBvGt6JSiNZy/p1ci8b8n
   pZdUWY4O2RIuopOh+5Y2sPteCBy/gmv/cDg2cMIVDS3Burg+LLcu0l3Me
   BYBJyUKtmU2PsNyHE8TRYAT71DErCCa5veLOyZQsjnC7/LVKW/wDMb5eu
   8D0kLBuCUjxv5O8/dxPURlDLK0zThu2/BubB1QmCFbPg96f9C8zpqm51D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="395995617"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="395995617"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 05:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2474874"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2024 05:21:20 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYnID-0005gK-2p;
	Sat, 10 Feb 2024 13:21:17 +0000
Date: Sat, 10 Feb 2024 21:20:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jmondi:pispbe/media-staging/be-upstream 7/8]
 ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:13: error: (this
 will be reported only once per input file)
Message-ID: <202402102111.l3RyAwnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   728775b95062efdecedad4df4013a8db5382d470
commit: fb7be10e2d1176b9cdd3bbf901d7795a27837b6f [7/8] media: raspberrypi: Add support for PiSP BE
config: x86_64-buildonly-randconfig-001-20240210 (https://download.01.org/0day-ci/archive/20240210/202402102111.l3RyAwnO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102111.l3RyAwnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102111.l3RyAwnO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:32:0:
   ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:13: error: C++ style comments are not allowed in ISO C90
     __u8 edge; // enum pisp_tile_edge
                ^
>> ./usr/include/linux/media/raspberrypi/pisp_be_config.h:476:13: error: (this will be reported only once per input file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
