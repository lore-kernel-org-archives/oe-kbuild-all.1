Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77819CCEC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738068641; cv=none; b=W21YZV/qE4+MkWJmgsic11/MvsuCzfPA5ZUZkPHfQTkW0FHc5DWXT7ZnUrZo7W4o47/RZpdvxNW3sxZCFpUOLagsc8UB7mBe2M0yB4yIazUh6TVYGJ0nvJZpXeS0f1Q4UC0wZU+QBodN+fQwVksWFGDGROnHP8AvcdRtMIqHLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738068641; c=relaxed/simple;
	bh=Pd+ww60EKyG6E5fevkebAnASNlR25NNnVbqphVsLGqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJtzvBAI94jMnuz4qk3GyS8eMfxVhHgwuVRLShuDH45IzAA9nrRexqWcTtXNMH9hvQd5/FYeUMiiVhT0mmqA1m8APdvukJGDYFOng0bRtXRyQa+YnfTwmxOM8VNl8k2pcrcOeuaqZYPzKt4NPJqtlwLv9tw4Jvvo8NoUvBZnTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+BqOBOw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+BqOBOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738068640; x=1769604640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pd+ww60EKyG6E5fevkebAnASNlR25NNnVbqphVsLGqA=;
  b=b+BqOBOwZ3M6ijOismUj/WkUu+WSjzSilSq+NG9mfMpNdIUaIQfYbFrC
   3C5/OtBj+ioOFUSxWE5cqCSMcP/YIWDthcE4ufUW9BfQzSYLZHSomoJp/
   GawT9dC6Jz7LNFXq+yVpy4/lnGuvwnsr8A/CuuE01Fqvx6e3YMri93eq7
   ZgMbrOK1xOBV3sU1PLHG7c6cSZWymT7TlT8MB+42MNQZwhB6yFopB/BLI
   zKvW9ejKqUilqK3ho6oEPnQokdDyh+CYq6+bHiQKg8wFePpeYFASSQbH2
   SOE6Y/Lfx35Hz92Ot/Z4qIy8FsZTpVkAasGbyEIhmmXxW7wc80Hs44WKN
   w==;
X-CSE-ConnectionGUID: uOH3sAnMRMuaNIWK+2VRKA==
X-CSE-MsgGUID: DkwFxPQyQEK6XodF5JebXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="49536470"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="49536470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 04:50:40 -0800
X-CSE-ConnectionGUID: zbtbQIxLQlKRgJRJPMNZ/g==
X-CSE-MsgGUID: SA8p2C+0QGqKlSlaF2qivA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113701943"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2025 04:50:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcl35-000hm7-32;
	Tue, 28 Jan 2025 12:50:35 +0000
Date: Tue, 28 Jan 2025 20:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: Tristram.Ha@microchip.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net-next 2/2] net: dsa: microchip: Add SGMII port
 support to KSZ9477 switch
Message-ID: <202501282024.qIqCO5ej-lkp@intel.com>
References: <20250128033226.70866-3-Tristram.Ha@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128033226.70866-3-Tristram.Ha@microchip.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Tristram-Ha-microchip-com/net-pcs-xpcs-Add-special-code-to-operate-in-Microchip-KSZ9477-switch/20250128-113425
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250128033226.70866-3-Tristram.Ha%40microchip.com
patch subject: [PATCH RFC net-next 2/2] net: dsa: microchip: Add SGMII port support to KSZ9477 switch
config: nios2-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501282024.qIqCO5ej-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501282024.qIqCO5ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501282024.qIqCO5ej-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/net/dsa/microchip/ksz_common.o: in function `ksz_phylink_mac_select_pcs':
>> ksz_common.c:(.text+0x10cc): undefined reference to `xpcs_to_phylink_pcs'
>> ksz_common.c:(.text+0x10cc): relocation truncated to fit: R_NIOS2_CALL26 against `xpcs_to_phylink_pcs'
   nios2-linux-ld: drivers/net/dsa/microchip/ksz9477.o: in function `ksz9477_pcs_create':
>> ksz9477.c:(.text+0xaf4): undefined reference to `xpcs_create_mdiodev'
>> ksz9477.c:(.text+0xaf4): relocation truncated to fit: R_NIOS2_CALL26 against `xpcs_create_mdiodev'
>> nios2-linux-ld: ksz9477.c:(.text+0xb14): undefined reference to `xpcs_set_quirk'
>> ksz9477.c:(.text+0xb14): relocation truncated to fit: R_NIOS2_CALL26 against `xpcs_set_quirk'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
