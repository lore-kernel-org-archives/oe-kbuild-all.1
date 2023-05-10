Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524B80C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683704243; x=1715240243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1QNa2g1drrwJCcZndATDmhBHDYh22o/UzhvX4MgcNH4=;
  b=eAF6Ne1ONaSZ6KNOI4UdSmEj6ZI9XGxj5vf2vvWvD5MNx+mPH9rF6c1J
   MuxVVMcy2MtW659xwaJRCJHDEfwRaF1lYM4uFiqcUhxpYKKu6/6HfQWIR
   kKx9NwRptlQh3ZGh3iCT+VjRbThpOzlxHtUrxGnwSxj9A+bV7ZcMVefrk
   FHwd8V/xqVJW4ahocHH5Y1mi76MYQsC3gVT8kboY+3dwqLA1tKmQY0cbm
   Z7TdaycO9BIioo8YXcthneEo/PtdV4RFmtIcIwe+EMUkhMqS5YTNldBOZ
   u8nGj4Bl8Cm4Kc/GSkiUUv9pLsgRM1Y6WgVvFK77OrV+8WYsMBqkqJr3+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="415723835"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="415723835"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 00:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="843418912"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="843418912"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 May 2023 00:37:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pweO1-00031s-00;
	Wed, 10 May 2023 07:37:21 +0000
Date: Wed, 10 May 2023 15:37:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 17380/27339]
 drivers/media/virtio/virtio_video_device.c:801:37: warning: variable
 'out_prev_min_buffs' set but not used
Message-ID: <202305101522.FBh4BZ82-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Bartłomiej,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   38c9505e848341b872cc86bab96f3f746a5c7e5d
commit: df1b8f1ab2fe61012ccc336a3d7371ac274bb570 [17380/27339] CHROMIUM: drivers: media: virtio: send EVENT_CTRL when CID_MIN_BUFFERS_FOR_* changes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230510/202305101522.FBh4BZ82-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout df1b8f1ab2fe61012ccc336a3d7371ac274bb570
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/virtio/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101522.FBh4BZ82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/virtio/virtio_video_device.c: In function 'virtio_video_update_params':
>> drivers/media/virtio/virtio_video_device.c:801:37: warning: variable 'out_prev_min_buffs' set but not used [-Wunused-but-set-variable]
     801 |         int ret, in_prev_min_buffs, out_prev_min_buffs;
         |                                     ^~~~~~~~~~~~~~~~~~


vim +/out_prev_min_buffs +801 drivers/media/virtio/virtio_video_device.c

   794	
   795	int virtio_video_update_params(struct virtio_video *vv,
   796				       struct virtio_video_stream *stream,
   797				       struct video_format_info *in_info,
   798				       struct video_format_info *out_info)
   799	{
   800		struct virtio_video_device *vvd = to_virtio_vd(stream->video_dev);
 > 801		int ret, in_prev_min_buffs, out_prev_min_buffs;
   802		bool is_encoder;
   803	
   804		in_prev_min_buffs = stream->in_info.min_buffers;
   805		out_prev_min_buffs = stream->out_info.min_buffers;
   806	
   807		if (in_info) {
   808			ret = virtio_video_cmd_set_params(vv, stream, in_info,
   809							  VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
   810			if (ret)
   811				return ret;
   812		}
   813		if (out_info) {
   814			ret = virtio_video_cmd_set_params(vv, stream, out_info,
   815							  VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
   816			if (ret)
   817				return ret;
   818		}
   819	
   820		ret = virtio_video_cmd_get_params(vv, stream,
   821						  VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
   822		if (ret)
   823			return ret;
   824		ret = virtio_video_cmd_get_params(vv, stream,
   825						  VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
   826		if (ret)
   827			return ret;
   828	
   829		is_encoder = vvd->type == VIRTIO_VIDEO_DEVICE_ENCODER;
   830		if (is_encoder && in_prev_min_buffs != stream->in_info.min_buffers)
   831			virtio_video_queue_ctrl_event(stream,
   832						      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
   833						      stream->in_info.min_buffers,
   834						      V4L2_EVENT_CTRL_CH_VALUE);
   835		if (!is_encoder && in_prev_min_buffs != stream->out_info.min_buffers)
   836			virtio_video_queue_ctrl_event(stream,
   837						      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
   838						      stream->out_info.min_buffers,
   839						      V4L2_EVENT_CTRL_CH_VALUE);
   840	
   841		return 0;
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
