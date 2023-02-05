Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5315B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 01:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675561325; x=1707097325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ZRtja9zl9k7V2SuwkjqFPS/dSWFpnNOng8I7eXTa50=;
  b=PdeFa+0dVUt4TRqgZxU5lt5wt2tIYXJ+g0HloH+DPI0ht7F0CCPlCiOw
   6NaJ3mgYT2mvDEf8Uwc5f7MKm7vu6E7i7bDXlFy8sy6O5q4GT8owlcEj+
   C+cBekLnXqqA41BK+DJquuq2b9k5KUeDVoswf77SyZP/Zv9x1etmB+336
   POANM/cqV/csx0eQNCyOFe2LyFxHZDqxq5nywoOFU55ie6WHwzqrUC9uS
   bAJT0C2kMeq46Os/0n5Msn7PLPsScz/VMFi5ZcAZhyqMr0R1o80PAtmgA
   Av6IIBZ13iss4+Fw3LB5L/CgeZKSzQj4zD9UHQKLcTlyCdmHDaqFTtpXi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="331143163"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="331143163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 17:42:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="790084799"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="790084799"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Feb 2023 17:42:03 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOU2d-0001e2-0Y;
	Sun, 05 Feb 2023 01:42:03 +0000
Date: Sun, 5 Feb 2023 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6077/20209]
 drivers/media/platform/mxc/capture/ov5640_v2.c:792:28: warning: unused
 variable 'client'
Message-ID: <202302050930.xwfPr88c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3248ffcb12d15a0e40b9a020ba362591b8137923
commit: 75f2ca3b452a3b216d8f58985e99ab517247880c [6077/20209] Merge remote-tracking branch 'origin/capture/ov5640' into capture/next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302050930.xwfPr88c-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/75f2ca3b452a3b216d8f58985e99ab517247880c
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 5.15-2.2.x-imx
        git checkout 75f2ca3b452a3b216d8f58985e99ab517247880c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/platform/mxc/capture/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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

4a2766d696ef8a2 Robby Cai 2019-09-25  787  
4a2766d696ef8a2 Robby Cai 2019-09-25  788  #ifdef CONFIG_VIDEO_ADV_DEBUG
4a2766d696ef8a2 Robby Cai 2019-09-25  789  static int ov5640_get_register(struct v4l2_subdev *sd,
4a2766d696ef8a2 Robby Cai 2019-09-25  790  					struct v4l2_dbg_register *reg)
4a2766d696ef8a2 Robby Cai 2019-09-25  791  {
4a2766d696ef8a2 Robby Cai 2019-09-25 @792  	struct i2c_client *client = v4l2_get_subdevdata(sd);
4a2766d696ef8a2 Robby Cai 2019-09-25  793  	int ret;
4a2766d696ef8a2 Robby Cai 2019-09-25  794  	u8 val;
4a2766d696ef8a2 Robby Cai 2019-09-25  795  
4a2766d696ef8a2 Robby Cai 2019-09-25  796  	if (reg->reg & ~0xffff)
4a2766d696ef8a2 Robby Cai 2019-09-25  797  		return -EINVAL;
4a2766d696ef8a2 Robby Cai 2019-09-25  798  
4a2766d696ef8a2 Robby Cai 2019-09-25  799  	reg->size = 1;
4a2766d696ef8a2 Robby Cai 2019-09-25  800  
4a2766d696ef8a2 Robby Cai 2019-09-25  801  	ret = ov5640_read_reg(reg->reg, &val);
4a2766d696ef8a2 Robby Cai 2019-09-25  802  	if (!ret)
4a2766d696ef8a2 Robby Cai 2019-09-25  803  		reg->val = (__u64)val;
4a2766d696ef8a2 Robby Cai 2019-09-25  804  
4a2766d696ef8a2 Robby Cai 2019-09-25  805  	return ret;
4a2766d696ef8a2 Robby Cai 2019-09-25  806  }
4a2766d696ef8a2 Robby Cai 2019-09-25  807  

:::::: The code at line 792 was first introduced by commit
:::::: 4a2766d696ef8a2b758c3728ea510d33c1502e69 media: capture: add ov5640 mipi and parallel driver of subdev version

:::::: TO: Robby Cai <robby.cai@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
