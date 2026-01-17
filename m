Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDF6257431
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 20:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680381; cv=none; b=Av4NR5gtmB7+S5w9v7hRRatbVcCTqJAaW1TtgG6AWvUlhuAzOzDK50yoOmhyZZGahLH2opP9mDG0HNVyzCVbNKK6cpwGJfZFHfgvBvPl23szTRRX+9ZjscVVvPP8Sa/r3W13YJBYadM40K8violkoVXTuk4NP+GvTqjL41shT+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680381; c=relaxed/simple;
	bh=fOZgjOuBCw0no2cxvS4r+Bsj585gNaEZ6J0UTuO8GbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNWfLxUvAZVYX4aMkiz821ZgJ8HWYZn+qi06W/VFVmwGDqYC95Q8TwGQJdgtLRiCehHEEJLuKVPo8mQK34FbE3XJE40utIxaM+BdceOR/GTtsFyLigVZB81cUzcU8n5XP+0Az8nXgHi9OUXxLZDq9bKmf66gbkcJtoYMqU8SYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6zYN1gd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6zYN1gd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768680380; x=1800216380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fOZgjOuBCw0no2cxvS4r+Bsj585gNaEZ6J0UTuO8GbQ=;
  b=Z6zYN1gdj8CbI8pzFVF5SvwKM/X5f5SrohvtfkUyeNV7k2tHS12th3zk
   HREHN7soXDgf9md/NtkDSe6Gh69l1CauXS2NOXlHVFJp4lOD2+EZOviZm
   gFP+Qd2RbpY44UasjRIxPIgAfvcXKKFaNGdnVUDvl2NXnUgTgRXKWwiPB
   RxSvKDKoEJ4lpmeVxPa5nK96nmIoPEo/S9H9ehnwUlJYq8o4V4syR2fc7
   H0rHXvsaJZdcldd0rKp6xKoK3XvKjZGb7LVh60i7uoAUD3N8ZRkrmDRf3
   U8HzJEOMxibXhRCII/YNOIbie3jLmyw+R+cW1Ub2i3X2KFXlpImxOFLZO
   Q==;
X-CSE-ConnectionGUID: nHYlekTaQnGzandwvM8/Qg==
X-CSE-MsgGUID: Bw6ZFS+rQByiP0Y67firmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="69689549"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="69689549"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 12:06:19 -0800
X-CSE-ConnectionGUID: m8AkgbwuR1er30YtN7ckWQ==
X-CSE-MsgGUID: x/W48Gm5SCiclzdEc3q1JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="236793823"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2026 12:06:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhCYm-00000000MBc-3ZoO;
	Sat, 17 Jan 2026 20:06:12 +0000
Date: Sun, 18 Jan 2026 04:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>,
	Xinfa Deng <xinfa.deng@gl-inet.com>
Subject: Re: [PATCH net-next v4 3/6] net: dsa: lantiq: allow arbitrary MII
 registers
Message-ID: <202601180336.eVmDVfHL-lkp@intel.com>
References: <d5cbb8c5917197d44b62d39c9799212d1b3fe390.1768612113.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5cbb8c5917197d44b62d39c9799212d1b3fe390.1768612113.git.daniel@makrotopia.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-net-dsa-lantiq-gswip-use-correct-node-name/20260117-092406
base:   net-next/main
patch link:    https://lore.kernel.org/r/d5cbb8c5917197d44b62d39c9799212d1b3fe390.1768612113.git.daniel%40makrotopia.org
patch subject: [PATCH net-next v4 3/6] net: dsa: lantiq: allow arbitrary MII registers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260118/202601180336.eVmDVfHL-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601180336.eVmDVfHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601180336.eVmDVfHL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/dsa/lantiq/mxl-gsw1xx.c:23:
>> drivers/net/dsa/lantiq/mxl-gsw1xx.h:14:49: error: array index range in initializer exceeds array bounds
      14 | #define GSW1XX_MII_PORT                         5
         |                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:708:18: note: in expansion of macro 'GSW1XX_MII_PORT'
     708 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS] = -1,
         |                  ^~~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.h:14:49: note: (near initialization for 'gsw12x_data.mii_cfg')
      14 | #define GSW1XX_MII_PORT                         5
         |                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:708:18: note: in expansion of macro 'GSW1XX_MII_PORT'
     708 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS] = -1,
         |                  ^~~~~~~~~~~~~~~
