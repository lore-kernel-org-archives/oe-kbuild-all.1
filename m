Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A573C0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 10:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674900688; x=1706436688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zhVYfpu9Q1x39ZZa1z24WVrHvLjTyYSq6V6S/1XjqH8=;
  b=GULWsz11idPxvJEFaPjDY8Qcalnj4MC3706n1njUZjk44IN8h4ph8FT3
   uJnvtod5PRKuFo4Ojs0/O6n488MIhdD1EniXteshZZBbhL9x+T5PRTNFD
   NyHQwJG5fz6EnxovJo8Q80UFFP6QwnAxHz70KJflJOouJ6FZbspuaNqMW
   2TpL4UVTfGw11GS7Gm3v37btpzSlP7L2vXU4NPl7DQ146rxo7vtVVdlbi
   Q6tL4dOBHOvWEn6uUqY+kDep93EJ2Ltz4o3ZycRgXofUzxbKNOTISunjP
   HFOUpy2KjcyKdfuVNNaXbkyjmdc2ee27qxC/lY1tttumwydZ0DF2mCGYc
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="354587189"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="354587189"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 02:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="640995490"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="640995490"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 02:11:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLiBB-0000Zl-1H;
	Sat, 28 Jan 2023 10:11:25 +0000
Date: Sat, 28 Jan 2023 18:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/3] media: nxp: Add i.MX8 ISI driver
Message-ID: <202301281726.g2hp2rZX-lkp@intel.com>
References: <20230126170603.11896-4-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126170603.11896-4-laurent.pinchart@ideasonboard.com>

