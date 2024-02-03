Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6E12E63
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706996862; cv=none; b=bKS21BJXpbxo4ArXU2HNZ7rUkXaQjEbeZJDjLwICXxkotwF2VQqeQELWHLxvp3Hjgw04tHFqe//lGCb53b2S2LuruybuwG/K6q1yS/KqKS9qXPi+hmWqrT2FPAmdaFbf20A0n/HlvXyKpWKP5aIRzlNAPB50oqFUML+kTmRaT54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706996862; c=relaxed/simple;
	bh=eJYAaMsgL0ueSQnPT57fASVVRZAuwx4mNxup1pccJMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5TgTPzQmggzbm//pGO/+vmYs8I7RNAaAp0oS2zIt9V4x+AAFvfupCJ3n8RZz+T+uwEHXovh4dpl43oKTXyeWmajvc/eaJLiNkF1aGwIbcSZ2UMmGEBPkMn6Bowuk6RfBJ5XX983z7erJ/ypqFCHkClOIsoIuRmaUDnq5NMhPIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHUXXkhu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHUXXkhu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706996861; x=1738532861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eJYAaMsgL0ueSQnPT57fASVVRZAuwx4mNxup1pccJMw=;
  b=XHUXXkhuWEWOYGyGgCUHVJFkz3oQ/ymZp3hW1cTgdV82NPqH2AgneL7/
   ZfdPamdo8crzvXOG+SzPbT1Z7cGHhM6MgwzfWI25bNMhhDDY/MVv3QCPy
   MD+0AbaNE/N6XVx+vLKR9sM1/OXDFfJX0FtAmDfT0dtCSvU9isaNmL6Oz
   /Vf++eg3AThotawQNPYd9i41EVK3cXCnxqw76bZ9KMyxCrxo1YnpB4xdo
   1DcCbUtZf1NAPAzFoArdu23FanFP+9eqyb9DCuPyFNhRlMZZgdtfhMGvz
   fgARAAd3RiAAamNTIcz/Z/IA9U41ri8aKrrLagF61BPL9Zau/njWOjV+X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="17756614"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="17756614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 13:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="373629"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Feb 2024 13:47:38 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWNrL-0005e5-1W;
	Sat, 03 Feb 2024 21:47:35 +0000
Date: Sun, 4 Feb 2024 05:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: Fiona Klute <fiona.klute@gmx.de>, linux-wireless@vger.kernel.org,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
	Fiona Klute <fiona.klute@gmx.de>
Subject: Re: [PATCH 1/9] wifi: rtw88: Shared module for rtw8723x devices
Message-ID: <202402040512.CAqNtCtW-lkp@intel.com>
References: <20240202121050.977223-2-fiona.klute@gmx.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202121050.977223-2-fiona.klute@gmx.de>

Hi Fiona,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on wireless/main linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fiona-Klute/wifi-rtw88-Shared-module-for-rtw8723x-devices/20240202-201428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20240202121050.977223-2-fiona.klute%40gmx.de
patch subject: [PATCH 1/9] wifi: rtw88: Shared module for rtw8723x devices
config: x86_64-randconfig-121-20240203 (https://download.01.org/0day-ci/archive/20240204/202402040512.CAqNtCtW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040512.CAqNtCtW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040512.CAqNtCtW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw88/rtw8723x.c:156:6: sparse: sparse: symbol '__rtw8723x_cfg_ldo25' was not declared. Should it be static?

vim +/__rtw8723x_cfg_ldo25 +156 drivers/net/wireless/realtek/rtw88/rtw8723x.c

   155	
 > 156	void __rtw8723x_cfg_ldo25(struct rtw_dev *rtwdev, bool enable)
   157	{
   158		u8 ldo_pwr;
   159	
   160		ldo_pwr = rtw_read8(rtwdev, REG_LDO_EFUSE_CTRL + 3);
   161		if (enable) {
   162			ldo_pwr &= ~BIT_MASK_LDO25_VOLTAGE;
   163			ldo_pwr |= (BIT_LDO25_VOLTAGE_V25 << 4) | BIT_LDO25_EN;
   164		} else {
   165			ldo_pwr &= ~BIT_LDO25_EN;
   166		}
   167		rtw_write8(rtwdev, REG_LDO_EFUSE_CTRL + 3, ldo_pwr);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
