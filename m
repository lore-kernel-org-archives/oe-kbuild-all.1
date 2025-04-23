Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE07223DFB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745383247; cv=none; b=or5ul0rCZQIbxN21R5tUNZCZZzY4xS2kuubDAECh255WT/45XeHWeHzte/N1vdcqypTX11h0O4Va3xLWCQTDY8vITnXJY8WomTp6/J2ABApWLb0wTn5jnpkkIvfHVfGBXPnbuZxUl2auE8qbxr4w7Vnz29ggTGuC53gVZYV3tDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745383247; c=relaxed/simple;
	bh=Aii/8rvwOwfp3FVYFVNXO3t0v+lYSTUZ2CGl2IExrOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oyZaG6bPcayoOmKszZWRf9whDsJ+aeaMYlM7u7/0xEgy5I697RnGsp8lRuV9JV2XI/ybb/w4DWAmxPSIkRSMDTNwauOFUFAcRrHeS0QgJS0jIMpkI898/UI/jd2RAbkgarqjFgms2cD2aC3j3mEu4nfo+kcrpv5Y5gX+BKnuwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6gBOJWt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6gBOJWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745383246; x=1776919246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aii/8rvwOwfp3FVYFVNXO3t0v+lYSTUZ2CGl2IExrOw=;
  b=U6gBOJWtbpYubBqyjXlZz9uZVRSmpaKFUH981VN2G82sXP/PTd3YGwR9
   NfFmaC7PSmR1EpV/mMGX/wx3n6g/6oAx2bDOZ84NmH4hisT9NcG6XaNDd
   OJ7bKS+gyxmG0KbWJZ3eSLramV+6/OtwUAZiMyA/5vjs1yjcyMxPsCpRu
   a2Vh71mmnzLR73C9M/2fml56XpAYtUYggqw1wQUiUPdGrHNsxmTkJe1qy
   HPaSan0SkRo+zZA+YbegHIsEIPDk8LpxruPYWXrFr1RvLjPD8PrToDQ9v
   Un4xwcSpOiaBLZcge7Ipm0n7Upexj49ueZR5vLzDtdCW+zrljSeTgV1x+
   A==;
X-CSE-ConnectionGUID: dBRR+QtZT+adVFPdOx5mcQ==
X-CSE-MsgGUID: WN6Xau7KRZm0qJoumCAyHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57151125"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57151125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 21:40:45 -0700
X-CSE-ConnectionGUID: tIbjsQRvRrSEItiJolNR+Q==
X-CSE-MsgGUID: qAFNYPXLQ1iyAsUDpuov/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="169413975"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 21:40:43 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Rua-0001bz-32;
	Wed, 23 Apr 2025 04:40:40 +0000
Date: Wed, 23 Apr 2025 12:40:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 21/21]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:51: error:
 passing argument 2 of 'dev_err_probe' makes integer from pointer without a
 cast
Message-ID: <202504231242.Mcuq7i4V-lkp@intel.com>
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
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250423/202504231242.Mcuq7i4V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231242.Mcuq7i4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231242.Mcuq7i4V-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c: In function 'mtk_jpegenc_smmu_init':
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:376:51: error: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
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
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:637:51: error: passing argument 2 of 'dev_err_probe' makes integer from pointer without a cast [-Wint-conversion]
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
