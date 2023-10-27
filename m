Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2223DFE0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 20:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXH0mxaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698438118; x=1729974118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hc74q4qwhH3nsmaocBdiMwzMFqqHjcSbGSoCrF8XMmE=;
  b=hXH0mxawUVudeFaQLpfd0q72SS04nEyNT79JXbCgWc7nUBiiL9JDV2Ys
   vt8qO9szYtsO5xSWEorwbjACqAorklineOBs+DelSPzI/xVxbKKS4cVVZ
   KLuGayYKm5ugWaJ+B6malO51+yTg2NdEpGiUROxfTbroBgoxBbA56RYcc
   zn2+0El1bVDUO0sEDiD1uny8+DQFL/FTv+ZS0QPROq15xhSpWf4CSMisb
   5FiQ9e1Zct7Z8CztuARSGxoxMCv3JdwaicfdgOP3KVJcrMzLxZH4nBPmf
   MrnyJe340rsDDTq80+M7raslCekIw3Wcpibp+eEWdRtm0Uv7Dft17bAAO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378211465"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="378211465"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 13:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="709518453"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="709518453"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Oct 2023 13:21:56 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwTL8-000BAp-02;
	Fri, 27 Oct 2023 20:21:54 +0000
Date: Sat, 28 Oct 2023 04:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/7] media: i2c: Use accessors for pad config 'try_*'
 fields
Message-ID: <202310280440.IDSYRK6B-lkp@intel.com>
References: <20231023214011.17730-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023214011.17730-7-laurent.pinchart@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on 94e27fbeca27d8c772fc2bc807730aaee5886055]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-atmel-isi-Use-accessors-for-pad-config-try_-fields/20231024-054150
base:   94e27fbeca27d8c772fc2bc807730aaee5886055
patch link:    https://lore.kernel.org/r/20231023214011.17730-7-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH 6/7] media: i2c: Use accessors for pad config 'try_*' fields
config: x86_64-buildonly-randconfig-006-20231027 (https://download.01.org/0day-ci/archive/20231028/202310280440.IDSYRK6B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310280440.IDSYRK6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310280440.IDSYRK6B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/saa6752hs.c: In function 'saa6752hs_set_fmt':
>> drivers/media/i2c/saa6752hs.c:598:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_has_pad_interdep'? [-Werror=implicit-function-declaration]
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
