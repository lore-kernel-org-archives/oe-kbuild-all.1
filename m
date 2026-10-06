Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD303DBD51
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281239; cv=none; b=PbahBda4I1HeUPvE1WVfDUWshB4kCW4BK1e3ndxb4dvshlR+2tHvnmcFaTXWE5YCJw0k7FEza5hF9Ka2sYIf41aQrH5/soLcqSVoZpN4OuPo3Z6bqZFnWf7HVVM6v6nyOBkRedF09KTDfTxPsVDLipZCvNa8FITet+8ob57KG1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281239; c=relaxed/simple;
	bh=TwRXhDLZy6XjMEtOb/FNN16Yz+EofUgK9C2C9zzYOeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l0mnsA0ogJLGRIlEiR/lrZrMSOCkmzitdUfCCo5MXAERwxta7/GvcWiXRaMDR5l6YGvbbs1FZJ/qWF9/iWVp9ut86VUBkXlzVOkxbXtSOeIpx6WHiuufrj/rS0+pY1ZkBTUVj/maNBnxKZ1fIPOaYX0YAyqugqa8XDKU9Bypxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTE1supy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTE1supy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791281237; x=1822817237;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TwRXhDLZy6XjMEtOb/FNN16Yz+EofUgK9C2C9zzYOeA=;
  b=UTE1supyVzYJJF5JLbO9sQ9Qvc/LGAcOykLVnN3xBb+YN/JxnJxv2wQk
   xDYETE9ucFw7rYhjGaSNAQkO2lui3eeT07oqss/IHl2teI+j5oYiRl5n6
   yiUwjJ1NvC6ahBbPh04O6FzKNMtNSUdCn9Or2JrMHRD5Ig0UxcNgpmKD3
   FkCly+VeuArBENNUiOo70Vj9ik0PhMfmR4HXR05x0uI5sbLpqqZP9g0FH
   a8Hl9MF//MD2xZOaiWvT0D6sEg7qi2CeyAOlCHNd1rUu9XBIyXAD09hkf
   IIw7Qm1GOcApbAnCO6nccxQT12SZaj6r1+KjpT25NSID06RFD0A0U9PBq
   Q==;
X-CSE-ConnectionGUID: 8dCYX63jTT2GtuK5o2kRQA==
X-CSE-MsgGUID: Zq09aTceRl22Z3ck0YdJFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="17084"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="17084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:07:16 -0700
X-CSE-ConnectionGUID: y0CfsQfGRrSHjHT+T3VcPw==
X-CSE-MsgGUID: jFee5Jz/QyeKci8YJvz6Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="306591755"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Oct 2026 03:07:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE24l-000000001Rw-2yyL;
	Tue, 06 Oct 2026 10:07:11 +0000
Date: Tue, 06 Oct 2026 18:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/media/virtio/virtio_video_device.c:801:37: warning: variable
 'out_prev_min_buffs' set but not used
Message-ID: <202610061728.2b00bq7i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Bart=C5=82omiej,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10=
-arcvm
head:   6f82755ed602e815541b2c6617a3f30f53500cdc
commit: df1b8f1ab2fe61012ccc336a3d7371ac274bb570 [4/4] CHROMIUM: drivers: m=
edia: virtio: send EVENT_CTRL when CID_MIN_BUFFERS_FOR_* changes
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261006/=
202610061728.2b00bq7i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261006/202610061728.2b00bq7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061728.2b00bq7i-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   drivers/media/virtio/virtio_video_device.c: In function 'virtio_video_up=
date_params':
>> drivers/media/virtio/virtio_video_device.c:801:37: warning: variable 'ou=
t_prev_min_buffs' set but not used [-Wunused-but-set-variable=3D]
     801 |         int ret, in_prev_min_buffs, out_prev_min_buffs;
         |                                     ^~~~~~~~~~~~~~~~~~


vim +/out_prev_min_buffs +801 drivers/media/virtio/virtio_video_device.c

   794=09
   795	int virtio_video_update_params(struct virtio_video *vv,
   796				       struct virtio_video_stream *stream,
   797				       struct video_format_info *in_info,
   798				       struct video_format_info *out_info)
   799	{
   800		struct virtio_video_device *vvd =3D to_virtio_vd(stream->video_dev);
 > 801		int ret, in_prev_min_buffs, out_prev_min_buffs;
   802		bool is_encoder;
   803=09
   804		in_prev_min_buffs =3D stream->in_info.min_buffers;
   805		out_prev_min_buffs =3D stream->out_info.min_buffers;
   806=09
   807		if (in_info) {
   808			ret =3D virtio_video_cmd_set_params(vv, stream, in_info,
   809							  VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
   810			if (ret)
   811				return ret;
   812		}
   813		if (out_info) {
   814			ret =3D virtio_video_cmd_set_params(vv, stream, out_info,
   815							  VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
   816			if (ret)
   817				return ret;
   818		}
   819=09
   820		ret =3D virtio_video_cmd_get_params(vv, stream,
   821						  VIRTIO_VIDEO_QUEUE_TYPE_INPUT);
   822		if (ret)
   823			return ret;
   824		ret =3D virtio_video_cmd_get_params(vv, stream,
   825						  VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT);
   826		if (ret)
   827			return ret;
   828=09
   829		is_encoder =3D vvd->type =3D=3D VIRTIO_VIDEO_DEVICE_ENCODER;
   830		if (is_encoder && in_prev_min_buffs !=3D stream->in_info.min_buffer=
s)
   831			virtio_video_queue_ctrl_event(stream,
   832						      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
   833						      stream->in_info.min_buffers,
   834						      V4L2_EVENT_CTRL_CH_VALUE);
   835		if (!is_encoder && in_prev_min_buffs !=3D stream->out_info.min_buff=
ers)
   836			virtio_video_queue_ctrl_event(stream,
   837						      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE,
   838						      stream->out_info.min_buffers,
   839						      V4L2_EVENT_CTRL_CH_VALUE);
   840=09
   841		return 0;
   842	}
   843=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
