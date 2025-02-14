Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8E5BAF0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543308; cv=none; b=CbVr2c4ew5lhWVRlBEmigEBdAPWJxDlRoVgajlfw8amhS8/83Nmou1ViucRotkeSyHcQXQIu2ndN7/RbTbcMcNzEb5f5kHb0fK57HtjxXfkgogg6QrKRdJvHI/C41buM4n+fTDDC2hUU6cDbEDfPq3eiYZlWrzgP2gY7TeCNABU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543308; c=relaxed/simple;
	bh=11kbSCWoVcsI99W35LviXEVuTFBMl/jnDkSkvUrKWcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uQph4mWa+zJ5NIBA9KHNuVADqZIIXidB5cf6jsPtXHvmmo6N+Xpg94+78O6okbNoxr462Ez/0k5mJYnhgMDP9BQCTkjg8MM36hXcYK9l8RGkdRFwVP+Y/KlPcgtQhj8VMcdJxlWgvEHwY5Orn6uFhe+KpEtwdKWAxYpR9ccwkNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrixyxZp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrixyxZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739543306; x=1771079306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=11kbSCWoVcsI99W35LviXEVuTFBMl/jnDkSkvUrKWcI=;
  b=LrixyxZpcFagQpcyk+pv0zV9zNDrllpQpA4+FLnWwckDxTXdrArb0WTN
   OerxjUEHobsaIzJja9eF2GJQJScIA00Pc2d5kYFuoWYFhMJhdzkK2hm4I
   wvgpQgGaPtURVQ1/0RdGogTh5uhFFwIHW3Q9hrI1fR4TJ7i6vf+iecF14
   CDP5+FJ40d3OAPMRHWPM1XNeteTsraOdfIlb87pB6qyx16QJ5VtfxTBAq
   Eq4uYEmlP7JifPwJrsAPRuI8Vnp3Xtxb3yrzeiNzgsAjV4Wdj6bhiQhzS
   DMYinqX/kdLBs0CIv4xL8hS5w/X/c+nCEsWUKeOcR0sXWHCGSGwASmSUS
   Q==;
X-CSE-ConnectionGUID: YxYvu0MyT3Onb2MSaEo1KA==
X-CSE-MsgGUID: NaWszZvuTDOkTQJ4kXdTjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40412720"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40412720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:28:25 -0800
X-CSE-ConnectionGUID: SNsNvLlqSTyxJUGm7VRc+w==
X-CSE-MsgGUID: fKpfgZgAQV+leZameH52KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="144324786"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Feb 2025 06:28:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiwg2-0019f5-0S;
	Fri, 14 Feb 2025 14:28:22 +0000
Date: Fri, 14 Feb 2025 22:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 262/262]
 drivers/media/i2c/saa6752hs.c:598:17: error: invalid type argument of unary
 '*' (have 'int')
Message-ID: <202502142201.r9OKcrcQ-lkp@intel.com>
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
commit: 4340964d78dab0ce92b63a18c2f475c0118f3cef [262/262] UPSTREAM: media: i2c: Use accessors for pad config 'try_*' fields
config: x86_64-buildonly-randconfig-005-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142201.r9OKcrcQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142201.r9OKcrcQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142201.r9OKcrcQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/saa6752hs.c: In function 'saa6752hs_set_fmt':
   drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_has_pad_interdep'? [-Werror=implicit-function-declaration]
     598 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *f;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_has_pad_interdep
>> drivers/media/i2c/saa6752hs.c:598:17: error: invalid type argument of unary '*' (have 'int')
     598 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *f;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +598 drivers/media/i2c/saa6752hs.c

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
 > 598			*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *f;
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
