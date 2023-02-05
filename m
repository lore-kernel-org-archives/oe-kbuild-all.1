Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298BC2F43
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675604603; x=1707140603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvbeb/ozYRYtTXyp0xjPnrQ7SZFBX+k1MgHLTAvDdHM=;
  b=OA5umqWRnVKjrd9ezcDRXc6VW3u6E7pVN6j7Y73b0w59P4yhkPENHSgL
   TNoAu3WKFmss7HjraV6bqB6oSuWwBVNk2O8M12UlakpIDi1JG4qmFVGwf
   KSYQs6x3b7hfFXI+7UyQe2QDBsPUI9OXgn12hzLRnf7Hy74+uNP9+t21y
   A/aj/8szE3fj1bRqknvb/cAlpH3fIrPDY5Csu5hd+gK4I5ukZw5FzPpah
   NLCf3ETZoBRJHk3j5o2mFR63OrzsxJ8RTRdUv5dmnLRZbX/HgstwAqYZT
   me1jyD/5BF+04yqR17vL68FdFbhXyVkucqDXA58Fpm6IEEUjV4Xs2Ae7s
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309381312"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309381312"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 05:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698600689"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698600689"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 05:43:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOfIe-00022G-1C;
	Sun, 05 Feb 2023 13:43:20 +0000
Date: Sun, 5 Feb 2023 21:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl-media:muxed/2023.1/xilinx/api-updates 64/88]
 drivers/media/platform/xilinx/xilinx-switch.c:292:10: error: 'const struct
 v4l2_subdev_pad_ops' has no member named 'get_routing'
Message-ID: <202302052151.5Y5RYB7F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2023.1/xilinx/api-updates
head:   4d84aca55464a5384ebfc09558bbc965f6eb5218
commit: bf8f2d37cfa42c788dc293e35d85f79701134697 [64/88] Revert "v4l: subdev: Add [GS]_ROUTING subdev ioctls and operations"
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230205/202302052151.5Y5RYB7F-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add pinchartl-media git://linuxtv.org/pinchartl/media.git
        git fetch --no-tags pinchartl-media muxed/2023.1/xilinx/api-updates
        git checkout bf8f2d37cfa42c788dc293e35d85f79701134697
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the pinchartl-media/muxed/2023.1/xilinx/api-updates HEAD 4d84aca55464a5384ebfc09558bbc965f6eb5218 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

                    from include/linux/ratelimit.h:5:
   drivers/media/platform/xilinx/xilinx-switch.c:196:57: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                                                         ^~
   include/linux/const.h:12:55: note: in definition of macro '__is_constexpr'
      12 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:26:39: note: in expansion of macro '__no_side_effects'
      26 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                                       ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:57: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                                                         ^~
   include/linux/minmax.h:28:34: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                  ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:57: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                                                         ^~
   include/linux/minmax.h:28:46: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                              ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:57: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                                                         ^~
   include/linux/minmax.h:32:24: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y = (y);               \
         |                        ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:57: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                                                         ^~
   include/linux/minmax.h:32:39: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y = (y);               \
         |                                       ^
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:196:25: note: in expansion of macro 'min'
     196 |         for (i = 0; i < min(xsw->xvip.num_sources, route->num_routes); ++i) {
         |                         ^~~
   drivers/media/platform/xilinx/xilinx-switch.c:197:22: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     197 |                 route->routes[i].sink = xsw->routing[i];
         |                      ^~
   drivers/media/platform/xilinx/xilinx-switch.c:198:22: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     198 |                 route->routes[i].source = i;
         |                      ^~
   drivers/media/platform/xilinx/xilinx-switch.c:201:14: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     201 |         route->num_routes = xsw->xvip.num_sources;
         |              ^~
   drivers/media/platform/xilinx/xilinx-switch.c: At top level:
   drivers/media/platform/xilinx/xilinx-switch.c:209:35: warning: 'struct v4l2_subdev_routing' declared inside parameter list will not be visible outside of this definition or declaration
     209 |                            struct v4l2_subdev_routing *route)
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c: In function 'xsw_set_routing':
   drivers/media/platform/xilinx/xilinx-switch.c:225:30: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     225 |         for (i = 0; i < route->num_routes; ++i)
         |                              ^~
   drivers/media/platform/xilinx/xilinx-switch.c:226:35: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     226 |                 xsw->routing[route->routes[i].source - xsw->xvip.num_sinks] =
         |                                   ^~
   drivers/media/platform/xilinx/xilinx-switch.c:227:30: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     227 |                         route->routes[i].sink;
         |                              ^~
   drivers/media/platform/xilinx/xilinx-switch.c: At top level:
