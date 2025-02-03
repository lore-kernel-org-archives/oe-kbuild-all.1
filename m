Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607920E6E4
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614922; cv=none; b=kY8HI8Kd7Xfvs3X9KSUi2bPQtxcNRniWJh0/oetESBIgs8sy2qPifgkiqo+iGiS/LFwVd+2T/asPm0iXuMZBmYEfMxMlkH7gZXxYLyyLBI9PqVJy9GCEj5S7eksJsbV4BTXT134lMX4KFP11sAuu33iX6v4KgxJz4iEFqtzziAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614922; c=relaxed/simple;
	bh=Bxwq6YrqkT4d4UDYO9qQUwdk7NCbnbh+2Ya7L6TiLGI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R5YDOt5I5QkMrODmVdObbshgMsomssiiuS+GslVMKTSUEVLYT86vxP/mY3UzkGADc5EmG8SWiTxfYdMN7h85h8Q/vaVMRCpIAuMrYWkABy/1DNzu+XeHq15ejRxmK1rNQtIdUAjoRrtUlxh+vDgKJLqyxktfumYLtgtsxk9hGFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMHENvFD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMHENvFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738614921; x=1770150921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bxwq6YrqkT4d4UDYO9qQUwdk7NCbnbh+2Ya7L6TiLGI=;
  b=dMHENvFD2JWjJyn7Trek5cJ8wnON8PiOwhpu5vdJrLtW8bjFV+zoUJv5
   1rn6PBzaGzqINiOubJgR9w3PtBeP/yxOblh4p8h2jK9eOtaOTuxkzXxcR
   hnULzh+LSIsh9i8UiTQtDTwNnt/OIqHtLDv99X49rohx6UfKIE+G/2Cb0
   8w/Nd4B4hXlLhqSBzyHgnyjbJe5uwJTtvs3jukIlL8t8pJ1WNZsEziK0V
   j0m8rtJ+epyjFcIOnNgO9mzMcn1NtKpo2/RWTVDrUHEzDI2cF6tg+jtWp
   dpEGzVchhHp1si+tDADJXHvECgVuHJ8U4IXe9paQnf0VxNCC0KdgO3mMF
   Q==;
X-CSE-ConnectionGUID: odxgzD8YRNulgVEM8kH7uA==
X-CSE-MsgGUID: +BzLy4JmT2aEj/6IVE56PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56660703"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="56660703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:35:20 -0800
X-CSE-ConnectionGUID: 45kjTJr7SCOx2HAFHpwqZQ==
X-CSE-MsgGUID: yRUcrLOBQpOoZk6UDGQ0tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115549482"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2025 12:35:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf3A4-000rTz-25;
	Mon, 03 Feb 2025 20:35:16 +0000
Date: Tue, 4 Feb 2025 04:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 169/169]
 drivers/gpu/drm/mediatek/mtk_dp.c:423:12: warning: function 'mtk_dp_suspend'
 has internal linkage but is not defined
Message-ID: <202502040451.qyZQpMPG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c65c7bbfa145ae7df24f5e9b4de74a7fbaaac6c5
commit: 044955e3eece16d9c50e1a693c197e4193399d72 [169/169] CHROMIUM: drm/mediatek: add eDP driver for mt8196
config: x86_64-buildonly-randconfig-001-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040451.qyZQpMPG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040451.qyZQpMPG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040451.qyZQpMPG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_dp.c:423:12: warning: function 'mtk_dp_suspend' has internal linkage but is not defined [-Wundefined-internal]
     423 | static int mtk_dp_suspend(struct device *dev);
         |            ^
   drivers/gpu/drm/mediatek/mtk_dp.c:2986:3: note: used here
    2986 |                 mtk_dp_suspend(dev);
         |                 ^
>> drivers/gpu/drm/mediatek/mtk_dp.c:424:12: warning: function 'mtk_dp_resume' has internal linkage but is not defined [-Wundefined-internal]
     424 | static int mtk_dp_resume(struct device *dev);
         |            ^
   drivers/gpu/drm/mediatek/mtk_dp.c:2989:3: note: used here
    2989 |                 mtk_dp_resume(dev);
         |                 ^
   2 warnings generated.


vim +/mtk_dp_suspend +423 drivers/gpu/drm/mediatek/mtk_dp.c

   415	
   416	static const struct regmap_config mtk_edp_phy_regmap_config = {
   417		.reg_bits = 32,
   418		.val_bits = 32,
   419		.reg_stride = 4,
   420		.max_register = SEC_OFFSET + 0x90,
   421		.name = "mtk-edp-phy-registers",
   422	};
 > 423	static int mtk_dp_suspend(struct device *dev);
 > 424	static int mtk_dp_resume(struct device *dev);
   425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
