Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E47F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 08:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675326502; x=1706862502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ukj002xLURDXh6A9qcKymgMdy3B+BlgCRY3TW4uZ98=;
  b=GSP11Q64pWj3QuUAJwhD+HecqR/bVbupWxZLm3ujA4AjMfSM5bDUAvKV
   3ftmIZ4X7WaDdap/mpeC/+fbsEj4ouZqUWpsEYDo01IGbuEp4Xi0B1DGD
   mOvS3tvJT181bhUsQWCBJjfiBmr8BBGIUs2YdNfaDF/fUWzcIertPobyw
   SmX+rRl3+XDUaJGKfBqeNjAGIj/v5Y5O2WlGUc2U/q7p2YIs6F51LCY+j
   RJqPaOT+99rdVK3lefOqzGZ38iHo0QZDfJubyTfQ6YL2p3PNFoLPOuZbl
   uXT+yqBtoTlGluGf1UzuFCT5OGpMyaNJgNvmItUqbBFcIY/9o+pQ27ZiN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="312036519"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="312036519"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 00:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728763020"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="728763020"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 00:28:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNUx8-0006K8-2V;
	Thu, 02 Feb 2023 08:28:18 +0000
Date: Thu, 2 Feb 2023 16:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-test 23/39]
 drivers/gpu/drm/bridge/analogix/anx7625.c:1591:13: warning: variable 'event'
 set but not used
Message-ID: <202302021639.qIvNEoW3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   14d84237ad57de7b0f267d290ae87e40842965b4
commit: e188f8d5589fc51e365bafe7210b281174a54b76 [23/39] drm/bridge: anx7625: Drop device lock before drm_helper_hpd_irq_event()
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302021639.qIvNEoW3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=e188f8d5589fc51e365bafe7210b281174a54b76
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout e188f8d5589fc51e365bafe7210b281174a54b76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/analogix/anx7625.c: In function 'anx7625_work_func':
>> drivers/gpu/drm/bridge/analogix/anx7625.c:1591:13: warning: variable 'event' set but not used [-Wunused-but-set-variable]
    1591 |         int event;
         |             ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [y]:
   - SUN20I_PPU [=y] && (ARCH_SUNXI || COMPILE_TEST [=y])


vim +/event +1591 drivers/gpu/drm/bridge/analogix/anx7625.c

8bdfc5dae4e3ba Xin Ji       2020-09-18  1588  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1589  static void anx7625_work_func(struct work_struct *work)
8bdfc5dae4e3ba Xin Ji       2020-09-18  1590  {
8bdfc5dae4e3ba Xin Ji       2020-09-18 @1591  	int event;
8bdfc5dae4e3ba Xin Ji       2020-09-18  1592  	struct anx7625_data *ctx = container_of(work,
8bdfc5dae4e3ba Xin Ji       2020-09-18  1593  						struct anx7625_data, work);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1594  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1595  	mutex_lock(&ctx->lock);
60487584a79abd Pi-Hsun Shih 2021-05-17  1596  
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1597  	if (pm_runtime_suspended(&ctx->client->dev)) {
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1598  		mutex_unlock(&ctx->lock);
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1599  		return;
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1600  	}
60487584a79abd Pi-Hsun Shih 2021-05-17  1601  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1602  	event = anx7625_hpd_change_detect(ctx);
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1603  
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1604  	mutex_unlock(&ctx->lock);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1605  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1606  	if (ctx->bridge_attached)
8bdfc5dae4e3ba Xin Ji       2020-09-18  1607  		drm_helper_hpd_irq_event(ctx->bridge.dev);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1608  }
8bdfc5dae4e3ba Xin Ji       2020-09-18  1609  

:::::: The code at line 1591 was first introduced by commit
:::::: 8bdfc5dae4e3ba4d99dfb430ef43249e5f1b7730 drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

:::::: TO: Xin Ji <xji@analogixsemi.com>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
