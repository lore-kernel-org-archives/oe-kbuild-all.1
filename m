Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB602566
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 May 2025 23:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748304001; cv=none; b=flqsBY1J4luAiMuihMLtnMD/4M1rJLJdZIi6Pagac9qow/E6AqrV5e40qqAZhtyjuLXJ7U19ZP/ktcuhXN4/RfAvH+OmR1h+VSqkd6KP+lDiKwLs6uzehbucwhDlUlg7ZrvNY+KaxfqlVXjn5hpImcL9lqOywB/1Dh/HmY2p4xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748304001; c=relaxed/simple;
	bh=sM4w/TGVhHmJOnXpwRzSdeLZ5er7w9sfg0bFGWsTUwM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCs5i419cYFjARo0wclhzXD0Cgk86imaI+sTT/haN6oLW24Ur5VeXUjxL3B0CjUjNxoYQEJ+jebemXkEayZObvq+rGZFjqUoeg5OkuNogeYOKPbv/pAD2zuuxi/c9XfQd1Ncf1zJdZFYDIFCvchzMz9H9lygoBuH4nBw4SwxEHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WyqUuYG/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WyqUuYG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748303999; x=1779839999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sM4w/TGVhHmJOnXpwRzSdeLZ5er7w9sfg0bFGWsTUwM=;
  b=WyqUuYG/VNyErm/hm/xLKksTE1SdwEFqrsk7J4/ElIbVckCKdRJXRQ/u
   yl9ERQnodvIhlZ3KbAIFVNwsjlQ4oV3B4SoJegghhyiqp+Y8cAQ1P0hlo
   hwRQDvvpI3/xuHQl74ZtFEHFRdJspNg5MovBwB+/ZFrPeEAKxQuTCs1wg
   gIwLOjC4G/qtyMoJ5KtMB69dQNafS9W94+cW6LYuYmqSvg7A+VxLnOqT4
   3fXX9UajXRlKuUNqiQ9mlWy0W9DNiKcE0kVzjxUa7NeFgfzfbMIILQIFm
   rGOvT8KJRQkUQTAj7lctj5MGeUxrrnIa45i+UhzpCatAelpd24COPitiG
   w==;
X-CSE-ConnectionGUID: PaTjfMDXSwirMtRjOn7akQ==
X-CSE-MsgGUID: EuNzbwxERwmnqke7GZlmpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="52901516"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="52901516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 16:59:58 -0700
X-CSE-ConnectionGUID: F60bQt2uTayVPKYqGcC8IA==
X-CSE-MsgGUID: FMakmNmTTDGJCm8SqTgUUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="165741979"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 May 2025 16:59:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJhjX-000Sku-0e;
	Mon, 26 May 2025 23:59:55 +0000
Date: Tue, 27 May 2025 07:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133] cc1: warning:
 drivers/media/platform/mtk-jpeg: No such file or directory
Message-ID: <202505270722.jRrPb2XJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   00e2b7e08c550ff321daba7b9956795d281bdd98
commit: efa431d1fe81da34b6433ca7fc1151dfa5b6bfcd [133/133] CHROMIUM: jpeg: add dvfs and mmqos interface for jpeg
config: arm64-randconfig-001-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270722.jRrPb2XJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270722.jRrPb2XJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270722.jRrPb2XJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> cc1: warning: drivers/media/platform/mtk-jpeg: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/iommu/arm/arm-smmu-v3: No such file or directory [-Wmissing-include-dirs]
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpegenc_smmu_init':
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:493:37: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
      return dev_err_probe(dev->dev, dev->smmu_regmap,
                                     ~~~^~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:15:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'struct regmap *'
    __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
                                                               ~~~~^~~
--
>> cc1: warning: drivers/media/platform/mtk-jpeg: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/iommu/arm/arm-smmu-v3: No such file or directory [-Wmissing-include-dirs]
--
>> cc1: warning: drivers/media/platform/mtk-jpeg: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/iommu/arm/arm-smmu-v3: No such file or directory [-Wmissing-include-dirs]
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c: In function 'mtk_jpeg_buf_prepare':
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:713:31: warning: variable 'plane_fmt' set but not used [-Wunused-but-set-variable]
     struct v4l2_plane_pix_format plane_fmt = {};
                                  ^~~~~~~~~
--
>> cc1: warning: drivers/media/platform/mtk-jpeg: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: /drivers/iommu/arm/arm-smmu-v3: No such file or directory [-Wmissing-include-dirs]
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpegdec_smmu_init':
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:750:37: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
      return dev_err_probe(dev->dev, dev->smmu_regmap,
                                     ~~~^~~~~~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:15:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'struct regmap *'
    __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
                                                               ~~~~^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
