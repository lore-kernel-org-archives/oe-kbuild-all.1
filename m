Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9D3F4A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtJs7Nx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698182672; x=1729718672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PC3i9yzvs7aCd13dZRkKM7CJkXGn/giqHzc9WFJ6NWA=;
  b=JtJs7Nx4kZy0uU/VvOe2JqrZwua0dxvollH9jchh9vL90Ws+TTlsf/sh
   d+yM+0treY5xj57DA18RdK+7uMHXUE/apwFT+613Ahi5Mx3gwHpp1FnMh
   eiCS9Z7L660IeKst6xILQOzNT8jExzKy6KeVO+e16LUdHApSZv87mk+Zg
   p9Dvg5O5995OI4/kMsy0ZZPBOwLCRaTbz2IxPs35BsBNwqbTLPFFbtgkl
   Znlm3El4Rc/1MO7VMIf0mRLk8G3XtiVDzm9VCIXMAIz7vL9amZtJ9nqIz
   4TeiQLYLnbU+yUsQpdUmBUqXm97y8aZPKsO6YvzYTdfUS1KF/wn2S0c3N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="391042344"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="391042344"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 14:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932169463"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="932169463"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Oct 2023 14:24:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvOsz-0008Ib-0c;
	Tue, 24 Oct 2023 21:24:25 +0000
Date: Wed, 25 Oct 2023 05:24:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Subject: [sailus-media-tree:metadata 6/42]
 drivers/staging/media/ipu3/ipu3-v4l2.c:200:1: error: control reaches end of
 non-void function
