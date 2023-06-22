Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB481E526
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 15:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687447304; x=1718983304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xi9XW8gQ8ZZ81wN7QepUyHNoauWpbAaZ9z85JspLrv0=;
  b=Uubto1hGPbQDJskuh/2G0ui+3hzXeumvh/0qyQmy50mbKsY/zd01iLCJ
   K67/6m8Q39Xcz+iEbt3LOcZvXbvOUo3L4Fm8pnTAS2PJ9mzHUkLJN4tn5
   lMLcPc91kgbzCn/gzzTODMCPCHkOKlwSVqtvkQ9WU2XIJNBydZxi7+p0t
   rPsiR7DiE9F6RcgfDt+0umIdveolHCvWvufA6A0HV3+ryiQp4FmikHL8U
   QZjdkObR47F01Gn1KmwF3X6t2dbq5roIVRjdB6KOXIt/tP7OZsgPlInWB
   pZSozBcqennfpwvA2VbPuPFnTnBhrzR5rbvLMQqkJnS2lnny/S1F06Hk2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="345273427"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="345273427"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 08:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="827974026"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="827974026"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2023 08:21:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCM7x-0007eN-3D;
	Thu, 22 Jun 2023 15:21:42 +0000
Date: Thu, 22 Jun 2023 23:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 4752/9881]
 drivers/media/platform/mxc/capture/ov5640_v2.c:792:28: warning: unused
 variable 'client'
Message-ID: <202306222354.Ow6iyVyS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   3260d1af47b1bedfe12b79a26efa184b9a60a8a3
commit: ce0e2f7e0ebc193aa10e4a6921c61302e470387c [4752/9881] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306222354.Ow6iyVyS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306222354.Ow6iyVyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306222354.Ow6iyVyS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_get_register':
>> drivers/media/platform/mxc/capture/ov5640_v2.c:792:28: warning: unused variable 'client' [-Wunused-variable]
     792 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'ov5640_set_register':
   drivers/media/platform/mxc/capture/ov5640_v2.c:811:28: warning: unused variable 'client' [-Wunused-variable]
     811 |         struct i2c_client *client = v4l2_get_subdevdata(sd);
         |                            ^~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c: In function 'init_device':
   drivers/media/platform/mxc/capture/ov5640_v2.c:1708:32: warning: variable 'frame_rate' set but not used [-Wunused-but-set-variable]
    1708 |         enum ov5640_frame_rate frame_rate;
         |                                ^~~~~~~~~~
   drivers/media/platform/mxc/capture/ov5640_v2.c:1706:13: warning: variable 'tgt_xclk' set but not used [-Wunused-but-set-variable]
    1706 |         u32 tgt_xclk;   /* target xclk */
         |             ^~~~~~~~


vim +/client +792 drivers/media/platform/mxc/capture/ov5640_v2.c

15d73846f70ad8 Robby Cai 2019-09-25  787  
15d73846f70ad8 Robby Cai 2019-09-25  788  #ifdef CONFIG_VIDEO_ADV_DEBUG
15d73846f70ad8 Robby Cai 2019-09-25  789  static int ov5640_get_register(struct v4l2_subdev *sd,
15d73846f70ad8 Robby Cai 2019-09-25  790  					struct v4l2_dbg_register *reg)
15d73846f70ad8 Robby Cai 2019-09-25  791  {
15d73846f70ad8 Robby Cai 2019-09-25 @792  	struct i2c_client *client = v4l2_get_subdevdata(sd);
15d73846f70ad8 Robby Cai 2019-09-25  793  	int ret;
15d73846f70ad8 Robby Cai 2019-09-25  794  	u8 val;
15d73846f70ad8 Robby Cai 2019-09-25  795  
15d73846f70ad8 Robby Cai 2019-09-25  796  	if (reg->reg & ~0xffff)
15d73846f70ad8 Robby Cai 2019-09-25  797  		return -EINVAL;
15d73846f70ad8 Robby Cai 2019-09-25  798  
15d73846f70ad8 Robby Cai 2019-09-25  799  	reg->size = 1;
15d73846f70ad8 Robby Cai 2019-09-25  800  
15d73846f70ad8 Robby Cai 2019-09-25  801  	ret = ov5640_read_reg(reg->reg, &val);
15d73846f70ad8 Robby Cai 2019-09-25  802  	if (!ret)
15d73846f70ad8 Robby Cai 2019-09-25  803  		reg->val = (__u64)val;
15d73846f70ad8 Robby Cai 2019-09-25  804  
15d73846f70ad8 Robby Cai 2019-09-25  805  	return ret;
15d73846f70ad8 Robby Cai 2019-09-25  806  }
15d73846f70ad8 Robby Cai 2019-09-25  807  

:::::: The code at line 792 was first introduced by commit
:::::: 15d73846f70ad81bfd5552f6dd8eb96d520b3b02 media: capture: add ov5640 mipi and parallel driver of subdev version

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
