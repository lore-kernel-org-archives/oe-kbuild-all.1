Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26AEAF6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729445339; cv=none; b=ReGWz/mV0CPFXiBXG87a6jVT3pdGbIkBXoi4szBmY9H8n6piF/BjsxXe736ab/DAovBRgjKFGClag5fZ6gM/zHNN1+eiD++TmYBXH4sE3Ke3iouDoyhFQQ9a/L5UQrCTTeTM0NDGJ/LIqwA6Mds3Rgja+J9fIN+HEQwJazlg/Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729445339; c=relaxed/simple;
	bh=f7m8N5pa/zYQdlyvWceKMw53nFoBkmOhNWSg7ufdydU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uIqmX3pC2ltu+MJ/7m8jXPv/e24/pBHtrM0VbaPTzHsXZB7CqpX5XzsOWsymfLn1DfgcQHcBJq00BC4aHGxJZLja5tFfDdLKv0llCTifL4kaWNUx7qUrku2YMyGfS869kvIZgb9cDAESfVwQkwpdvtV6GCN3xGlDx25O58rzQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlYpQCRP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlYpQCRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729445337; x=1760981337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7m8N5pa/zYQdlyvWceKMw53nFoBkmOhNWSg7ufdydU=;
  b=VlYpQCRPPN3t9XPY6UDpSoE0Lv2AdnNqhE33tlcrMZp02W24yR1mXZqm
   ssIompTsxPygBWJqCsBgf9sc6N8fT9bqKLLkMqdLyyUyPeQZcDPPhhck4
   X/s/YCrlHVm2qTa7zj2Zw/6onMVlcasaq9CffjcEbiLOJ2qnVpEIAmE/1
   PFWN/Gg9il7RRzhFGOZrXCcp/qHGNwi0T/A5p8HR9j59jSjhO2vlvlQZ9
   jYo1rKz5bsIttORrLNGG4sMBfIfuVH5xTVMZ8YJ8czMEqDuxpVLYJArnQ
   di4NDyafHBTwrp+wCbgXj9IgFVWn+k3FkKXG/3CQLNNWg4qSK7OSwHIbs
   w==;
X-CSE-ConnectionGUID: Roul0JXNR/aNiDKJSmRHcA==
X-CSE-MsgGUID: sb9uYT7kRvqfpvq4eWrTVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29140221"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="29140221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 10:28:57 -0700
X-CSE-ConnectionGUID: I9Ji1PlgQTCGQyUgRplFHQ==
X-CSE-MsgGUID: 3of9+cEXTgSCgfKpyWvrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83934951"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2024 10:28:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2ZjZ-000QXL-1v;
	Sun, 20 Oct 2024 17:28:53 +0000
Date: Mon, 21 Oct 2024 01:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [linux-next:master 4122/5686] drivers/net/phy/aquantia/aquantia.o:
 warning: objtool: aqr_phy_led_polarity_set+0x80: can't find jump dest
 instruction at .text.aqr_phy_led_polarity_set+0x133
Message-ID: <202410210134.2PQESVqi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: 9d55e68b19f222e6334ef4021c5527998f5ab537 [4122/5686] net: phy: aquantia: correctly describe LED polarity override
config: x86_64-randconfig-121-20241020 (https://download.01.org/0day-ci/archive/20241021/202410210134.2PQESVqi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210134.2PQESVqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210134.2PQESVqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/aquantia/aquantia.o: warning: objtool: aqr_phy_led_polarity_set+0x80: can't find jump dest instruction at .text.aqr_phy_led_polarity_set+0x133

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
