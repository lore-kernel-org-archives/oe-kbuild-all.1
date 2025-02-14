Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDA0134AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739558941; cv=none; b=nzP07tS9tl6dATNJVGU3c/3OWSplzh0lUOEdy9oq1TZXoKBaYt1Lb0QY+d1PuDWnxYOLM9giElbFIZpqfIf6dva9ZLlc9BttzJlykrKw9ZqgaCD1LBFNnWLv97mVEyfLbKjxphT5XaMt65epj+StTlNSRZdzE3hzlw9ozp/XqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739558941; c=relaxed/simple;
	bh=EL5bD/9kZqj06zJPIgpeSOzMwq64bINp3MPKOr8UDcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZ0E4whV79ZD3D8+AiCjk1HMLecw74wpT1xp6Jd81SPWwLNpzr3AfSGmxNzJXJowHBDSllSbp8iOlDO4YETlkvxROV83Eu5UY0W+XEo2KiHoaBGhKECN+N8ZRRLmDwvV31ijRdXuLfEqNK9M73uzI+RK5HpI7n7vH3Yq+w9GORc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW1JfNFF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW1JfNFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739558940; x=1771094940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EL5bD/9kZqj06zJPIgpeSOzMwq64bINp3MPKOr8UDcc=;
  b=BW1JfNFFkp4vsWJfipfvKyvpt3fljq+tn5mlwNFzTWho+UND/JlVjd4i
   7qJtTgi47yf9lHLhgGCkdn9i60T7c7o7ELLZQJ+U4AqRdC5DSagD7WkAK
   nA/pyL/ucT/DF8oQvRoszfVY4LGOKxyxHg8nQQKx18TPJ4VEVo0ARIUe7
   yWbjIpLURn7VAOWxWPTw78NE81aXC+4wgEEKy9VGuOapKErHB0yxneFuE
   zNNm4k2zhjr5HnrJuyF1XMPd+E4WxLp3MtjkiPgwo+Zxt85qTzjzWqdmx
   cn27ByMK1Yi3K4zyQ5kEmBMqKhI5sQZs4FpV9DFNbJJj6JzzEnpZUnWet
   w==;
X-CSE-ConnectionGUID: zsyGcL9CQPyBbGhM5Jp1ZA==
X-CSE-MsgGUID: Jq41ztCPS+ubbS/3gkNxeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51748756"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51748756"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 10:48:59 -0800
X-CSE-ConnectionGUID: KuPhAjyASteAnYchU7aIQA==
X-CSE-MsgGUID: ZcM0qESfSw6rMuGyCGCsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118156478"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Feb 2025 10:48:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj0kC-001A35-0t;
	Fri, 14 Feb 2025 18:48:56 +0000
Date: Sat, 15 Feb 2025 02:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/1]
 drivers/gpu/mediatek/arm/mali/Kbuild:252:
 drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild:
 No such file or directory
Message-ID: <202502150236.VvyMhha5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6737b000ef8c138d01872003fa3b7fd0a39021f3
commit: 20c6549501f674937409aba5411ee8c5c0ab133a [1/1] CHROMIUM: gpu/mediatek: Enable Kconfig and build target
config: arm64-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150236.VvyMhha5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150236.VvyMhha5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150236.VvyMhha5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/mediatek/arm/mali/Kbuild:252: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild: No such file or directory
>> make[8]: *** No rule to make target 'drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild'.
   drivers/gpu/mediatek/arm/mali/Kbuild:252: Failed to remake makefile 'drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild'.
--
>> drivers/gpu/mediatek/arm/mali/Kbuild:252: drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild: No such file or directory
   make[3]: *** No rule to make target 'drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild'.
   drivers/gpu/mediatek/arm/mali/Kbuild:252: Failed to remake makefile 'drivers/gpu/mediatek/arm/mali/platform/devicetree/mtk_platform_common/Kbuild'.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI_MTK [=m] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=y]


vim +252 drivers/gpu/mediatek/arm/mali/Kbuild

2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  249  
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  250  # *** MTK Proprietary ***
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15  251  export MALI_PLATFORM_DIR
2b0918badca3b0 drivers/gpu/mediatek/arm/midgard/Kbuild Alvin Liu 2025-01-15 @252  include $(src)/platform/$(MALI_PLATFORM_DIR)/mtk_platform_common/Kbuild

:::::: The code at line 252 was first introduced by commit
:::::: 2b0918badca3b06a0371cf4cb21785d202033004 CHROMIUM: gpu/mediatek: update gpu kernel driver(r51p0) with mtk modification

:::::: TO: Alvin Liu <alvin.liu@mediatek.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
