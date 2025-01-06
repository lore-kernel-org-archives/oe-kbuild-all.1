Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DC61DFD8C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 20:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736196405; cv=none; b=JRL6NvShw0U1J3g3etWjfERo972LNMoTsVj9oULngCWpX83xFYgQYHl5oz1WioVIPm8yHHz/7jWq7b9kqFOAwSk53mGoH35RBa0rUZ7AUvPrvrNIJ6BDDQPfTl040WNWhmNpVc/tKxxRLCP+6UkxFSSeMd+TQnXldWzWA/4Vhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736196405; c=relaxed/simple;
	bh=l+Z8/bcGj7c1R8sqLU62MvQLb/ygQABt2MI+Vi3t89c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j215xMpp7PEEkq4XzAaUAxYF2jTZrzg2xp7ZW/qrzwJoSuhJJyJmokpuGUd74o/1nEZgBkA9VZBJK2Maj2JXXbdcyLC8NJwCoV23C/cFXkuAXm2r2RU/22rFXB9StTCtJ7Jxz9YHw1KcaWRoXsvfvYAWJ5EdPxizNPiFL7gFQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0Wnf/O7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0Wnf/O7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736196402; x=1767732402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+Z8/bcGj7c1R8sqLU62MvQLb/ygQABt2MI+Vi3t89c=;
  b=K0Wnf/O7x+8jlJvNW7KS/+X2m4w86GtEravnnSmYaYc1h/hXGhgSDJJN
   KHNQIK6XBUARuicpZ+ZtI9TUuMxeKiKfTveOCGz696hanSunuc/kAHXtR
   4yQdzbfRQk5Xbic2oIkESFtUkxsBUe6ooK+Oxnihs3n5aNwM927ze9XOK
   Pi9ZTeSpbRwXO0kvFEO5Q4xF/ApW65COeCBW+CLVvjD4MdTBuTcADaFKv
   iylSF8UxQBzWZ3xs5GzhTu3F8JLC0mjtT8u2GqrauSnulj7FjgrxKbMr0
   hMV490DPl8Z4jBvFzY8b2l8okClO3s/bAU0CejhDgsMywL0irA54yD4mZ
   g==;
X-CSE-ConnectionGUID: Mw4ZVmMnQZOR/PxzN2bUbA==
X-CSE-MsgGUID: 4NSb2tWgS6Gt/k3sCjq/oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="53775966"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; 
   d="scan'208";a="53775966"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 12:46:42 -0800
X-CSE-ConnectionGUID: el46eYwBT/SGPm2KQa8r5Q==
X-CSE-MsgGUID: RyKHVX8gT6+k3QlBLv0QCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107170205"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Jan 2025 12:46:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUtzi-000DuZ-1f;
	Mon, 06 Jan 2025 20:46:38 +0000
Date: Tue, 7 Jan 2025 04:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 177/177]
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:69:
 warning: Function parameter or member 'wdma_end_addr_offset' not described
 in 'vdec_h264_slice_info_ex'
Message-ID: <202501070415.cF5bDqTy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yunfei,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   37484545df505e5a625635cadf4bbdf4f3eef3e1
commit: 9b611361920c1cd4c33c08f3242325549549fe8e [177/177] FROMLIST: media: mediatek: vcodec: rename vsi to extend vsi
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250107/202501070415.cF5bDqTy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501070415.cF5bDqTy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501070415.cF5bDqTy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'wdma_end_addr_offset' not described in 'vdec_h264_slice_info_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:69: warning: Function parameter or member 'reserved' not described in 'vdec_h264_slice_info_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'bs' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'fb' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'ube' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'trans' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'row_info' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'err_map' not described in 'vdec_h264_slice_vsi_ex'
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:129: warning: Function parameter or member 'slice_bc' not described in 'vdec_h264_slice_vsi_ex'


vim +69 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c

