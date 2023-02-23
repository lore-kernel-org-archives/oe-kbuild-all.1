Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B772F2A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Feb 2023 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677172305; x=1708708305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I4+/UkM8aPuo7dqe2LJXZW5/uF/vwgztWL4vR4/KUYc=;
  b=Uu0jt6LWwjze1TEL4LmEGrFORHNmFEzV1TAmFk8kzsI6ZMIpA6GCg2aH
   FYwTrqnYcidlnrlMgX+lQruQaKt8oawUMZMy0AEnH+EBoFduJXRLEEdCO
   XlwJDqkSqkQSz73wmhUDsTQX6k0JGwWU++mzGYUNv1ON4qCUognrWFdOM
   qj4fdZkVXQAfsL+5acMZuV2IEshyc0whUMQlih08h9F4Vq3bsluAD0zyQ
   9I2taEIrjYgSzVfMruyG0sXH6T+U8MHZU0pykVPDKVune/pZgoWj2nDJS
   IeFguaOfGby8xywYaCpUuVcVNFqkIE1FGWvr6YdrKO7N8/gK3VcmM1dVh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331943886"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="331943886"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 09:10:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="1001489032"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="1001489032"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 23 Feb 2023 09:10:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVF6g-0001XW-0M;
	Thu, 23 Feb 2023 17:10:10 +0000
Date: Fri, 24 Feb 2023 01:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp
 driver
Message-ID: <202302240000.LsLyruJR-lkp@intel.com>
References: <20230223135635.30659-3-quic_sbillaka@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223135635.30659-3-quic_sbillaka@quicinc.com>

Hi Sankeerth,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-intel/for-linux-next drm-tip/drm-tip linus/master next-20230223]
[cannot apply to drm-misc/drm-misc-next drm-exynos/exynos-drm-next drm-intel/for-linux-next-fixes v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sankeerth-Billakanti/drm-msm-dp-enumerate-edp-panel-during-driver-probe/20230223-215810
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20230223135635.30659-3-quic_sbillaka%40quicinc.com
patch subject: [RFC PATCH 2/2] drm/msm/dp: enable pm_runtime support for dp driver
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230224/202302240000.LsLyruJR-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5351853e6b90c88348c59c9ffc02122ac2e491f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sankeerth-Billakanti/drm-msm-dp-enumerate-edp-panel-during-driver-probe/20230223-215810
        git checkout 5351853e6b90c88348c59c9ffc02122ac2e491f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240000.LsLyruJR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_client_deinit':
>> drivers/gpu/drm/msm/dp/dp_power.c:184:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     184 |         struct dp_power_private *power;
         |                                  ^~~~~
   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_init':
   drivers/gpu/drm/msm/dp/dp_power.c:198:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     198 |         struct dp_power_private *power = NULL;
         |                                  ^~~~~
   drivers/gpu/drm/msm/dp/dp_power.c: In function 'dp_power_deinit':
   drivers/gpu/drm/msm/dp/dp_power.c:221:34: warning: variable 'power' set but not used [-Wunused-but-set-variable]
     221 |         struct dp_power_private *power;
         |                                  ^~~~~


vim +/power +184 drivers/gpu/drm/msm/dp/dp_power.c

c943b4948b5848 Chandan Uddaraju 2020-08-27  181  
c943b4948b5848 Chandan Uddaraju 2020-08-27  182  void dp_power_client_deinit(struct dp_power *dp_power)
c943b4948b5848 Chandan Uddaraju 2020-08-27  183  {
c943b4948b5848 Chandan Uddaraju 2020-08-27 @184  	struct dp_power_private *power;
c943b4948b5848 Chandan Uddaraju 2020-08-27  185  
c943b4948b5848 Chandan Uddaraju 2020-08-27  186  	if (!dp_power) {
c943b4948b5848 Chandan Uddaraju 2020-08-27  187  		DRM_ERROR("invalid power data\n");
c943b4948b5848 Chandan Uddaraju 2020-08-27  188  		return;
c943b4948b5848 Chandan Uddaraju 2020-08-27  189  	}
c943b4948b5848 Chandan Uddaraju 2020-08-27  190  
c943b4948b5848 Chandan Uddaraju 2020-08-27  191  	power = container_of(dp_power, struct dp_power_private, dp_power);
c943b4948b5848 Chandan Uddaraju 2020-08-27  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