>> drivers/net/dsa/lantiq/mxl-gsw1xx.h:14:49: error: array index range in initializer exceeds array bounds
      14 | #define GSW1XX_MII_PORT                         5
         |                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:713:18: note: in expansion of macro 'GSW1XX_MII_PORT'
     713 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS] = -1,
         |                  ^~~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.h:14:49: note: (near initialization for 'gsw12x_data.mii_pcdu')
      14 | #define GSW1XX_MII_PORT                         5
         |                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:713:18: note: in expansion of macro 'GSW1XX_MII_PORT'
     713 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS] = -1,
         |                  ^~~~~~~~~~~~~~~
   In file included from drivers/net/dsa/lantiq/mxl-gsw1xx.c:22:
   drivers/net/dsa/lantiq/lantiq_gswip.h:60:41: warning: initialized field overwritten [-Woverride-init]
      60 | #define GSWIP_MII_CFGp(p)               (0x2 * (p))
         |                                         ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:749:37: note: in expansion of macro 'GSWIP_MII_CFGp'
     749 |                 [GSW1XX_MII_PORT] = GSWIP_MII_CFGp(0),
         |                                     ^~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/lantiq_gswip.h:60:41: note: (near initialization for 'gsw141_data.mii_cfg[5]')
      60 | #define GSWIP_MII_CFGp(p)               (0x2 * (p))
         |                                         ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:749:37: note: in expansion of macro 'GSWIP_MII_CFGp'
     749 |                 [GSW1XX_MII_PORT] = GSWIP_MII_CFGp(0),
         |                                     ^~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:750:65: warning: initialized field overwritten [-Woverride-init]
     750 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS - 1] = -1,
         |                                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:750:65: note: (near initialization for 'gsw141_data.mii_cfg[6]')
   drivers/net/dsa/lantiq/lantiq_gswip.h:80:41: warning: initialized field overwritten [-Woverride-init]
      80 | #define GSWIP_MII_PCDU0                 0x01
         |                                         ^~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:754:37: note: in expansion of macro 'GSWIP_MII_PCDU0'
     754 |                 [GSW1XX_MII_PORT] = GSWIP_MII_PCDU0,
         |                                     ^~~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/lantiq_gswip.h:80:41: note: (near initialization for 'gsw141_data.mii_pcdu[5]')
      80 | #define GSWIP_MII_PCDU0                 0x01
         |                                         ^~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:754:37: note: in expansion of macro 'GSWIP_MII_PCDU0'
     754 |                 [GSW1XX_MII_PORT] = GSWIP_MII_PCDU0,
         |                                     ^~~~~~~~~~~~~~~
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:755:65: warning: initialized field overwritten [-Woverride-init]
     755 |                 [GSW1XX_MII_PORT + 1 ... GSWIP_MAX_PORTS - 1] = -1,
         |                                                                 ^
   drivers/net/dsa/lantiq/mxl-gsw1xx.c:755:65: note: (near initialization for 'gsw141_data.mii_pcdu[6]')


vim +14 drivers/net/dsa/lantiq/mxl-gsw1xx.h

22335939ec907c Daniel Golle 2025-11-03  11  
22335939ec907c Daniel Golle 2025-11-03  12  #define GSW1XX_PORTS				6
22335939ec907c Daniel Golle 2025-11-03  13  /* Port used for RGMII or optional RMII */
22335939ec907c Daniel Golle 2025-11-03 @14  #define GSW1XX_MII_PORT				5
22335939ec907c Daniel Golle 2025-11-03  15  /* Port used for SGMII */
22335939ec907c Daniel Golle 2025-11-03  16  #define GSW1XX_SGMII_PORT			4
22335939ec907c Daniel Golle 2025-11-03  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
