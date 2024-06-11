Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2269DF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 21:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718142673; cv=none; b=tkIMnzZ/rUhwbO7l0MwJ1IPepJ8CRHoxsyc1qr4DMJvTmQk6LOPX7q1zq0crlDEXsUPpBE6QiEAcvbm987inbJkTiM5CFz2ri8sMKd+dWRPy+2sclsgtx5gW3D2Tl+uHSo5wOYZEzahHs1/nTdq7T4d2Cky31tbjKCHfDj6Mv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718142673; c=relaxed/simple;
	bh=Z+6N7filDQrxXBR6+tk+zLlb6L9za7pehwg11mvCIEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UQAIWwyfRqLxMPtJYUFOY6xrub2Qy6VHryFQ3YvbnKXGYBT32UApshK4oqgAZisppsdDVPNGXGvSYdWsphpSs0PZBO0lshlmUYZRREu5tOnKyr9HPnl6fVTH/rgRYPoP6tObuHmXH5aMLSiLWL5rnJTM7G3tGC6XBaPQjmBK0hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXbhXg9r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXbhXg9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718142671; x=1749678671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z+6N7filDQrxXBR6+tk+zLlb6L9za7pehwg11mvCIEg=;
  b=QXbhXg9rCV9hkQwM+1EIxwwSr2NbDVkh23nfSP5D9A8UHqp1LLz/SgtZ
   ioMphK2IlgAwTw+XX+zgB9dELqJ/B/Xk21CZRHoFHJcPvSdqD6fPr8yif
   dc/W2PakNsrItcipSKDIKkLtmdTmI8zBEMMzTbyiBNAUw3k2uIZHcFcDc
   X5cndodOd4Ut/0Qe7B6YBBIs6ZuhCiMp9AsVvgZF6ePesJPtCA9bTG0oT
   Sc4LAxT0s/t9vs/8AcU2A/QsK2tWYO227MhHLiJuSQaSJ3UWXFrHeZmTa
   nDNxas4W0tmTHNu30wnFLLdGUdb1Ef/kT7sDQCV/Vk+Uln3GCYKqYFumb
   g==;
X-CSE-ConnectionGUID: cCYh4JF9RjOW6CxK0xVHwA==
X-CSE-MsgGUID: jL/n77vOTtOFigLU+/Cplw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18661299"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="18661299"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 14:51:11 -0700
X-CSE-ConnectionGUID: LLB4KDPAQ0aYVFf6rQ9DhQ==
X-CSE-MsgGUID: 09dA7mnBSt2hSkyyTvHa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; 
   d="scan'208";a="40281894"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2024 14:51:09 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH9OV-0000wE-0P;
	Tue, 11 Jun 2024 21:51:07 +0000
Date: Wed, 12 Jun 2024 05:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 163/176]
 drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:69:
 warning: Function parameter or member 'wdma_end_addr_offset' not described
 in 'vdec_h264_slice_info'
Message-ID: <202406120525.dAZqUNJg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   647b8418b5ae299998e2190ba3bd174fa8651630
commit: fcd0d2acedb1cbb21cff658d710e75835477e252 [163/176] Reapply "FROMLIST: media: mediatek: vcodec: re-construct h264 driver to support svp mode"
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240612/202406120525.dAZqUNJg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120525.dAZqUNJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120525.dAZqUNJg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'wdma_end_addr_offset' not described in 'vdec_h264_slice_info'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'reserved' not described in 'vdec_h264_slice_info'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'bs' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'fb' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'ube' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'trans' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'row_info' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'err_map' not described in 'vdec_h264_slice_vsi'
>> drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'slice_bc' not described in 'vdec_h264_slice_vsi'


vim +69 drivers/media/platform/mediatek/vcodec/decoder_mt8188/vdec/vdec_h264_req_multi_if.c

    49	
    50	/**
    51	 * struct vdec_h264_slice_info - decode information
    52	 *
    53	 * @nal_info:		nal info of current picture
    54	 * @timeout:		Decode timeout: 1 timeout, 0 no timeount
    55	 * @bs_buf_size:	bitstream size
    56	 * @bs_buf_addr:	bitstream buffer dma address
    57	 * @y_fb_dma:		Y frame buffer dma address
    58	 * @c_fb_dma:		C frame buffer dma address
    59	 * @vdec_fb_va:	VDEC frame buffer struct virtual address
    60	 * @crc:		Used to check whether hardware's status is right
    61	 */
    62	struct vdec_h264_slice_info {
    63		u64 wdma_end_addr_offset;
    64		u16 nal_info;
    65		u16 timeout;
    66		u64 vdec_fb_va;
    67		u32 crc[8];
    68		u32 reserved;
  > 69	};
    70	
    71	/*
    72	 * struct vdec_h264_slice_mem - memory address and size
    73	 */
    74	struct vdec_h264_slice_mem {
    75		union {
    76			u64 buf;
    77			u64 dma_addr;
    78		};
    79		union {
    80			size_t size;
    81			u64 dma_addr_end;
    82		};
    83	};
    84	
    85	/**
    86	 * struct vdec_h264_slice_fb - frame buffer for decoding
    87	 * @y:  current y buffer address info
    88	 * @c:  current c buffer address info
    89	 */
    90	struct vdec_h264_slice_fb {
    91		struct vdec_h264_slice_mem y;
    92		struct vdec_h264_slice_mem c;
    93	};
    94	
    95	/**
    96	 * struct vdec_h264_slice_vsi - shared memory for decode information exchange
    97	 *        between SCP and Host.
    98	 *
    99	 * @wdma_err_addr:		wdma error dma address
   100	 * @wdma_start_addr:		wdma start dma address
   101	 * @wdma_end_addr:		wdma end dma address
   102	 * @slice_bc_start_addr:	slice bc start dma address
   103	 * @slice_bc_end_addr:		slice bc end dma address
   104	 * @row_info_start_addr:	row info start dma address
   105	 * @row_info_end_addr:		row info end dma address
   106	 * @trans_start:		trans start dma address
   107	 * @trans_end:			trans end dma address
   108	 * @wdma_end_addr_offset:	wdma end address offset
   109	 *
   110	 * @mv_buf_dma:		HW working motion vector buffer
   111	 *				dma address (AP-W, VPU-R)
   112	 * @dec:			decode information (AP-R, VPU-W)
   113	 * @h264_slice_params:		decode parameters for hw used
   114	 */
   115	struct vdec_h264_slice_vsi {
   116		/* LAT dec addr */
   117		struct vdec_h264_slice_mem bs;
   118		struct vdec_h264_slice_fb fb;
   119	
   120		struct vdec_h264_slice_mem ube;
   121		struct vdec_h264_slice_mem trans;
   122		struct vdec_h264_slice_mem row_info;
   123		struct vdec_h264_slice_mem err_map;
   124		struct vdec_h264_slice_mem slice_bc;
   125	
   126		struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
   127		struct vdec_h264_slice_info dec;
   128		struct vdec_h264_slice_lat_dec_param h264_slice_params;
 > 129	};
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
