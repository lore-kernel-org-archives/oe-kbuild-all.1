Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8132DCBF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375670; cv=none; b=oxxerVfnma/waBT5VGMUuJQTUz2ccYhTfS0WSGlCebccRqsTuIu4b8Euq8JzfhVtDuozoPlkAn6v2nnYPA6wiARkZLhddkdWaw/YlEJVjyXmo3uKywincmu8TbjKOhUMdgvzvv0iooK1CmFduN9ZAeKr2XRqKRC8jW/cLC1m9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375670; c=relaxed/simple;
	bh=rsp9Z522XUsrr5khaJ500IDF9dujEtYcvBBQoKpNHKs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNJpLWPPg1YKnczUubLahwoFuJKl0bZt2PtM/DhevATOx+09OtPhokJsZVs2nCWwjbiu3UmV0WFfZ+mlPdoLbLctxDFWg4VcNzizjwirqcA3OOLFDln5CqfCkUEYZudNfcvxf318Tqmqe0coTeJlZNGJU14/6HodmBu6Yw/8+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDTIb0V7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDTIb0V7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748375669; x=1779911669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rsp9Z522XUsrr5khaJ500IDF9dujEtYcvBBQoKpNHKs=;
  b=MDTIb0V7zSd9EQSNKet5rTjG/g25BkDnVP20VVe9F3wyreYOBtTs6Pbj
   wL04QJxDayuiBmpSpkJY2wR5BvHI4dulaq+WIZdebohky+FLLVrLVOhZW
   pZ4VTlOsIxnsDlngknqy44ew3wXgQka36gUf1rhir7ndhnQTrOqWEcNCO
   blu1QBemJxsbbZDjHOKYmjPPzw4S0zc3n9zBHqZL6hTArcwgU75939Z/R
   vMeyZAjPUaYm3EUXsmBiL5MQWn5qVSgSVvFcOyQuTM+apZLU+5Z1a4Rce
   9tC4xZUMcc4Vm54glPXzTwZNStOSv7C2j1HY1w5SjpV2NgqOE/TS5gnKE
   Q==;
X-CSE-ConnectionGUID: 3vAJzFG1QluaXTD1C06idA==
X-CSE-MsgGUID: dgzeeFnzTBGs0+g+ZCIkBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60635885"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="60635885"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:54:27 -0700
X-CSE-ConnectionGUID: NaEoUiXUTZyD+no/0QgEOg==
X-CSE-MsgGUID: Lcht/XskROmU2n1Iu+tV+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="173846581"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 May 2025 12:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0NT-000UyC-0h;
	Tue, 27 May 2025 19:54:23 +0000
Date: Wed, 28 May 2025 03:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 133/133]
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:532:46: error:
 incompatible integer to pointer conversion passing 'unsigned long' to
 parameter of type 'unsigned long *'; take the address with &
Message-ID: <202505280300.qTrFtcL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   a8b155e1dd30a4460ca0bf9db35d30ab891d3e91
commit: efa431d1fe81da34b6433ca7fc1151dfa5b6bfcd [133/133] CHROMIUM: jpeg: add dvfs and mmqos interface for jpeg
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250528/202505280300.qTrFtcL9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280300.qTrFtcL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280300.qTrFtcL9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> clang: warning: no such include directory: 'drivers/media/platform/mtk-jpeg' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: '/drivers/iommu/arm/arm-smmu-v3' [-Wmissing-include-dirs]
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:22:
   In file included from include/media/v4l2-mem2mem.h:16:
   In file included from include/media/videobuf2-v4l2.h:16:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:713:31: warning: variable 'plane_fmt' set but not used [-Wunused-but-set-variable]
     713 |         struct v4l2_plane_pix_format plane_fmt = {};
         |                                      ^
   5 warnings generated.
--
>> clang: warning: no such include directory: 'drivers/media/platform/mtk-jpeg' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: '/drivers/iommu/arm/arm-smmu-v3' [-Wmissing-include-dirs]
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c:12:
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.h:11:
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h:12:
   In file included from include/media/videobuf2-core.h:18:
   In file included from include/linux/dma-buf.h:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
