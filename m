Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B519DF72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 17:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719250404; cv=none; b=qq6c/aEmrZL09NEANbCPxG2BW5gQf0+DloSljD6j5vZeA26qYNmmVGyYgtqjSMCCuO16kMnc6JiIt6JJOAAnHHVhdH/pGMXSoZgZEAyOY/VNPmDVHlVfZm7ijxBXBIOGb/1sbRk8hB8RCZYqg/Ip1vqPjGu4QcuPSWyAr5hV57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719250404; c=relaxed/simple;
	bh=d5gdZrcoC4Fid+wyB1eWF2yMJjtSqqJQcinrs+mus6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MRIzR1A/g9ze71blIYjgAAGBTJUB8tHxAyp7KH7VkPOrPVXVMV4uHZ62aE3cHcfBOM/Kloq0+pwZXMtwRqY9TVWHusNkqz/Yi47lBK7YSh/XNntRploVmCsvojE2OCCRm2nOBEqzUBKULiF6mZCeaSQ96HRK8DcZ7HUVsYQC18M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IufYNnDH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IufYNnDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719250402; x=1750786402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5gdZrcoC4Fid+wyB1eWF2yMJjtSqqJQcinrs+mus6o=;
  b=IufYNnDHG4S16m0vnPOdEl9wXGAg+xSKMfdD4UHxebWTFrE/moLP0Alh
   9WlmLHzX/5ush2IvKVlQnwVO96Kr61TDryiHnwvIECnkMgn++E9mNaWjN
   nBGmv2NKaV0FCNTE6adjPc62F9lI5jVn231t7kQuX/RSF1N+GyGC7LF8s
   enBI2R64CisWYaMYPtS+sLXGGE7nJ6e48Syjl3KWVKbEA3sqU125PbVBS
   DnTpaVL8R8LUtjHCpZzI/R6ZFSxF8J7nJjFoer1o1EGXNOHbogDoMWPe7
   vPQG0IhMjXStrecoe7A0/I0gqECSr0sl3LqiW0ntc66Lg1wB0EMaKjY17
   Q==;
X-CSE-ConnectionGUID: loC0IyPyRvCboJr5z+rpVA==
X-CSE-MsgGUID: U0sojfEXTrq+LCk7tH84Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="15991906"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="15991906"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 10:33:21 -0700
X-CSE-ConnectionGUID: 2qtkgSQ2RMucjx4/3OeTiw==
X-CSE-MsgGUID: dWOjym9XSPirMJXNOhwBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43477751"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 10:33:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLnZ7-000DZq-2r;
	Mon, 24 Jun 2024 17:33:17 +0000