>> drivers/media/platform/xilinx/xilinx-switch.c:292:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'get_routing'
     292 |         .get_routing = xsw_get_routing,
         |          ^~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     292 |         .get_routing = xsw_get_routing,
         |                        ^~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:292:24: note: (near initialization for 'xsw_pad_ops.set_edid')
   drivers/media/platform/xilinx/xilinx-switch.c:293:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'set_routing'
     293 |         .set_routing = xsw_set_routing,
         |          ^~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     293 |         .set_routing = xsw_set_routing,
         |                        ^~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: note: (near initialization for 'xsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *, struct v4l2_subdev_selection *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:293:24: note: (near initialization for 'xsw_pad_ops.set_selection')
   drivers/media/platform/xilinx/xilinx-switch.c:331:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     331 |         .has_route = xsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     331 |         .has_route = xsw_has_route,
         |                      ^~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops')
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-switch.c:331:22: note: (near initialization for 'xsw_media_ops.link_setup')
   cc1: some warnings being treated as errors
--
   drivers/media/platform/xilinx/xilinx-axis-switch.c:248:36: warning: 'struct v4l2_subdev_routing' declared inside parameter list will not be visible outside of this definition or declaration
     248 |                             struct v4l2_subdev_routing *route)
         |                                    ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c: In function 'xvsw_get_routing':
   drivers/media/platform/xilinx/xilinx-axis-switch.c:260:43: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     260 |         if (xvsw->xvip.num_sources < route->num_routes)
         |                                           ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:263:28: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     263 |                 min = route->num_routes;
         |                            ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:266:22: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     266 |                 route->routes[i].sink = xvsw->routing[i];
         |                      ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:267:22: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     267 |                 route->routes[i].source = i;
         |                      ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:270:14: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     270 |         route->num_routes = xvsw->xvip.num_sources;
         |              ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c: At top level:
   drivers/media/platform/xilinx/xilinx-axis-switch.c:278:36: warning: 'struct v4l2_subdev_routing' declared inside parameter list will not be visible outside of this definition or declaration
     278 |                             struct v4l2_subdev_routing *route)
         |                                    ^~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c: In function 'xvsw_set_routing':
   drivers/media/platform/xilinx/xilinx-axis-switch.c:298:30: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     298 |         for (i = 0; i < route->num_routes; ++i)
         |                              ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:299:36: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     299 |                 xvsw->routing[route->routes[i].source - xvsw->xvip.num_sinks] =
         |                                    ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:300:30: error: invalid use of undefined type 'struct v4l2_subdev_routing'
     300 |                         route->routes[i].sink;
         |                              ^~
   drivers/media/platform/xilinx/xilinx-axis-switch.c: At top level:
>> drivers/media/platform/xilinx/xilinx-axis-switch.c:327:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'get_routing'
     327 |         .get_routing = xvsw_get_routing,
         |          ^~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     327 |         .get_routing = xvsw_get_routing,
         |                        ^~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: error: initialization of 'int (*)(struct v4l2_subdev *, unsigned int,  struct v4l2_mbus_config *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:327:24: note: (near initialization for 'xvsw_pad_ops.get_mbus_config')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:10: error: 'const struct v4l2_subdev_pad_ops' has no member named 'set_routing'
     328 |         .set_routing = xvsw_set_routing,
         |          ^~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     328 |         .set_routing = xvsw_set_routing,
         |                        ^~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: note: (near initialization for 'xvsw_pad_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: error: initialization of 'int (*)(struct v4l2_subdev *, struct v4l2_edid *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_routing *)' [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:328:24: note: (near initialization for 'xvsw_pad_ops.get_edid')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:329:28: warning: initialized field overwritten [-Woverride-init]
     329 |         .get_mbus_config = xvip_get_mbus_config,
         |                            ^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:329:28: note: (near initialization for 'xvsw_pad_ops.get_mbus_config')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:10: error: 'const struct media_entity_operations' has no member named 'has_route'
     371 |         .has_route = xvsw_has_route,
         |          ^~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         .has_route = xvsw_has_route,
         |                      ^~~~~~~~~~~~~~
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops')
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: error: initialization of 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, u32)' {aka 'int (*)(struct media_entity *, const struct media_pad *, const struct media_pad *, unsigned int)'} from incompatible pointer type 'bool (*)(struct media_entity *, unsigned int,  unsigned int)' {aka '_Bool (*)(struct media_entity *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
   drivers/media/platform/xilinx/xilinx-axis-switch.c:371:22: note: (near initialization for 'xvsw_media_ops.link_setup')
   cc1: some warnings being treated as errors


vim +292 drivers/media/platform/xilinx/xilinx-switch.c

c6ecbf063a0cce Laurent Pinchart 2014-03-26  286  
22f357c7c03adf Laurent Pinchart 2021-12-13  287  static const struct v4l2_subdev_pad_ops xsw_pad_ops = {
c6ecbf063a0cce Laurent Pinchart 2014-03-26  288  	.enum_mbus_code = xvip_enum_mbus_code,
c6ecbf063a0cce Laurent Pinchart 2014-03-26  289  	.enum_frame_size = xvip_enum_frame_size,
c6ecbf063a0cce Laurent Pinchart 2014-03-26  290  	.get_fmt = xsw_get_format,
c6ecbf063a0cce Laurent Pinchart 2014-03-26  291  	.set_fmt = xsw_set_format,
c6ecbf063a0cce Laurent Pinchart 2014-03-26 @292  	.get_routing = xsw_get_routing,
c6ecbf063a0cce Laurent Pinchart 2014-03-26  293  	.set_routing = xsw_set_routing,
c6ecbf063a0cce Laurent Pinchart 2014-03-26  294  };
c6ecbf063a0cce Laurent Pinchart 2014-03-26  295  

:::::: The code at line 292 was first introduced by commit
:::::: c6ecbf063a0cce19a700f7d903ef788417940b28 media: xilinx: Add AXI4 stream switch driver

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Michal Simek <michal.simek@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
