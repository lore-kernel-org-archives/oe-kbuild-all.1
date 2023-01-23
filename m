Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F57E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 02:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674440872; x=1705976872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5DHwgiy76G4Hbm+NK88+UDYjrTreMvxDAsnKlg53eJ8=;
  b=hxcHwRj6DP79GW6Rm/MvhS0brb7zVQOkAnIl9SXgfMYwOPyGxpod/pXu
   X0KNyV5UlHgUkLtiMzfBti5jrWwMFfhk+VXIKSaalVWhMrDkKU7vq1GkI
   ldvKfl5wfmxVbO5vgodCeTD+rd3oQA4+tZHgfeuN3pSShhyXSfshxjuyo
   VG7W4JxvI6II/FwGgV0nITQM/plFIR30IVstNlrhSkY6H/lHJa4nFN/jE
   tJ78b5CHv7pJx3CDVTcGUKkclk3AGNRH81qb0tI3sE6G+lAw00ggEZIsD
   U+H0CvW4do+3yCQpBjGf0IsZQ1apqHB+Js5TbKXl1dL6MhnNNKXQDsbcZ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="412190448"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="412190448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 18:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="691975007"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="691975007"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Jan 2023 18:27:50 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJmYn-0005Mq-2Y;
	Mon, 23 Jan 2023 02:27:49 +0000
Date: Mon, 23 Jan 2023 10:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 86/91] drivers/gpu/drm/apple/dcp.c:603:15:
 error: implicit declaration of function 'apple_rtkit_idle'; did you mean
 'apple_rtkit_poll'?
Message-ID: <202301231033.HbAJy5se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a2482bcc061b8b8143649c24162ebcaed9af3102
commit: f5b1df5d5cb2c204e2855b9186c37c61459cca00 [86/91] drm/apple: WIP: Runtime PD / proper sleep modes
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230123/202301231033.HbAJy5se-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f5b1df5d5cb2c204e2855b9186c37c61459cca00
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/200-dcp
        git checkout f5b1df5d5cb2c204e2855b9186c37c61459cca00
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/apple/dcp.c: In function 'dcp_crtc_atomic_check':
   drivers/gpu/drm/apple/dcp.c:197:45: warning: variable 'old_state' set but not used [-Wunused-but-set-variable]
     197 |         struct drm_plane_state *new_state, *old_state;
         |                                             ^~~~~~~~~
   drivers/gpu/drm/apple/dcp.c: In function 'dcp_runtime_suspend':
>> drivers/gpu/drm/apple/dcp.c:603:15: error: implicit declaration of function 'apple_rtkit_idle'; did you mean 'apple_rtkit_poll'? [-Werror=implicit-function-declaration]
     603 |         ret = apple_rtkit_idle(dcp->rtk);
         |               ^~~~~~~~~~~~~~~~
         |               apple_rtkit_poll
   cc1: some warnings being treated as errors


vim +603 drivers/gpu/drm/apple/dcp.c

   594	
   595	static int __maybe_unused dcp_runtime_suspend(struct device *dev)
   596	{
   597		struct apple_dcp *dcp = dev_get_drvdata(dev);
   598		u32 cpu_ctrl;
   599		int ret;
   600	
   601		dcp_sleep(dcp);
   602	
 > 603		ret = apple_rtkit_idle(dcp->rtk);
   604		if (ret) {
   605			dev_err(dev, "Failed to shut down RTKit: %d", ret);
   606			return ret;
   607		}
   608	
   609		cpu_ctrl =
   610			readl_relaxed(dcp->coproc_reg + APPLE_DCP_COPROC_CPU_CONTROL);
   611		writel_relaxed(cpu_ctrl & ~APPLE_DCP_COPROC_CPU_CONTROL_RUN,
   612			       dcp->coproc_reg + APPLE_DCP_COPROC_CPU_CONTROL);
   613	
   614		dev_info(dev, "Sleep\n");
   615	
   616		return ret;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