Date: Tue, 25 Jun 2024 01:32:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 153/203] ld:
 drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_if.o:(.rodata+0x14):
 multiple definition of `vdec_h264_if';
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.o:(.rodata+0x14):
 first defined here
Message-ID: <202406250137.H7jzj8wr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d4e5ab445b50a104ed3f1b34ada73f237fe1bfc0
commit: 3f19f4ecfd3abee6affdb50a93133fc69088771e [153/203] CHROMIUM: Duplicate video decoder drivers for MT8188
config: i386-buildonly-randconfig-001-20240624 (https://download.01.org/0day-ci/archive/20240625/202406250137.H7jzj8wr-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250137.H7jzj8wr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250137.H7jzj8wr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_if.o:(.rodata+0x14): multiple definition of `vdec_h264_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_if.o:(.rodata+0x14): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_vp8_if.o:(.rodata+0x14): multiple definition of `vdec_vp8_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.o:(.rodata+0x14): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_vp8_req_if.o:(.rodata+0x0): multiple definition of `vdec_vp8_slice_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.o:(.rodata+0x0): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_vp9_if.o:(.rodata+0x14): multiple definition of `vdec_vp9_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_if.o:(.rodata+0x14): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_vp9_req_lat_if.o:(.rodata+0x0): multiple definition of `vdec_vp9_slice_lat_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.o:(.rodata+0x0): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_av1_req_lat_if.o:(.rodata+0x44): multiple definition of `vdec_av1_slice_lat_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.o:(.rodata+0x44): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_if.o:(.rodata+0x0): multiple definition of `vdec_h264_slice_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.o:(.rodata+0x0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_get_ref_list':
>> vdec_h264_req_common.c:(.text+0x0): multiple definition of `mtk_vdec_h264_get_ref_list'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_get_ctrl_ptr':
>> vdec_h264_req_common.c:(.text+0xa0): multiple definition of `mtk_vdec_h264_get_ctrl_ptr'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0xa0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_fill_dpb_info':
>> vdec_h264_req_common.c:(.text+0xd0): multiple definition of `mtk_vdec_h264_fill_dpb_info'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0xd0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_copy_sps_params':
>> vdec_h264_req_common.c:(.text+0x1c0): multiple definition of `mtk_vdec_h264_copy_sps_params'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x1c0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_copy_pps_params':
>> vdec_h264_req_common.c:(.text+0x260): multiple definition of `mtk_vdec_h264_copy_pps_params'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x260): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_copy_slice_hd_params':
>> vdec_h264_req_common.c:(.text+0x2f0): multiple definition of `mtk_vdec_h264_copy_slice_hd_params'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x2f0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_copy_scaling_matrix':
>> vdec_h264_req_common.c:(.text+0x390): multiple definition of `mtk_vdec_h264_copy_scaling_matrix'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x390): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_copy_decode_params':
>> vdec_h264_req_common.c:(.text+0x4f0): multiple definition of `mtk_vdec_h264_copy_decode_params'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x4f0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_update_dpb':
>> vdec_h264_req_common.c:(.text+0x590): multiple definition of `mtk_vdec_h264_update_dpb'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x590): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_get_mv_buf_size':
>> vdec_h264_req_common.c:(.text+0x750): multiple definition of `mtk_vdec_h264_get_mv_buf_size'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x750): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_common.o: in function `mtk_vdec_h264_find_start_code':
>> vdec_h264_req_common.c:(.text+0x760): multiple definition of `mtk_vdec_h264_find_start_code'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.o:vdec_h264_req_common.c:(.text+0x760): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.o:(.rodata+0x0): multiple definition of `vdec_h264_slice_multi_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.o:(.rodata+0x0): first defined here
>> ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_hevc_req_multi_if.o:(.rodata+0x0): multiple definition of `vdec_hevc_slice_multi_if'; drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.o:(.rodata+0x0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_drv_if.o: in function `vdec_if_init':
   vdec_drv_if.c:(.text+0x0): multiple definition of `vdec_if_init'; drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.o:vdec_drv_if.c:(.text+0x0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_drv_if.o: in function `vdec_if_decode':
   vdec_drv_if.c:(.text+0x1e0): multiple definition of `vdec_if_decode'; drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.o:vdec_drv_if.c:(.text+0x1e0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_drv_if.o: in function `vdec_if_get_param':
   vdec_drv_if.c:(.text+0x290): multiple definition of `vdec_if_get_param'; drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.o:vdec_drv_if.c:(.text+0x290): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_drv_if.o: in function `vdec_if_deinit':
   vdec_drv_if.c:(.text+0x2f0): multiple definition of `vdec_if_deinit'; drivers/media/platform/mediatek/vcodec/decoder/vdec_drv_if.o:vdec_drv_if.c:(.text+0x2f0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_init':
   vdec_vpu_if.c:(.text+0x2d0): multiple definition of `vpu_dec_init'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x2d0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_start':
   vdec_vpu_if.c:(.text+0x3d0): multiple definition of `vpu_dec_start'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x3d0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_get_param':
   vdec_vpu_if.c:(.text+0x4b0): multiple definition of `vpu_dec_get_param'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x4b0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_core':
   vdec_vpu_if.c:(.text+0x590): multiple definition of `vpu_dec_core'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x590): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_end':
   vdec_vpu_if.c:(.text+0x5a0): multiple definition of `vpu_dec_end'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x5a0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_core_end':
   vdec_vpu_if.c:(.text+0x5b0): multiple definition of `vpu_dec_core_end'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x5b0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_deinit':
   vdec_vpu_if.c:(.text+0x5c0): multiple definition of `vpu_dec_deinit'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x5c0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_vpu_if.o: in function `vpu_dec_reset':
   vdec_vpu_if.c:(.text+0x5d0): multiple definition of `vpu_dec_reset'; drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.o:vdec_vpu_if.c:(.text+0x5d0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_init_ctx':
   vdec_msg_queue.c:(.text+0x0): multiple definition of `vdec_msg_queue_init_ctx'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_qbuf':
   vdec_msg_queue.c:(.text+0x60): multiple definition of `vdec_msg_queue_qbuf'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x60): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_dqbuf':
   vdec_msg_queue.c:(.text+0x1b0): multiple definition of `vdec_msg_queue_dqbuf'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x1b0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_update_ube_rptr':
   vdec_msg_queue.c:(.text+0x4c0): multiple definition of `vdec_msg_queue_update_ube_rptr'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x4c0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_update_ube_wptr':
   vdec_msg_queue.c:(.text+0x510): multiple definition of `vdec_msg_queue_update_ube_wptr'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x510): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_wait_lat_buf_full':
   vdec_msg_queue.c:(.text+0x560): multiple definition of `vdec_msg_queue_wait_lat_buf_full'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x560): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_deinit':
   vdec_msg_queue.c:(.text+0x670): multiple definition of `vdec_msg_queue_deinit'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x670): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec_msg_queue.o: in function `vdec_msg_queue_init':
   vdec_msg_queue.c:(.text+0x730): multiple definition of `vdec_msg_queue_init'; drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.o:vdec_msg_queue.c:(.text+0x730): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `mtk_vdec_unlock':
   mtk_vcodec_dec.c:(.text+0xf80): multiple definition of `mtk_vdec_unlock'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0xf80): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `mtk_vdec_lock':
   mtk_vcodec_dec.c:(.text+0xfa0): multiple definition of `mtk_vdec_lock'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0xfa0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `mtk_vcodec_dec_release':
   mtk_vcodec_dec.c:(.text+0xfd0): multiple definition of `mtk_vcodec_dec_release'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0xfd0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `mtk_vcodec_dec_set_default_params':
   mtk_vcodec_dec.c:(.text+0xff0): multiple definition of `mtk_vcodec_dec_set_default_params'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0xff0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_queue_setup':
   mtk_vcodec_dec.c:(.text+0x12f0): multiple definition of `vb2ops_vdec_queue_setup'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x12f0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_buf_prepare':
   mtk_vcodec_dec.c:(.text+0x13e0): multiple definition of `vb2ops_vdec_buf_prepare'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x13e0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_buf_finish':
   mtk_vcodec_dec.c:(.text+0x14a0): multiple definition of `vb2ops_vdec_buf_finish'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x14a0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_buf_init':
   mtk_vcodec_dec.c:(.text+0x1510): multiple definition of `vb2ops_vdec_buf_init'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x1510): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_start_streaming':
   mtk_vcodec_dec.c:(.text+0x1530): multiple definition of `vb2ops_vdec_start_streaming'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x1530): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `vb2ops_vdec_stop_streaming':
   mtk_vcodec_dec.c:(.text+0x1550): multiple definition of `vb2ops_vdec_stop_streaming'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x1550): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o: in function `mtk_vcodec_dec_queue_init':
   mtk_vcodec_dec.c:(.text+0x1670): multiple definition of `mtk_vcodec_dec_queue_init'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:mtk_vcodec_dec.c:(.text+0x1670): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o:(.rodata+0x20): multiple definition of `mtk_vdec_ioctl_ops'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:(.rodata+0x20): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec.o:(.rodata+0x1fc): multiple definition of `mtk_vdec_m2m_ops'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.o:(.rodata+0x1fc): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateful.o:(.rodata+0x80): multiple definition of `mtk_vdec_8173_pdata'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.o:(.rodata+0x80): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.o:(.rodata+0x40): multiple definition of `mtk_vdec_single_core_pdata'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.o:(.rodata+0x40): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.o:(.rodata+0x80): multiple definition of `mtk_lat_sig_core_pdata'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.o:(.rodata+0x80): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.o:(.rodata+0xc0): multiple definition of `mtk_vdec_8183_pdata'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.o:(.rodata+0xc0): first defined here
   ld: drivers/media/platform/mediatek/vcodec/decoder_mt8188/mtk_vcodec_dec_stateless.o:(.rodata+0xf4): multiple definition of `mtk_vcodec_media_ops'; drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.o:(.rodata+0xf4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
