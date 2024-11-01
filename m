Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8BEEC3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730420706; cv=none; b=JjJPRwQRy9Zrn5l14QR7pV0dwepBmOY5TOLvDZ6eAjb4LlpYKN/HuIyBriumWhYTuk6150ar3aPUN0fuoxFptbGccgHn4YXcL0WTsBVMnnlmPQA516/MuVRqGIZbQm9uQsSv1R5N1j1xEc0Ldkun0+tAROpvuYL2laZQun7FAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730420706; c=relaxed/simple;
	bh=HgGI0MztuDXM0kkbhNu/WK25UzLMgeMemdDEF+M6Yis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+tJshy4sJHtdcXGQmDwgAIUn70kQpeYf7wGIG3id6WquUMjygHXEye5e1C5xUEG+201WsiJSRI4d4Y5m0t4uSYdEu+Nqtz0KdOVl0nYhd1OvpEB1dHp7ShV7PtRNvs0BuSgd3MSaAY+wivWecEL0u2dIovW+UGaZPkCikYla5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RNwsCeWu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RNwsCeWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730420700; x=1761956700;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HgGI0MztuDXM0kkbhNu/WK25UzLMgeMemdDEF+M6Yis=;
  b=RNwsCeWuv1akR1H2cP8tv6i21T9kKU8XGFonFHa/yqxP/+mxd5XT9eEZ
   TvsO28AGJQNXSK5hgAyja7rl/utAu0svOjHVdCVDVdtHCOamUIbjNXHXC
   cjKYY4uxanfO4Ah8zcPTHEMB92i/Qub1N97/N0gTQaZRMXCJIWhPx32qY
   dGd3gjTBQTVQfzaiTnzzqp5F2PkMT5lSrwECdbns4ZRkH6DfbKLWotG0g
   bSQ20IMwCks80JuW8sO/MlVi9HZIpxDfgSjB2bnVZspu0fG6W/8+ytodi
   ODjoslqYUU+d7B2Yyu/xsQtWswWO62OfpJjuypkeOtteGVU4MU3eSCioe
   g==;
X-CSE-ConnectionGUID: b6jULfSlREG+0izhjtacvQ==
X-CSE-MsgGUID: f2yiXBeIRu2QPmoKwFCbrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33988270"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="33988270"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:24:56 -0700
X-CSE-ConnectionGUID: RzYv7uP7THeQKpbmmHYBZA==
X-CSE-MsgGUID: 96x6eHVSQbyORU8dcMijjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; 
   d="scan'208";a="82323066"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 31 Oct 2024 17:24:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6fT7-000gsN-2M;
	Fri, 01 Nov 2024 00:24:49 +0000
Date: Fri, 1 Nov 2024 08:24:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write
 page helper functions
Message-ID: <202411010814.EOjx8juJ-lkp@intel.com>
References: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-5-SkyLake.Huang@mediatek.com>

Hi Sky,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20241030-184043
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241030103554.29218-5-SkyLake.Huang%40mediatek.com
patch subject: [PATCH net-next 4/5] net: phy: mediatek: Integrate read/write page helper functions
config: i386-randconfig-004-20241101 (https://download.01.org/0day-ci/archive/20241101/202411010814.EOjx8juJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411010814.EOjx8juJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411010814.EOjx8juJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0xb4): undefined reference to `mtk_phy_read_page'
>> ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0xb8): undefined reference to `mtk_phy_write_page'
   ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0x1c8): undefined reference to `mtk_phy_read_page'
   ld: drivers/net/phy/mediatek/mtk-ge.o:(.data+0x1cc): undefined reference to `mtk_phy_write_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
