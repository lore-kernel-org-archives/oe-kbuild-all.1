Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAE1FC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 01:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b56HR87c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704514; x=1732240514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AZJ271P9oq4wW/F8qserHlPAU235ACCRwStgacxDnBY=;
  b=b56HR87cs6fmX55NnkmmrNKMl7s7+tjL+xn9B9p9On9wRqkxetjXAoqm
   3DW3oS+fpNMAfqWx61GHx1zII0daE53Lntt8H2zQ5Not/U0WLBgDlDLgZ
   kRsGoDy+oYgH5jzQEjCyNwScLbMhKhJNJop0lJtYl3WCWBhAgIsRkUuKc
   HDtvWunW+OTcU6aGGAJgabjxEONLwT6prpZcmI1yuTwbPFLgnTfcel04P
   76fx00mrgm/RbIhTgPikeTosbaYAXswqFHt8n9XBthBk4zcRgntE1ByQX
   95Q2hEFk36Uo34Gxa0GtE2Szt46roI82zQd12SfWiv05ZM3BIlUXLRY4N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13737176"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13737176"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801909594"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801909594"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Nov 2023 17:55:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvr-00016F-0h;
	Thu, 23 Nov 2023 01:55:07 +0000
Date: Thu, 23 Nov 2023 09:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Pavel Machek <pavel@ucw.cz>,
	Alain Volmat <alain.volmat@foss.st.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] media: i2c: gc2145: Galaxy Core GC2145 sensor
 support
Message-ID: <202311230621.ATIDPgtm-lkp@intel.com>
References: <20231122075154.789431-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122075154.789431-4-alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-stage/master]
[also build test ERROR on linus/master v6.7-rc2 next-20231122]
[cannot apply to media-tree/master robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/dt-bindings-vendor-prefixes-Add-prefix-for-GalaxyCore-Inc/20231122-155443
base:   https://git.linuxtv.org/media_stage.git master
patch link:    https://lore.kernel.org/r/20231122075154.789431-4-alain.volmat%40foss.st.com
patch subject: [PATCH v5 3/3] media: i2c: gc2145: Galaxy Core GC2145 sensor support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231123/202311230621.ATIDPgtm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230621.ATIDPgtm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230621.ATIDPgtm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/gc2145.c: In function 'gc2145_init_cfg':
>> drivers/media/i2c/gc2145.c:664:18: error: implicit declaration of function 'v4l2_subdev_state_get_format'; did you mean 'v4l2_subdev_state_get_stream_format'? [-Werror=implicit-function-declaration]
     664 |         format = v4l2_subdev_state_get_format(state, 0);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_state_get_stream_format
   drivers/media/i2c/gc2145.c:664:16: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     664 |         format = v4l2_subdev_state_get_format(state, 0);
         |                ^
>> drivers/media/i2c/gc2145.c:669:16: error: implicit declaration of function 'v4l2_subdev_state_get_crop'; did you mean 'v4l2_subdev_state_get_stream_crop'? [-Werror=implicit-function-declaration]
     669 |         crop = v4l2_subdev_state_get_crop(state, 0);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                v4l2_subdev_state_get_stream_crop
   drivers/media/i2c/gc2145.c:669:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     669 |         crop = v4l2_subdev_state_get_crop(state, 0);
         |              ^
   drivers/media/i2c/gc2145.c: In function 'gc2145_get_selection':
   drivers/media/i2c/gc2145.c:681:26: error: invalid type argument of unary '*' (have 'int')
     681 |                 sel->r = *v4l2_subdev_state_get_crop(sd_state, 0);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/gc2145.c: In function 'gc2145_set_pad_format':
   drivers/media/i2c/gc2145.c:758:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     758 |         framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
         |                  ^
   drivers/media/i2c/gc2145.c:770:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     770 |         crop = v4l2_subdev_state_get_crop(sd_state, fmt->pad);
         |              ^
   drivers/media/i2c/gc2145.c: In function 'gc2145_start_streaming':
   drivers/media/i2c/gc2145.c:874:13: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     874 |         fmt = v4l2_subdev_state_get_format(state, 0);
         |             ^
   cc1: some warnings being treated as errors


vim +664 drivers/media/i2c/gc2145.c

   655	
   656	static int gc2145_init_cfg(struct v4l2_subdev *sd,
   657				   struct v4l2_subdev_state *state)
   658	{
   659		struct gc2145 *gc2145 = to_gc2145(sd);
   660		struct v4l2_mbus_framefmt *format;
   661		struct v4l2_rect *crop;
   662	
   663		/* Initialize pad format */
 > 664		format = v4l2_subdev_state_get_format(state, 0);
   665		gc2145_update_pad_format(gc2145, &supported_modes[0], format,
   666					 MEDIA_BUS_FMT_RGB565_1X16);
   667	
   668		/* Initialize crop rectangle. */
 > 669		crop = v4l2_subdev_state_get_crop(state, 0);
   670		*crop = supported_modes[0].crop;
   671	
   672		return 0;
   673	}
   674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
