Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3513AFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 09:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695028566; x=1726564566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+w6oxSxiXuOkTLNLS005s9K2GeB0Y5R9v77tRZ0bXcc=;
  b=f82cvn9/b+G73GbnDvPxKIDdEqKhV4AY3rFTq+RFLppCPLpnJQcObpJs
   8tsflcHg5NlLrTPN57dHtMCeUM1iYOeQ/wuJPlDxK96dATgQgC8AOo15E
   Zw0UgSTnhzbqC/fc87TDFu3vCFvkFWVJic0blyUXZfzM5RYssQRGWUQt6
   jBtnIuwFDnJTRTw1OEhg3rl43WfMGEe0iPNzpRge+fQ5p48KNdk15m6RI
   TR9QLzBNyBh8qTohiXGkmu9uZyJ+pxAno7eaY8/qfVDD3dQLTKc1QY92x
   jf8twuhDAz/2waLIjVpTVPEOnmqOGAcMvze8PuXicfhdJivTQROt9b+1b
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410561996"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="410561996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 02:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="860985222"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="860985222"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2023 02:16:04 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiAMK-0005ye-2D;
	Mon, 18 Sep 2023 09:16:01 +0000
Date: Mon, 18 Sep 2023 17:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 81/87] r535.c:undefined reference to
 `__udivdi3'
Message-ID: <202309181749.PKanZ1aC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   0e721db5649d18bcfb3219434d24af61bf5afb15
commit: bd8dac2b4d91ff21d9cb9e58c0e68fe385215e87 [81/87] drm/nouveau/fifo/r535: initial support
config: i386-buildonly-randconfig-003-20230918 (https://download.01.org/0day-ci/archive/20230918/202309181749.PKanZ1aC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230918/202309181749.PKanZ1aC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309181749.PKanZ1aC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.o: in function `r535_chan_id_get_locked':
>> r535.c:(.text+0x45d): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst.isra.0':
   disp.c:(.text+0x1a9b): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x1b21): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x1b38): undefined reference to `__udivdi3'
   ld: disp.c:(.text+0x1b52): undefined reference to `__udivdi3'
   ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x1bc5): more undefined references to `__udivdi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
