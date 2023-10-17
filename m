Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970E3F4C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmtvKJ2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697534297; x=1729070297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8qNZyg8MQxFEAeC3CWlx0Lj1zmmdVpGxYpOFT74a7rQ=;
  b=JmtvKJ2vb2PSiZQ43evECAvW5cjpAgBBwQdZSL2H3LGdZvBxFPGdeb3A
   AZ/6ICoJz04Li/3iq/BbJdxdHQ5X9QeI+3oVY1LEWmPNGgKXL0NIGUgcH
   l+TF2bR+yTBRpqk9du0u5zDR7dx9JZVdKZTMB6RBRRBr0mPj2kQehBcqE
   9iLWvxTsXK9SVYefw9sz/Qfre+xqyQe0VSsk7PtC2QBhb8s1vcRE3pZUC
   msD6ItPrk2FD4q8jwzv2jzKrAVEj1TYwX9+Q/WRxVjmkRGR9YxnQzDZP+
   gKxnPQTQeOxXP6PHr19G5Ts8TLAFjT76NQqWXH5x9WfHHLQI7vYLFsxtn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="376107723"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="376107723"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 02:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="791175270"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="791175270"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Oct 2023 02:18:12 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsgDK-0009Ob-1Y;
	Tue, 17 Oct 2023 09:18:10 +0000
Date: Tue, 17 Oct 2023 17:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH 5/6] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <202310171702.b4KH205d-lkp@intel.com>
References: <20231013104424.404768-6-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-6-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231016]
[cannot apply to media-tree/master rockchip/for-next sailus-media-tree/streams v6.6-rc6 v6.6-rc5 v6.6-rc4 linus/master v6.6-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231017-120800
base:   next-20231016
patch link:    https://lore.kernel.org/r/20231013104424.404768-6-sakari.ailus%40linux.intel.com
patch subject: [PATCH 5/6] media: v4l: subdev: Switch to stream-aware state functions
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171702.b4KH205d-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171702.b4KH205d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171702.b4KH205d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/media/imx/imx-ic-prp.c: In function '__prp_get_fmt':
>> drivers/staging/media/imx/imx-ic-prp.c:85:29: warning: unused variable 'ic_priv' [-Wunused-variable]
      85 |         struct imx_ic_priv *ic_priv = priv->ic_priv;
         |                             ^~~~~~~
--
   drivers/staging/media/imx/imx-ic-prpencvf.c: In function '__prp_get_fmt':
>> drivers/staging/media/imx/imx-ic-prpencvf.c:793:29: warning: unused variable 'ic_priv' [-Wunused-variable]
     793 |         struct imx_ic_priv *ic_priv = priv->ic_priv;
         |                             ^~~~~~~
--
   drivers/media/platform/ti/cal/cal-camerarx.c: In function 'cal_camerarx_sd_enum_mbus_code':
>> drivers/media/platform/ti/cal/cal-camerarx.c:624:30: warning: unused variable 'phy' [-Wunused-variable]
     624 |         struct cal_camerarx *phy = to_cal_camerarx(sd);
         |                              ^~~


vim +/ic_priv +85 drivers/staging/media/imx/imx-ic-prp.c

f0d9c8924e2c33 Steve Longerbeam 2017-06-07  80  
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  81  static struct v4l2_mbus_framefmt *
0d346d2a6f54f0 Tomi Valkeinen   2021-06-10  82  __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  83  	      unsigned int pad, enum v4l2_subdev_format_whence which)
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  84  {
f0d9c8924e2c33 Steve Longerbeam 2017-06-07 @85  	struct imx_ic_priv *ic_priv = priv->ic_priv;
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  86  
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  87  	if (which == V4L2_SUBDEV_FORMAT_TRY)
95c1b021ae1138 Sakari Ailus     2023-10-13  88  		return v4l2_subdev_get_format(sd_state, pad, 0);
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  89  	else
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  90  		return &priv->format_mbus;
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  91  }
f0d9c8924e2c33 Steve Longerbeam 2017-06-07  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
