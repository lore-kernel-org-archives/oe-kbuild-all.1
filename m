Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113DA4D2EDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 19:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527078; cv=none; b=FmFxe4B1cbr6bcAqXenBnb5qD2Nuuj3S0RZd5iobizmv8AcEIwZ8lGzshH0FB0AQlX/tY/woOCegxPj1e+K1TPuI3Qk7ZVfRvC66GhH51XDdAoGi1KSvphbnMc919U3QmPduXotfiwjJ6hOSoCmC8Sgk/w7byogVx/kk+G67A+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527078; c=relaxed/simple;
	bh=P80xHYpcsgpArSeEYEigJk/TQXgC51+70Cy6vbxap8k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pgStLQw9l8+qQk53EvzqwinrWCofsBO0PawlAUn0Q//qt9d3x/cM+Rn4xkv65jFMcBW4q5Yxfp1gHrBz+5/Ygw5TTt1/EX6gmtDGZYKkawhJ6y9ueHS6D+OhZYfiaBrTGB0dL/3moZFbMwYF6OXQqjjYohO30VnMGj8fdobnChw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=li99de6d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="li99de6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778527077; x=1810063077;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P80xHYpcsgpArSeEYEigJk/TQXgC51+70Cy6vbxap8k=;
  b=li99de6dyUHpiFc7YDs6HSGCV/pjSph5kbzmy9cuUaOGUoPRXn2Gv646
   aorpYEppVmE+5RLVCyrSnM0QIRW1HVsdByoCAM+FP0ghCtPEaWa2Y4Csz
   Rn4BUlr60drEx2zNBjFcfvMUNnTxrVCChFNAxUpqea1WGvlOg2NGbdO/V
   E/+EZQl9KkZJortupdBeKlHKaXRLD3EmS/1GaA2L9rMDUfj1XT0CjXO1E
   MfvcN3N6h/BwwiY/bOK1V7h0xGeyBZZ77T5BCgfA6usm1jbytQeZhlo9b
   3iBjiKB07lmKIHuV5TbsZ5FSQSuOlDC8YJ/BLU0i3mgnxt71bPH8C82if
   A==;
X-CSE-ConnectionGUID: xWwYJCsfTTumhq16c/4qaA==
X-CSE-MsgGUID: 0LV8ykhrRrK++6CqvV8qbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79535113"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79535113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:17:56 -0700
X-CSE-ConnectionGUID: Tn8e55TuTr2Lf78eZa2HwQ==
X-CSE-MsgGUID: WiJ+IWt2RGylqKWxM1EF+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="233226594"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 12:17:55 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMW8W-0000000013h-34Y8;
	Mon, 11 May 2026 19:17:52 +0000
Date: Tue, 12 May 2026 03:16:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 drivers/media/virtio/virtio_video_device.c:801:30: warning: variable
 'out_prev_min_buffs' set but not used
Message-ID: <202605120356.HEZxmdDk-lkp@intel.com>
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
head:   80e99694479e5e9fe7c6230aad1327bbb9c655be
commit: df1b8f1ab2fe61012ccc336a3d7371ac274bb570 [1/1] CHROMIUM: drivers: m=
edia: virtio: send EVENT_CTRL when CID_MIN_BUFFERS_FOR_* changes
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/202605=
12/202605120356.HEZxmdDk-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260512/202605120356.HEZxmdDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120356.HEZxmdDk-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' mac=
ro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/media/virtio/virtio_video_device.c:801:30: warning: variable 'ou=
t_prev_min_buffs' set but not used [-Wunused-but-set-variable]
     801 |         int ret, in_prev_min_buffs, out_prev_min_buffs;
         |                                     ^
   2 warnings generated.


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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
