Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C379279F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680011348; x=1711547348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2xHUtelrHPrHhQC0foTa3QYorMj6Gk08M600q2rTLPM=;
  b=Vdqo/BEmgnjA4khAQ/bge4aPXk34gnvquOj7sd9X3Oqa83IPrqImOVKG
   8wv6Dzl9hGKDrtsaoHutACxYuBT9CuZbKphNVcH69Ix9pzVhgwwEUNa9V
   n2dxTBF90D4KdnJ+0lVUM8VVt7/nhOLg0W+5FsyMYXj++J12TA2uq7fPu
   Ex71O+FTFHDIiNVZn1wWq4Tkx2Ht+w1EPY9j6L44ZI7yGF/QrIWcWfSa6
   SScpKi3LDeI3Rifw8IEwsexHu8/F/lT9HW+Dr6MKxiGPmWEx8D9C9xKr4
   MD3uCgWTgJomA7o8P5XfzXS0GUrFI/yiWo57wOFKzDjapHV5t6viqz0d9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="338068473"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="338068473"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 06:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="661184194"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="661184194"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Mar 2023 06:49:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph9hB-000IZd-0d;
	Tue, 28 Mar 2023 13:49:05 +0000
Date: Tue, 28 Mar 2023 21:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/media/virtio/virtio_video_caps.c:66:22: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202303282112.J6gWgplH-lkp@intel.com>
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
date:   2 years, 3 months ago
config: powerpc-randconfig-s042-20230326 (https://download.01.org/0day-ci/archive/20230328/202303282112.J6gWgplH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282112.J6gWgplH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/media/virtio/virtio_video_caps.c:40:38: sparse: sparse: restricted __le32 degrades to integer
>> drivers/media/virtio/virtio_video_caps.c:66:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] min @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     expected restricted __le32 [usertype] min
   drivers/media/virtio/virtio_video_caps.c:66:22: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:67:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] max @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     expected restricted __le32 [usertype] max
   drivers/media/virtio/virtio_video_caps.c:67:22: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:68:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] step @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     expected restricted __le32 [usertype] step
   drivers/media/virtio/virtio_video_caps.c:68:23: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:107:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_rates @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     expected restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:107:26: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted __le32 [usertype] num_rates @@
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     expected unsigned int [usertype] n
   drivers/media/virtio/virtio_video_caps.c:108:42: sparse:     got restricted __le32 [usertype] num_rates
   drivers/media/virtio/virtio_video_caps.c:113:34: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_caps.c:146:26: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:149:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le64 [usertype] mask @@     got unsigned long long @@
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     expected restricted __le64 [usertype] mask
   drivers/media/virtio/virtio_video_caps.c:149:24: sparse:     got unsigned long long
>> drivers/media/virtio/virtio_video_caps.c:150:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] planes_layout @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     expected restricted __le32 [usertype] planes_layout
   drivers/media/virtio/virtio_video_caps.c:150:33: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_caps.c:152:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_frames @@     got unsigned int @@
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     expected restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:152:30: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] n @@     got restricted __le32 [usertype] num_frames @@
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     expected unsigned int [usertype] n
   drivers/media/virtio/virtio_video_caps.c:153:39: sparse:     got restricted __le32 [usertype] num_frames
   drivers/media/virtio/virtio_video_caps.c:158:37: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:343:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:425:26: sparse: sparse: cast to restricted __le32
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_caps.c:457:69: sparse:     got restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] format @@     got restricted __le32 [usertype] format @@
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     expected unsigned int [usertype] format
   drivers/media/virtio/virtio_video_caps.c:468:31: sparse:     got restricted __le32 [usertype] format
--
   drivers/media/virtio/virtio_video_vq.c:241:25: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:242:21: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long id @@     got restricted __le32 [usertype] stream_id @@
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     expected unsigned long id
   drivers/media/virtio/virtio_video_vq.c:359:49: sparse:     got restricted __le32 [usertype] stream_id
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] num_data_sizes @@     got unsigned char [usertype] num_data_size @@
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     expected restricted __le32 [usertype] num_data_sizes
   drivers/media/virtio/virtio_video_vq.c:549:31: sparse:     got unsigned char [usertype] num_data_size
>> drivers/media/virtio/virtio_video_vq.c:726:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] top @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     expected restricted __le32 [usertype] top
   drivers/media/virtio/virtio_video_vq.c:726:31: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:727:32: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] left @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     expected restricted __le32 [usertype] left
   drivers/media/virtio/virtio_video_vq.c:727:32: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:728:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] width @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     expected restricted __le32 [usertype] width
   drivers/media/virtio/virtio_video_vq.c:728:33: sparse:     got unsigned int
>> drivers/media/virtio/virtio_video_vq.c:729:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] height @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     expected restricted __le32 [usertype] height
   drivers/media/virtio/virtio_video_vq.c:729:34: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:776:18: sparse: sparse: restricted __le32 degrades to integer
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] v4l2_format @@     got restricted __le32 [usertype] @@
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     expected unsigned int [usertype] v4l2_format
   drivers/media/virtio/virtio_video_vq.c:818:34: sparse:     got restricted __le32 [usertype]
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] format @@     got unsigned int @@
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     expected restricted __le32 [usertype] format
   drivers/media/virtio/virtio_video_vq.c:817:30: sparse:     got unsigned int
   drivers/media/virtio/virtio_video_vq.c:309:28: sparse: sparse: context imbalance in 'virtio_video_queue_cmd_buffer_locked' - unexpected unlock

vim +66 drivers/media/virtio/virtio_video_caps.c

    62	
    63	static void assign_format_range(struct virtio_video_format_range *d_range,
    64					struct virtio_video_format_range *s_range)
    65	{
  > 66		d_range->min = le32_to_cpu(s_range->min);
  > 67		d_range->max = le32_to_cpu(s_range->max);
  > 68		d_range->step = le32_to_cpu(s_range->step);
    69	}
    70	
    71	static size_t
    72	virtio_video_parse_virtio_frame_rate(struct virtio_video_device *vvd,
    73					     struct virtio_video_format_range *f_rate,
    74					     void *buf)
    75	{
    76		struct virtio_video_format_range *virtio_frame_rate = NULL;
    77		size_t frame_rate_size = sizeof(struct virtio_video_format_range);
    78	
    79		if (!f_rate || !buf || !vvd)
    80			return 0;
    81	
    82		virtio_frame_rate = buf;
    83		assign_format_range(f_rate, virtio_frame_rate);
    84		return frame_rate_size;
    85	}
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
 > 107		frame->num_rates = le32_to_cpu(virtio_frame->num_rates);
   108		frm->frame_rates =  kcalloc(frame->num_rates,
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
 > 149		fmt_desc->mask = le64_to_cpu(virtio_fmt_desc->mask);
 > 150		fmt_desc->planes_layout = le32_to_cpu(virtio_fmt_desc->planes_layout);
   151	
 > 152		fmt_desc->num_frames = le32_to_cpu(virtio_fmt_desc->num_frames);
   153		fmt->frames = kcalloc(fmt_desc->num_frames,
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
https://github.com/intel/lkp-tests
