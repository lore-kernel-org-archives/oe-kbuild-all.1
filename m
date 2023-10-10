Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF5D377
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYTA9Y9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696899190; x=1728435190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXefU8YCj1tK++naHXYQ+J6q7kr5bhZ+/x5xMjunENY=;
  b=eYTA9Y9O4ry6wiCqoxny82mwnGUGlwd2ylZJ9Qq/vP+PHhXKn0Y35gOU
   wAlT/8GO7T8zlTKgq7luhMCShgg5dpL35gnQY/wEbRBS93yz9vtEF6KX3
   s/02mJizzFRQ9F4xB5h449cQtmdG2e2x8hf1nrj84URp+Mk05ljaeB+V9
   omxgLunSq1l9XmDX7zM9DYexoQJQkrHbWhlOSOaDhDIYuHp42lPOB4orH
   R+3uix9Saca80gXE9nYZ65obcJV4Syf+fWgxylzNIp1pyz2za4Lg4QVqz
   7fO2VrYKl3pBqIP1P8xzDc4ex7npVzleN6566pGucNTth7lqXRM7M2jgY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="374626306"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="374626306"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 17:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="746874827"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="746874827"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 09 Oct 2023 17:53:07 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq0zh-0000tS-1A;
	Tue, 10 Oct 2023 00:53:05 +0000
Date: Tue, 10 Oct 2023 08:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Rob Clark <robdclark@chromium.org>
Subject: [drm-msm:msm-next 31/31] drivers/gpu/drm/msm/msm_drv.c:59:1: error:
 type defaults to 'int' in declaration of 'DECLARE_FAULT_ATTR'
Message-ID: <202310100836.6E6zjEcE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/msm.git msm-next
head:   506efcba31296e9cbc4f8f148eec1e4b29039931
commit: 506efcba31296e9cbc4f8f148eec1e4b29039931 [31/31] drm/msm: carve out KMS code from msm_drv.c
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231010/202310100836.6E6zjEcE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100836.6E6zjEcE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100836.6E6zjEcE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/msm_drv.c:59:1: warning: data definition has no type or storage class
      59 | DECLARE_FAULT_ATTR(fail_gem_alloc);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/msm/msm_drv.c:59:1: error: type defaults to 'int' in declaration of 'DECLARE_FAULT_ATTR' [-Werror=implicit-int]
>> drivers/gpu/drm/msm/msm_drv.c:59:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/msm/msm_drv.c:60:1: warning: data definition has no type or storage class
      60 | DECLARE_FAULT_ATTR(fail_gem_iova);
         | ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/msm_drv.c:60:1: error: type defaults to 'int' in declaration of 'DECLARE_FAULT_ATTR' [-Werror=implicit-int]
   drivers/gpu/drm/msm/msm_drv.c:60:1: warning: parameter names (without types) in function declaration
   drivers/gpu/drm/msm/msm_drv.c: In function 'msm_ioctl_gem_new':
>> drivers/gpu/drm/msm/msm_drv.c:452:13: error: implicit declaration of function 'should_fail' [-Werror=implicit-function-declaration]
     452 |         if (should_fail(&fail_gem_alloc, args->size))
         |             ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +59 drivers/gpu/drm/msm/msm_drv.c

ba4dd71828bce7 Rob Clark 2017-07-06  57  
6d29709de8028c Rob Clark 2022-08-07  58  #ifdef CONFIG_FAULT_INJECTION
6d29709de8028c Rob Clark 2022-08-07 @59  DECLARE_FAULT_ATTR(fail_gem_alloc);
6d29709de8028c Rob Clark 2022-08-07  60  DECLARE_FAULT_ATTR(fail_gem_iova);
6d29709de8028c Rob Clark 2022-08-07  61  #endif
6d29709de8028c Rob Clark 2022-08-07  62  

:::::: The code at line 59 was first introduced by commit
:::::: 6d29709de8028cfd5a827d02f93a5076ba632563 drm/msm: Add fault-injection support

:::::: TO: Rob Clark <robdclark@chromium.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
