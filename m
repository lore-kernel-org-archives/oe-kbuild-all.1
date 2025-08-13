Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EFD2EB5B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085059; cv=none; b=hSn5QvhadeQtRhUAKsu7gaUegkrQarCDIQJLuId+f04Js12/jaV8lQmro/6xVwowl/b1TZXdVr511i2RPbMtH1946J8ocKjJn4rlbRFbFP3OSga8e1SR662eE/gKuKV52xZgnjpWfXE3m+oQCbPqq/mVIWVm5ieEQhgT7vndEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085059; c=relaxed/simple;
	bh=S6x6lsgO9kQRIeeOBI2GNDXwx2Wms3BCv3w14r1EfkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNN6FQNsH0At/djcSiniL+CVKvIZOxzPeypDl9JJeUvPzLbHXGwm+Qml9XUI5wUB1qd9wkX47kLT1bBJSEl6Hke5XEO8S9C5h96hJxNazYFthoKXzUBiRtp2j4lPxSbojn8D/c0KPuK8MxHoA1NM9Wzmdyko9gM5eH6f2Bv9eFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8a6Iwqc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8a6Iwqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755085057; x=1786621057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6x6lsgO9kQRIeeOBI2GNDXwx2Wms3BCv3w14r1EfkQ=;
  b=P8a6IwqcwpQVt4K24ZQ8hj3GTu8SBxnLleoY3UGMvT6N3llH5fCoxNOZ
   MkdTjPr457AIuxfGWegSxSNzDP7V45GJPyhgQZKbGwhfqo3VZlmsSbVs3
   gxLp6WV8Itq1St4nY9PpE125mwmgCSh4f+uu2I9pHEtbrczONL5IbWaJx
   xzZke5umIPGTHUDhU00Pgwqqji+/A+qxK8yyCBqTDXPxDyRetC99tMwc9
   sOGYdiHUcuq0eFAUhXTYjZDziTaJ5O5DKpxT5RHMKgKKoKqw0GG1UUiQ7
   AWTG+3bfhNqG+tMhN1XI8YiPCsP3K8wLfOXwkjDQsPkxr0WpQCJrRofsw
   g==;
X-CSE-ConnectionGUID: aBUPtiVbSauK0duq05oNVA==
X-CSE-MsgGUID: Hb0awLfgS76TyQh25g8Uzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57440581"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57440581"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 04:37:35 -0700
X-CSE-ConnectionGUID: tr3kufecShmcPkkN6rnKYw==
X-CSE-MsgGUID: djuPOJuuQ3SLA4ot8BMJOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165632829"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 04:37:34 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um9mu-0009po-1h;
	Wed, 13 Aug 2025 11:37:12 +0000
Date: Wed, 13 Aug 2025 19:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 354/354]
 drivers/gpu/drm/mediatek/mtk_dvo.c:808:14: warning: no previous prototype
 for 'mtk_dvo_encoder_index'
Message-ID: <202508131900.E41zdAa0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   db867ccf596a910b85bab8c6052afe59fa921727
commit: 67be6bf2abc721aedffdc60f176b59c6374f712d [354/354] CHROMIUM: drm/mediatek: mt8189: mmsys driver probe
config: arm-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131900.E41zdAa0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131900.E41zdAa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131900.E41zdAa0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_dvo.c:275:6: warning: no previous prototype for 'mtk_dvo_mutex_vsync_set' [-Wmissing-prototypes]
    void mtk_dvo_mutex_vsync_set(struct mtk_dvo *dvo)
         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dvo.c: In function 'mtk_dvo_sodi_setting':
   drivers/gpu/drm/mediatek/mtk_dvo.c:302:6: warning: variable 'data_rate' set but not used [-Wunused-but-set-variable]
     u64 data_rate = 0;
         ^~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dvo.c: At top level:
   drivers/gpu/drm/mediatek/mtk_dvo.c:781:6: warning: no previous prototype for 'mtk_dvo_start' [-Wmissing-prototypes]
    void mtk_dvo_start(struct device *dev)
         ^~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dvo.c:788:6: warning: no previous prototype for 'mtk_dvo_stop' [-Wmissing-prototypes]
    void mtk_dvo_stop(struct device *dev)
         ^~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_dvo.c:795:6: warning: no previous prototype for 'mtk_dvo_get_hrt_bw_by_datarate' [-Wmissing-prototypes]
    void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_dvo.c:808:14: warning: no previous prototype for 'mtk_dvo_encoder_index' [-Wmissing-prototypes]
    unsigned int mtk_dvo_encoder_index(struct device *dev)
                 ^~~~~~~~~~~~~~~~~~~~~


vim +/mtk_dvo_encoder_index +808 drivers/gpu/drm/mediatek/mtk_dvo.c

   780	
 > 781	void mtk_dvo_start(struct device *dev)
   782	{
   783		struct mtk_dvo *dvo = dev_get_drvdata(dev);
   784	
   785		mtk_dvo_power_on(dvo);
   786	}
   787	
   788	void mtk_dvo_stop(struct device *dev)
   789	{
   790		struct mtk_dvo *dvo = dev_get_drvdata(dev);
   791	
   792		mtk_dvo_power_off(dvo);
   793	}
   794	
   795	void mtk_dvo_get_hrt_bw_by_datarate(struct device *dev, unsigned int *bw_base)
   796	{
   797		struct mtk_dvo *dvo = dev_get_drvdata(dev);
   798		int htotal, vtotal, vrefresh;
   799	
   800		htotal = dvo->mode.htotal;
   801		vtotal = dvo->mode.vtotal;
   802		vrefresh = drm_mode_vrefresh(&dvo->mode);
   803	
   804		*bw_base = (unsigned int)div_u64((unsigned long long)vtotal * htotal * vrefresh * 4,
   805						 1000000);
   806	}
   807	
 > 808	unsigned int mtk_dvo_encoder_index(struct device *dev)
   809	{
   810		struct mtk_dvo *dvo = dev_get_drvdata(dev);
   811		unsigned int encoder_index = drm_encoder_index(&dvo->encoder);
   812	
   813		dev_dbg(dev, "encoder index:%d\n", encoder_index);
   814		return encoder_index;
   815	}
   816	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
