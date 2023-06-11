Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA8C10EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jun 2023 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686448859; x=1717984859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mEQ+b4TtcJM5dha+gAaE7lsAFG0WTNd6k+EFS7C1WJk=;
  b=aFN5wwqgPdRzBKktvucYB0pCINjUEUK+w5F5PrFlfGarEvsfbHR9Y4a9
   KE+oDrIisefbk3srMPmUIwmbVayqTsIiHNluuD4wf+q8RLe5X2BZBnFqo
   d2HjTmzeZn3HHNaTFhJnnxoxroji4/wVtQsfnfvq7LMYFTutD6p+eRIT9
   vO4WZBgIzVlBfZLDGLZezvqvx8tcqXsTH8A1i9XgEB2Whw66INAUj72mC
   JCLC6dr2AqK8g0/9aVlmFbbVjr/QROFF8aF+wIW3bSggBc7I7tXrip3X/
   4XDifRORBaBxtAQiMyHrk1YUnn9CKOriWcfoBwHkozKmYFVNtIBepSaWH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="356709300"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="356709300"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 19:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="688178968"
X-IronPort-AV: E=Sophos;i="6.00,233,1681196400"; 
   d="scan'208";a="688178968"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2023 19:00:57 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8AO0-000AYa-28;
	Sun, 11 Jun 2023 02:00:56 +0000
Date: Sun, 11 Jun 2023 10:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [drm-msm:msm-next 9/9]
 drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1
 of 'adreno_is_a690' discards 'const' qualifier from pointer target type
Message-ID: <202306110933.OhOc5tZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   1b90e8f8879c64d4f77dd1f25134397ac075b7bd
commit: 1b90e8f8879c64d4f77dd1f25134397ac075b7bd [9/9] drm/msm/adreno: change adreno_is_* functions to accept const argument
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230611/202306110933.OhOc5tZh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add drm-msm https://gitlab.freedesktop.org/drm/msm.git
        git fetch --no-tags drm-msm msm-next
        git checkout 1b90e8f8879c64d4f77dd1f25134397ac075b7bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110933.OhOc5tZh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/adreno_device.c:9:
   drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function 'adreno_is_a660_family':
>> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1 of 'adreno_is_a690' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
         |                                                      ^~~
   drivers/gpu/drm/msm/adreno/adreno_gpu.h:287:53: note: expected 'struct adreno_gpu *' but argument is of type 'const struct adreno_gpu *'
     287 | static inline int adreno_is_a690(struct adreno_gpu *gpu)
         |                                  ~~~~~~~~~~~~~~~~~~~^~~


vim +303 drivers/gpu/drm/msm/adreno/adreno_gpu.h

b7616b5c69e62e Konrad Dybcio    2022-05-28  300  
1b90e8f8879c64 Dmitry Baryshkov 2023-04-11  301  static inline int adreno_is_a660_family(const struct adreno_gpu *gpu)
192f4ee3e40855 Akhil P Oommen   2021-07-30  302  {
5e7665b5e484b3 Bjorn Andersson  2023-05-30 @303  	return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
192f4ee3e40855 Akhil P Oommen   2021-07-30  304  }
192f4ee3e40855 Akhil P Oommen   2021-07-30  305  

:::::: The code at line 303 was first introduced by commit
:::::: 5e7665b5e484b32872bc1f44263940f094ccd814 drm/msm/adreno: Add Adreno A690 support

:::::: TO: Bjorn Andersson <bjorn.andersson@linaro.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
