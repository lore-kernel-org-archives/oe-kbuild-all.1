Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DBA33980
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695745310; x=1727281310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOLi+tNVVtaYkWTVX/7AESQkIiZFjfH3RaEZEz2Zfb4=;
  b=J2iQVmhMqyEVf5PriM+zGSSEzrxW5+LP9nHUEIjDevc8kGaXP4WRaZai
   KtKNlgLEiyDd6ahY7bAI1AaF84dFWRKISmkaQmdgoj9Ei6vsvz4AqXJ07
   Yi7fsx2mh077mmdRFnFjHdB1k8B/hlrhq29dQZBR0paEORvV+3drv2U4D
   BiY28KRK2ntNgYIkdQ8y2kJ+57BD2ZW4ruFxR76Jdt9D87oBIZz2Ihmft
   Is3R3cJ0j62DX5GLCuSg+hdYhHDzc6hvNSVjv0ZigzfiJLfPDij4vhQtY
   ZaD9852m8dAFCyzI5fL7DoL8bskqFCJ7ZyJIAdEICZ/GlSR6MLp677juB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="445739333"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="445739333"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 09:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814540198"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="814540198"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 26 Sep 2023 09:21:47 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlAoi-000358-2u;
	Tue, 26 Sep 2023 16:21:44 +0000
Date: Wed, 27 Sep 2023 00:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: gc2145: Galaxy Core GC2145 sensor support
Message-ID: <202309270018.GBMyNvxU-lkp@intel.com>
References: <20230926092825.819229-3-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926092825.819229-3-alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/dt-bindings-media-i2c-add-galaxycore-gc2145-dt-bindings/20230926-173518
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230926092825.819229-3-alain.volmat%40foss.st.com
patch subject: [PATCH 2/2] media: i2c: gc2145: Galaxy Core GC2145 sensor support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230927/202309270018.GBMyNvxU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270018.GBMyNvxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270018.GBMyNvxU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/gc2145.c:1140:12: warning: 'gc2145_resume' defined but not used [-Wunused-function]
    1140 | static int gc2145_resume(struct device *dev)
         |            ^~~~~~~~~~~~~
>> drivers/media/i2c/gc2145.c:1129:12: warning: 'gc2145_suspend' defined but not used [-Wunused-function]
    1129 | static int gc2145_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~


vim +/gc2145_resume +1140 drivers/media/i2c/gc2145.c

  1128	
> 1129	static int gc2145_suspend(struct device *dev)
  1130	{
  1131		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  1132		struct gc2145 *gc2145 = to_gc2145(sd);
  1133	
  1134		if (gc2145->streaming)
  1135			gc2145_stop_streaming(gc2145);
  1136	
  1137		return 0;
  1138	}
  1139	
> 1140	static int gc2145_resume(struct device *dev)
  1141	{
  1142		struct v4l2_subdev *sd = dev_get_drvdata(dev);
  1143		struct gc2145 *gc2145 = to_gc2145(sd);
  1144		struct v4l2_subdev_state *state;
  1145		int ret;
  1146	
  1147		if (gc2145->streaming) {
  1148			state = v4l2_subdev_lock_and_get_active_state(sd);
  1149			ret = gc2145_start_streaming(gc2145, state);
  1150			v4l2_subdev_unlock_state(state);
  1151			if (ret)
  1152				goto error;
  1153		}
  1154	
  1155		return 0;
  1156	
  1157	error:
  1158		gc2145_stop_streaming(gc2145);
  1159		gc2145->streaming = false;
  1160	
  1161		return ret;
  1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
