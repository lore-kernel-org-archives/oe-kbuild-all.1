Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A981FB4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJbw901S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705229772; x=1736765772;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ZLuyD+Q5xIXaie2Zsns4LmNT4TnSgOeQUPbhe3z9y0=;
  b=cJbw901SUWUpYlvpHxJ5jBXJe78xWIeLr0gyPy/S+3AkY2tKVynlpUVS
   wHeZK8ZApUkrsqZ6l7Z+Ipq8rH+rfqGdWyXExvXnq1KUH6KhiAH2YBXDL
   FgurHIAJzjAFolCFqqgv88P3mCov65ClD0cQ3mAkuyu4YuGfeOIkja9g8
   jkE3TS5ATPwDg4A57xAmwpNykL8HBeQ5z8rIz+D8GlnMPupvybTe0Jmfr
   1DUKJQz5ZY1WYsLNkYQLdRz4JBClqNnFwsrAiORZnap4tWLttmJlWzgQT
   s7EJ5w7o0MNpS1bInwv7UveQMZkM9/h3DF421KAGGz6KQx/OVBpOpYH6c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="399128627"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="399128627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 02:56:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="759583154"
X-IronPort-AV: E=Sophos;i="6.04,194,1695711600"; 
   d="scan'208";a="759583154"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Jan 2024 02:56:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOy9u-000BR8-0q;
	Sun, 14 Jan 2024 10:56:06 +0000
Date: Sun, 14 Jan 2024 18:55:29 +0800
From: kernel test robot <lkp@intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] media: v4l: implement virtual channels
Message-ID: <202401141855.lmVJSToP-lkp@intel.com>
References: <20240110125103.215267-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110125103.215267-1-demonsingur@gmail.com>

