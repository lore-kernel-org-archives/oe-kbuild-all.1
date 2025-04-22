Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05038280CFF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 13:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327012; cv=none; b=Tt3vIopZlzCnY8szoo8GKCkrluyox+n876Z8idzKxpO6p35kEXbe8yFyGg1SCqxrC6DpT/zXgKRRgs1H1fkCuvFsId21ZmjrhZ0dknaayEo15AtoSR4LXixLEmIsFYZQdOdhs4iufxxjVP3U6hsoENzm+1gUSpx2uIegyXuUb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327012; c=relaxed/simple;
	bh=pCHHkQPUk9E4XsIO2gbrhaYeypB3/lza13aMvj30JUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUYCR3c/Y1dCSYuJ540LI6YnHKyKaj5hMsuJEiOlJ/jhuKrRXQA32NDBR+2aXp4PqB7UQYZLX9OTU0VWG6Q6ubmsRdFClysCvHyShB7qn6k9cp//2HTjPXT7JHYyKEIl1Rg8zV2sDqynwvpeO07y+jXjTITikGvnczGbAkbxQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A34eSUkq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A34eSUkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745327011; x=1776863011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pCHHkQPUk9E4XsIO2gbrhaYeypB3/lza13aMvj30JUk=;
  b=A34eSUkqO72YjwxG8v0NzNRyEKzifvffgMOfUDG3d677w+EH1LFwO8Qx
   8dwArd6xD8MPio/fmsMfjsGhOqD1xnPIbIZGBskOsIJosYqqmgqYUZ76F
   QC0qzTsmN2TasniJirYo5wvgSjpEokUw+dB+O2YhTrA4eF+w/9FsVLO/c
   s1BN7EVDdafa1mIiiha77lmpPJN02sxqeQKuA8QpHomWA6GI+A3vafohC
   sNkkVZHF3H2yaVvg9gqVJEzq/pFMBRzPx867iB3jJ1FeQ1Z3Vhwov5fkQ
   BvqWvdC5KDgqcGXIghTTTa1JiNrCrTQsVu6ozbhVuLJUSxpaEj0PmH3e/
   w==;
X-CSE-ConnectionGUID: HkOrd1CATt+Fo4yY1mxaCA==
X-CSE-MsgGUID: IBhhRUtbRMaNhJhdHlZ9jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="49546727"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="49546727"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 06:03:30 -0700
X-CSE-ConnectionGUID: BJL2wIedSuGg/PsSPeuBKg==
X-CSE-MsgGUID: /zXE20kTT7K6TrSUL6MA1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136795099"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 06:03:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7DHb-00011j-1m;
	Tue, 22 Apr 2025 13:03:27 +0000
Date: Tue, 22 Apr 2025 21:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 21/21]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:51: warning:
 passing argument 2 of 'dev_err_probe' makes integer from pointer without a
 cast
Message-ID: <202504222014.o9gIJIW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   f140971cf554cfa7c517cfb96260a3a674e9166f
commit: 767753385164d9ffc25c22e2825199a8b3471fea [21/21] CHROMIUM: jpeg: refactor jpeg smmu sid setting interface
config: i386-buildonly-randconfig-003-20250422 (https://download.01.org/0day-ci/archive/20250422/202504222014.o9gIJIW2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222014.o9gIJIW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222014.o9gIJIW2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpegenc_smmu_init':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:51: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     376 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ~~~^~~~~~~~~~~~~
         |                                                   |
         |                                                   struct regmap *
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:15:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'struct regmap *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~
--
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c: In function 'mtk_jpegdec_smmu_init':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:637:51: warning: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
     637 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ~~~^~~~~~~~~~~~~
         |                                                   |
         |                                                   struct regmap *
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:15:
   include/linux/dev_printk.h:278:64: note: expected 'int' but argument is of type 'struct regmap *'
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                            ~~~~^~~


vim +/dev_err_probe +376 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c

   364	
   365	static int mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
   366	{
   367		struct mtk_jpeg_dev *master_dev = dev->master_dev;
   368	
   369		if (!master_dev->variant->support_smmu)
   370			return 0;
   371	
   372		dev->smmu_regmap =
   373	                syscon_regmap_lookup_by_phandle(dev->plat_dev->dev.of_node,
   374							"mediatek,smmu-config");
   375	        if (IS_ERR(dev->smmu_regmap)) {
 > 376			return dev_err_probe(dev->dev, dev->smmu_regmap,
   377					     "mmap smmu_base failed(%ld)\n",
   378					     PTR_ERR(dev->smmu_regmap));
   379		}
   380	
   381		return 0;
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
