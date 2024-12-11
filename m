Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640632451CC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Dec 2024 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733889579; cv=none; b=WeaSmJ4Rw3TnFTKrjt/8i35qsElEyW1vREMgdVrXvm1CeBlM3qgVhzfrAupwmOJkE39CVMEvivIDEGVLkr9RK5A0pJl955EZdn6GmVT/lXc9XkqBdUX8uS1pHDHfdAztTEsyEM5DZiaR1IXjZ1EvWK3ObA2qqaBzbTOj/kmr2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733889579; c=relaxed/simple;
	bh=Y+zW0o+Ru8ChUsUUUJTa5/ZiLxmu+VjE+sprUFoEdcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MVlHSNn30tZooAdpDG6GbQRooA9mugNaAJJrFU5/GCL8zeCZI6+OT/yW7juzXpWkPRT9rhj6L1kyKeIm7Eo+I4K1of7p2ql6S17JHJxiv2UtgjRLoTpcmr/vnI3g+CZo/xTKhNkiTRNBiDXxgcV9BKTeIxc2h+KQtxSR8erkMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4C1q1l6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4C1q1l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733889578; x=1765425578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+zW0o+Ru8ChUsUUUJTa5/ZiLxmu+VjE+sprUFoEdcQ=;
  b=C4C1q1l6CypZCYOgQCW3wWbCvVeTLpxif3KXFl8aOLWqPBUhmN2SfYUT
   tSeOkrTHyl/zRMT2E6vp+1GhtEsCEOUjEPyphE/7raPCIEJLhTrt/LpAx
   ZC8WSanHaa707sgukfGehePfJ4GghiaNaVTwdUWUvLEtmbXCXqEwTWqiq
   ci5byMg7Hap9PvX0qyOyp2xYzWqhLvd80NxuRKFLBRdDRfG0VVg+2ygGb
   i3LTpT88cTS8ShZY4NOgP5Evq0aMV+Sc/47GKCqjYgrdkScQO0JcYXXWh
   +v+jd/7ssdmXvUOS38Z8m+9r0HNtpst+Ia8sj3412C1GhgP60ru9hz9yN
   w==;
X-CSE-ConnectionGUID: +YOVeUD8RjCYh9uhqbsxcA==
X-CSE-MsgGUID: BFeb7s/WQD6sfsxbA/UE4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34306783"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34306783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 19:59:36 -0800
X-CSE-ConnectionGUID: bGBtUQEsSMS3qnUgLU5WNA==
X-CSE-MsgGUID: 8yU5nHhYRnGWewiIvMerwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100695542"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2024 19:59:35 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLDsq-0006G1-1H;
	Wed, 11 Dec 2024 03:59:32 +0000
Date: Wed, 11 Dec 2024 11:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 15/18] cc1: error:
 drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me: No such file or
 directory
Message-ID: <202412111132.AIEV46WK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   1ddd56bb5d16f426e97762cdfc99f78c0a731c04
commit: 1909df14454d4cd1dd232d5a88305c4e5ea70c74 [15/18] CHROMIUM: media: mediatek: imgsys: ME driver moved to imgsys
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20241211/202412111132.AIEV46WK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111132.AIEV46WK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111132.AIEV46WK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me: No such file or directory [-Werror=missing-include-dirs]
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-debug.c:556:6: error: no previous prototype for 'imgsys_cg_debug_dump' [-Werror=missing-prototypes]
     556 | void imgsys_cg_debug_dump(struct mtk_imgsys_dev *imgsys_dev)
         |      ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> cc1: error: drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me: No such file or directory [-Werror=missing-include-dirs]
   cc1: all warnings being treated as errors
--
>> cc1: error: drivers/media/platform/mediatek/isp/isp_7x/mtk-ipesys-me: No such file or directory [-Werror=missing-include-dirs]
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'imgsys_scp_handler':
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:321:15: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
     321 |         req = (struct mtk_imgsys_request *)swfrm_info->req_vaddr;
         |               ^
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'mtk_imgsys_hw_connect':
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:469:25: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     469 |         info.drv_data = (u64)&imgsys_dev;
         |                         ^
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c: In function 'imgsys_composer_workfunc':
   drivers/media/platform/mediatek/isp/isp_7x/imgsys/mtk_imgsys-sys.c:704:33: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
     704 |         ipi_param.req_addr_va = (u64)req;
         |                                 ^
   cc1: all warnings being treated as errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
