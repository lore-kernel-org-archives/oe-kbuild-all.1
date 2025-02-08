Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19413198E81
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026872; cv=none; b=fLknXaGM8QXgT41hGnAzp1gscz19JAW5C9Fh1lgrIGxHqnp+ELgq5q2KDJxOAnN1ujv6Dyhh7xkn0VtL4c4sdIVS5HGTWJkd4e3BeCGRawJyDQS7kRtFaAXywX1JJ7K7g35Xdz4o+nIEcQw6oJeGbRCf9LQhEaQ1yR5ekFeHQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026872; c=relaxed/simple;
	bh=NdyAAf6GyRIXYNO+8tX/B4fov4AYb1C4ZbTHaJeOH1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnuTBcgdscmZYY8gjZzQcLo0ISOaSKO7TLvxithoQOTO6BU/V/Q5k6BGY7nxjxXxT91kztC6ez1AP54qDuGqPK/w9BwaV8KiGo0zZcVX/fydfCDfZ5xubjw1JWDTZMRqGFQ2I+LcOIhdhDuk0m1oSu9a16iEIM2LnmwMdacgq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq+QAOnh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq+QAOnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026871; x=1770562871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdyAAf6GyRIXYNO+8tX/B4fov4AYb1C4ZbTHaJeOH1A=;
  b=Kq+QAOnhGo6hUiyZ+K4IcEWGqwsD55H+eB4mPu5MNlKghWQna9ljXlkF
   CS48dp3/1Lb0t6M5NVwL44pkLlpEerYlI0tpNQiTvluIjvoK3WsVK52Xu
   Ob/3M+6fB9ZrYdNCkSj/eFo/whK0Za7idlbS5Hzura7P3lVHb6agtUynK
   UIW6UkD7ygEaLGb6tWRx/fXqtj1Xbe1MF9PHhkTXaBLZUHPv/+LFlFoJW
   A/m4T9+H3p7umedMtJdUxPcQ455jEP3chu17rPRXXUO910vXe2Gvs8WRE
   DrwzZzCdQGdEyUJDP3H2NPW4PP/SsOEe8taBNS7fdmWZlk0OmRF90xKo2
   w==;
X-CSE-ConnectionGUID: pTZd0Nw1Rfarcc4MoJoFOA==
X-CSE-MsgGUID: 8rH7TK7RRNa1tV2PA1DpKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39783849"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39783849"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:10 -0800
X-CSE-ConnectionGUID: A+cB1XugSZ6bLcwgbautbw==
X-CSE-MsgGUID: u2EVAjcxTAu8SDCSn9Qm+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111613878"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:01:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-00109D-1j;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 11/17] iio: adc: ad7944: add support for SPI offload
Message-ID: <202502082251.NuHT15R7-lkp@intel.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c@baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c@baylibre.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 884697cc74d9fea0a8628c2794d0b80065ac95d1]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/spi-add-basic-support-for-SPI-offloading/20250208-041627
base:   884697cc74d9fea0a8628c2794d0b80065ac95d1
patch link:    https://lore.kernel.org/r/20250207-dlech-mainline-spi-engine-offload-2-v8-11-e48a489be48c%40baylibre.com
patch subject: [PATCH v8 11/17] iio: adc: ad7944: add support for SPI offload
config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082251.NuHT15R7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082251.NuHT15R7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082251.NuHT15R7-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "devm_iio_dmaengine_buffer_setup_with_handle" [drivers/iio/adc/ad7944.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