Hi Cosmin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7]
[cannot apply to media-tree/master linuxtv-media-stage/master sailus-media-tree/streams linus/master next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cosmin-Tanislav/media-v4l-implement-virtual-channels/20240110-204915
base:   v6.7
patch link:    https://lore.kernel.org/r/20240110125103.215267-1-demonsingur%40gmail.com
patch subject: [RFC PATCH] media: v4l: implement virtual channels
reproduce: (https://download.01.org/0day-ci/archive/20240114/202401141855.lmVJSToP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401141855.lmVJSToP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/media/v4l2-subdev.h:729: warning: Function parameter or member 'vc' not described in 'v4l2_subdev_stream_config'
>> ./include/media/v4l2-subdev.h:901: warning: Function parameter or member 'get_vc' not described in 'v4l2_subdev_pad_ops'
>> ./include/media/v4l2-subdev.h:901: warning: Function parameter or member 'set_vc' not described in 'v4l2_subdev_pad_ops'

vim +729 ./include/media/v4l2-subdev.h

f7234138f14c22 Hans Verkuil          2015-03-04  707  
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  708  /**
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  709   * struct v4l2_subdev_stream_config - Used for storing stream configuration.
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  710   *
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  711   * @pad: pad number
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  712   * @stream: stream number
d0749adb30706f Laurent Pinchart      2021-12-13  713   * @enabled: has the stream been enabled with v4l2_subdev_enable_stream()
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  714   * @fmt: &struct v4l2_mbus_framefmt
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  715   * @crop: &struct v4l2_rect to be used for crop
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  716   * @compose: &struct v4l2_rect to be used for compose
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  717   *
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  718   * This structure stores configuration for a stream.
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  719   */
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  720  struct v4l2_subdev_stream_config {
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  721  	u32 pad;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  722  	u32 stream;
d0749adb30706f Laurent Pinchart      2021-12-13  723  	bool enabled;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  724  
c6b46aa829653e Cosmin Tanislav       2024-01-10  725  	u32 vc;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  726  	struct v4l2_mbus_framefmt fmt;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  727  	struct v4l2_rect crop;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  728  	struct v4l2_rect compose;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21 @729  };
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  730  
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  731  /**
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  732   * struct v4l2_subdev_stream_configs - A collection of stream configs.
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  733   *
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  734   * @num_configs: number of entries in @config.
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  735   * @configs: an array of &struct v4l2_subdev_stream_configs.
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  736   */
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  737  struct v4l2_subdev_stream_configs {
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  738  	u32 num_configs;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  739  	struct v4l2_subdev_stream_config *configs;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  740  };
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  741  
a418bb3f30d9ac Laurent Pinchart      2021-04-23  742  /**
a418bb3f30d9ac Laurent Pinchart      2021-04-23  743   * struct v4l2_subdev_krouting - subdev routing table
a418bb3f30d9ac Laurent Pinchart      2021-04-23  744   *
a418bb3f30d9ac Laurent Pinchart      2021-04-23  745   * @num_routes: number of routes
a418bb3f30d9ac Laurent Pinchart      2021-04-23  746   * @routes: &struct v4l2_subdev_route
a418bb3f30d9ac Laurent Pinchart      2021-04-23  747   *
a418bb3f30d9ac Laurent Pinchart      2021-04-23  748   * This structure contains the routing table for a subdev.
a418bb3f30d9ac Laurent Pinchart      2021-04-23  749   */
a418bb3f30d9ac Laurent Pinchart      2021-04-23  750  struct v4l2_subdev_krouting {
a418bb3f30d9ac Laurent Pinchart      2021-04-23  751  	unsigned int num_routes;
a418bb3f30d9ac Laurent Pinchart      2021-04-23  752  	struct v4l2_subdev_route *routes;
a418bb3f30d9ac Laurent Pinchart      2021-04-23  753  };
a418bb3f30d9ac Laurent Pinchart      2021-04-23  754  
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  755  /**
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  756   * struct v4l2_subdev_state - Used for storing subdev state information.
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  757   *
ed647ea668fb27 Tomi Valkeinen        2022-04-12  758   * @_lock: default for 'lock'
ed647ea668fb27 Tomi Valkeinen        2022-04-12  759   * @lock: mutex for the state. May be replaced by the user.
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  760   * @pads: &struct v4l2_subdev_pad_config array
a418bb3f30d9ac Laurent Pinchart      2021-04-23  761   * @routing: routing table for the subdev
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  762   * @stream_configs: stream configurations (only for V4L2_SUBDEV_FL_STREAMS)
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  763   *
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  764   * This structure only needs to be passed to the pad op if the 'which' field
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  765   * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  766   * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  767   */
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  768  struct v4l2_subdev_state {
ed647ea668fb27 Tomi Valkeinen        2022-04-12  769  	/* lock for the struct v4l2_subdev_state fields */
ed647ea668fb27 Tomi Valkeinen        2022-04-12  770  	struct mutex _lock;
ed647ea668fb27 Tomi Valkeinen        2022-04-12  771  	struct mutex *lock;
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  772  	struct v4l2_subdev_pad_config *pads;
a418bb3f30d9ac Laurent Pinchart      2021-04-23  773  	struct v4l2_subdev_krouting routing;
2f91e10ee6fd4c Tomi Valkeinen        2021-12-21  774  	struct v4l2_subdev_stream_configs stream_configs;
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  775  };
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  776  
291031192426bf Sylwester Nawrocki    2012-05-17  777  /**
291031192426bf Sylwester Nawrocki    2012-05-17  778   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  779   *
9b02cbb3ede89b Laurent Pinchart      2015-04-24  780   * @init_cfg: initialize the pad config to default values
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  781   * @enum_mbus_code: callback for VIDIOC_SUBDEV_ENUM_MBUS_CODE() ioctl handler
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  782   *		    code.
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  783   * @enum_frame_size: callback for VIDIOC_SUBDEV_ENUM_FRAME_SIZE() ioctl handler
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  784   *		     code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  785   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  786   * @enum_frame_interval: callback for VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL() ioctl
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  787   *			 handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  788   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  789   * @get_fmt: callback for VIDIOC_SUBDEV_G_FMT() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  790   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  791   * @set_fmt: callback for VIDIOC_SUBDEV_S_FMT() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  792   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  793   * @get_selection: callback for VIDIOC_SUBDEV_G_SELECTION() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  794   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  795   * @set_selection: callback for VIDIOC_SUBDEV_S_SELECTION() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  796   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  797   * @get_edid: callback for VIDIOC_SUBDEV_G_EDID() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  798   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  799   * @set_edid: callback for VIDIOC_SUBDEV_S_EDID() ioctl handler code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  800   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  801   * @dv_timings_cap: callback for VIDIOC_SUBDEV_DV_TIMINGS_CAP() ioctl handler
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  802   *		    code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  803   *
3fb558f6c3bbcc Mauro Carvalho Chehab 2017-10-05  804   * @enum_dv_timings: callback for VIDIOC_SUBDEV_ENUM_DV_TIMINGS() ioctl handler
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  805   *		     code.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  806   *
1d8955b2c3fa47 Mauro Carvalho Chehab 2015-08-22  807   * @link_validate: used by the media controller code to check if the links
1d8955b2c3fa47 Mauro Carvalho Chehab 2015-08-22  808   *		   that belongs to a pipeline can be used for stream.
1d8955b2c3fa47 Mauro Carvalho Chehab 2015-08-22  809   *
291031192426bf Sylwester Nawrocki    2012-05-17  810   * @get_frame_desc: get the current low level media bus frame parameters.
e44cc20a1d0952 Mauro Carvalho Chehab 2015-08-22  811   *
1d8955b2c3fa47 Mauro Carvalho Chehab 2015-08-22  812   * @set_frame_desc: set the low level media bus frame parameters, @fd array
291031192426bf Sylwester Nawrocki    2012-05-17  813   *                  may be adjusted by the subdev driver to device capabilities.
38df0b8506130c Jacopo Mondi          2020-07-17  814   *
38df0b8506130c Jacopo Mondi          2020-07-17  815   * @get_mbus_config: get the media bus configuration of a remote sub-device.
38df0b8506130c Jacopo Mondi          2020-07-17  816   *		     The media bus configuration is usually retrieved from the
38df0b8506130c Jacopo Mondi          2020-07-17  817   *		     firmware interface at sub-device probe time, immediately
38df0b8506130c Jacopo Mondi          2020-07-17  818   *		     applied to the hardware and eventually adjusted by the
38df0b8506130c Jacopo Mondi          2020-07-17  819   *		     driver. Remote sub-devices (usually video receivers) shall
38df0b8506130c Jacopo Mondi          2020-07-17  820   *		     use this operation to query the transmitting end bus
38df0b8506130c Jacopo Mondi          2020-07-17  821   *		     configuration in order to adjust their own one accordingly.
38df0b8506130c Jacopo Mondi          2020-07-17  822   *		     Callers should make sure they get the most up-to-date as
38df0b8506130c Jacopo Mondi          2020-07-17  823   *		     possible configuration from the remote end, likely calling
38df0b8506130c Jacopo Mondi          2020-07-17  824   *		     this operation as close as possible to stream on time. The
38df0b8506130c Jacopo Mondi          2020-07-17  825   *		     operation shall fail if the pad index it has been called on
38df0b8506130c Jacopo Mondi          2020-07-17  826   *		     is not valid or in case of unrecoverable failures.
a418bb3f30d9ac Laurent Pinchart      2021-04-23  827   *
da7e34e558a522 Laurent Pinchart      2023-08-18  828   * @set_routing: Enable or disable data connection routes described in the
da7e34e558a522 Laurent Pinchart      2023-08-18  829   *		 subdevice routing table. Subdevs that implement this operation
da7e34e558a522 Laurent Pinchart      2023-08-18  830   *		 must set the V4L2_SUBDEV_FL_STREAMS flag.
d0749adb30706f Laurent Pinchart      2021-12-13  831   *
d0749adb30706f Laurent Pinchart      2021-12-13  832   * @enable_streams: Enable the streams defined in streams_mask on the given
d0749adb30706f Laurent Pinchart      2021-12-13  833   *	source pad. Subdevs that implement this operation must use the active
d0749adb30706f Laurent Pinchart      2021-12-13  834   *	state management provided by the subdev core (enabled through a call to
d0749adb30706f Laurent Pinchart      2021-12-13  835   *	v4l2_subdev_init_finalize() at initialization time). Do not call
d0749adb30706f Laurent Pinchart      2021-12-13  836   *	directly, use v4l2_subdev_enable_streams() instead.
d0749adb30706f Laurent Pinchart      2021-12-13  837   *
d0749adb30706f Laurent Pinchart      2021-12-13  838   * @disable_streams: Disable the streams defined in streams_mask on the given
d0749adb30706f Laurent Pinchart      2021-12-13  839   *	source pad. Subdevs that implement this operation must use the active
d0749adb30706f Laurent Pinchart      2021-12-13  840   *	state management provided by the subdev core (enabled through a call to
d0749adb30706f Laurent Pinchart      2021-12-13  841   *	v4l2_subdev_init_finalize() at initialization time). Do not call
d0749adb30706f Laurent Pinchart      2021-12-13  842   *	directly, use v4l2_subdev_disable_streams() instead.
291031192426bf Sylwester Nawrocki    2012-05-17  843   */
eb08f35480869f Laurent Pinchart      2009-12-09  844  struct v4l2_subdev_pad_ops {
9b02cbb3ede89b Laurent Pinchart      2015-04-24  845  	int (*init_cfg)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  846  			struct v4l2_subdev_state *state);
f7234138f14c22 Hans Verkuil          2015-03-04  847  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  848  			      struct v4l2_subdev_state *state,
333c8b97785d5a Laurent Pinchart      2010-03-15  849  			      struct v4l2_subdev_mbus_code_enum *code);
333c8b97785d5a Laurent Pinchart      2010-03-15  850  	int (*enum_frame_size)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  851  			       struct v4l2_subdev_state *state,
333c8b97785d5a Laurent Pinchart      2010-03-15  852  			       struct v4l2_subdev_frame_size_enum *fse);
35c3017a29d278 Laurent Pinchart      2010-05-05  853  	int (*enum_frame_interval)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  854  				   struct v4l2_subdev_state *state,
35c3017a29d278 Laurent Pinchart      2010-05-05  855  				   struct v4l2_subdev_frame_interval_enum *fie);
f7234138f14c22 Hans Verkuil          2015-03-04  856  	int (*get_fmt)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  857  		       struct v4l2_subdev_state *state,
333c8b97785d5a Laurent Pinchart      2010-03-15  858  		       struct v4l2_subdev_format *format);
f7234138f14c22 Hans Verkuil          2015-03-04  859  	int (*set_fmt)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  860  		       struct v4l2_subdev_state *state,
333c8b97785d5a Laurent Pinchart      2010-03-15  861  		       struct v4l2_subdev_format *format);
c6b46aa829653e Cosmin Tanislav       2024-01-10  862  	int (*get_vc)(struct v4l2_subdev *sd,
c6b46aa829653e Cosmin Tanislav       2024-01-10  863  		      struct v4l2_subdev_state *state,
c6b46aa829653e Cosmin Tanislav       2024-01-10  864  		      struct v4l2_subdev_vc *vc);
c6b46aa829653e Cosmin Tanislav       2024-01-10  865  	int (*set_vc)(struct v4l2_subdev *sd,
c6b46aa829653e Cosmin Tanislav       2024-01-10  866  		      struct v4l2_subdev_state *state,
c6b46aa829653e Cosmin Tanislav       2024-01-10  867  		      struct v4l2_subdev_vc *vc);
f7234138f14c22 Hans Verkuil          2015-03-04  868  	int (*get_selection)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  869  			     struct v4l2_subdev_state *state,
ae184cda8d0eeb Sakari Ailus          2011-10-14  870  			     struct v4l2_subdev_selection *sel);
f7234138f14c22 Hans Verkuil          2015-03-04  871  	int (*set_selection)(struct v4l2_subdev *sd,
0d346d2a6f54f0 Tomi Valkeinen        2021-06-10  872  			     struct v4l2_subdev_state *state,
ae184cda8d0eeb Sakari Ailus          2011-10-14  873  			     struct v4l2_subdev_selection *sel);
dd519bb34a09d8 Hans Verkuil          2014-03-07  874  	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
dd519bb34a09d8 Hans Verkuil          2014-03-07  875  	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
0349f6a5f18e92 Laurent Pinchart      2014-01-29  876  	int (*dv_timings_cap)(struct v4l2_subdev *sd,
0349f6a5f18e92 Laurent Pinchart      2014-01-29  877  			      struct v4l2_dv_timings_cap *cap);
0349f6a5f18e92 Laurent Pinchart      2014-01-29  878  	int (*enum_dv_timings)(struct v4l2_subdev *sd,
0349f6a5f18e92 Laurent Pinchart      2014-01-29  879  			       struct v4l2_enum_dv_timings *timings);
8227c92b696884 Sakari Ailus          2011-10-10  880  #ifdef CONFIG_MEDIA_CONTROLLER
8227c92b696884 Sakari Ailus          2011-10-10  881  	int (*link_validate)(struct v4l2_subdev *sd, struct media_link *link,
8227c92b696884 Sakari Ailus          2011-10-10  882  			     struct v4l2_subdev_format *source_fmt,
8227c92b696884 Sakari Ailus          2011-10-10  883  			     struct v4l2_subdev_format *sink_fmt);
8227c92b696884 Sakari Ailus          2011-10-10  884  #endif /* CONFIG_MEDIA_CONTROLLER */
291031192426bf Sylwester Nawrocki    2012-05-17  885  	int (*get_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
291031192426bf Sylwester Nawrocki    2012-05-17  886  			      struct v4l2_mbus_frame_desc *fd);
291031192426bf Sylwester Nawrocki    2012-05-17  887  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
291031192426bf Sylwester Nawrocki    2012-05-17  888  			      struct v4l2_mbus_frame_desc *fd);
38df0b8506130c Jacopo Mondi          2020-07-17  889  	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
38df0b8506130c Jacopo Mondi          2020-07-17  890  			       struct v4l2_mbus_config *config);
a418bb3f30d9ac Laurent Pinchart      2021-04-23  891  	int (*set_routing)(struct v4l2_subdev *sd,
a418bb3f30d9ac Laurent Pinchart      2021-04-23  892  			   struct v4l2_subdev_state *state,
a418bb3f30d9ac Laurent Pinchart      2021-04-23  893  			   enum v4l2_subdev_format_whence which,
a418bb3f30d9ac Laurent Pinchart      2021-04-23  894  			   struct v4l2_subdev_krouting *route);
d0749adb30706f Laurent Pinchart      2021-12-13  895  	int (*enable_streams)(struct v4l2_subdev *sd,
d0749adb30706f Laurent Pinchart      2021-12-13  896  			      struct v4l2_subdev_state *state, u32 pad,
d0749adb30706f Laurent Pinchart      2021-12-13  897  			      u64 streams_mask);
d0749adb30706f Laurent Pinchart      2021-12-13  898  	int (*disable_streams)(struct v4l2_subdev *sd,
d0749adb30706f Laurent Pinchart      2021-12-13  899  			       struct v4l2_subdev_state *state, u32 pad,
d0749adb30706f Laurent Pinchart      2021-12-13  900  			       u64 streams_mask);
eb08f35480869f Laurent Pinchart      2009-12-09 @901  };
eb08f35480869f Laurent Pinchart      2009-12-09  902  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
