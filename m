Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F51173C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 23:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbANkUfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702424655; x=1733960655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YI7DbzJxSHc/y4dCfIm7eLRDdC0wPSS7S3PIjuZPeuo=;
  b=SbANkUfl07pnKUTzpP3m5bnLjgvCh4+5UewyDdjQdO0EpIsvyrBy3Oh8
   hSE+lj2y8dmKMiiTW1nUbRr67PpsgmOb3K+ZDaro4MzGYWlbQOges0+GD
   3uj12nqEtHCdtpd8se8gvGfppBf6wIFZD1ja+19NT8pHhAknuggIQD1fg
   utY4V0jnV1Fqa+KLSRdDEkjP5jn5qhrcbliSHmaQAk0nWSV4bsItKnxGg
   ewea3dmytCBaVKw4Yw9WM7Pp4Dmug2D8BgJnllLMCz//10D0P5IE5L9zO
   GCNlmUvPrSvMx09+kTEq9FCwGuklX9n1u7hpdTMkZHve36jWIFP1wRBND
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1743325"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1743325"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 15:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749885507"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="749885507"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 15:44:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDCQ6-000Jrr-1r;
	Tue, 12 Dec 2023 23:44:10 +0000
Date: Wed, 13 Dec 2023 07:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 770/2045]
 drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:146:24: error: implicit
 declaration of function 'v4l2_subdev_get_try_format'
Message-ID: <202312130714.EHnxh2zU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   150aa4a3e713e0e5764d6fe64111ea1d0297825d
commit: 80e5d2e6b77fa42679958ea422275d78ed1c6e32 [770/2045] CHROMIUM: media: add Intel IPU6 drivers
config: x86_64-randconfig-002-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130714.EHnxh2zU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312130714.EHnxh2zU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130714.EHnxh2zU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c: In function '__ipu_isys_get_ffmt':
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:146:24: error: implicit declaration of function 'v4l2_subdev_get_try_format' [-Werror=implicit-function-declaration]
     146 |                 return v4l2_subdev_get_try_format(sd, state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:146:24: warning: returning 'int' from a function with return type 'struct v4l2_mbus_framefmt *' makes pointer from integer without a cast [-Wint-conversion]
     146 |                 return v4l2_subdev_get_try_format(sd, state, pad);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c: In function '__ipu_isys_get_selection':
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:166:32: error: implicit declaration of function 'v4l2_subdev_get_try_crop' [-Werror=implicit-function-declaration]
     166 |                         return v4l2_subdev_get_try_crop(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:166:32: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     166 |                         return v4l2_subdev_get_try_crop(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:168:32: error: implicit declaration of function 'v4l2_subdev_get_try_compose' [-Werror=implicit-function-declaration]
     168 |                         return v4l2_subdev_get_try_compose(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:168:32: warning: returning 'int' from a function with return type 'struct v4l2_rect *' makes pointer from integer without a cast [-Wint-conversion]
     168 |                         return v4l2_subdev_get_try_compose(sd, state, pad);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c: In function 'ipu_isys_subdev_open':
>> drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:558:58: error: 'struct v4l2_subdev_fh' has no member named 'state'
     558 |                         v4l2_subdev_get_try_format(sd, fh->state, i);
         |                                                          ^~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:560:56: error: 'struct v4l2_subdev_fh' has no member named 'state'
     560 |                         v4l2_subdev_get_try_crop(sd, fh->state, i);
         |                                                        ^~
   drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c:562:59: error: 'struct v4l2_subdev_fh' has no member named 'state'
     562 |                         v4l2_subdev_get_try_compose(sd, fh->state, i);
         |                                                           ^~
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_get_try_format +146 drivers/media/pci/intel/ipu6/../ipu-isys-subdev.c

   135	
   136	struct v4l2_mbus_framefmt *__ipu_isys_get_ffmt(struct v4l2_subdev *sd,
   137						       struct v4l2_subdev_state *state,
   138						       unsigned int pad,
   139						       unsigned int which)
   140	{
   141		struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
   142	
   143		if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
   144			return &asd->ffmt[pad];
   145		else
 > 146			return v4l2_subdev_get_try_format(sd, state, pad);
   147	}
   148	
   149	struct v4l2_rect *__ipu_isys_get_selection(struct v4l2_subdev *sd,
   150						   struct v4l2_subdev_state *state,
   151						   unsigned int target,
   152						   unsigned int pad, unsigned int which)
   153	{
   154		struct ipu_isys_subdev *asd = to_ipu_isys_subdev(sd);
   155	
   156		if (which == V4L2_SUBDEV_FORMAT_ACTIVE) {
   157			switch (target) {
   158			case V4L2_SEL_TGT_CROP:
   159				return &asd->crop[pad];
   160			case V4L2_SEL_TGT_COMPOSE:
   161				return &asd->compose[pad];
   162			}
   163		} else {
   164			switch (target) {
   165			case V4L2_SEL_TGT_CROP:
 > 166				return v4l2_subdev_get_try_crop(sd, state, pad);
   167			case V4L2_SEL_TGT_COMPOSE:
 > 168				return v4l2_subdev_get_try_compose(sd, state, pad);
   169			}
   170		}
   171		WARN_ON(1);
   172		return NULL;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
