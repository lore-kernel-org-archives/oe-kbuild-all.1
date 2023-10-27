Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0527317FA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4Lt4mfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698374641; x=1729910641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4mugV94xtN6ArBLC2Bi9kr38jFoJqH6EP/V0ryBenk8=;
  b=M4Lt4mfQp2CYgkFtHka9ZakSRZwYsvKoud+Xo3tfJ0rBbU7Bt8ifq5ke
   rX61wPp5l+S2zaVJ83ZHBwv82l76RTn2/I+YnQtS9OD66z1aURGbQEWpt
   tc8mEZEDh5lW0zl+WDMT2Lhwh+0dFohR9lW/zKlFRQutwrJy/MGA2zH/4
   +DnF0TCQaNdU47qsBR9wqOEWwawGI2hJajLSxUiE41uMn2H2r3WWBJ1l8
   dzqyL8xIcNuOeq4H/t3sWXpMRQSdPcgUIYWj2vCbeFrRBgYA7Fl3cVISL
   ehaM4VwFFS4UtqZ1FjbIp5iqSPjqZIUHoKI0T70Em5SunKcqIVcPmWfJH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="509281"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="509281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 19:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="788695581"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="788695581"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Oct 2023 19:43:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwCpI-000AMR-26;
	Fri, 27 Oct 2023 02:43:56 +0000
Date: Fri, 27 Oct 2023 10:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
Subject: [drm:topic/nvidia-gsp 41/48] ld: disp.c:undefined reference to
 `__udivdi3'
Message-ID: <202310271011.kL4E5dY2-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271011.kL4E5dY2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271011.kL4E5dY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271011.kL4E5dY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst.isra.0':
   disp.c:(.text+0x18c3): undefined reference to `__udivdi3'
>> ld: disp.c:(.text+0x1943): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x195f): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x197d): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x19eb): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x1a09): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
