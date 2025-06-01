Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05C4A08
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748738646; cv=none; b=hraSB7fwGbrIemLJmztNba5UebQ8Rxsh9hw74XGZWuDMkKVIJUbfMNWFtBXpRBeCbuFVWZNBPSpI8mZRH3T4t2MJpa11hA0Yl3ZnJ5Rib4NH/s0yB7tfm3EVsgKn1J9c7DjvJ+VkH72PMy4/t3H6huXCQK4box5/OU4grOTDF7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748738646; c=relaxed/simple;
	bh=+XLbk0n0OfYAxcie9FwOpfe8nvjleRVKH+GsU+88GpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEkfcKNZwZeSFojZul3Vxse8vIonq0M4Yg2mqXnESNPE0WSljiNYYvZneRw25dNDmoeP2n+xHgiMuphWPJZZzDccUqFs0FXLKWuy7VbGSMXC4M2uYnBe2lHm5kKGK3zeoAZH3Li1RahawYpWGu/1hcc1JTlJjEW9v1yBq2gmBRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqeVGlum; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqeVGlum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748738644; x=1780274644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+XLbk0n0OfYAxcie9FwOpfe8nvjleRVKH+GsU+88GpA=;
  b=YqeVGlumlvG4S0rvDXaJ4P7CzXov/TfhqKqeNWePYcozmvSoW917vclx
   6eQNRPvKZL6teHZpO//oI3AI8Nc1kq9vdwVhjgd81HsMq/eO87yzW4EiL
   mBTJIpw+S1lXp6FwTHbsjlrmeGg/JzcZpX+NQWqzqhTqvZFMBJNnuB2E+
   MEFt3PasHUK9pgNymat5DsVyOQcRtFkIuPGmfbfeIXGnVZbtTtCLa5hqD
   hpDWyLQREu+YTkB+O9Wh9u/Owim0SNTn0HbEN6AfoevMM9TOAXgurqWTG
   WYvgslnUYv58K1C9SdCcLJu6M6cSb/TO2tmbZroljEFOV06zq2m7zvGFY
   g==;
X-CSE-ConnectionGUID: 2tfARTntTByy9ym0N767Dw==
X-CSE-MsgGUID: 4RPE0ZvaRKW+IPYAsVGHUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61462298"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="61462298"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 17:44:04 -0700
X-CSE-ConnectionGUID: i2wdyA9nQrOl+Mo+fCeU0A==
X-CSE-MsgGUID: 4NM9+RmbTUiZtnjxSRYRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="148087216"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2025 17:44:02 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLWnw-000Yie-0T;
	Sun, 01 Jun 2025 00:44:00 +0000
Date: Sun, 1 Jun 2025 08:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Lamparter <chunkeey@gmail.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1] spi: push HAS_IOMEM dependency down to the drivers
Message-ID: <202506010837.XIuxozSA-lkp@intel.com>
References: <20250530234941.950431-1-chunkeey@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530234941.950431-1-chunkeey@gmail.com>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on linus/master next-20250530]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Lamparter/spi-push-HAS_IOMEM-dependency-down-to-the-drivers/20250531-075211
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250530234941.950431-1-chunkeey%40gmail.com
patch subject: [PATCH v1] spi: push HAS_IOMEM dependency down to the drivers
config: s390-kismet-CONFIG_MFD_OCELOT-CONFIG_NET_DSA_MSCC_OCELOT_EXT-0-0 (https://download.01.org/0day-ci/archive/20250601/202506010837.XIuxozSA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250601/202506010837.XIuxozSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010837.XIuxozSA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for MFD_OCELOT when selected by NET_DSA_MSCC_OCELOT_EXT
   WARNING: unmet direct dependencies detected for MFD_OCELOT
     Depends on [n]: HAS_IOMEM [=n] && SPI_MASTER [=y]
     Selected by [y]:
     - NET_DSA_MSCC_OCELOT_EXT [=y] && NETDEVICES [=y] && NET_DSA [=y] && SPI [=y] && NET_VENDOR_MICROSEMI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]
   
   WARNING: unmet direct dependencies detected for MDIO_MSCC_MIIM
     Depends on [n]: NETDEVICES [=y] && MDIO_DEVICE [=y] && MDIO_BUS [=y] && HAS_IOMEM [=n] && REGMAP_MMIO [=y]
     Selected by [y]:
     - NET_DSA_MSCC_OCELOT_EXT [=y] && NETDEVICES [=y] && NET_DSA [=y] && SPI [=y] && NET_VENDOR_MICROSEMI [=y] && PTP_1588_CLOCK_OPTIONAL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
