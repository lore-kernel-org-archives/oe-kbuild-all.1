Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E4D4C9B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 23:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715728869; cv=none; b=FuEc3JoV3xGCPZKIhs3h7coa4wrm38nH03J6DeVPYwpyBkjiWuLcuTPKBZiAxXno5PYm9gohBGdjcTsCh0vYCM23k8Brd1VALmkypKKK2Ehqs17lZTeKNc9jsN9HchKpUGaaCkH4/ZOVOIaSZKlyR4U4IWXc3rI8uu3x4+HhfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715728869; c=relaxed/simple;
	bh=zNYU6h8JSp0/VRSIKi6JAOn4R26UA1v1UIZBCFebZIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZAnqso20USwZIIBQqdZ6NbV5OygKQAVX/y9Clm4AhSfismbkFfFYo7O3FIobifJyiFo+E2PWxPGpll3HyzNyLkomxrzm1ExnyKif6iH4rH+LJAvtq4bo6f77YTvsTDAXjN5jbvdg5NrnmY+QbQqyqSDttZAQown4gVT3elkrdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM7gxDS8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM7gxDS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715728867; x=1747264867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNYU6h8JSp0/VRSIKi6JAOn4R26UA1v1UIZBCFebZIc=;
  b=ZM7gxDS80CeCDLVUL08lC5x6tndI1znFH9pnw/B8wAkHh/4VkbexoXbK
   J/Rgf1TKgTikOPxP74Nn1YfVBM1/2yXZGoW2IKbyL4+/3shzMpsWArujr
   kFwAvd1nn3li3hfIC8/w/cprGXSw9nheUKBuBBQw1nskk0hUGGEfCoZ0D
   S/Ahm0hMtPbjaFXn7VP76B18wHheSosF4BQ3IKWofgwIyT2NowpI7IBJB
   TgbghwcEXFdfiR+BzK9V79fyIUVJN/EMH48yo8vmxgCDCSdkEgGbnwxol
   EA6lf86LGKeJwuF9coP4vYmxDcpHGd9U66DRrixUOqXPnWdG1AW84a6nt
   g==;
X-CSE-ConnectionGUID: xH8Bm/sTQImjJT8XNAiRyA==
X-CSE-MsgGUID: IRFnLe1bRo+Qkk2wXkS1sw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11966857"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11966857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 16:21:06 -0700
X-CSE-ConnectionGUID: LwHEb2+lRveACkhF7qZW7g==
X-CSE-MsgGUID: +LxfuAZkTWCPwo7g03oIRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="31415325"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2024 16:21:04 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s71SA-000C6F-1F;
	Tue, 14 May 2024 23:21:02 +0000