59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   49  
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   50  /**
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   51   * struct vdec_h264_slice_info_ex - extend decode information
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   52   *
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   53   * @nal_info:		nal info of current picture
ab83e4255f4ff2 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Sebastian Fricke 2024-03-02   54   * @timeout:		Decode timeout: 1 timeout, 0 no timeout
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   55   * @bs_buf_size:	bitstream size
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   56   * @bs_buf_addr:	bitstream buffer dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   57   * @y_fb_dma:		Y frame buffer dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   58   * @c_fb_dma:		C frame buffer dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   59   * @vdec_fb_va:	VDEC frame buffer struct virtual address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   60   * @crc:		Used to check whether hardware's status is right
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   61   */
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   62  struct vdec_h264_slice_info_ex {
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   63  	u64 wdma_end_addr_offset;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   64  	u16 nal_info;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   65  	u16 timeout;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   66  	u64 vdec_fb_va;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   67  	u32 crc[8];
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   68  	u32 reserved;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  @69  };
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   70  
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   71  /*
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   72   * struct vdec_h264_slice_mem - memory address and size
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   73   */
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   74  struct vdec_h264_slice_mem {
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   75  	union {
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   76  		u64 buf;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   77  		u64 dma_addr;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   78  	};
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   79  	union {
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   80  		size_t size;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   81  		u64 dma_addr_end;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   82  	};
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   83  };
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   84  
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   85  /**
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   86   * struct vdec_h264_slice_fb - frame buffer for decoding
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   87   * @y:  current y buffer address info
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   88   * @c:  current c buffer address info
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   89   */
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   90  struct vdec_h264_slice_fb {
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   91  	struct vdec_h264_slice_mem y;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   92  	struct vdec_h264_slice_mem c;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   93  };
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   94  
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   95  /**
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20   96   * struct vdec_h264_slice_vsi_ex - extend shared memory for decode information exchange
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   97   *        between SCP and Host.
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   98   *
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12   99   * @wdma_err_addr:		wdma error dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  100   * @wdma_start_addr:		wdma start dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  101   * @wdma_end_addr:		wdma end dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  102   * @slice_bc_start_addr:	slice bc start dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  103   * @slice_bc_end_addr:		slice bc end dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  104   * @row_info_start_addr:	row info start dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  105   * @row_info_end_addr:		row info end dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  106   * @trans_start:		trans start dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  107   * @trans_end:			trans end dma address
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  108   * @wdma_end_addr_offset:	wdma end address offset
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  109   *
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  110   * @mv_buf_dma:		HW working motion vector buffer
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  111   *				dma address (AP-W, VPU-R)
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  112   * @dec:			decode information (AP-R, VPU-W)
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  113   * @h264_slice_params:		decode parameters for hw used
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  114   */
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  115  struct vdec_h264_slice_vsi_ex {
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  116  	/* LAT dec addr */
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  117  	struct vdec_h264_slice_mem bs;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  118  	struct vdec_h264_slice_fb fb;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  119  
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  120  	struct vdec_h264_slice_mem ube;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  121  	struct vdec_h264_slice_mem trans;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  122  	struct vdec_h264_slice_mem row_info;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  123  	struct vdec_h264_slice_mem err_map;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  124  	struct vdec_h264_slice_mem slice_bc;
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  125  
83ee8446dfaf3b drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  126  	struct vdec_h264_slice_mem mv_buf_dma[H264_MAX_MV_NUM];
9b611361920c1c drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c Yunfei Dong      2024-07-20  127  	struct vdec_h264_slice_info_ex dec;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  128  	struct vdec_h264_slice_lat_dec_param h264_slice_params;
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12 @129  };
59fba9eed5a736 drivers/media/platform/mediatek/vcodec/vdec/vdec_h264_req_multi_if.c         Yunfei Dong      2022-05-12  130  

:::::: The code at line 69 was first introduced by commit
:::::: 83ee8446dfaf3b28910370e9b0d846a87a2254c9 FROMLIST: media: mediatek: vcodec: re-construct h264 driver to support svp mode

:::::: TO: Yunfei Dong <yunfei.dong@mediatek.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
