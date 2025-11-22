Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809581C84A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763807524; cv=none; b=YKqMl/AFwltDYkr+x5y4c6KoE85H0Gwb0yp2RHPeybM/qMC/KmBYsSUkdY6NX8ybGROL1mcHBoYmVKhxjSn8vTulCKbNgmoVvEt1trd89C+Tqiw4slb7v60s6K/5knzRQ5iUdcJLWF8EM2bgo5TWYwzOJcGFj/hERdvioQE4adc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763807524; c=relaxed/simple;
	bh=wpdyCFZbk7NVeZvDHyBA6YIaYgqFxFMIT40Zw2qft9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A+gEmROdYUATZkb0qOYcMUtCFTGvho0PCN7xh2UrCpNSlTVJSXjZfaxcDuj9WaaqW0wBCbzdOUCnJtvUhAUGOUnQbgldnyRbdMUapwON2/3p8ucxibEXAhA3De9WMJd2IWqRWdqicirWbzVXPKSIGRzdnLCqsVIyhls2bxV/tbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JizNm2M6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JizNm2M6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763807523; x=1795343523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wpdyCFZbk7NVeZvDHyBA6YIaYgqFxFMIT40Zw2qft9A=;
  b=JizNm2M69HOnJpJoXa+2UcEu42lYNqm65vLO4IV+zqhUvSZWFsUehkJC
   OBuIer2iz3pcLhtqHcmmiDfOIYHrjI2hQKr1b/Va3jwMYRzfNSvFbKArq
   z0DtpiCZlu7XSuMUpjMafJqZmRYXQuCPBh84Cn+OSrAA+RYKnQwArf6q2
   0CilteqNEV34ezKtG31R3EpxB8jLcVRmsL8ebTfFEtrx1aHMeR444f7HY
   r8K5gtykCY3DObE07Bq7pvHroxI5IonH0Vo/CSrLsVfiHw2/Ey26orNDb
   GXAAhNPQMCyzANLeBSJ7URq65J2AvCdNdwol0kPPSe4kM2GwzgwpfHFQF
   Q==;
X-CSE-ConnectionGUID: Kjr6Mq5TTR2JlZRf1ZF4hQ==
X-CSE-MsgGUID: XikxVhgPR5ylwSuorPRp/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="88539584"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="88539584"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:32:03 -0800
X-CSE-ConnectionGUID: xbXfXHmXQBqLtdxObvlFkQ==
X-CSE-MsgGUID: eSHHYEuIRVGMiBPqgygvYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="229203826"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2025 02:32:01 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMkuL-0007Pf-2h;
	Sat, 22 Nov 2025 10:31:57 +0000
Date: Sat, 22 Nov 2025 18:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tobias Sperling <tobias.sperling@softing.com>
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: Re: [PATCH 2/2] iio: adc: Add ti-ads1x18 driver
Message-ID: <202511221834.DmWdWn3a-lkp@intel.com>
References: <20251121-ads1x18-v1-2-86db080fc9a4@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-ads1x18-v1-2-86db080fc9a4@gmail.com>

Hi Kurt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f9e05791642810a0cf6237d39fafd6fec5e0b4bb]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/dt-bindings-iio-adc-Add-TI-ADS1018-ADS1118/20251122-012031
base:   f9e05791642810a0cf6237d39fafd6fec5e0b4bb
patch link:    https://lore.kernel.org/r/20251121-ads1x18-v1-2-86db080fc9a4%40gmail.com
patch subject: [PATCH 2/2] iio: adc: Add ti-ads1x18 driver
config: openrisc-randconfig-r131-20251122 (https://download.01.org/0day-ci/archive/20251122/202511221834.DmWdWn3a-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221834.DmWdWn3a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511221834.DmWdWn3a-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ti-ads1x18.c:237:16: sparse: sparse: cast to restricted __be16
>> drivers/iio/adc/ti-ads1x18.c:244:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short @@     got restricted __be16 [usertype] @@
   drivers/iio/adc/ti-ads1x18.c:244:28: sparse:     expected unsigned short
   drivers/iio/adc/ti-ads1x18.c:244:28: sparse:     got restricted __be16 [usertype]
   drivers/iio/adc/ti-ads1x18.c:788:15: sparse: sparse: cast to restricted __be16
   drivers/iio/adc/ti-ads1x18.c:813:15: sparse: sparse: cast to restricted __be16

vim +237 drivers/iio/adc/ti-ads1x18.c

   226	
   227	static int __ads1x18_read_conver(struct ads1x18 *ads1x18, u16 *cnv)
   228	{
   229		int ret;
   230	
   231		ads1x18->tx_buf[0] = 0;
   232		ads1x18->tx_buf[1] = 0;
   233		ret = spi_sync_locked(ads1x18->spi, &ads1x18->message);
   234		if (ret)
   235			return ret;
   236	
 > 237		*cnv = be16_to_cpu(ads1x18->rx_buf[0]);
   238	
   239		return 0;
   240	}
   241	
   242	static int __ads1x18_write_config(struct ads1x18 *ads1x18, u16 cfg)
   243	{
 > 244		ads1x18->tx_buf[0] = cpu_to_be16(cfg);
   245		ads1x18->tx_buf[1] = 0;
   246	
   247		return spi_sync_locked(ads1x18->spi, &ads1x18->message);
   248	}
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
