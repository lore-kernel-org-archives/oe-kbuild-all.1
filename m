Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249515A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675600280; x=1707136280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+qTRydaUb++ywVDQM+GDmRE/kPNqO6g2tEBPQXynbw=;
  b=lxKHwLCmKlZmmekoT0I19cbSzRH7ogXc0ePiGechCBS8sZ/sLIv3R9Xu
   WYNgqfnb0Zn6Q1HEThlThph0Om2IWcur/islUbJT5x5nTGqWCYX5OmoBk
   NhxFzoEcYUR/o+frwdnNTFCvg2ptIelME9yDAVXAcjsItgv98l3Bf8kk1
   vrXzLKEMuy+lyh5IQs1Ti7DSD1e1Dp2M2/ZZz3RF9vmRUdskIqLTtyNfB
   qVfEVmzVjOlLmwd6OpEjwfnjbd6X93XNXP6cXzgCAY9uKJHpnhZ5eMcM2
   waQ4qggNtwKdyLi5XVb2YSKjzSaHxHNm6WbiMYhfHxRVabSKJ1iBqAg4C
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="317046636"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="317046636"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 04:31:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="729757683"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="729757683"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 Feb 2023 04:31:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOeAw-0001zo-2I;
	Sun, 05 Feb 2023 12:31:18 +0000
Date: Sun, 5 Feb 2023 20:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 1530/20208]
 drivers/gpu/drm/bridge/nwl-dsi.c:838: undefined reference to `__udivdi3'
Message-ID: <202302052009.B0iJiDHO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: e60acbff596e266cd7d7b3dece7760f12e5cbf02 [1530/20208] LF-1373-1: drm/bridge: nwl-dsi: Add support for video_pll
config: i386-randconfig-a012 (https://download.01.org/0day-ci/archive/20230205/202302052009.B0iJiDHO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/e60acbff596e266cd7d7b3dece7760f12e5cbf02
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout e60acbff596e266cd7d7b3dece7760f12e5cbf02
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: net/bpfilter/bpfilter_umh_blob.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/gpu/drm/bridge/nwl-dsi.o: in function `nwl_dsi_get_lcm':
>> drivers/gpu/drm/bridge/nwl-dsi.c:838: undefined reference to `__udivdi3'


vim +838 drivers/gpu/drm/bridge/nwl-dsi.c

   815	
   816	/*
   817	 * Utility function to calculate least commom multiple, using an improved
   818	 * version of the Euclidean algorithm for greatest common factor.
   819	 */
   820	static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
   821	{
   822		u32 gcf = 0; /* greatest common factor */
   823		unsigned long tmp_a = a;
   824		unsigned long tmp_b = b;
   825	
   826		if (!a || !b)
   827			return 0;
   828	
   829		while (tmp_a % tmp_b) {
   830			gcf = tmp_a % tmp_b;
   831			tmp_a = tmp_b;
   832			tmp_b = gcf;
   833		}
   834	
   835		if (!gcf)
   836			return a;
   837	
 > 838		return ((unsigned long long)a * b) / gcf;
   839	}
   840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
