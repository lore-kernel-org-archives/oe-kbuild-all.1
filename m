Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF091C777
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685974036; x=1717510036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9EbKsoJn+Q/+Dk8/Wyy5szNvUqVXhmOiyiAfG3+o78=;
  b=TwFcZ5M4G9QqZE90Sh1iSpdi4A15CDUqIsOWH9b+ojmoFhiBcV4pkgvW
   4LOLehU3OIeHqutl2UEUSqigQeQd9vxlCi1NDpnyPRPfKMqQgQEHOk70v
   Fm+sN4TYNfJpg+KvoCDX+/SShDdwZCRXQEO3wg+oIOztJn6njtl8WXsnf
   LdQrwJAQZ9Bz0g3XlWn6fEKzvWmibQVIQfhgqGhZfTwIW2QffuIeNT+JI
   owjCICWRfrN4uehU/pwnyLA+V+kZee1DlD6zhJy3SgVmuAULeTupmhmI9
   k3nf4VhqqLe/pCC5l8q4ipWIzzcXr4VkshoxnljtniyehBkVsOauNkCAa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="419920682"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="419920682"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 07:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821217108"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="821217108"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 07:05:06 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ApW-0004Bv-0i;
	Mon, 05 Jun 2023 14:05:06 +0000
Date: Mon, 5 Jun 2023 22:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/media/virtio/virtio_video_caps.c:108:42: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202306052143.3Fe3yMsk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f BACKPORT: FROMLIST: virtio_video: Add the Virtio Video V4L2 driver
date:   2 years, 6 months ago
config: alpha-randconfig-s033-20230605 (https://download.01.org/0day-ci/archive/20230605/202306052143.3Fe3yMsk-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout 80041cae8e8ca7f9c5ff0c8e22dbd7d4b27d9a6f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash drivers/media/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306052143.3Fe3yMsk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_caps.c:40:38: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] min @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     expected restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     got unsigned int [usertype]
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] max @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     expected restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     got unsigned int [usertype]
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] step @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     expected restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     got unsigned int [usertype]
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_rates @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     expected restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     got unsigned int [usertype]
>> drivers/media/virtio/virtio_video_caps.c:108:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] n @@     got restricted __le32 [usertype] num_rates @@
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     expected unsigned long [usertype] n
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     got restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:113:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] mask @@     got unsigned long long [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     expected restricted __le64 [usertype] mask
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     got unsigned long long [usertype]
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] planes_layout @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     expected restricted __le32 [usertype] planes_layout
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     got unsigned int [usertype]
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_frames @@     got unsigned int [usertype] @@
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     expected restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     got unsigned int [usertype]
>> drivers/media/virtio/virtio_video_caps.c:153:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] n @@     got restricted __le32 [usertype] num_frames @@
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     expected unsigned long [usertype] n
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     got restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:158:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     got restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     expected unsigned int [usertype] format
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     got restricted __le32 [usertype] format

vim +108 drivers/media/virtio/virtio_video_caps.c

    86	
    87	static size_t virtio_video_parse_virtio_frame(struct virtio_video_device *vvd,
    88						      struct video_format_frame *frm,
    89						      void *buf)
    90	{
    91		struct virtio_video *vv = NULL;
    92		struct virtio_video_format_frame *virtio_frame = NULL;
    93		struct virtio_video_format_frame *frame = &frm->frame;
    94		struct virtio_video_format_range *rate = NULL;
    95		size_t idx, offset = 0;
    96		size_t extra_size = 0;
    97	
    98		if (!frame || !buf || !vvd)
    99			return 0;
   100	
   101		vv = vvd->vv;
   102		virtio_frame = buf;
   103	
   104		assign_format_range(&frame->width, &virtio_frame->width);
   105		assign_format_range(&frame->height, &virtio_frame->height);
   106	
   107		frame->num_rates = le32_to_cpu(virtio_frame->num_rates);
 > 108		frm->frame_rates =  kcalloc(frame->num_rates,
   109					    sizeof(struct virtio_video_format_range),
   110					    GFP_KERNEL);
   111	
   112		offset = sizeof(struct virtio_video_format_frame);
   113		for (idx = 0; idx < frame->num_rates; idx++) {
   114			rate = &frm->frame_rates[idx];
   115			extra_size =
   116				virtio_video_parse_virtio_frame_rate(vvd, rate,
   117								     buf + offset);
   118			if (extra_size == 0) {
   119				kfree(frm->frame_rates);
   120				v4l2_err(&vv->v4l2_dev, "failed to parse frame rate\n");
   121				return 0;
   122			}
   123			offset += extra_size;
   124		}
   125	
   126		return offset;
   127	}
   128	
   129	static size_t virtio_video_parse_virtio_fmt(struct virtio_video_device *vvd,
   130						    struct video_format *fmt, void *buf)
   131	{
   132		struct virtio_video *vv = NULL;
   133		struct virtio_video_format_desc *virtio_fmt_desc = NULL;
   134		struct virtio_video_format_desc *fmt_desc = NULL;
   135		struct video_format_frame *frame = NULL;
   136		size_t idx, offset = 0;
   137		size_t extra_size = 0;
   138	
   139		if (!fmt || !buf || !vvd)
   140			return 0;
   141	
   142		vv = vvd->vv;
   143		virtio_fmt_desc = buf;
   144		fmt_desc = &fmt->desc;
   145	
   146		fmt_desc->format =
   147			virtio_video_format_to_v4l2
   148			(le32_to_cpu(virtio_fmt_desc->format));
   149		fmt_desc->mask = le64_to_cpu(virtio_fmt_desc->mask);
   150		fmt_desc->planes_layout = le32_to_cpu(virtio_fmt_desc->planes_layout);
   151	
   152		fmt_desc->num_frames = le32_to_cpu(virtio_fmt_desc->num_frames);
 > 153		fmt->frames = kcalloc(fmt_desc->num_frames,
   154				      sizeof(struct video_format_frame),
   155				      GFP_KERNEL);
   156	
   157		offset = sizeof(struct virtio_video_format_desc);
   158		for (idx = 0; idx < fmt_desc->num_frames; idx++) {
   159			frame = &fmt->frames[idx];
   160			extra_size =
   161				virtio_video_parse_virtio_frame(vvd, frame,
   162								buf + offset);
   163			if (extra_size == 0) {
   164				kfree(fmt->frames);
   165				v4l2_err(&vv->v4l2_dev, "failed to parse frame\n");
   166				return 0;
   167			}
   168			offset += extra_size;
   169		}
   170	
   171		return offset;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
