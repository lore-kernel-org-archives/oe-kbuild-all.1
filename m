Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2894517F2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Sep 2023 05:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695966448; x=1727502448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9utYOH/4ivYq0bQw9qoun8O5GnA5JotYCL757Uykuw=;
  b=iDNvAi/xnZRLuzsxTA3LQk6g1aPNNoE8pa/kKnoDj+7eWutwDPrFf3/x
   f4U3d4bfpvfznkd9Zb+VQA6dbj+j2njru9O1F4qjFzuoRQD+XRqmdmQ35
   ydSIW4jDCSlqCIjSmDg3c+evL8KryOPlbnhsuAXwahp6LJTnap0mbcyB8
   keninBoeixGsSR/eUjxuvAR9Hqs/9librEAAKtj/4y0pFqcweyVDyxCr0
   1ZMiefMRr1YeoZlAhIQaBmS2YD0psL3r/Q2URp1V1hYwNeReNgpOik53N
   1pUv6pEx6bY5UpI66E6QpNR6yFLH455bVWQXopHXQDazEhqQ1zlK7yyLi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="468518691"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="468518691"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 22:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="893312219"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; 
   d="scan'208";a="893312219"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2023 22:46:08 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qm6LO-0002Wa-0P;
	Fri, 29 Sep 2023 05:47:18 +0000
Date: Fri, 29 Sep 2023 13:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 283/1370] htmldocs:
 ./include/media/v4l2-subdev.h:812: warning: Function parameter or member
 'get_routing' not described in 'v4l2_subdev_pad_ops'
