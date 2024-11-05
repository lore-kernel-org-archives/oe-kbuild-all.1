Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897AE36AEC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 03:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730776589; cv=none; b=ba6O8wohCvOtvZ3hPeqMy2CMiRNUn9kbW1RwIx3S3ffaoBoScQb2lbeNuDRUp1lf/NOvEfDb9V6Rtr0YfhDxrRR4BQiJlst1qPtYJIexB4zFTaZX9b8oY7kps6DEZQWg56Zf48IiFPw4VdN0USMmvgJpSzHYDn/ScHJHkeeE0xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730776589; c=relaxed/simple;
	bh=Gkdgtap+WGrNmIFh9egmYoxQOXi8kqEUmbNQbpOoSu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmDqvwu7nTdlscRhOjSRZutEE5xVE2xZPT6FwATfnZ7Q7nOBPIMSlxO5XzJCSV3iO5kFVd9Xdv5ICtZ1DKStV8XG85XKwYLNZRXdaj/CE/cRjl/4lMLO5avghnYT7OWa0XwZhMp+H8jtNfXd3PX6pmEELcKhVtnnaz/WF8mL8N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th86GGtw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th86GGtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730776587; x=1762312587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gkdgtap+WGrNmIFh9egmYoxQOXi8kqEUmbNQbpOoSu0=;
  b=Th86GGtwfjMizMxSQMsZUXIMJbSx0r1+UbEU8HYwHyctJDJzI50I/dij
   3wdSQ6b7KVt2pEqybQ8lD6FTPfP17PAx4wgTFRhlIKd1YaHolbXZl4YuQ
   gfzKGFzpg9e99deqMNJw3Hektn9OR2HBDiNGtF8uex5H1jaUovQfPZLzZ
   EkvIFgQi0IcNSLI7omu5CocmBQbvLyMujV5kdxZ9rWgKC4oFarcfx9XDl
   pfeZKMZITeeLW7MFKp55J71TfFgQCqdZMHLTcBXkm5RZL6gS9orO0+5F2
   BKQygObfpLm/EfrC86Ao83SBp3X0jM0+AjekwqLpXfywZRNbqJGNycpmj
   A==;
X-CSE-ConnectionGUID: nKaVeOOKTi6BwTvpRzBsjw==
X-CSE-MsgGUID: 88Gn8EwhRTa3bk4uCqe3uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41133449"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41133449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 19:16:25 -0800
X-CSE-ConnectionGUID: A3LxpHfLTxyyynGz22ImkA==
X-CSE-MsgGUID: QFhkJ7DYRYOoFrnNfPHvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="84187739"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Nov 2024 19:15:02 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8A1y-000lXn-1m;
	Tue, 05 Nov 2024 03:14:58 +0000
Date: Tue, 5 Nov 2024 11:14:57 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Koppera <divya.koppera@microchip.com>, andrew@lunn.ch,
	arun.ramadoss@microchip.com, UNGLinuxDriver@microchip.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 5/5] net: phy: microchip_t1 : Add initialization
 of ptp for lan887x
Message-ID: <202411051039.Yz1kJCOl-lkp@intel.com>
References: <20241104090750.12942-6-divya.koppera@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104090750.12942-6-divya.koppera@microchip.com>

Hi Divya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Divya-Koppera/net-phy-microchip_ptp-Add-header-file-for-Microchip-ptp-library/20241104-171132
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241104090750.12942-6-divya.koppera%40microchip.com
patch subject: [PATCH net-next 5/5] net: phy: microchip_t1 : Add initialization of ptp for lan887x
config: x86_64-randconfig-121-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051039.Yz1kJCOl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051039.Yz1kJCOl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051039.Yz1kJCOl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/phy/microchip_t1.c: note: in included file:
>> drivers/net/phy/microchip_ptp.h:201:16: sparse: sparse: Using plain integer as NULL pointer

vim +201 drivers/net/phy/microchip_ptp.h

ca38715fe9dd46 Divya Koppera 2024-11-04  196  
ca38715fe9dd46 Divya Koppera 2024-11-04  197  static inline struct mchp_ptp_clock *mchp_ptp_probe(struct phy_device *phydev,
ca38715fe9dd46 Divya Koppera 2024-11-04  198  						    u8 mmd, u16 clk_base,
ca38715fe9dd46 Divya Koppera 2024-11-04  199  						    u16 port_base)
ca38715fe9dd46 Divya Koppera 2024-11-04  200  {
ca38715fe9dd46 Divya Koppera 2024-11-04 @201  	return 0;
ca38715fe9dd46 Divya Koppera 2024-11-04  202  }
ca38715fe9dd46 Divya Koppera 2024-11-04  203  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
