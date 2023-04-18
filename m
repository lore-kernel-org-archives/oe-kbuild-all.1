Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A89C185A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681804412; x=1713340412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jFlk9yDiZ5EwRyB7DXMcrBVVG2801rnmZMuNS8dcnDU=;
  b=U0MLi4WmHs6VHpDTZRGatkAUnW4MQ9NKl87pqIRljJi1RAsTjOQOy/HY
   JHLvYBfcG2wNRbk2RVj2Vc9YCUC8orbYd1X7JkcFmeUPTHD+GA9cgF6Rr
   uf2II3c/pTc0U6YlsjRJBcaELtDYRASNhBd55DKNZSPMbYtx10pSshlkO
   NfOcjpWQuzHLcg7sCVg27nMK7sPoXsgiKgGMy9sPePx2GtUDxloBuA+Kj
   9ZNgvev4rBAAiT7MjH0q2qA1qSNu1azxrwlSopBNGJBKjP34k8ch4cnXa
   WYuFNWmRVAr98SzDgKh1Zpz2PDybAHqFC3q/oI4FL2yasLWxNuhD2MQQT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345101318"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="345101318"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 00:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="834777347"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="834777347"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2023 00:53:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pog9V-000d7d-2O;
	Tue, 18 Apr 2023 07:53:25 +0000
Date: Tue, 18 Apr 2023 15:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Clark <robdclark@chromium.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 4415/9999]
 drivers/gpu/drm/msm/dp/dp_display.c:523:26: warning: variable 'hpd' set but
 not used
Message-ID: <202304181557.SbkboRMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kuogee,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   387078f9030cf336cd9fef521540db75b61615e0
commit: acf76125bb2b247d27cb4ca57fda772c8a691fe9 [4415/9999] drm/msm/dp: fix connect/disconnect handled at irq_hpd
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304181557.SbkboRMW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=acf76125bb2b247d27cb4ca57fda772c8a691fe9
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout acf76125bb2b247d27cb4ca57fda772c8a691fe9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181557.SbkboRMW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_display.c: In function 'dp_display_usbpd_attention_cb':
>> drivers/gpu/drm/msm/dp/dp_display.c:523:26: warning: variable 'hpd' set but not used [-Wunused-but-set-variable]
     523 |         struct dp_usbpd *hpd;
         |                          ^~~


vim +/hpd +523 drivers/gpu/drm/msm/dp/dp_display.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  517  
c943b4948b5848 Chandan Uddaraju 2020-08-27  518  static int dp_display_usbpd_attention_cb(struct device *dev)
c943b4948b5848 Chandan Uddaraju 2020-08-27  519  {
c943b4948b5848 Chandan Uddaraju 2020-08-27  520  	int rc = 0;
61f8f4034c0423 Kuogee Hsieh     2020-11-03  521  	u32 sink_request;
c943b4948b5848 Chandan Uddaraju 2020-08-27  522  	struct dp_display_private *dp;
61f8f4034c0423 Kuogee Hsieh     2020-11-03 @523  	struct dp_usbpd *hpd;
c943b4948b5848 Chandan Uddaraju 2020-08-27  524  
c943b4948b5848 Chandan Uddaraju 2020-08-27  525  	if (!dev) {
c943b4948b5848 Chandan Uddaraju 2020-08-27  526  		DRM_ERROR("invalid dev\n");
c943b4948b5848 Chandan Uddaraju 2020-08-27  527  		return -EINVAL;
c943b4948b5848 Chandan Uddaraju 2020-08-27  528  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  529  
061eb621fc2780 Abhinav Kumar    2020-09-12  530  	dp = container_of(g_dp_display,
061eb621fc2780 Abhinav Kumar    2020-09-12  531  			struct dp_display_private, dp_display);
c943b4948b5848 Chandan Uddaraju 2020-08-27  532  	if (!dp) {
c943b4948b5848 Chandan Uddaraju 2020-08-27  533  		DRM_ERROR("no driver data found\n");
c943b4948b5848 Chandan Uddaraju 2020-08-27  534  		return -ENODEV;
c943b4948b5848 Chandan Uddaraju 2020-08-27  535  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  536  
61f8f4034c0423 Kuogee Hsieh     2020-11-03  537  	hpd = dp->usbpd;
61f8f4034c0423 Kuogee Hsieh     2020-11-03  538  
c943b4948b5848 Chandan Uddaraju 2020-08-27  539  	/* check for any test request issued by sink */
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  540  	rc = dp_link_process_request(dp->link);
61f8f4034c0423 Kuogee Hsieh     2020-11-03  541  	if (!rc) {
61f8f4034c0423 Kuogee Hsieh     2020-11-03  542  		sink_request = dp->link->sink_request;
acf76125bb2b24 Kuogee Hsieh     2020-11-18  543  		if (sink_request & DS_PORT_STATUS_CHANGED)
acf76125bb2b24 Kuogee Hsieh     2020-11-18  544  			rc = dp_display_handle_port_ststus_changed(dp);
acf76125bb2b24 Kuogee Hsieh     2020-11-18  545  		else
61f8f4034c0423 Kuogee Hsieh     2020-11-03  546  			rc = dp_display_handle_irq_hpd(dp);
61f8f4034c0423 Kuogee Hsieh     2020-11-03  547  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  548  
8ede2ecc3e5ee3 Kuogee Hsieh     2020-09-11  549  	return rc;
c943b4948b5848 Chandan Uddaraju 2020-08-27  550  }
c943b4948b5848 Chandan Uddaraju 2020-08-27  551  

:::::: The code at line 523 was first introduced by commit
:::::: 61f8f4034c04231148e7580ae51a2a74171c04a0 drm/msm/dp: promote irq_hpd handle to handle link training correctly

:::::: TO: Kuogee Hsieh <khsieh@codeaurora.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
