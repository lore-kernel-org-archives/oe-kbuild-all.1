Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2977B24BC1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 22:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749680390; cv=none; b=eoUdtv1c37HL0yGSKYXvl54WydLYogsAe7ImXMVwqaon7yZ8v6oN+uRskE0/jIUo1e2BD2h2rbO+kngKpqtk7S3sGdR/ONhF/lbrrGk3Tx8kOYKUkNy0/744ccbFSqzmmmthvj4YBCRql7s24H7XI53HLMBCbNdYTZy+PL5IEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749680390; c=relaxed/simple;
	bh=wdxumVoCLJh+JMH/3Nh+7BhbG0x4FmGjuT4dteTeG34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xl8itW2w5iBRCwe/8SA27QN9wDlsuUHpVA06gg7Y9AFTXL9uv6v48jbVe8GZx1LXZCp+WZ1T5q9gBScT/WGtG1wiMXiqY5i2441/jv1wqnYVwK9UTekJ+1QkOh6kwt3WuZvBvuN8mgouwiwHxZ/fjgf98bPL2BKRbjE6+8AuZ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+AZrdtk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+AZrdtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749680385; x=1781216385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wdxumVoCLJh+JMH/3Nh+7BhbG0x4FmGjuT4dteTeG34=;
  b=k+AZrdtkABy9GhzRskkDzRXfa11KOV7AODWSksh83R9qglTmPFHhxZ//
   9tUxYZUiT+cd73Bm4y+2T27sJKmEKS/pktQfC2dcMieos8ePMEawDqfXq
   OiQBfJ1Pf31F5A4u66RKUys16s5mGJD0HkuNKdqeV7ekbQCLxUZeivIzN
   J49Qw8upx1OdCUT0twirzXuEEtxfoi3u2KSH46MhKP3eswpHSyxOW0Gxe
   X85K5ptTGTgfNKPhCHgpGIKYWHmW1D1vzwU6P0nU/jmJ97ye1rqqhwMBi
   o+X4Yf0Zvkdjy6t6AJIOLgNTug6+ybebekXUSk7H17II+bkO64cbdmk02
   A==;
X-CSE-ConnectionGUID: mc5KAGpJRCGAY7L6aNY4wQ==
X-CSE-MsgGUID: Z2cWOgwwRzOHbF/CPzZYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51717611"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="51717611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 15:19:45 -0700
X-CSE-ConnectionGUID: n3Gn2FfVQuGQfZa8mq2jOw==
X-CSE-MsgGUID: 5nLAmQBUSYWRx003nnH4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147315997"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 15:19:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPTnE-000Ati-1g;
	Wed, 11 Jun 2025 22:19:36 +0000
Date: Thu, 12 Jun 2025 06:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org,
	Kory Maincent <kory.maincent@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Simon Horman <horms@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Robert Hancock <robert.hancock@calian.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [net-next PATCH v6 07/10] net: axienet: Convert to use PCS
 subsystem
Message-ID: <202506120616.NvIbQEgS-lkp@intel.com>
References: <20250610233134.3588011-8-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610233134.3588011-8-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-net-Add-Xilinx-PCS/20250611-143544
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250610233134.3588011-8-sean.anderson%40linux.dev
patch subject: [net-next PATCH v6 07/10] net: axienet: Convert to use PCS subsystem
config: alpha-kismet-CONFIG_OF_DYNAMIC-CONFIG_XILINX_AXI_EMAC_PCS_COMPAT-0-0 (https://download.01.org/0day-ci/archive/20250612/202506120616.NvIbQEgS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250612/202506120616.NvIbQEgS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120616.NvIbQEgS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for OF_DYNAMIC when selected by XILINX_AXI_EMAC_PCS_COMPAT
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
     Depends on [n]: OF [=n]
     Selected by [y]:
     - XILINX_AXI_EMAC [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && HAS_IOMEM [=y] && XILINX_DMA [=y]
     - XILINX_AXI_EMAC_PCS_COMPAT [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_XILINX [=y] && XILINX_AXI_EMAC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
