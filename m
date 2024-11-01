Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24291BCA0A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474094; cv=none; b=kuONIJUEHw9ohUM1xrcrZgDfmUN0sphqdzuscwP2V33pSXzMp6sf7rUEUgRnRLe0PugVsnToat9Bj1FPXmjDO2JxEwX0NwnvaZrxjqgyWFRPuy1JFSnYfOUujDgm/6mqIU6lLDFkggWPm5g6kEMvq6CRe9DP5vA1Fxm2kJ2493s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474094; c=relaxed/simple;
	bh=HDf6jYleLt1dL9i7iCeHfUfUY0TTmgcO8vabuye36qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRpaL6ncnDscrcDs8kmb7ICbQvmpTeZZJf0ntQun+i2rIVbIiLa1s1YbmKR8zUQOs9DgdCrSKuOXhkrnY79W3mJJb1HaWnCu2wVZUMKyKeyyQuwwsFhO6Bjsw8vE/+++Mn0zmvQ89CwLv3oMQj/UXCdjR79ufbWGFHYW3n6vhoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEa7KccA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEa7KccA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730474093; x=1762010093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HDf6jYleLt1dL9i7iCeHfUfUY0TTmgcO8vabuye36qY=;
  b=DEa7KccAlGpcrS/sBvI1xFhXuXmYMOeo/xH/yQgWUob5HqNcGm59bUMV
   nE2Nu9nY6JRIEm3ESuk5J+frITkaXkbmSE/tAe2q46UtE+KCtVC35F5Iy
   WAqLmGnOSzSf8dR9v+N1WlKX0pMf+OOR97QNLeY5edgokITlMSljq11o4
   ZY2RB53ywEK84HNtnf0apJCLogOayscoPhhLQKH4MyVypiWco/yMnCjZm
   VilOq6qDNUapGSCHDjub4+Rqo8XfFjU6L0JCnjNainyqQvtBdRaFJz6bm
   AurlwEhUIqry4oNOWXARKl/hxc5MOllpMPPHpAM0JDaSj53Mzdsfg9ODt
   A==;
X-CSE-ConnectionGUID: LapA5Ud6SUunTNOy6uneog==
X-CSE-MsgGUID: DZZHOHfXSlGSLMKqgP4ABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="30454126"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="30454126"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 08:14:49 -0700
X-CSE-ConnectionGUID: UBQEuVPYQoW0mbS4mKno7w==
X-CSE-MsgGUID: 6Ri9NZEUQHKCbwSfXmY+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="82914858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Nov 2024 08:14:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6tMI-000hgx-0S;
	Fri, 01 Nov 2024 15:14:42 +0000
Date: Fri, 1 Nov 2024 23:14:20 +0800
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
Message-ID: <202411012322.1xALQkaN-lkp@intel.com>
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
config: s390-randconfig-002-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012322.1xALQkaN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012322.1xALQkaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012322.1xALQkaN-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
>> ERROR: modpost: "mtk_phy_read_page" [drivers/net/phy/mediatek/mtk-ge.ko] undefined!
>> ERROR: modpost: "mtk_phy_write_page" [drivers/net/phy/mediatek/mtk-ge.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
