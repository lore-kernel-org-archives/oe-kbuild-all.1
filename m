Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BDC34A3A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727127; cv=none; b=tc6OtnAmbpRyrcGMRSrWC4VhnGrHVuzsiMYRi2d9w12YGD4TRt1LmX2/Dl93YW7usuVENE/fX314E6auQB+wVTWNkcsOp6EpUV5GibgVMFCEk64c9HTaWcsbptfiTSVt2HrnN1RQ0e4BvdiqvMeSG14ukZefdphUs6d8JYiK464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727127; c=relaxed/simple;
	bh=wqWPTIvAKL83aGl0HiFpgUZP2uLr9zLOEr57abq342M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZCclmU0dWp2zR08l0flmDR+kFggKeerTT004NJyu5bvYJ2itead4yV4qk9qN4h6OTUjhAnn93ndSd3QvcOjkGzJHDYGmgWKAITDLDUAOqItwmA9lJbemH0t7M8t2imXwkrve2ImdR6L9ZxUQTwdRKlGJTkzgU7FPKAe3JS0Uf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwVzrfgO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwVzrfgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787727126; x=1819263126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wqWPTIvAKL83aGl0HiFpgUZP2uLr9zLOEr57abq342M=;
  b=RwVzrfgO/AQavDPnE5i/DqLpy1BOWJa1xu4vZLAMKxepZJdxOlqsAxNW
   WwfXP1HMW7Cq21iihRMjbDc64kEjWrD0YVigXxLgWfQ/hDRkfGt319wUn
   5tJ5I24J4OFCq0QCrfshLbB+CBGUbJSWkRRBrlYdnFX5Zt4XTh7wnaf1o
   x/8yrgl9BCIqg2hX+r7tYr5LP+QNb7w9Po0YK5Utr5dBaUwwvuWCjCZDj
   hd4BxUk37ndlyncsn3fAJ2XT7xeT5oLqf4LdWwjUgJb2j5Lj8kjHaM+23
   67yvFrQkDx4xSnE4u+KKwdHvnYOZcXuRvPn+ASQtdWZFNR/zn8zCgRpWm
   Q==;
X-CSE-ConnectionGUID: oPvIK6nJT26jHFp8FlqIEQ==
X-CSE-MsgGUID: QXuv0exIQBCqZgRL8catCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98536836"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="98536836"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 23:52:06 -0700
X-CSE-ConnectionGUID: Wmo/hLY9TVOKTT5iQ+30nA==
X-CSE-MsgGUID: c/E8q47PQtyQ9arsJUYhEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="268073434"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Aug 2026 23:52:01 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wz7UM-0000000077T-0xzT;
	Wed, 26 Aug 2026 06:51:58 +0000
Date: Wed, 26 Aug 2026 14:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>, netdev@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andrew@lunn.ch, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	naseefkm@gmail.com, joey@tinyisr.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: Re: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast
 Ethernet SoC PHYs
Message-ID: <202608261446.DGUqZP2A-lkp@intel.com>
References: <20260825180421.1804729-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825180421.1804729-1-cjd@cjdns.fr>

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-James-DeLisle/net-phy-mediatek-add-driver-for-EcoNet-Fast-Ethernet-SoC-PHYs/20260825-180421
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260825180421.1804729-1-cjd%40cjdns.fr
patch subject: [PATCH net-next] net: phy: mediatek: add driver for EcoNet Fast Ethernet SoC PHYs
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260826/202608261446.DGUqZP2A-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260826/202608261446.DGUqZP2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261446.DGUqZP2A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'phydev' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'ctx' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:233 function parameter 'phydev' not described in 'en751221_fephy_cal_cycle'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:233 expecting prototype for poll_cal_complete(). Prototype was for en751221_fephy_cal_cycle() instead
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'phydev' not described in 'poll_cal_complete'
>> Warning: drivers/net/phy/mediatek/econet-fe-soc.c:184 function parameter 'ctx' not described in 'poll_cal_complete'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
