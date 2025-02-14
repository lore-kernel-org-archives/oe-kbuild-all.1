Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CD1F92A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547096; cv=none; b=gtsqwhIZw5xoMwfrEIBo/un+iUND1bJCsqYeTZXVgjwSkDOt1T8myzRrc5JzT2ktC0Gub6enBNJvdYJZYVSOC3mXZNgCJHuKk7ukhX7CDsdQkY0bOcfGrHbdouv07SNBQprhuVLzRzKERYT64pU1KIhK1hsMObfhd8Sw9NrYqkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547096; c=relaxed/simple;
	bh=lTnn1xYk02DETAjdi82AsXqIBiUX4JF6TvaXqBqDp7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9uaXY7loMkY+hHb/DAL8qwRQBHeVxMS4XT9lksSDkU0jjJd7+aUvta0s69+miVnzWC5p9C+98RLJBC8jIyRIGMB2Z9TzcRo/yCkBlAk5/p6dRxQS3hO3QmieDbGraY5K1S/ds9nADue7mW2TQy9kU07owv0IZ0NmL7NtKPaC9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7qIzCQJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7qIzCQJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547094; x=1771083094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lTnn1xYk02DETAjdi82AsXqIBiUX4JF6TvaXqBqDp7s=;
  b=V7qIzCQJC47WmdySgH9U02OaWBOmEr6TrIIPWeugDZXZwVSPlBqdJlMY
   vQr1qgmrW/kH71UXKGm1kt28e4dz+b7NZzR61fO6E3vGpFzqxvAe+yckA
   tRTEeQCq6zOeA3Zriiwn3eQ+kE1dfZCl41d+0/csefQS6cyn2ziJyHZpC
   hrVIbwGC0WHI9h5Fmsi/UvtKopVpIwB3IMqba5KQsESWHp3E7AtgqZQkg
   heohLB8FG1T2Sx3vvyk/oWXeZ0GSmVWVw8GKTSu2ngvoUhadGM6tH87el
   QAInYKAsqtU3YuNaL/9RKtDR+KRonQF3nXvA8tajw8uWlm3P1NczhBzS4
   Q==;
X-CSE-ConnectionGUID: 59DZ9OsOQ9WwS7wf6/yB/g==
X-CSE-MsgGUID: wzFrBjmLSmilFhD3yK9pVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40006838"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40006838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:31:33 -0800
X-CSE-ConnectionGUID: m7zMVMQqTZm5no+TFaY5sQ==
X-CSE-MsgGUID: CjkSpfFBQGOuFn3000YWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118107802"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 07:31:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixf8-0019mE-1K;
	Fri, 14 Feb 2025 15:31:30 +0000
Date: Fri, 14 Feb 2025 23:31:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 262/262]
 drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of
 function 'v4l2_subdev_state_get_format'
Message-ID: <202502142351.z8R3LHET-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   3bc425c306458b9d5af1effdd97e7efcf09e407a
commit: 716334a0312be131d1c69186eaa4f6527220d83c [262/262] BACKPORT: media: v4l: subdev: Switch to stream-aware state functions
config: x86_64-buildonly-randconfig-005-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142351.z8R3LHET-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142351.z8R3LHET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142351.z8R3LHET-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/saa6752hs.c: In function 'saa6752hs_set_fmt':
>> drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of function 'v4l2_subdev_state_get_format' [-Werror=implicit-function-declaration]
     598 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *f;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/saa6752hs.c:598:17: error: invalid type argument of unary '*' (have 'int')
     598 |                 *v4l2_subdev_state_get_format(sd_state, 0) = *f;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/v4l2_subdev_state_get_format +598 drivers/media/i2c/saa6752hs.c

   564	
   565	static int saa6752hs_set_fmt(struct v4l2_subdev *sd,
   566			struct v4l2_subdev_state *sd_state,
   567			struct v4l2_subdev_format *format)
   568	{
   569		struct v4l2_mbus_framefmt *f = &format->format;
   570		struct saa6752hs_state *h = to_state(sd);
   571		int dist_352, dist_480, dist_720;
   572	
   573		if (format->pad)
   574			return -EINVAL;
   575	
   576		f->code = MEDIA_BUS_FMT_FIXED;
   577	
   578		dist_352 = abs(f->width - 352);
   579		dist_480 = abs(f->width - 480);
   580		dist_720 = abs(f->width - 720);
   581		if (dist_720 < dist_480) {
   582			f->width = 720;
   583			f->height = 576;
   584		} else if (dist_480 < dist_352) {
   585			f->width = 480;
   586			f->height = 576;
   587		} else {
   588			f->width = 352;
   589			if (abs(f->height - 576) < abs(f->height - 288))
   590				f->height = 576;
   591			else
   592				f->height = 288;
   593		}
   594		f->field = V4L2_FIELD_INTERLACED;
   595		f->colorspace = V4L2_COLORSPACE_SMPTE170M;
   596	
   597		if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 > 598			*v4l2_subdev_state_get_format(sd_state, 0) = *f;
   599			return 0;
   600		}
   601	
   602		/*
   603		  FIXME: translate and round width/height into EMPRESS
   604		  subsample type:
   605	
   606		  type   |   PAL   |  NTSC
   607		  ---------------------------
   608		  SIF    | 352x288 | 352x240
   609		  1/2 D1 | 352x576 | 352x480
   610		  2/3 D1 | 480x576 | 480x480
   611		  D1     | 720x576 | 720x480
   612		*/
   613	
   614		if (f->code != MEDIA_BUS_FMT_FIXED)
   615			return -EINVAL;
   616	
   617		if (f->width == 720)
   618			h->video_format = SAA6752HS_VF_D1;
   619		else if (f->width == 480)
   620			h->video_format = SAA6752HS_VF_2_3_D1;
   621		else if (f->height == 576)
   622			h->video_format = SAA6752HS_VF_1_2_D1;
   623		else
   624			h->video_format = SAA6752HS_VF_SIF;
   625		return 0;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