Date: Wed, 15 May 2024 07:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 95/106] videobuf2-core.c:undefined reference
 to `v4l_vb2q_enable_media_source'
Message-ID: <202405150738.oxjL4cH1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1f64c8ce89e6d5c5cf094d47ae84dbc6956094a6
commit: 5cd0ae9700e0a1483b2fd161c7d7f120b643d953 [95/106] CHROMIUM: media: platform: mediatek: aie driver migration
config: arm-randconfig-004-20240515 (https://download.01.org/0day-ci/archive/20240515/202405150738.oxjL4cH1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405150738.oxjL4cH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405150738.oxjL4cH1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/common/videobuf2/videobuf2-core.o: in function `vb2_core_streamon':
>> videobuf2-core.c:(.text+0x5cf8): undefined reference to `v4l_vb2q_enable_media_source'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_hw_job_finish':
>> mtk_aie_53.c:(.text+0xea8): undefined reference to `v4l2_m2m_get_curr_priv'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0xec8): undefined reference to `v4l2_m2m_buf_remove'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0xee0): undefined reference to `v4l2_m2m_buf_remove'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0xf28): undefined reference to `v4l2_m2m_buf_copy_metadata'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0xf60): undefined reference to `v4l2_m2m_job_finish'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_vb2_request_complete':
>> mtk_aie_53.c:(.text+0x1208): undefined reference to `v4l2_ctrl_request_complete'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_job_ready':
>> mtk_aie_53.c:(.text+0x12ec): undefined reference to `v4l2_m2m_next_buf'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1304): undefined reference to `v4l2_m2m_next_buf'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x131c): undefined reference to `v4l2_ctrl_find'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1534): undefined reference to `v4l2_ctrl_request_complete'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_s_fmt_out_mp':
>> mtk_aie_53.c:(.text+0x176c): undefined reference to `v4l2_m2m_get_vq'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_querycap':
>> mtk_aie_53.c:(.text+0x18d4): undefined reference to `video_devdata'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_vfd_release':
   mtk_aie_53.c:(.text+0x19fc): undefined reference to `video_devdata'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1a48): undefined reference to `v4l2_m2m_ctx_release'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1a50): undefined reference to `v4l2_ctrl_handler_free'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1a58): undefined reference to `v4l2_fh_del'
>> arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x1a64): undefined reference to `v4l2_fh_exit'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_vb2_buf_queue':
>> mtk_aie_53.c:(.text+0x1ac4): undefined reference to `v4l2_m2m_buf_queue'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_vb2_stop_streaming':
>> mtk_aie_53.c:(.text+0x1b48): undefined reference to `v4l2_m2m_buf_remove'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_hw_enable':
>> mtk_aie_53.c:(.text+0x1c9c): undefined reference to `v4l2_ctrl_find'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_vfd_fop_poll':
>> mtk_aie_53.c:(.text+0x1ea0): undefined reference to `v4l2_m2m_fop_poll'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_queue_init':
   mtk_aie_53.c:(.text+0x1fd0): undefined reference to `vb2_queue_init'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x20a0): undefined reference to `vb2_queue_init'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_video_device_register':
   mtk_aie_53.c:(.text+0x21e0): undefined reference to `__video_register_device'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x21f8): undefined reference to `v4l2_m2m_register_media_controller'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2240): undefined reference to `video_unregister_device'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2268): undefined reference to `video_device_release_empty'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_dev_v4l2_init':
   mtk_aie_53.c:(.text+0x22ac): undefined reference to `v4l2_device_register'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x22c0): undefined reference to `v4l2_m2m_init'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2380): undefined reference to `v4l2_m2m_release'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2388): undefined reference to `v4l2_device_unregister'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x23d8): undefined reference to `v4l2_m2m_unregister_media_controller'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x23e4): undefined reference to `video_unregister_device'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_vfd_open':
   mtk_aie_53.c:(.text+0x2a3c): undefined reference to `video_devdata'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2a54): undefined reference to `video_devdata'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2b00): undefined reference to `v4l2_fh_init'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2b74): undefined reference to `v4l2_ctrl_handler_init_class'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2b9c): undefined reference to `v4l2_ctrl_new_custom'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2bc0): undefined reference to `v4l2_ctrl_new_custom'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2be8): undefined reference to `v4l2_ctrl_handler_setup'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2c00): undefined reference to `v4l2_m2m_ctx_init'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2c20): undefined reference to `v4l2_fh_add'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2c68): undefined reference to `v4l2_ctrl_handler_free'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2c70): undefined reference to `v4l2_fh_exit'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2cbc): undefined reference to `v4l2_ctrl_handler_free'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o: in function `mtk_aie_remove':
   mtk_aie_53.c:(.text+0x2eb0): undefined reference to `v4l2_m2m_unregister_media_controller'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2ebc): undefined reference to `video_unregister_device'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2ed8): undefined reference to `v4l2_m2m_release'
   arm-linux-gnueabi-ld: mtk_aie_53.c:(.text+0x2ee4): undefined reference to `v4l2_device_unregister'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xda4): undefined reference to `vb2_ops_wait_prepare'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xda8): undefined reference to `vb2_ops_wait_finish'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xe10): undefined reference to `video_ioctl2'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xe18): undefined reference to `v4l2_m2m_fop_mmap'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf28): undefined reference to `v4l2_m2m_ioctl_reqbufs'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf2c): undefined reference to `v4l2_m2m_ioctl_querybuf'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf30): undefined reference to `v4l2_m2m_ioctl_qbuf'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf34): undefined reference to `v4l2_m2m_ioctl_expbuf'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf38): undefined reference to `v4l2_m2m_ioctl_dqbuf'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf3c): undefined reference to `v4l2_m2m_ioctl_create_bufs'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf40): undefined reference to `v4l2_m2m_ioctl_prepare_buf'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf50): undefined reference to `v4l2_m2m_ioctl_streamon'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0xf54): undefined reference to `v4l2_m2m_ioctl_streamoff'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0x1030): undefined reference to `v4l2_ctrl_subscribe_event'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0x1034): undefined reference to `v4l2_event_unsubscribe'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0x11ac): undefined reference to `vb2_request_validate'
   arm-linux-gnueabi-ld: drivers/media/platform/mediatek/aie/mtk_aie_53.o:(.rodata+0x11b0): undefined reference to `v4l2_m2m_request_queue'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
