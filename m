Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD41172A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730784832; cv=none; b=YFWjTZ5sPfVNP6899oBWc2oQViLa8I2Yn4NL/CDfov2ExZy6bwuq++L7V/K/qN0KoQtrrsHe6CnKlFpXPvUJ047UrZQPJ4kktsZndUe/3xuc9IasMFB6zwqG/bRQGLKJGYibFEqTT9gbrClGRL3Il90QDoWmV5F7E1+4RjGGTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730784832; c=relaxed/simple;
	bh=g3Q3M6WUtQ6xDA3rcj5fxZODTWiZLjTjC4j+67Vvc4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9m66ezbqlPCfEoVz2Sh3X5ijfkLVGEnBzPjTDjvpAl1zvU0VD9Uxemda7TImWrenpdcSDVZFmntWBbyerYoakszhgpHYusDT/4aUcwY9pRJCe89L9vUQGueoXNS1qR0NK4hbaxhputTHMoMgOoNw0/kob6ChKglHUYVLJlcNiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIn4S4aC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIn4S4aC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730784831; x=1762320831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g3Q3M6WUtQ6xDA3rcj5fxZODTWiZLjTjC4j+67Vvc4Y=;
  b=PIn4S4aCqU5XdsUwtbXJeBOrAcnzwr6G6IsidjCNukpw65IA7nK6Wh7I
   gdrXQVtfe2sNDmVScCTJYe8fF2IsOPRyMdjqMmUUE7tkk/99jUxcN2NOc
   kchYT29K2kImj8gTVQ2zwMEb6bx6gX00NXzw6HVV5ArXH9y3b+qcB1+a6
   mkCOtsc4rr6FOPk/PV2ISf0YR+1aACHmXp8ADzM3ltq2g1Kj4OJCbRkmE
   vCmm18KTVlj2FsJVAwYfrof6ILFEszVDKeq0xiv2ni1b44a2vk025sOKH
   3DS+aAoVrMVqgbOjMJdgbT1OjbtA060abHYopzlRS+hWcOmDcfkh0RfWV
   g==;
X-CSE-ConnectionGUID: 73XNGzF1QMibnKsbNDyNGw==
X-CSE-MsgGUID: RKZz4wizRtCgW4CNMtw+Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30685742"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30685742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:33:50 -0800
X-CSE-ConnectionGUID: kM3nh4pcStOj1L+0QRHEsw==
X-CSE-MsgGUID: U6Z3GzQcTbebC3t43cg/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="88695720"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 21:33:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8CBd-000lfn-2O;
	Tue, 05 Nov 2024 05:33:05 +0000
Date: Tue, 5 Nov 2024 13:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Divya Koppera <divya.koppera@microchip.com>, andrew@lunn.ch,
	arun.ramadoss@microchip.com, UNGLinuxDriver@microchip.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	richardcochran@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net-next 4/5] net: phy: Makefile: Add makefile support
 for ptp in Microchip phys
Message-ID: <202411051307.bXWxsYtE-lkp@intel.com>
References: <20241104090750.12942-5-divya.koppera@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104090750.12942-5-divya.koppera@microchip.com>

Hi Divya,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Divya-Koppera/net-phy-microchip_ptp-Add-header-file-for-Microchip-ptp-library/20241104-171132
base:   net-next/main
patch link:    https://lore.kernel.org/r/20241104090750.12942-5-divya.koppera%40microchip.com
patch subject: [PATCH net-next 4/5] net: phy: Makefile: Add makefile support for ptp in Microchip phys
config: hexagon-randconfig-r112-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051307.bXWxsYtE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce: (https://download.01.org/0day-ci/archive/20241105/202411051307.bXWxsYtE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051307.bXWxsYtE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/phy/microchip_ptp.c:614:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __be16 [usertype] sequence_id @@
   drivers/net/phy/microchip_ptp.c:614:16: sparse:     expected unsigned short [usertype] val
   drivers/net/phy/microchip_ptp.c:614:16: sparse:     got restricted __be16 [usertype] sequence_id
>> drivers/net/phy/microchip_ptp.c:614:16: sparse: sparse: cast from restricted __be16
>> drivers/net/phy/microchip_ptp.c:614:16: sparse: sparse: cast from restricted __be16
>> drivers/net/phy/microchip_ptp.c:614:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
   drivers/net/phy/microchip_ptp.c:614:14: sparse:     expected unsigned short [usertype]
   drivers/net/phy/microchip_ptp.c:614:14: sparse:     got restricted __be16 [usertype]
   drivers/net/phy/microchip_ptp.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +614 drivers/net/phy/microchip_ptp.c

cf630bd2326111 Divya Koppera 2024-11-04  600  
cf630bd2326111 Divya Koppera 2024-11-04  601  static bool mchp_ptp_get_sig_tx(struct sk_buff *skb, u16 *sig)
cf630bd2326111 Divya Koppera 2024-11-04  602  {
cf630bd2326111 Divya Koppera 2024-11-04  603  	struct ptp_header *ptp_header;
cf630bd2326111 Divya Koppera 2024-11-04  604  	int type;
cf630bd2326111 Divya Koppera 2024-11-04  605  
cf630bd2326111 Divya Koppera 2024-11-04  606  	type = ptp_classify_raw(skb);
cf630bd2326111 Divya Koppera 2024-11-04  607  	if (type == PTP_CLASS_NONE)
cf630bd2326111 Divya Koppera 2024-11-04  608  		return false;
cf630bd2326111 Divya Koppera 2024-11-04  609  
cf630bd2326111 Divya Koppera 2024-11-04  610  	ptp_header = ptp_parse_header(skb, type);
cf630bd2326111 Divya Koppera 2024-11-04  611  	if (!ptp_header)
cf630bd2326111 Divya Koppera 2024-11-04  612  		return false;
cf630bd2326111 Divya Koppera 2024-11-04  613  
cf630bd2326111 Divya Koppera 2024-11-04 @614  	*sig = htons(ptp_header->sequence_id);
cf630bd2326111 Divya Koppera 2024-11-04  615  
cf630bd2326111 Divya Koppera 2024-11-04  616  	return true;
cf630bd2326111 Divya Koppera 2024-11-04  617  }
cf630bd2326111 Divya Koppera 2024-11-04  618  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
