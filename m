Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD311E1022
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736205309; cv=none; b=sfDUVz1PzGeexP3xU4rkgZYxcv5uC6CB99uQp1xHWo6mQoNACSsJ88V9CoY0EqBeHKkiydAkC8ulmD0s9oSkaqRdoz2HAkVVLUcZ3xW320cSIlZ/WGRDyZsVVuG25flM41yrFK9yYY+5M9RhPBlXJ0qPiCEKeBVAJiU9t27hHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736205309; c=relaxed/simple;
	bh=JnWn15U8ftGmhqeFk61Wqvv+O855sATNNDb0WlDH/so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEZXJ3oEM/wVGRL1QMUXsBsNwDTJe1B2r3AeYzgKnvqIlLcqHpYWhYStzd+eU5fVs75SMswCQfgjCKyeuWiMAze4CI+2H1Cl6mXecmhen7L1YXLF6YAi7bs4d1BkAlNzOqqt7db4JnRNy0Q6vL1JVoVTv9YllnEMb1hXZeJzlTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DYcnd/Ya; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DYcnd/Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736205307; x=1767741307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JnWn15U8ftGmhqeFk61Wqvv+O855sATNNDb0WlDH/so=;
  b=DYcnd/YaExa1ZoGjtdnetFPCk2K4Xckh+xbv8SQk4Zu7v+ccdfVPfGZP
   h1jNxSithR9Iicn3svk7CcvMXcXbzmuqgsIw98NUJWgABNIA4NrlEUJY5
   huljB6Q1uIwHksmQO8BurhlZwt0MFVk9CXQlg6FW23MkHGgt/zSvShw8O
   oZMJi9SQbIR/z6G5Ak4TjJiFLJVP4vMAA5GX0CxqtUAWwg3QviPxt7zfW
   VqXu+Bj41jJlQm/k50y46lqgCd++XwJ9NcgW4FCm2lVm+J5ayDzs/m0fY
   A9soA74KSyqYLaLsQIW0I3yoy0xBoEvWwjyo3L1/bDQBy/wYEX8cxwteG
   g==;
X-CSE-ConnectionGUID: ld1q4x8MTc6QF2G4Zss50w==
X-CSE-MsgGUID: M5vuPjUyS6iVXEMKCyuMlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53786503"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="53786503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 15:15:06 -0800
X-CSE-ConnectionGUID: U5f0p7xeTfm9OZ8rZq+4JA==
X-CSE-MsgGUID: snl6b6+ySS+5IaqDhYCL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="103074714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jan 2025 15:15:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUwJJ-000E0l-04;
	Mon, 06 Jan 2025 23:15:01 +0000
Date: Tue, 7 Jan 2025 07:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 177/177]
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:261:
 warning: Function parameter or member 'vsi' not described in
 'vdec_h264_slice_inst'
Message-ID: <202501070730.lXCL8EEl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   37484545df505e5a625635cadf4bbdf4f3eef3e1
commit: 1fa2cebc09969532dd8f7a2ff9b86c1820f16292 [177/177] FROMLIST: media: mediatek: vcodec: adding non extend struct
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070730.lXCL8EEl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070730.lXCL8EEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070730.lXCL8EEl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'wdma_end_addr_offset' not described in 'vdec_h264_slice_info_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'reserved' not described in 'vdec_h264_slice_info_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'bs' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'fb' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'ube' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'trans' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'row_info' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'err_map' not described in 'vdec_h264_slice_vsi_ex'
   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:152: warning: Function parameter or member 'slice_bc' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:261: warning: Function parameter or member 'vsi' not described in 'vdec_h264_slice_inst'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:261: warning: Function parameter or member 'vsi_core' not described in 'vdec_h264_slice_inst'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:261: warning: Function parameter or member 'vsi_ctx' not described in 'vdec_h264_slice_inst'


vim +261 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c

59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  211  
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  212  /**
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  213   * struct vdec_h264_slice_inst - h264 decoder instance
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  214   *
8d197aaf1b8497 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Sebastian Fricke 2024-03-02  215   * @slice_dec_num:	Number of frames to be decoded
01abf5fbb081c0 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2023-07-29  216   * @ctx:		point to mtk_vcodec_dec_ctx
ab83e4255f4ff2 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Sebastian Fricke 2024-03-02  217   * @pred_buf:		HW working prediction buffer
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  218   * @mv_buf:		HW working motion vector buffer
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  219   * @vpu:		VPU instance
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  220   * @vsi_ex:		extend vsi used for lat
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  221   * @vsi_core_ex:	extend vsi used for core
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  222   *
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  223   * @vsi_ctx_ex:	Local extend vsi data for this decoding context
397edc703a10f6 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  224   * @h264_slice_param:	the parameters that hardware use to decode
397edc703a10f6 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  225   *
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  226   * @resolution_changed:resolution changed
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  227   * @realloc_mv_buf:	reallocate mv buffer
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  228   * @cap_num_planes:	number of capture queue plane
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  229   *
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  230   * @dpb:		decoded picture buffer used to store reference
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  231   *			buffer information
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  232   *@is_field_bitstream:	is field bitstream
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  233   */
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  234  struct vdec_h264_slice_inst {
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  235  	unsigned int slice_dec_num;
01abf5fbb081c0 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2023-07-29  236  	struct mtk_vcodec_dec_ctx *ctx;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  237  	struct mtk_vcodec_mem pred_buf;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  238  	struct mtk_vcodec_mem mv_buf[H264_MAX_MV_NUM];
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  239  	struct vdec_vpu_inst vpu;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  240  	union {
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  241  		struct vdec_h264_slice_vsi_ex *vsi_ex;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  242  		struct vdec_h264_slice_vsi *vsi;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  243  	};
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  244  	union {
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  245  		struct vdec_h264_slice_vsi_ex *vsi_core_ex;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  246  		struct vdec_h264_slice_vsi *vsi_core;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  247  	};
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  248  
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  249  	union {
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  250  		struct vdec_h264_slice_vsi_ex vsi_ctx_ex;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  251  		struct vdec_h264_slice_vsi vsi_ctx;
1fa2cebc099695 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  252  	};
397edc703a10f6 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  253  	struct vdec_h264_slice_lat_dec_param h264_slice_param;
397edc703a10f6 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  254  
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  255  	unsigned int resolution_changed;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  256  	unsigned int realloc_mv_buf;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  257  	unsigned int cap_num_planes;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  258  
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  259  	struct v4l2_h264_dpb_entry dpb[16];
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  260  	bool is_field_bitstream;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12 @261  };
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  262  

:::::: The code at line 261 was first introduced by commit
:::::: 59fba9eed5a736caa257df4738c57ff72492365f media: mediatek: vcodec: support stateless H.264 decoding for mt8192

:::::: TO: Yunfei Dong <yunfei.dong@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
