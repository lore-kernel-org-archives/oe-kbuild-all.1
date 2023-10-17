Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1A3AC36
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/cwssQB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697530971; x=1729066971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u1oEUSaE6sBUllJMVGVzCdRl0KZ4kTsD6RtOAITU7JM=;
  b=m/cwssQBWYe3gwbGnfDbE+QtwS75c37JpjwVJ4wmf9fJ/0NxHHcumX8r
   8lLR7PNnSw9Uo8xurQceUPwLQhjdRBv6/BQkjkL/MTxE1HC3+1shnqp7N
   +gZtsz5hOs9/x+F0mwQd6QfNlSf9LhJ1doXfh3w4eN8Hdl8SFkpkQO3qR
   I2fhGFDdmGLILak0BouGC2n+hHI6lgLDKzT063BOpwGgq6Y4nsO671CNk
   kWltKsn/hImX+04pdrsBxythwpooAP+iLbYszToTlEbrXiH4PksATyBKj
   bQb1lZGUjUkFiGfDKWHDZBm8tOdC4ksAjFUNp3HoS7JCyOuKOgRUAkKNQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="389598078"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="389598078"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="899830496"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="899830496"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 01:20:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsfLd-0009LQ-25;
	Tue, 17 Oct 2023 08:22:41 +0000
Date: Tue, 17 Oct 2023 16:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com
Subject: Re: [PATCH 3/6] media: v4l: subdev: Rename sub-device state
 information access functions
Message-ID: <202310171645.8Tac7Ez4-lkp@intel.com>
References: <20231013104424.404768-4-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013104424.404768-4-sakari.ailus@linux.intel.com>

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20231016]
[also build test WARNING on linus/master v6.6-rc6]
[cannot apply to media-tree/master rockchip/for-next sailus-media-tree/streams v6.6-rc6 v6.6-rc5 v6.6-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l-subdev-Also-return-pads-array-information-on-stream-functions/20231017-120800
base:   next-20231016
patch link:    https://lore.kernel.org/r/20231013104424.404768-4-sakari.ailus%40linux.intel.com
patch subject: [PATCH 3/6] media: v4l: subdev: Rename sub-device state information access functions
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310171645.8Tac7Ez4-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171645.8Tac7Ez4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171645.8Tac7Ez4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_gasket_enable':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:61:15: error: implicit declaration of function 'v4l2_subdev_state_get_stream_format'; did you mean 'v4l2_subdev_state_get_opposite_stream_format'? [-Werror=implicit-function-declaration]
      61 |         fmt = v4l2_subdev_state_get_stream_format(state, port, 0);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               v4l2_subdev_state_get_opposite_stream_format
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:61:13: warning: assignment to 'const struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      61 |         fmt = v4l2_subdev_state_get_stream_format(state, port, 0);
         |             ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_fmt':
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:284:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     284 |         sink_fmt = v4l2_subdev_state_get_stream_format(state, fmt->pad,
         |                  ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:299:28: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     299 |                 source_fmt = v4l2_subdev_state_get_stream_format(state, route->source_pad,
         |                            ^
   cc1: some warnings being treated as errors


vim +61 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

cf21f328fcafac Laurent Pinchart 2019-01-21  26  
cf21f328fcafac Laurent Pinchart 2019-01-21  27  static int mxc_isi_crossbar_gasket_enable(struct mxc_isi_crossbar *xbar,
cf21f328fcafac Laurent Pinchart 2019-01-21  28  					  struct v4l2_subdev_state *state,
cf21f328fcafac Laurent Pinchart 2019-01-21  29  					  struct v4l2_subdev *remote_sd,
cf21f328fcafac Laurent Pinchart 2019-01-21  30  					  u32 remote_pad, unsigned int port)
cf21f328fcafac Laurent Pinchart 2019-01-21  31  {
cf21f328fcafac Laurent Pinchart 2019-01-21  32  	struct mxc_isi_dev *isi = xbar->isi;
f48498ad0a4106 Guoniu.zhou      2023-06-29  33  	const struct mxc_gasket_ops *gasket_ops = isi->pdata->gasket_ops;
cf21f328fcafac Laurent Pinchart 2019-01-21  34  	const struct v4l2_mbus_framefmt *fmt;
cf21f328fcafac Laurent Pinchart 2019-01-21  35  	struct v4l2_mbus_frame_desc fd;
cf21f328fcafac Laurent Pinchart 2019-01-21  36  	int ret;
cf21f328fcafac Laurent Pinchart 2019-01-21  37  
f48498ad0a4106 Guoniu.zhou      2023-06-29  38  	if (!gasket_ops)
cf21f328fcafac Laurent Pinchart 2019-01-21  39  		return 0;
cf21f328fcafac Laurent Pinchart 2019-01-21  40  
cf21f328fcafac Laurent Pinchart 2019-01-21  41  	/*
cf21f328fcafac Laurent Pinchart 2019-01-21  42  	 * Configure and enable the gasket with the frame size and CSI-2 data
cf21f328fcafac Laurent Pinchart 2019-01-21  43  	 * type. For YUV422 8-bit, enable dual component mode unconditionally,
cf21f328fcafac Laurent Pinchart 2019-01-21  44  	 * to match the configuration of the CSIS.
cf21f328fcafac Laurent Pinchart 2019-01-21  45  	 */
cf21f328fcafac Laurent Pinchart 2019-01-21  46  
cf21f328fcafac Laurent Pinchart 2019-01-21  47  	ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc, remote_pad, &fd);
cf21f328fcafac Laurent Pinchart 2019-01-21  48  	if (ret) {
cf21f328fcafac Laurent Pinchart 2019-01-21  49  		dev_err(isi->dev,
cf21f328fcafac Laurent Pinchart 2019-01-21  50  			"failed to get frame descriptor from '%s':%u: %d\n",
cf21f328fcafac Laurent Pinchart 2019-01-21  51  			remote_sd->name, remote_pad, ret);
cf21f328fcafac Laurent Pinchart 2019-01-21  52  		return ret;
cf21f328fcafac Laurent Pinchart 2019-01-21  53  	}
cf21f328fcafac Laurent Pinchart 2019-01-21  54  
cf21f328fcafac Laurent Pinchart 2019-01-21  55  	if (fd.num_entries != 1) {
cf21f328fcafac Laurent Pinchart 2019-01-21  56  		dev_err(isi->dev, "invalid frame descriptor for '%s':%u\n",
cf21f328fcafac Laurent Pinchart 2019-01-21  57  			remote_sd->name, remote_pad);
cf21f328fcafac Laurent Pinchart 2019-01-21  58  		return -EINVAL;
cf21f328fcafac Laurent Pinchart 2019-01-21  59  	}
cf21f328fcafac Laurent Pinchart 2019-01-21  60  
cf21f328fcafac Laurent Pinchart 2019-01-21 @61  	fmt = v4l2_subdev_state_get_stream_format(state, port, 0);
cf21f328fcafac Laurent Pinchart 2019-01-21  62  	if (!fmt)
cf21f328fcafac Laurent Pinchart 2019-01-21  63  		return -EINVAL;
cf21f328fcafac Laurent Pinchart 2019-01-21  64  
f48498ad0a4106 Guoniu.zhou      2023-06-29  65  	gasket_ops->enable(isi, &fd, fmt, port);
cf21f328fcafac Laurent Pinchart 2019-01-21  66  	return 0;
cf21f328fcafac Laurent Pinchart 2019-01-21  67  }
cf21f328fcafac Laurent Pinchart 2019-01-21  68  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
