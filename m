Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A661860
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714098539; cv=none; b=kmSkj+dePFl4V2etubw0w6iorZ987ORNQaFdj2gSLb4vbbeI5OC+VWhc35anlSjDDNpuP8/5x5QqJQilUrhXXM8tXx3QJPpbJqcY5Ob0gWgQlGKA6GI3sa8OBpnndSfaNhHH5eGCXvKsbbyJCuRxFj8d1fIEgnMaf4cLoM099g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714098539; c=relaxed/simple;
	bh=a7GCnBwqMy29DV7yfejurYzqI+BjrI2g+dPqUPElVxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQc5XP8uPSdrdp9P55NfF1YOINGHQ9Pc0pdhvMhfASXYz46TLjVqhU8Ecf31RtmrFKVesVLOGMzynlTJUZFhrb207MSmw36VihLjlTet0loZqc6LS1XUuIaO8wGRWCNgJERgbTHsIHm6D4C1DWsgCi4XVgUVsyJaOxaUT6kp6to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kw/cpDiL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kw/cpDiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714098538; x=1745634538;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a7GCnBwqMy29DV7yfejurYzqI+BjrI2g+dPqUPElVxY=;
  b=Kw/cpDiLx/t2TBgKj2EeOEq5Zd7TZtnqpmk43w1NbPYU2TFBXeCLpdKH
   ISUKRzxgNTyShM5LO8gNDnD+mgfBDDOH2L7v/+qwGWasI5b1SegNvYH00
   QD9n80mh/zb8YVdbNBxn/4J38Rb55v0RrD4ncA5fTty1J+BnEuoD0/vtP
   CFiDPVqpKHUNn/kKHVNhsihT4yKTaQidoP81FBKslt3/l51oaX7Da3hx2
   nIKAoJSlPS2anTR4DNS7A2UPyKsVu4RXz0VG2P6ZYXacsMo4q9oPx2ssh
   o3qDANUIGBTrGH64gSwkQLY2wNzHORnj2hpO3PVv2WJcu414x49z0p/8T
   w==;
X-CSE-ConnectionGUID: 9F3+/HgISSWzFlBUvjLr+A==
X-CSE-MsgGUID: KZ59zfAGTAGfVk3yzh8j6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9658980"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="9658980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 19:28:31 -0700
X-CSE-ConnectionGUID: Muomi0QGS/GUkiANgz9eDA==
X-CSE-MsgGUID: i31M9VSMRcKlVW3m4otSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; 
   d="scan'208";a="25276471"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 19:28:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0BK4-0003Ai-29;
	Fri, 26 Apr 2024 02:28:24 +0000
Date: Fri, 26 Apr 2024 10:27:38 +0800
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
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	"SkyLake.Huang" <skylake.huang@mediatek.com>
Subject: Re: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet
 phy drivers
Message-ID: <202404261047.Dx118RCc-lkp@intel.com>
References: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-2-SkyLake.Huang@mediatek.com>

Hi Sky,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240424]
[cannot apply to net-next/main net/main linus/master v6.9-rc5 v6.9-rc4 v6.9-rc3 v6.9-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sky-Huang/net-phy-mediatek-Re-organize-MediaTek-ethernet-phy-drivers/20240425-103608
base:   next-20240424
patch link:    https://lore.kernel.org/r/20240425023325.15586-2-SkyLake.Huang%40mediatek.com
patch subject: [PATCH 1/3] net: phy: mediatek: Re-organize MediaTek ethernet phy drivers
config: i386-kismet-CONFIG_NVMEM_MTK_EFUSE-CONFIG_MEDIATEK_GE_SOC_PHY-0-0 (https://download.01.org/0day-ci/archive/20240426/202404261047.Dx118RCc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240426/202404261047.Dx118RCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261047.Dx118RCc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE when selected by MEDIATEK_GE_SOC_PHY
   WARNING: unmet direct dependencies detected for NVMEM_MTK_EFUSE
     Depends on [n]: NVMEM [=n] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && HAS_IOMEM [=y]
     Selected by [y]:
     - MEDIATEK_GE_SOC_PHY [=y] && NETDEVICES [=y] && PHYLIB [=y] && (ARM64 && ARCH_MEDIATEK || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
