Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6CD5C090
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/HdM6ds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701184197; x=1732720197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nvdfhRppHPvgPmo/5MgwGI+3i+GdaALUb1kC001PAWA=;
  b=c/HdM6ds/svBhm89CukH55HbJd5zdEjXYjULs4Uwv+GqaPS4JgcvweDr
   ++tCxAHewD9at3T7EqOMEglKyKTWa09YHQKiyTKhaCXpDhnmeruyv3jhV
   uENrA0gJEZjfivLtOOGetOfd65RjM0HhIuYtJyGrg/ieclmaBLGeg6pY+
   OdbNlhdb4749gKTZnO4PXApYmcd/y2eyW+o9dHLl69JA6XfuSA4D9Tc2f
   5Q6OXmgKdLVlvqrr/qkBw9VGG849jqnhv6cI0gCCkIK7pzqDJEq9M5Azz
   WFnSXTluLtPnRxFAXsO/7rf5vS7q7dL2Xm1952fBMIpE4eLTtrhGZXL9D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="390092191"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="390092191"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 07:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="802974973"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="802974973"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Nov 2023 07:09:54 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7zii-0007fT-1m;
	Tue, 28 Nov 2023 15:09:52 +0000
Date: Tue, 28 Nov 2023 23:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 3/5] media: stm32-dcmipp: STM32 DCMIPP camera
 interface driver
Message-ID: <202311282323.TtRZT0pU-lkp@intel.com>
References: <20231127170828.1426117-4-alain.volmat@foss.st.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127170828.1426117-4-alain.volmat@foss.st.com>

Hi Alain,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on media-tree/master robh/for-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alain-Volmat/dt-bindings-media-add-bindings-for-stm32-dcmipp/20231128-012530
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231127170828.1426117-4-alain.volmat%40foss.st.com
patch subject: [PATCH v9 3/5] media: stm32-dcmipp: STM32 DCMIPP camera interface driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231128/202311282323.TtRZT0pU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311282323.TtRZT0pU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311282323.TtRZT0pU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_init_state':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:22: error: implicit declaration of function 'v4l2_subdev_state_get_format'; did you mean 'v4l2_subdev_state_get_stream_format'? [-Werror=implicit-function-declaration]
     154 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_state_get_stream_format
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:154:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     154 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_set_fmt':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:236:12: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     236 |         mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
         |            ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:256:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     256 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: In function 'dcmipp_par_configure':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:310:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     310 |         sink_fmt = v4l2_subdev_state_get_format(state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:311:17: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     311 |         src_fmt = v4l2_subdev_state_get_format(state, 1);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c: At top level:
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:396:10: error: 'const struct v4l2_subdev_internal_ops' has no member named 'init_state'
     396 |         .init_state = dcmipp_par_init_state,
         |          ^~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:396:23: error: initialization of 'int (*)(struct v4l2_subdev *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     396 |         .init_state = dcmipp_par_init_state,
         |                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c:396:23: note: (near initialization for 'dcmipp_par_int_ops.registered')
   cc1: some warnings being treated as errors
--
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_init_state':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:22: error: implicit declaration of function 'v4l2_subdev_state_get_format'; did you mean 'v4l2_subdev_state_get_stream_format'? [-Werror=implicit-function-declaration]
     171 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                      v4l2_subdev_state_get_stream_format
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:171:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     171 |                 mf = v4l2_subdev_state_get_format(sd_state, i);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:29: error: implicit declaration of function 'v4l2_subdev_state_get_compose'; did you mean 'v4l2_subdev_state_get_stream_compose'? [-Werror=implicit-function-declaration]
     175 |                         r = v4l2_subdev_state_get_compose(sd_state, i);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_state_get_stream_compose
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:175:27: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     175 |                         r = v4l2_subdev_state_get_compose(sd_state, i);
         |                           ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:29: error: implicit declaration of function 'v4l2_subdev_state_get_crop'; did you mean 'v4l2_subdev_state_get_stream_crop'? [-Werror=implicit-function-declaration]
     177 |                         r = v4l2_subdev_state_get_crop(sd_state, i);
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                             v4l2_subdev_state_get_stream_crop
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:177:27: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     177 |                         r = v4l2_subdev_state_get_crop(sd_state, i);
         |                           ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_enum_mbus_code':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:206:26: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     206 |                 sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
         |                          ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_enum_frame_size':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:230:25: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     230 |                 compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                         ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_set_fmt':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:249:12: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     249 |         mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
         |            ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:251:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     251 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:252:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     252 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:255:31: error: invalid type argument of unary '*' (have 'int')
     255 |                 fmt->format = *v4l2_subdev_state_get_format(sd_state, 0);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:266:17: error: invalid type argument of unary '*' (have 'int')
     266 |                 *v4l2_subdev_state_get_format(sd_state, 1) = fmt->format;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_get_selection':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:297:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     297 |         sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:298:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     298 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:299:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     299 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_set_selection':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:349:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     349 |         crop = v4l2_subdev_state_get_crop(sd_state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:350:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     350 |         compose = v4l2_subdev_state_get_compose(sd_state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:357:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     357 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:365:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     365 |                 mf = v4l2_subdev_state_get_format(sd_state, 0);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:370:20: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     370 |                 mf = v4l2_subdev_state_get_format(sd_state, 1);
         |                    ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: In function 'dcmipp_byteproc_configure_scale_crop':
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:405:18: warning: assignment to 'struct v4l2_mbus_framefmt *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     405 |         sink_fmt = v4l2_subdev_state_get_format(state, 0);
         |                  ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:406:17: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     406 |         compose = v4l2_subdev_state_get_compose(state, 0);
         |                 ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:407:14: warning: assignment to 'struct v4l2_rect *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     407 |         crop = v4l2_subdev_state_get_crop(state, 1);
         |              ^
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c: At top level:
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:520:10: error: 'const struct v4l2_subdev_internal_ops' has no member named 'init_state'
     520 |         .init_state = dcmipp_byteproc_init_state,
         |          ^~~~~~~~~~
>> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:520:23: error: initialization of 'int (*)(struct v4l2_subdev *)' from incompatible pointer type 'int (*)(struct v4l2_subdev *, struct v4l2_subdev_state *)' [-Werror=incompatible-pointer-types]
     520 |         .init_state = dcmipp_byteproc_init_state,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c:520:23: note: (near initialization for 'dcmipp_byteproc_int_ops.registered')
   cc1: some warnings being treated as errors


vim +396 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-parallel.c

   394	
   395	static const struct v4l2_subdev_internal_ops dcmipp_par_int_ops = {
 > 396		.init_state = dcmipp_par_init_state,
   397		.release = dcmipp_par_release,
   398	};
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
