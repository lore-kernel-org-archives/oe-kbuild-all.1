Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAA4D7D22
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Sep 2026 07:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063902; cv=none; b=VF5LsKxR5RWGSNrkaQGEdI+FOJ0o0wZKUDD8bYRUo0tCpsxJ15CTK/FJHnvGppQARntVM6mvOkkU92MtW0kp5Hw3qEYsgNFFSU/XI14vWycEu+/iqP1Q6uFEg/gU9HRvPgTc+7mVhCytREjQ8XTEAmLlyYhSlHzE0aT4lPaY6xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063902; c=relaxed/simple;
	bh=st5zqvh5AAGmU926OyFQ7dzQZEV3MT6aFNUPe3AIhJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iYQleoG/7PWEUPfGAia0XWQgK71j+X4vbrB2/AAvCn0A+MHYCG5iY4wRQz3UyDjfPmzclFxJOGrAjjlOW8NVBI7JG7oQcQ94LCETCEO/rWuHjhkK7xdRuzpTqb18xws8SPywb86+YJciPKuK4lf64U2bYA9kIR5AnkT5V3Fa688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnUs8Cn7; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnUs8Cn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790063896; x=1821599896;
  h=date:from:to:cc:subject:message-id;
  bh=st5zqvh5AAGmU926OyFQ7dzQZEV3MT6aFNUPe3AIhJA=;
  b=FnUs8Cn73wUa2x1jGB+Cs5Xl13iYLrWm91wqLdq3+fM1yDvxfU3Cyeaj
   fneL/xYo5/T7eyzbzXkRrD1VV7feo/djHT8VTI3FhezErItLzilpirpyu
   DKDn8tNqHJBR/rwVG71Ja4GxNI8/fwyrxfg68vo2Dn/m6K0/89/xeDeKN
   WpFyqkrXEeiiA1zdl6PaTzeFjztX5K52G0hj23hx4tle5xYgqrEbuMiP8
   LbB/biSk/333LYyPIvZc1FNgDPO6igWl60g+GwrDO3FMQ+wXua2Tv8XaT
   gLfOte9hHlOvCzM/ZquEn+0E2h1tIcj9g05FLL8+uverrnSSEFLAvpMec
   g==;
X-CSE-ConnectionGUID: KfHN9R7pRx2ZfuEgJGMIhg==
X-CSE-MsgGUID: cfpjrbceTiGZNPB7WwJj7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1151237"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1151237"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 00:58:09 -0700
X-CSE-ConnectionGUID: I5JJwG+0SyKoJ3iUHV8qIg==
X-CSE-MsgGUID: AnC3xvpIQeuhegzMjW/i0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="281092126"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2026 00:58:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8vO8-00000000FAC-3ZlA;
	Tue, 22 Sep 2026 07:58:04 +0000
Date: Tue, 22 Sep 2026 15:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: drivers/gpu/drm/rockchip/cdn-dp-core.c:321:25: sparse:
 sparse: cast to restricted __le32
Message-ID: <202609221523.NSIdRvjX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: 0244539f9a4f3b564604dfe4d639f61cecec381a drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP
date:   9 months ago
config: powerpc64-randconfig-r1308-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221523.NSIdRvjX-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221523.NSIdRvjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0244539f9a4f ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221523.NSIdRvjX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/rockchip/cdn-dp-core.c:321:25: sparse: sparse: cast to restricted __le32

vim +321 drivers/gpu/drm/rockchip/cdn-dp-core.c

1a0f7ed3abe29c Chris Zhong 2017-02-05  312  
1a0f7ed3abe29c Chris Zhong 2017-02-05  313  static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
1a0f7ed3abe29c Chris Zhong 2017-02-05  314  {
1a0f7ed3abe29c Chris Zhong 2017-02-05  315  	int ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  316  	const u32 *iram_data, *dram_data;
1a0f7ed3abe29c Chris Zhong 2017-02-05  317  	const struct firmware *fw = dp->fw;
1a0f7ed3abe29c Chris Zhong 2017-02-05  318  	const struct cdn_firmware_header *hdr;
1a0f7ed3abe29c Chris Zhong 2017-02-05  319  
1a0f7ed3abe29c Chris Zhong 2017-02-05  320  	hdr = (struct cdn_firmware_header *)fw->data;
1a0f7ed3abe29c Chris Zhong 2017-02-05 @321  	if (fw->size != le32_to_cpu(hdr->size_bytes)) {
1a0f7ed3abe29c Chris Zhong 2017-02-05  322  		DRM_DEV_ERROR(dp->dev, "firmware is invalid\n");
1a0f7ed3abe29c Chris Zhong 2017-02-05  323  		return -EINVAL;
1a0f7ed3abe29c Chris Zhong 2017-02-05  324  	}
1a0f7ed3abe29c Chris Zhong 2017-02-05  325  
1a0f7ed3abe29c Chris Zhong 2017-02-05  326  	iram_data = (const u32 *)(fw->data + hdr->header_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  327  	dram_data = (const u32 *)(fw->data + hdr->header_size + hdr->iram_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  328  
1a0f7ed3abe29c Chris Zhong 2017-02-05  329  	ret = cdn_dp_load_firmware(dp, iram_data, hdr->iram_size,
1a0f7ed3abe29c Chris Zhong 2017-02-05  330  				   dram_data, hdr->dram_size);
1a0f7ed3abe29c Chris Zhong 2017-02-05  331  	if (ret)
1a0f7ed3abe29c Chris Zhong 2017-02-05  332  		return ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  333  
1a0f7ed3abe29c Chris Zhong 2017-02-05  334  	ret = cdn_dp_set_firmware_active(dp, true);
1a0f7ed3abe29c Chris Zhong 2017-02-05  335  	if (ret) {
1a0f7ed3abe29c Chris Zhong 2017-02-05  336  		DRM_DEV_ERROR(dp->dev, "active ucpu failed: %d\n", ret);
1a0f7ed3abe29c Chris Zhong 2017-02-05  337  		return ret;
1a0f7ed3abe29c Chris Zhong 2017-02-05  338  	}
1a0f7ed3abe29c Chris Zhong 2017-02-05  339  
1a0f7ed3abe29c Chris Zhong 2017-02-05  340  	return cdn_dp_event_config(dp);
1a0f7ed3abe29c Chris Zhong 2017-02-05  341  }
1a0f7ed3abe29c Chris Zhong 2017-02-05  342  

:::::: The code at line 321 was first introduced by commit
:::::: 1a0f7ed3abe29cff8e652c69a8ad89aec2c40f00 drm/rockchip: cdn-dp: add cdn DP support for rk3399

:::::: TO: Chris Zhong <zyw@rock-chips.com>
:::::: CC: Mark Yao <mark.yao@rock-chips.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
