Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130E79E1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 01:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739063858; cv=none; b=Dp0CyIrmrzOoTMfx5qpYDyoNC4sZrs2do7lpFU+ur0yMqE1uV3BXKhTLOu1acv42Hv0YjWCz1SXAo9fYd05kLi0Lbr481HLCJfRu1MbvNkil6nT7UImncpAWC4WiRlErOJQuoze1KpIItv/UEAs8+XPmEClNxrdtyDQnOmi2Fhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739063858; c=relaxed/simple;
	bh=9Gf49JWJdD6f5laYVcZsJbhxoybotaijyssWJR/Tirg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcN3a1pTf2kgfMurN4aR66b5Y2DctC9IgL8Db7xbJtakfCeuepETH4Qbv70yBvHTIQMj1nfiz8pSMQCM9rrnpjuRsloJRnOmTuu3eqzs3ZkzpJ5GYPJq3Pcchjum2M+hQoNnUCHdzyAY52OEmSWEsfafgPcQ9KUuETG0U4WfTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2v5JP/8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2v5JP/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739063857; x=1770599857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Gf49JWJdD6f5laYVcZsJbhxoybotaijyssWJR/Tirg=;
  b=b2v5JP/8q1VKYYUjEzPe7pe5HQccI1Gv3NK94q3lZg0hx1cqBnXLrVI+
   v5ZuOBiqFfBpS6BuZ4xIncGE/W7STnvxo9gx4geuljivyGT4UI4FRSpR4
   2gStpLN2eGgxRTkHbC/6rSAWjUL6OVkRX+BSDacAo0XoirfgVmSmavkEl
   cSgjVsJCI1r9NDuuN5fi5dq+rnwUBa3viU7lSkYmfA9gy/0BQLRtjrw2W
   JvikxXwJR7b5K9hBKUUSNAgrU4BKCGjIB7qzI/x3oH49yOQq4kl1W2mmv
   ow/nxUwL/v1rlwHytf1C9N5xN9Z8JectnIKqNqBZs+0QsMpFLwufsrnhZ
   g==;
X-CSE-ConnectionGUID: v4WOYIKaSwuaE0sfF3SkKQ==
X-CSE-MsgGUID: 0zjRFwmKTemaTkppy7WiFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="51064513"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="51064513"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 17:17:32 -0800
X-CSE-ConnectionGUID: EV2pi5L2T1ONdxsKo2ljZg==
X-CSE-MsgGUID: 5K7v83M5Tr+I4w84fRIZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117063035"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 17:17:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgvwu-0010sd-1X;
	Sun, 09 Feb 2025 01:17:28 +0000
Date: Sun, 9 Feb 2025 09:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 14/17] iio: adc: ad4695: Add support for SPI offload
Message-ID: <202502090910.ganYXEeF-lkp@intel.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c@baylibre.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 884697cc74d9fea0a8628c2794d0b80065ac95d1]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/spi-add-basic-support-for-SPI-offloading/20250208-041627
base:   884697cc74d9fea0a8628c2794d0b80065ac95d1
patch link:    https://lore.kernel.org/r/20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c%40baylibre.com
patch subject: [PATCH v8 14/17] iio: adc: ad4695: Add support for SPI offload
config: x86_64-buildonly-randconfig-002-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090910.ganYXEeF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090910.ganYXEeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090910.ganYXEeF-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/iio/adc/ad4695.o: in function `ad4695_offload_trigger_request':
>> ad4695.c:(.text+0xcbf): undefined reference to `spi_offload_trigger_get_priv'
   ld: drivers/iio/adc/ad4695.o: in function `ad4695_offload_buffer_postenable':
>> ad4695.c:(.text+0x2a6e): undefined reference to `spi_offload_trigger_enable'
>> ld: ad4695.c:(.text+0x2ad6): undefined reference to `spi_offload_trigger_disable'
   ld: ad4695.c:(.text+0x2bef): undefined reference to `spi_offload_trigger_disable'
   ld: drivers/iio/adc/ad4695.o: in function `ad4695_offload_buffer_predisable':
>> ad4695.c:(.text+0x2df4): undefined reference to `spi_offload_trigger_disable'
   ld: drivers/iio/adc/ad4695.o: in function `ad4695_probe_spi_offload':
>> ad4695.c:(.text+0x340e): undefined reference to `devm_spi_offload_trigger_register'
>> ld: ad4695.c:(.text+0x345b): undefined reference to `devm_spi_offload_trigger_get'
>> ld: ad4695.c:(.text+0x36ed): undefined reference to `devm_spi_offload_rx_stream_request_dma_chan'
   ld: drivers/iio/adc/ad4695.o: in function `ad4695_probe':
>> ad4695.c:(.text+0x4fc8): undefined reference to `devm_spi_offload_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