Message-ID: <202310250538.rAiAP4fr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/sailus/media_tree.git metadata
head:   9d9606b3c96b65b0cdc5978ffa2699de5c5d6feb
commit: 664ffe0ad78d9dc70a40fbf51ad5d9aeda061d23 [6/42] media: v4l: subdev: Switch to stream-aware state functions
config: x86_64-randconfig-003-20231025 (https://download.01.org/0day-ci/archive/20231025/202310250538.rAiAP4fr-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310250538.rAiAP4fr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310250538.rAiAP4fr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/media/v4l2-device.h:13:0,
                    from drivers/staging/media/ipu3/ipu3.h:11,
                    from drivers/staging/media/ipu3/ipu3-v4l2.c:10:
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_open':
   include/media/v4l2-subdev.h:1557:9: error: implicit declaration of function '__v4l2_subdev_state_get_format___VA_OPT__'; did you mean '__v4l2_subdev_state_get_format_'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
            ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:39:4: note: in expansion of macro 'v4l2_subdev_state_get_format'
       v4l2_subdev_state_get_format(fh->state, i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1557:55: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:39:4: note: in expansion of macro 'v4l2_subdev_state_get_format'
       v4l2_subdev_state_get_format(fh->state, i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1557:55: note: each undeclared identifier is reported only once for each function it appears in
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:39:4: note: in expansion of macro 'v4l2_subdev_state_get_format'
       v4l2_subdev_state_get_format(fh->state, i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1558:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:39:4: note: in expansion of macro 'v4l2_subdev_state_get_format'
       v4l2_subdev_state_get_format(fh->state, i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1580:9: error: implicit declaration of function '__v4l2_subdev_state_get_crop___VA_OPT__'; did you mean '__v4l2_subdev_state_get_crop_stream'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_crop_ ## __VA_OPT__(stream) \
            ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:47:3: note: in expansion of macro 'v4l2_subdev_state_get_crop'
     *v4l2_subdev_state_get_crop(fh->state, IMGU_NODE_IN) = try_crop;
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1581:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:47:3: note: in expansion of macro 'v4l2_subdev_state_get_crop'
     *v4l2_subdev_state_get_crop(fh->state, IMGU_NODE_IN) = try_crop;
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/media/v4l2-subdev.h:1603:9: error: implicit declaration of function '__v4l2_subdev_state_get_compose___VA_OPT__'; did you mean '__v4l2_subdev_state_get_compose_stream'? [-Werror=implicit-function-declaration]
            __v4l2_subdev_state_get_compose_ ## __VA_OPT__(stream) \
            ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:48:3: note: in expansion of macro 'v4l2_subdev_state_get_compose'
     *v4l2_subdev_state_get_compose(fh->state, IMGU_NODE_IN) = try_crop;
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1604:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:48:3: note: in expansion of macro 'v4l2_subdev_state_get_compose'
     *v4l2_subdev_state_get_compose(fh->state, IMGU_NODE_IN) = try_crop;
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_get_fmt':
   include/media/v4l2-subdev.h:1557:55: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:139:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      mf = v4l2_subdev_state_get_format(sd_state, pad);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1558:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:139:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      mf = v4l2_subdev_state_get_format(sd_state, pad);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_set_fmt':
   include/media/v4l2-subdev.h:1557:55: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_format_ ## __VA_OPT__(stream) \
                                                          ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:164:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      mf = v4l2_subdev_state_get_format(sd_state, pad);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1558:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:164:8: note: in expansion of macro 'v4l2_subdev_state_get_format'
      mf = v4l2_subdev_state_get_format(sd_state, pad);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_get_crop':
   include/media/v4l2-subdev.h:1580:53: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_crop_ ## __VA_OPT__(stream) \
                                                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:197:10: note: in expansion of macro 'v4l2_subdev_state_get_crop'
      return v4l2_subdev_state_get_crop(sd_state, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1581:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:197:10: note: in expansion of macro 'v4l2_subdev_state_get_crop'
      return v4l2_subdev_state_get_crop(sd_state, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_get_compose':
   include/media/v4l2-subdev.h:1603:56: error: 'stream' undeclared (first use in this function); did you mean 'strim'?
            __v4l2_subdev_state_get_compose_ ## __VA_OPT__(stream) \
                                                           ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:208:10: note: in expansion of macro 'v4l2_subdev_state_get_compose'
      return v4l2_subdev_state_get_compose(sd_state, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-subdev.h:1604:21: error: expected ')' before '__VA_OPT__'
            (state, pad __VA_OPT__(,) __VA_ARGS__)
                        ^
   drivers/staging/media/ipu3/ipu3-v4l2.c:208:10: note: in expansion of macro 'v4l2_subdev_state_get_compose'
      return v4l2_subdev_state_get_compose(sd_state, pad);
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_get_crop':
>> drivers/staging/media/ipu3/ipu3-v4l2.c:200:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   drivers/staging/media/ipu3/ipu3-v4l2.c: In function 'imgu_subdev_get_compose':
   drivers/staging/media/ipu3/ipu3-v4l2.c:211:1: error: control reaches end of non-void function [-Werror=return-type]
    }
    ^
   cc1: some warnings being treated as errors


vim +200 drivers/staging/media/ipu3/ipu3-v4l2.c

a0ca1627b4501d Yong Zhi       2018-12-06  190  
dc608edf7d45ba Maximilian Luz 2022-09-08  191  static struct v4l2_rect *
dc608edf7d45ba Maximilian Luz 2022-09-08  192  imgu_subdev_get_crop(struct imgu_v4l2_subdev *sd,
dc608edf7d45ba Maximilian Luz 2022-09-08  193  		     struct v4l2_subdev_state *sd_state, unsigned int pad,
dc608edf7d45ba Maximilian Luz 2022-09-08  194  		     enum v4l2_subdev_format_whence which)
dc608edf7d45ba Maximilian Luz 2022-09-08  195  {
dc608edf7d45ba Maximilian Luz 2022-09-08  196  	if (which == V4L2_SUBDEV_FORMAT_TRY)
664ffe0ad78d9d Sakari Ailus   2023-10-13  197  		return v4l2_subdev_state_get_crop(sd_state, pad);
dc608edf7d45ba Maximilian Luz 2022-09-08  198  	else
dc608edf7d45ba Maximilian Luz 2022-09-08  199  		return &sd->rect.eff;
dc608edf7d45ba Maximilian Luz 2022-09-08 @200  }
dc608edf7d45ba Maximilian Luz 2022-09-08  201  

:::::: The code at line 200 was first introduced by commit
:::::: dc608edf7d45ba0c2ad14c06eccd66474fec7847 ipu3-imgu: Fix NULL pointer dereference in imgu_subdev_set_selection()

:::::: TO: Maximilian Luz <luzmaximilian@gmail.com>
:::::: CC: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