Message-ID: <202309291353.3YDhvqDX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: fb622f76823f4a9b5e37b272004cea8ac6becd47 [283/1370] v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations
reproduce: (https://download.01.org/0day-ci/archive/20230929/202309291353.3YDhvqDX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309291353.3YDhvqDX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-subdev.h:812: warning: Function parameter or member 'get_routing' not described in 'v4l2_subdev_pad_ops'
>> ./include/media/v4l2-subdev.h:812: warning: Function parameter or member 'set_routing' not described in 'v4l2_subdev_pad_ops'

vim +812 ./include/media/v4l2-subdev.h

0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  715  
291031192426bfc Sylwester Nawrocki    2012-05-17  716  /**
291031192426bfc Sylwester Nawrocki    2012-05-17  717   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  718   *
9b02cbb3ede89b5 Laurent Pinchart      2015-04-24  719   * @init_cfg: initialize the pad config to default values
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  720   * @enum_mbus_code: callback for VIDIOC_SUBDEV_ENUM_MBUS_CODE() ioctl handler
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  721   *		    code.
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  722   * @enum_frame_size: callback for VIDIOC_SUBDEV_ENUM_FRAME_SIZE() ioctl handler
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  723   *		     code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  724   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  725   * @enum_frame_interval: callback for VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL() ioctl
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  726   *			 handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  727   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  728   * @get_fmt: callback for VIDIOC_SUBDEV_G_FMT() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  729   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  730   * @set_fmt: callback for VIDIOC_SUBDEV_S_FMT() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  731   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  732   * @get_selection: callback for VIDIOC_SUBDEV_G_SELECTION() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  733   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  734   * @set_selection: callback for VIDIOC_SUBDEV_S_SELECTION() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  735   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  736   * @get_edid: callback for VIDIOC_SUBDEV_G_EDID() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  737   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  738   * @set_edid: callback for VIDIOC_SUBDEV_S_EDID() ioctl handler code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  739   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  740   * @dv_timings_cap: callback for VIDIOC_SUBDEV_DV_TIMINGS_CAP() ioctl handler
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  741   *		    code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  742   *
3fb558f6c3bbcc4 Mauro Carvalho Chehab 2017-10-05  743   * @enum_dv_timings: callback for VIDIOC_SUBDEV_ENUM_DV_TIMINGS() ioctl handler
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  744   *		     code.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  745   *
1d8955b2c3fa476 Mauro Carvalho Chehab 2015-08-22  746   * @link_validate: used by the media controller code to check if the links
1d8955b2c3fa476 Mauro Carvalho Chehab 2015-08-22  747   *		   that belongs to a pipeline can be used for stream.
1d8955b2c3fa476 Mauro Carvalho Chehab 2015-08-22  748   *
291031192426bfc Sylwester Nawrocki    2012-05-17  749   * @get_frame_desc: get the current low level media bus frame parameters.
e44cc20a1d09528 Mauro Carvalho Chehab 2015-08-22  750   *
1d8955b2c3fa476 Mauro Carvalho Chehab 2015-08-22  751   * @set_frame_desc: set the low level media bus frame parameters, @fd array
291031192426bfc Sylwester Nawrocki    2012-05-17  752   *                  may be adjusted by the subdev driver to device capabilities.
38df0b8506130c9 Jacopo Mondi          2020-07-17  753   *
38df0b8506130c9 Jacopo Mondi          2020-07-17  754   * @get_mbus_config: get the media bus configuration of a remote sub-device.
38df0b8506130c9 Jacopo Mondi          2020-07-17  755   *		     The media bus configuration is usually retrieved from the
38df0b8506130c9 Jacopo Mondi          2020-07-17  756   *		     firmware interface at sub-device probe time, immediately
38df0b8506130c9 Jacopo Mondi          2020-07-17  757   *		     applied to the hardware and eventually adjusted by the
38df0b8506130c9 Jacopo Mondi          2020-07-17  758   *		     driver. Remote sub-devices (usually video receivers) shall
38df0b8506130c9 Jacopo Mondi          2020-07-17  759   *		     use this operation to query the transmitting end bus
38df0b8506130c9 Jacopo Mondi          2020-07-17  760   *		     configuration in order to adjust their own one accordingly.
38df0b8506130c9 Jacopo Mondi          2020-07-17  761   *		     Callers should make sure they get the most up-to-date as
38df0b8506130c9 Jacopo Mondi          2020-07-17  762   *		     possible configuration from the remote end, likely calling
38df0b8506130c9 Jacopo Mondi          2020-07-17  763   *		     this operation as close as possible to stream on time. The
38df0b8506130c9 Jacopo Mondi          2020-07-17  764   *		     operation shall fail if the pad index it has been called on
38df0b8506130c9 Jacopo Mondi          2020-07-17  765   *		     is not valid or in case of unrecoverable failures.
291031192426bfc Sylwester Nawrocki    2012-05-17  766   */
eb08f35480869f7 Laurent Pinchart      2009-12-09  767  struct v4l2_subdev_pad_ops {
9b02cbb3ede89b5 Laurent Pinchart      2015-04-24  768  	int (*init_cfg)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  769  			struct v4l2_subdev_state *state);
f7234138f14c229 Hans Verkuil          2015-03-04  770  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  771  			      struct v4l2_subdev_state *state,
333c8b97785d5af Laurent Pinchart      2010-03-15  772  			      struct v4l2_subdev_mbus_code_enum *code);
333c8b97785d5af Laurent Pinchart      2010-03-15  773  	int (*enum_frame_size)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  774  			       struct v4l2_subdev_state *state,
333c8b97785d5af Laurent Pinchart      2010-03-15  775  			       struct v4l2_subdev_frame_size_enum *fse);
35c3017a29d278c Laurent Pinchart      2010-05-05  776  	int (*enum_frame_interval)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  777  				   struct v4l2_subdev_state *state,
35c3017a29d278c Laurent Pinchart      2010-05-05  778  				   struct v4l2_subdev_frame_interval_enum *fie);
f7234138f14c229 Hans Verkuil          2015-03-04  779  	int (*get_fmt)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  780  		       struct v4l2_subdev_state *state,
333c8b97785d5af Laurent Pinchart      2010-03-15  781  		       struct v4l2_subdev_format *format);
f7234138f14c229 Hans Verkuil          2015-03-04  782  	int (*set_fmt)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  783  		       struct v4l2_subdev_state *state,
333c8b97785d5af Laurent Pinchart      2010-03-15  784  		       struct v4l2_subdev_format *format);
f7234138f14c229 Hans Verkuil          2015-03-04  785  	int (*get_selection)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  786  			     struct v4l2_subdev_state *state,
ae184cda8d0eebf Sakari Ailus          2011-10-14  787  			     struct v4l2_subdev_selection *sel);
f7234138f14c229 Hans Verkuil          2015-03-04  788  	int (*set_selection)(struct v4l2_subdev *sd,
0d346d2a6f54f06 Tomi Valkeinen        2021-06-10  789  			     struct v4l2_subdev_state *state,
ae184cda8d0eebf Sakari Ailus          2011-10-14  790  			     struct v4l2_subdev_selection *sel);
dd519bb34a09d86 Hans Verkuil          2014-03-07  791  	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
dd519bb34a09d86 Hans Verkuil          2014-03-07  792  	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
0349f6a5f18e929 Laurent Pinchart      2014-01-29  793  	int (*dv_timings_cap)(struct v4l2_subdev *sd,
0349f6a5f18e929 Laurent Pinchart      2014-01-29  794  			      struct v4l2_dv_timings_cap *cap);
0349f6a5f18e929 Laurent Pinchart      2014-01-29  795  	int (*enum_dv_timings)(struct v4l2_subdev *sd,
0349f6a5f18e929 Laurent Pinchart      2014-01-29  796  			       struct v4l2_enum_dv_timings *timings);
8227c92b6968840 Sakari Ailus          2011-10-10  797  #ifdef CONFIG_MEDIA_CONTROLLER
8227c92b6968840 Sakari Ailus          2011-10-10  798  	int (*link_validate)(struct v4l2_subdev *sd, struct media_link *link,
8227c92b6968840 Sakari Ailus          2011-10-10  799  			     struct v4l2_subdev_format *source_fmt,
8227c92b6968840 Sakari Ailus          2011-10-10  800  			     struct v4l2_subdev_format *sink_fmt);
8227c92b6968840 Sakari Ailus          2011-10-10  801  #endif /* CONFIG_MEDIA_CONTROLLER */
291031192426bfc Sylwester Nawrocki    2012-05-17  802  	int (*get_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
291031192426bfc Sylwester Nawrocki    2012-05-17  803  			      struct v4l2_mbus_frame_desc *fd);
291031192426bfc Sylwester Nawrocki    2012-05-17  804  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
291031192426bfc Sylwester Nawrocki    2012-05-17  805  			      struct v4l2_mbus_frame_desc *fd);
38df0b8506130c9 Jacopo Mondi          2020-07-17  806  	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
38df0b8506130c9 Jacopo Mondi          2020-07-17  807  			       struct v4l2_mbus_config *config);
fb622f76823f4a9 Laurent Pinchart      2014-03-26  808  	int (*get_routing)(struct v4l2_subdev *sd,
fb622f76823f4a9 Laurent Pinchart      2014-03-26  809  			   struct v4l2_subdev_routing *route);
fb622f76823f4a9 Laurent Pinchart      2014-03-26  810  	int (*set_routing)(struct v4l2_subdev *sd,
fb622f76823f4a9 Laurent Pinchart      2014-03-26  811  			   struct v4l2_subdev_routing *route);
eb08f35480869f7 Laurent Pinchart      2009-12-09 @812  };
eb08f35480869f7 Laurent Pinchart      2009-12-09  813  

:::::: The code at line 812 was first introduced by commit
:::::: eb08f35480869f7a82e9be1f19bc4575452e7f98 [media] v4l: v4l2_subdev pad-level operations

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
