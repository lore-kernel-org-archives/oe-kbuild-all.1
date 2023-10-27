Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD75249
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 05:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYKQ1EEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698384189; x=1729920189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dbdb9UD1MUdZ/QApxxwvUaC0j5cqW0ciKnr+yH5q7UM=;
  b=eYKQ1EEvrPbSnM7eRgp59J+lWwRfQUnWXjmzJ2hlBDWSu+ZOfcpLyPy9
   4Wae0tfMY5WCIynYHaAKlpDW05SfGzvBMdXXykjgRcY2kKO3dx8suUtkX
   cIcboMkqiF7yhWw8vih2c8Hq9PnnJiWtE1FlFexI7acKCQOLiL4J520WD
   lttus6aAlNPxKgS/cUhzmoZzIoWzncdRHEeN6BwYJXGGDPXoOxNVZo8we
   HqVr+cfmZVx6Gph6l67pVbmDGKbMAvHdl69EQeH74QT4otYXsK57ZMOlu
   CXbutpY0sWqYQTuCLnI+5h844fLx6Lntr3Ta1d1ostlFz6yaO5NBhXliL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="367055411"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="367055411"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 22:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1006642523"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="1006642523"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2023 22:23:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwFJJ-000AVH-2B;
	Fri, 27 Oct 2023 05:23:05 +0000
Date: Fri, 27 Oct 2023 13:22:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
Subject: [drm:topic/nvidia-gsp 41/48] disp.c:undefined reference to
 `__udivdi3'
Message-ID: <202310271316.3nkC9uV0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm topic/nvidia-gsp
head:   c09ddadcb054bbbb45b46e1dd0554a3ee1a96328
commit: e9ad7a2f99667b6ba6ac966050e5d7d6b5e485dd [41/48] drm/nouveau/disp/r535: initial support
config: powerpc-randconfig-003-20231026 (https://download.01.org/0day-ci/archive/20231027/202310271316.3nkC9uV0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271316.3nkC9uV0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271316.3nkC9uV0-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst.isra.0':
>> disp.c:(.text+0x1710): undefined reference to `__udivdi3'
>> powerpc-linux-ld: disp.c:(.text+0x1768): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x1790): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x17b4): undefined reference to `__udivdi3'
   powerpc-linux-ld: disp.c:(.text+0x1864): undefined reference to `__udivdi3'
   powerpc-linux-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x1928): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
