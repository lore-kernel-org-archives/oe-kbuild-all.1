Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284F1C27
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675493622; x=1707029622;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vP517VPNLeMl5qMSZv5hYh92Ykwu0neGbr0zo5Xa6jI=;
  b=k4lNTuAQUPYlbmiG/+5ATszMuqbdEl80QlGk3fKENVFo0X6J5rXfFLQ3
   tRjka/RCGoLo8k+tLIQO4vjC6eyPu3IjQxIHQqChOC+gVRTnvqJKHw2Lu
   4L2RwHMAQHp3rXIHs3WanooSm+h35j90rPViCyuwItrEgJAMyEvVjn6zA
   rZaBOk4X5CSMrnRx5OLtzvFAhreZQpY7m6BeakonlHDn4sdtwLqIuMuDa
   76N4+rDlxK5W1nQOmwJNLmXjOMz9MUzUnzft2SfCTEyBqmudJjjT72bUR
   lnRrpLvW4y76NP+2TaUDnmZGDXs5ruZkSDMA4X1lXXsS79taV7nUG+II1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309258049"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309258049"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 22:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="774582804"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="774582804"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2023 22:53:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOCQZ-00017H-0V;
	Sat, 04 Feb 2023 06:53:35 +0000
Date: Sat, 4 Feb 2023 14:53:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.15-arcvm
 115/138] drivers/media/virtio/virtio_video_device.c:801:37: warning:
 variable 'out_prev_min_buffs' set but not used
Message-ID: <202302041403.ipr42zHg-lkp@intel.com>
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

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.15-arcvm
head:   573344b8d137d3584c918c7efa8d4b949d0414d4
commit: d2fdccc2068350260263ab52734dbb0a7871673f [115/138] CHROMIUM: drivers: media: virtio: send EVENT_CTRL when CID_MIN_BUFFERS_FOR_* changes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230204/202302041403.ipr42zHg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/d2fdccc2068350260263ab52734dbb0a7871673f
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.15-arcvm
        git checkout d2fdccc2068350260263ab52734dbb0a7871673f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
