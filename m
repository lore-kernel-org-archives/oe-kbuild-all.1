Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0160317CD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674133017; x=1705669017;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Po9G/xcopqiIEHqQRslRlay4ia4gxtANkhfxy/IKpu4=;
  b=Ra0rwtov3dD9c+unPgiTbk+Qjawo4R17DXFxzKzAO8FMN3NM8IcTPMyv
   u0c69jylL6OtBIhPcMMOXnajueFKj86i8TEu02NkMwlB02o47FypAib8a
   2LzDr6J9JxMzVneT85UmC0gkYhOX1R3NeSI2rZxv96EBFlfqJZb4/JHkD
   Ae3qxuksRCEJynvt3rbuM8A90KF1SvMmAQxL/1RWxfgJSq2dL7N5rof1W
   6PPPDcZ2UqmEfWsdv+mh4Bnw9eeF/90T7MqOT+y/tPM1B81vsaxBFZWR1
   2LcT8cR2H72DWj5cvFOoHfiXxjAfVdoIigrUM3xXdeRbLCYBWSQtbnkve
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="308833064"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="308833064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 04:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="662101131"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="662101131"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2023 04:56:56 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIUTK-0001TC-1U;
	Thu, 19 Jan 2023 12:56:50 +0000
Date: Thu, 19 Jan 2023 20:56:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Li, NanX" <nanx.li@intel.com>
Subject: [intel-lts:5.15/preempt-rt 13220/21928]
 drivers/gpu/drm/msm/adreno/adreno_device.c:664:12: warning: unused function
 'adreno_system_suspend'
Message-ID: <202301192057.OadChqZv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/preempt-rt
head:   616223323be527ff85db4026f7fcf4a296ad5b16
commit: f74aa21a1d6b433676ee02cf983a294605111b40 [13220/21928] drm/msm/gpu: Park scheduler threads for system suspend
config: arm-randconfig-r046-20230118 (https://download.01.org/0day-ci/archive/20230119/202301192057.OadChqZv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel/linux-intel-lts/commit/f74aa21a1d6b433676ee02cf983a294605111b40
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.15/preempt-rt
        git checkout f74aa21a1d6b433676ee02cf983a294605111b40
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/adreno/adreno_device.c:664:12: warning: unused function 'adreno_system_suspend' [-Wunused-function]
   static int adreno_system_suspend(struct device *dev)
              ^
>> drivers/gpu/drm/msm/adreno/adreno_device.c:688:12: warning: unused function 'adreno_system_resume' [-Wunused-function]
   static int adreno_system_resume(struct device *dev)
              ^
   2 warnings generated.


vim +/adreno_system_suspend +664 drivers/gpu/drm/msm/adreno/adreno_device.c

   663	
 > 664	static int adreno_system_suspend(struct device *dev)
   665	{
   666		struct msm_gpu *gpu = dev_to_gpu(dev);
   667		int remaining, ret;
   668	
   669		suspend_scheduler(gpu);
   670	
   671		remaining = wait_event_timeout(gpu->retire_event,
   672					       active_submits(gpu) == 0,
   673					       msecs_to_jiffies(1000));
   674		if (remaining == 0) {
   675			dev_err(dev, "Timeout waiting for GPU to suspend\n");
   676			ret = -EBUSY;
   677			goto out;
   678		}
   679	
   680		ret = pm_runtime_force_suspend(dev);
   681	out:
   682		if (ret)
   683			resume_scheduler(gpu);
   684	
   685		return ret;
   686	}
   687	
 > 688	static int adreno_system_resume(struct device *dev)
   689	{
   690		resume_scheduler(dev_to_gpu(dev));
   691		return pm_runtime_force_resume(dev);
   692	}
   693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