--
>> clang: warning: no such include directory: 'drivers/media/platform/mtk-jpeg' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: '/drivers/iommu/arm/arm-smmu-v3' [-Wmissing-include-dirs]
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1628:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:493:34: error: incompatible pointer to integer conversion passing 'struct regmap *' to parameter of type 'int' [-Wint-conversion]
     493 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   4 warnings and 1 error generated.
--
>> clang: warning: no such include directory: 'drivers/media/platform/mtk-jpeg' [-Wmissing-include-dirs]
>> clang: warning: no such include directory: '/drivers/iommu/arm/arm-smmu-v3' [-Wmissing-include-dirs]
   In file included from drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:18:
   In file included from include/media/media-device.h:16:
   In file included from include/linux/pci.h:1628:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2194:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:532:46: error: incompatible integer to pointer conversion passing 'unsigned long' to parameter of type 'unsigned long *'; take the address with & [-Wint-conversion]
     532 |                 opp = dev_pm_opp_find_freq_ceil(jpeg->dev, jpeg->freqs[0]);
         |                                                            ^~~~~~~~~~~~~~
         |                                                            &
   include/linux/pm_opp.h:139:26: note: passing argument to parameter 'freq' here
     139 |                                              unsigned long *freq);
         |                                                             ^
>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:524:6: warning: no previous prototype for function 'jpeg_drv_hybrid_dec_end_dvfs' [-Wmissing-prototypes]
     524 | void jpeg_drv_hybrid_dec_end_dvfs(struct mtk_jpegdec_comp_dev *jpeg)
         |      ^
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:524:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     524 | void jpeg_drv_hybrid_dec_end_dvfs(struct mtk_jpegdec_comp_dev *jpeg)
         | ^
         | static 
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:750:34: error: incompatible pointer to integer conversion passing 'struct regmap *' to parameter of type 'int' [-Wint-conversion]
     750 |                 return dev_err_probe(dev->dev, dev->smmu_regmap,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:278:64: note: passing argument to parameter 'err' here
     278 | __printf(3, 4) int dev_err_probe(const struct device *dev, int err, const char *fmt, ...);
         |                                                                ^
   5 warnings and 2 errors generated.


vim +532 drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c

   523	
 > 524	void jpeg_drv_hybrid_dec_end_dvfs(struct mtk_jpegdec_comp_dev *jpeg)
   525	{
   526		bool mmdfvs_enable_flag;
   527		struct dev_pm_opp *opp;
   528		int volt;
   529		int ret;
   530	
   531		if (jpeg->jpeg_reg) {
 > 532			opp = dev_pm_opp_find_freq_ceil(jpeg->dev, jpeg->freqs[0]);
   533			if (IS_ERR(opp)) {
   534				dev_err(jpeg->dev, "Failed to get dev_pm_opp");
   535				return;
   536			}
   537	
   538			volt = dev_pm_opp_get_voltage(opp);
   539			dev_pm_opp_put(opp);
   540	
   541			ret = regulator_set_voltage(jpeg->jpeg_reg, volt, INT_MAX);
   542			if (ret)
   543				dev_err(jpeg->dev, "Failed to set voltage %d", volt);
   544		} else if (jpeg->jpeg_mmdvfs_clk) {
   545			mmdfvs_enable_flag = mmdvfs_is_mux_version();
   546			if (mmdfvs_enable_flag)
   547				mtk_mmdvfs_enable_vcp(true, VCP_PWR_USR_JPEGDEC);
   548	
   549			ret = clk_set_rate(jpeg->jpeg_mmdvfs_clk, 0);
   550			if (ret)
   551				dev_err(jpeg->dev, "Failed to set freq 0");
   552	
   553			if (mmdfvs_enable_flag)
   554				mtk_mmdvfs_enable_vcp(false, VCP_PWR_USR_JPEGDEC);
   555		}
   556	}
   557	#endif
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
