Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BCE29A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675434724; x=1706970724;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5Sk7ebWkYvH08Kg2S3Dx1vvrve72aI3R9CdGq2cGOcQ=;
  b=XfNdczECbsYZ2usEM1ZvloBB5CCojj9GRJtJhkT3QBDTqMkOWkCD1Jpx
   p1I2L2LM4VoAVJRJVHdKEfzDlDwiX5w9X+xI/2tso0AdDZEVJ/o4rMLyN
   rz9a0JnPyA/ity6hn+e94sXdB3KYP/iDI42aoQcartBzFX5WnYGA90Kxd
   DdlTznSDRkPHEsOLOPL8nk2wAXyDoBkQvBjmzoPmifwns6mUvfjtlIo2Z
   +bsHpfwxW/rzMtoymK7pav19oBeoYn+FDz2t21DdtG9mZB7uV2PDd8f8q
   UkMdAwyzF03YHWBlDhvh6TTraQv2l2InlbL4LXtPCTfre3m4h3Oa0Cm2Y
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309092253"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="309092253"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 06:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="808382768"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; 
   d="scan'208";a="808382768"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2023 06:32:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNx6g-0000Yf-2D;
	Fri, 03 Feb 2023 14:32:02 +0000
Date: Fri, 3 Feb 2023 22:31:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/preempt-rt 16133/29702]
 drivers/gpu/drm/msm/dp/dp_display.c:1042:28: warning: variable 'drm' set but
 not used
Message-ID: <202302032224.PMkI0GZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dmitry,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   32e6f493fd5e5c8cadd5b628aac19f8e64db0f33
commit: 0512bfb0f5ce49889f7279640a489e6084ec0e6e [16133/29702] drm/msm: fix display snapshotting if DP or DSI is disabled
config: arm64-randconfig-r014-20230202 (https://download.01.org/0day-ci/archive/20230203/202302032224.PMkI0GZN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/linux-intel-lts/commit/0512bfb0f5ce49889f7279640a489e6084ec0e6e
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout 0512bfb0f5ce49889f7279640a489e6084ec0e6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_display.c: In function 'dp_display_usbpd_attention_cb':
   drivers/gpu/drm/msm/dp/dp_display.c:497:26: warning: variable 'hpd' set but not used [-Wunused-but-set-variable]
     497 |         struct dp_usbpd *hpd;
         |                          ^~~
   drivers/gpu/drm/msm/dp/dp_display.c: In function 'msm_dp_snapshot':
>> drivers/gpu/drm/msm/dp/dp_display.c:1042:28: warning: variable 'drm' set but not used [-Wunused-but-set-variable]
    1042 |         struct drm_device *drm;
         |                            ^~~


vim +/drm +1042 drivers/gpu/drm/msm/dp/dp_display.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  1038  
51baa7de594de8 Dmitry Baryshkov 2021-04-27  1039  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1040  {
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1041  	struct dp_display_private *dp_display;
e5fec680bc3c92 Abhinav Kumar    2021-04-16 @1042  	struct drm_device *drm;
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1043  
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1044  	dp_display = container_of(dp, struct dp_display_private, dp_display);
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1045  	drm = dp->drm_dev;
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1046  
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1047  	/*
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1048  	 * if we are reading registers we need the link clocks to be on
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1049  	 * however till DP cable is connected this will not happen as we
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1050  	 * do not know the resolution to power up with. Hence check the
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1051  	 * power_on status before dumping DP registers to avoid crash due
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1052  	 * to unclocked access
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1053  	 */
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1054  	mutex_lock(&dp_display->event_mutex);
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1055  
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1056  	if (!dp->power_on) {
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1057  		mutex_unlock(&dp_display->event_mutex);
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1058  		return;
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1059  	}
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1060  
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1061  	dp_catalog_snapshot(dp_display->catalog, disp_state);
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1062  
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1063  	mutex_unlock(&dp_display->event_mutex);
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1064  }
e5fec680bc3c92 Abhinav Kumar    2021-04-16  1065  

:::::: The code at line 1042 was first introduced by commit
:::::: e5fec680bc3c9215a546b2c03a6c3392e4c1a2b1 drm/msm/dp: add API to take DP register snapshot

:::::: TO: Abhinav Kumar <abhinavk@codeaurora.org>
:::::: CC: Junxiao Chang <junxiao.chang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