Hi Laurent,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/dt-bindings-media-Add-i-MX8-ISI-DT-bindings/20230128-131738
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230126170603.11896-4-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v4 3/3] media: nxp: Add i.MX8 ISI driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230128/202301281726.g2hp2rZX-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8534d315bac28fcd483571a98bd5fe42d154c93a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Laurent-Pinchart/dt-bindings-media-Add-i-MX8-ISI-DT-bindings/20230128-131738
        git checkout 8534d315bac28fcd483571a98bd5fe42d154c93a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/platform/nxp/imx8-isi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

         |               v4l2_subdev_link_validate
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:129:44: error: 'V4L2_SUBDEV_ROUTING_NO_N_TO_1' undeclared (first use in this function)
     129 |                                            V4L2_SUBDEV_ROUTING_NO_N_TO_1);
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:129:44: note: each undeclared identifier is reported only once for each function it appears in
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:134:9: error: implicit declaration of function 'for_each_active_route'; did you mean 'for_each_active_irq'? [-Werror=implicit-function-declaration]
     134 |         for_each_active_route(&state->routing, route) {
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         for_each_active_irq
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:134:37: error: 'struct v4l2_subdev_state' has no member named 'routing'
     134 |         for_each_active_route(&state->routing, route) {
         |                                     ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:134:54: error: expected ';' before '{' token
     134 |         for_each_active_route(&state->routing, route) {
         |                                                      ^~
         |                                                      ;
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:124:34: warning: unused variable 'xbar' [-Wunused-variable]
     124 |         struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
         |                                  ^~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_xlate_streams':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:170:37: error: 'struct v4l2_subdev_state' has no member named 'routing'
     170 |         for_each_active_route(&state->routing, route) {
         |                                     ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:170:54: error: expected ';' before '{' token
     170 |         for_each_active_route(&state->routing, route) {
         |                                                      ^~
         |                                                      ;
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_init_cfg':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:16: error: variable 'routing' has initializer but incomplete type
     207 |         struct v4l2_subdev_krouting routing = { };
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:37: error: storage size of 'routing' isn't known
     207 |         struct v4l2_subdev_krouting routing = { };
         |                                     ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:216:51: error: invalid application of 'sizeof' to incomplete type 'struct v4l2_subdev_route'
     216 |         routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
         |                                                   ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:221:58: error: invalid use of undefined type 'struct v4l2_subdev_route'
     221 |                 struct v4l2_subdev_route *route = &routes[i];
         |                                                          ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:223:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     223 |                 route->sink_pad = i;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:224:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     224 |                 route->source_pad = i + xbar->num_sinks;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:225:22: error: invalid use of undefined type 'struct v4l2_subdev_route'
     225 |                 route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
         |                      ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:225:32: error: 'V4L2_SUBDEV_ROUTE_FL_ACTIVE' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FORMAT_ACTIVE'?
     225 |                 route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                V4L2_SUBDEV_FORMAT_ACTIVE
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:207:37: warning: unused variable 'routing' [-Wunused-variable]
     207 |         struct v4l2_subdev_krouting routing = { };
         |                                     ^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_enum_mbus_code':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:255:26: error: implicit declaration of function 'v4l2_subdev_state_get_opposite_stream_format' [-Werror=implicit-function-declaration]
     255 |                 format = v4l2_subdev_state_get_opposite_stream_format(state,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:257:75: error: 'struct v4l2_subdev_mbus_code_enum' has no member named 'stream'
     257 |                                                                       code->stream);
         |                                                                           ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_fmt':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:309:59: error: 'struct v4l2_subdev_format' has no member named 'stream'
     309 |                                                        fmt->stream);
         |                                                           ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:316:37: error: 'struct v4l2_subdev_state' has no member named 'routing'
     316 |         for_each_active_route(&state->routing, route) {
         |                                     ^~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:316:54: error: expected ';' before '{' token
     316 |         for_each_active_route(&state->routing, route) {
         |                                                      ^~
         |                                                      ;
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:337:48: warning: 'struct v4l2_subdev_krouting' declared inside parameter list will not be visible outside of this definition or declaration
     337 |                                         struct v4l2_subdev_krouting *routing)
         |                                                ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_routing':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:343:58: error: passing argument 3 of '__mxc_isi_crossbar_set_routing' from incompatible pointer type [-Werror=incompatible-pointer-types]
     343 |         return __mxc_isi_crossbar_set_routing(sd, state, routing);
         |                                                          ^~~~~~~
         |                                                          |
         |                                                          struct v4l2_subdev_krouting *
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:122:72: note: expected 'struct v4l2_subdev_krouting *' but argument is of type 'struct v4l2_subdev_krouting *'
     122 |                                           struct v4l2_subdev_krouting *routing)
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_enable_streams':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:376:23: error: implicit declaration of function 'v4l2_subdev_enable_streams'; did you mean 'v4l2_subdev_unlock_state'? [-Werror=implicit-function-declaration]
     376 |                 ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                       v4l2_subdev_unlock_state
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_disable_streams':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:416:23: error: implicit declaration of function 'v4l2_subdev_disable_streams' [-Werror=implicit-function-declaration]
     416 |                 ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'set_routing'
     435 |         .set_routing = mxc_isi_crossbar_set_routing,
         |          ^~~~~~~~~~~
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     435 |         .set_routing = mxc_isi_crossbar_set_routing,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, enum v4l2_subdev_format_whence,  struct v4l2_subdev_krouting *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:435:24: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.get_selection')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'enable_streams'
     436 |         .enable_streams = mxc_isi_crossbar_enable_streams,
         |          ^~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     436 |         .enable_streams = mxc_isi_crossbar_enable_streams,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_format *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, u32,  u64)' {aka 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, unsigned int,  long long unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.get_fmt')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: warning: initialized field overwritten [-Woverride-init]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:436:27: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.get_fmt')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'disable_streams'
     437 |         .disable_streams = mxc_isi_crossbar_disable_streams,
         |          ^~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     437 |         .disable_streams = mxc_isi_crossbar_disable_streams,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, u32,  u64)' {aka 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, unsigned int,  long long unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:437:28: note: (near initialization for 'mxc_isi_crossbar_subdev_pad_ops.set_edid')
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:447:29: error: 'v4l2_subdev_has_pad_interdep' undeclared here (not in a function); did you mean 'v4l2_subdev_get_pad_crop'?
     447 |         .has_pad_interdep = v4l2_subdev_has_pad_interdep,
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_get_pad_crop
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_init':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:465:51: error: 'V4L2_SUBDEV_FL_STREAMS' undeclared (first use in this function); did you mean 'V4L2_SUBDEV_FL_HAS_EVENTS'?
     465 |         sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                                   V4L2_SUBDEV_FL_HAS_EVENTS
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function '__mxc_isi_crossbar_set_routing':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:147:1: error: control reaches end of non-void function [-Werror=return-type]
     147 | }
         | ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: In function 'mxc_isi_crossbar_set_fmt':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:332:1: error: control reaches end of non-void function [-Werror=return-type]
     332 | }
         | ^
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c: At top level:
   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c:109:40: warning: 'mxc_isi_crossbar_default_format' defined but not used [-Wunused-const-variable=]
     109 | static const struct v4l2_mbus_framefmt mxc_isi_crossbar_default_format = {
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function 'mxc_isi_channel_set_inbuf':
>> drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      33 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c: In function 'mxc_isi_channel_set_outbuf':
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      51 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: warning: "CONFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Wundef]
      66 | #if CONFIG_ARCH_DMA_ADDR_T_64BIT
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +435 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c

   429	
   430	static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
   431		.init_cfg = mxc_isi_crossbar_init_cfg,
   432		.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
   433		.get_fmt = v4l2_subdev_get_fmt,
   434		.set_fmt = mxc_isi_crossbar_set_fmt,
 > 435		.set_routing = mxc_isi_crossbar_set_routing,
   436		.enable_streams = mxc_isi_crossbar_enable_streams,
   437		.disable_streams = mxc_isi_crossbar_disable_streams,
   438	};
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
