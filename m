Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1B5538B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680876890; x=1712412890;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fQUUjArGrTeRO61RilSrwNGYJLqpH0+7VYi7Yyn5YUQ=;
  b=OzoJWK2JXODoxQf0GtMdDTCWywPmnTTgflCtrViT1H1Slw73gL/oWEei
   RT5YQSNBuAdJsSnlgv67kSNErrK5DK3WgKYNxcanXI7Xll31HLLHxGUA7
   bfYwu5D/ZfW05Xu5q5G18VtilFXyBLOArosBLAKX1V4JSUmDbFhIHiAGy
   hJkLuF3MEPrMvTHuoMnCYg4+tUHg/q+4fh+mmb91214+6MsgrlxGcVro/
   njAlwmVzQdl8Pr1dxo9UYw1ODpcE2QIcbmk42M5MN6oymdFaJKi5gOklL
   E9SoYvg2m3kj13YhH1QV6+GRfUVwNtWkH5EP3LhqLLj/u9CGEW6if4CWg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="322633131"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="322633131"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 07:14:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="861790043"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="861790043"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Apr 2023 07:14:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkmrX-000Sa1-2R;
	Fri, 07 Apr 2023 14:14:47 +0000
Date: Fri, 7 Apr 2023 22:13:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 15656/22025]
 drivers/media/v4l2-core/v4l2-subdev.c:917:17: error: implicit declaration of
 function '__v4l2_subdev_state_alloc'
Message-ID: <202304072232.p6L2AkQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomi,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 6aadd6b6f27234516b19f8d6d4d102184d70d394 [15656/22025] media: subdev: add active state to struct v4l2_subdev
config: nios2-randconfig-r035-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072232.p6L2AkQm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 6aadd6b6f27234516b19f8d6d4d102184d70d394
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072232.p6L2AkQm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_init_finalize':
>> drivers/media/v4l2-core/v4l2-subdev.c:917:17: error: implicit declaration of function '__v4l2_subdev_state_alloc' [-Werror=implicit-function-declaration]
     917 |         state = __v4l2_subdev_state_alloc(sd);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/v4l2-core/v4l2-subdev.c:917:15: warning: assignment to 'struct v4l2_subdev_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     917 |         state = __v4l2_subdev_state_alloc(sd);
         |               ^
   drivers/media/v4l2-core/v4l2-subdev.c: In function 'v4l2_subdev_cleanup':
>> drivers/media/v4l2-core/v4l2-subdev.c:929:9: error: implicit declaration of function '__v4l2_subdev_state_free' [-Werror=implicit-function-declaration]
     929 |         __v4l2_subdev_state_free(sd->state);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__v4l2_subdev_state_alloc +917 drivers/media/v4l2-core/v4l2-subdev.c

   912	
   913	int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
   914	{
   915		struct v4l2_subdev_state *state;
   916	
 > 917		state = __v4l2_subdev_state_alloc(sd);
   918		if (IS_ERR(state))
   919			return PTR_ERR(state);
   920	
   921		sd->state = state;
   922	
   923		return 0;
   924	}
   925	EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
   926	
   927	void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
   928	{
 > 929		__v4l2_subdev_state_free(sd->state);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
