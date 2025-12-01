Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3CC269CE7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622420; cv=none; b=a9zc3ui2f8UBzDwv7vDz28X1ExjYVi4DrnB5I6LCr1DfPNBonUV0NqAFEdblzj5b/773ONSl6uiZOTliMISFz1zB+z6Q3ayRZT5Q7/slkexQL/rYGF0xdTx4QLxoIwfaTHJl/FS4cq9T9nEcFCOI0uzlH+f+rfCurhNvi4C/G+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622420; c=relaxed/simple;
	bh=i2yWiMgVN25ldcUU8tIiyG+Pj2a7ODnODRW58yBShYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=leZSTyuPVdwh6306/uXhCz/MDXk+z612mSH17/wQiMkjCS9kOq2gHXWfVBixsAaCZNtOVLB7sTTpql+AdvjLcGfwF6qimKxnnVMRNuM+Wj5dwScNF+KUSBIBXCLqgn02Oq2/BwaCwS8a8sCxJL3pvENweaR+7P+SgFbv+ISVQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I06bCSNx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I06bCSNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764622419; x=1796158419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2yWiMgVN25ldcUU8tIiyG+Pj2a7ODnODRW58yBShYE=;
  b=I06bCSNx/Og3LLqYoz/KcKrAqEZEim07bdaDm2LFGI/GeP3885xb6kuv
   6o+S2X9vyquz0ym7nSdeP1kOjo0MMjZdjUvjL+817RpAHLNwL91EVV/7f
   ZXxLrL9YNGKKN1SnvOTdUU9v5zFERJCcLpHTGUdn4FKYUwLQFv47bhHOy
   nTk9VSLXliYwhGZEuijMzl9DDy8Fi0b+dKqz0eIEmOFl+N3etkfkG1AnE
   2A/SszAOot7ie3iUYcuUXciEahUTXl/dP7KmBAXKzVkMl+PUNzH+ddk4x
   2anFcjZWMC+Iop8FVwBA58RifOr4uryB/Yy0ZpHTYUtzviq+p7KqYt8jM
   Q==;
X-CSE-ConnectionGUID: 3g032Mj5SG6D8ZAnVoY5kA==
X-CSE-MsgGUID: CSu6ae/mQNKUNXwEWW7TZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70191669"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70191669"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:53:37 -0800
X-CSE-ConnectionGUID: UvbOuWLNT5OOCakcOqkt2g==
X-CSE-MsgGUID: L/nRyIJSSD+3tck8JHiWYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194006694"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 12:53:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQAtp-0000000098V-0SbQ;
	Mon, 01 Dec 2025 20:53:33 +0000
Date: Tue, 2 Dec 2025 04:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 24/94] microblaze-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202512020423.MP6A4MOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   4ca6276b4ddb27ef143f7e84817b6e8a2fdb8372
commit: 622c43e416a1c8b7ce2e145f2f1d22db3d4cdc50 [24/94] ASoC: SOF: mediatek: Add mt8365 support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20251202/202512020423.MP6A4MOW-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020423.MP6A4MOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020423.MP6A4MOW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> microblaze-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data+0x98): undefined reference to `sof_of_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
