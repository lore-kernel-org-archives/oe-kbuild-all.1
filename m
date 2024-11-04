Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E318C02E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730704918; cv=none; b=JK0osXr89aesQEeJLrnqkQfhRRaLcX55sc13oe6I02jHDDufY6ycbhL+8p513SwOoDYKlVGDg7E4zl4Pga3e8BDoRG0k0f0cE0+oPv6x9534aRC+0qHYlsBQ3N2sed/IW8AGhg5ZOvAyaBXpxsfGdsJBz/syVJ3nbMVki5ZfAmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730704918; c=relaxed/simple;
	bh=vVvC//hm2Qb9JX4BN8wiAIzh4mvzc75vswlBe2pSDsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxFIMxyHVD7gltDJvIXfgqApTkXL3loiyzMoIzDXMMgUJwV2jX785aVskLVrywxvp4cVXS3UmM8ECwLnJenV/twavyIPtUxap0VCARmGXcnkXhtdyUfJZho8qnnN67yWK3/7yQhY/4XBP09qCcMcNxiofzHa9gL4jseEn2Jlq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlPJ9VUx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlPJ9VUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730704917; x=1762240917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vVvC//hm2Qb9JX4BN8wiAIzh4mvzc75vswlBe2pSDsk=;
  b=QlPJ9VUxjKrFw8bjmmTkrKZTPoGDkEXExXtcmHGEHZ/GbNvSdImPN4yA
   Qo7eDI6i9r48hua2fBVx6zWH83+uvRiDbzH69F4gLsp7ISoUlgQiqoH18
   bSwriiKjjFPj6TdI5XrRfgRhBVbLRJXidEgAJBR+b1LCeKhopo6YeF2Gz
   DDOV3KOQ5Opv/WU/T2CktSR5435toHuD/QIujIh5d22wFbkFFL/7dxm9X
   PdfDdYVlfQYa/mXbIVwDwNkp7n1OR0NEXWSOKylgROOHbdAZbikzUAVN5
   8kFJjreWHQ5Ts2SO4PphGyfFZ4cJCEniyp/DHD9cPmAqkfdthnkk9CUj6
   w==;
X-CSE-ConnectionGUID: CyHQ3EP3Q1Ct3q+kv/nNxw==
X-CSE-MsgGUID: qoxwtFbCTWm2DQWjeQsEpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="34177759"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="34177759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 23:21:56 -0800
X-CSE-ConnectionGUID: gOTNyNwWQyioP4BtnfK/IA==
X-CSE-MsgGUID: MZev9TICTqKf9KSMkCwTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83452794"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2024 23:21:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7rPJ-000kal-2E;
	Mon, 04 Nov 2024 07:21:49 +0000
Date: Mon, 4 Nov 2024 15:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org,
	tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, kong.kongxinwei@hisilicon.com
Cc: oe-kbuild-all@lists.linux.dev, liangjian010@huawei.com,
	chenjianmin@huawei.com, lidongming5@huawei.com,
	shiyongbang@huawei.com, libaihan@huawei.com, shenjian15@huawei.com,
	shaojijie@huawei.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <202411041559.WIfxRN6n-lkp@intel.com>
References: <20241101105028.2177274-3-shiyongbang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101105028.2177274-3-shiyongbang@huawei.com>

Hi Yongbang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241101-185648
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20241101105028.2177274-3-shiyongbang%40huawei.com
patch subject: [PATCH V3 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in hibmc
config: csky-randconfig-r121-20241103 (https://download.01.org/0day-ci/archive/20241104/202411041559.WIfxRN6n-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241104/202411041559.WIfxRN6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:12:10: sparse: sparse: symbol 'link_rate_map' was not declared. Should it be static?

vim +/link_rate_map +12 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c

    11	
  > 12	const u8 link_rate_map[] = {DP_LINK_BW_1_62, DP_LINK_BW_2_7,
    13				    DP_LINK_BW_5_4, DP_LINK_BW_8_1};
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
