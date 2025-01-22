Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2F11CCEED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 23:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737589430; cv=none; b=FbUVhd9yAdW3yJCZQta6jXQRsox9/eKxgZq+DnImzoXmG88+09pa3NPm8O6WZ49VlTV1+8kvfHndsyv2VxC6x0fjbeX8XWYDWaDBlY46edv+UH615G9ZtAAo+j6pXsmc+rTsl1Z1Gg9R1IsiE7Bxtptw13IodQ45idFcvZyWqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737589430; c=relaxed/simple;
	bh=LolBdgdzVneo4Jtz7uuPymuLghRg2vPGhhneZfyYcj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7hZ4ls68jFLFHg2r5EISPrz2/Z3NLPgZQv4Ukg66vVnwYFauSz1WQkSWKjy+tI/tEiJKJtWZv57y2Y9zL3RL1OrwpYb5yfQ8kwfkPREsxQSxmhD7mHH5cGYeFXLYg1glWq9tn3Ya0TGT5xjOEEdl+D2C1sJpJPshttR6+wyCmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AT8GL0w0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AT8GL0w0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737589428; x=1769125428;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LolBdgdzVneo4Jtz7uuPymuLghRg2vPGhhneZfyYcj8=;
  b=AT8GL0w0aaFSOdvCejduXWdzN1sGvzPqsRzrY6kyu7tnZ9th2cQF0ew1
   b+7hIMookmowJrK9bYua8sFB5BF7tz+647aOahgAbjdtVthYMae0VRjDP
   WRGoLzwYN1KLonNX5HpEJfed1YJFNpyjDvi0f5JeMfKwZ+8s7wBHoFHHt
   Lt1WZzfUHAHJioAV330vPiDPgnyxMHSOFTnafqQ+czBialkD+y6hML/2e
   foJRiSYMLEYbPBWlZdyz/ojhahM4TUXpjyE+3UXTLyWDmyukLeEwIAczP
   kabE1H7rdrHMY5a/xPi6GYLhvu8iOCahkT71B9IrGuJeLHa5m4FEhLmIb
   w==;
X-CSE-ConnectionGUID: JVKYP7PnQ2qXqE3k94oi1w==
X-CSE-MsgGUID: 25kMQ0lhT7u+uWhZLgo7QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="63421896"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; 
   d="scan'208";a="63421896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 15:43:47 -0800
X-CSE-ConnectionGUID: TwPfqlIBRua3CZ81GWwbfw==
X-CSE-MsgGUID: Ov+ADsmXQGKyNhvZwIYtsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112264403"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 15:43:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1takNs-000aPv-1O;
	Wed, 22 Jan 2025 23:43:44 +0000
Date: Thu, 23 Jan 2025 07:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 0/1]
 drivers/media/virtio/virtio_video_device.c:801:37: warning: variable
 'out_prev_min_buffs' set but not used
Message-ID: <202501230707.QBQPONnX-lkp@intel.com>
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
head:   f2a45e7307e73a366b48781aa253aec45ff1fd5a
commit: df1b8f1ab2fe61012ccc336a3d7371ac274bb570 [0/1] CHROMIUM: drivers: media: virtio: send EVENT_CTRL when CID_MIN_BUFFERS_FOR_* changes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250123/202501230707.QBQPONnX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230707.QBQPONnX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230707.QBQPONnX-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
