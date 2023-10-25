Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE07D30CE3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQZAlisW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698254664; x=1729790664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mIbb037174+bOdznRrZiyWuHxU4yCQHlYl1BOSUWzbw=;
  b=jQZAlisWqtByMDGB+tlixJFyj2G3MtJMQUlAq+bNll+HyslVhhQHoy7Y
   wJFM2KAcbtP+AcXmfiTB7rhLuBZHMD7+66qo/GRfby7cYBhAQ49xtj9Ox
   0G0LjBrLXRWnWEkj3aSEUIB+dlgOHXW1NKwkDO28wfhyUOOYk3RrKYJjV
   l/3Mx9gr+0JIeEwc0Du1jwEEL3BkRM080RDmk3w0HKFPq5A+4sZLc3xZi
   LHQe4a1mTEqhtMpuEuUz2FvDuf+SX6YvAiqXitEN3grvfsJx1ONE0V04r
   egtDmCMffDEHp2tQJhmTWjMFx2S61iK0z1ZZCtW9rPNCboPfnd/e+sI06
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="139641"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="139641"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 10:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="824715376"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="824715376"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Oct 2023 10:24:20 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvhcA-000945-1S;
	Wed, 25 Oct 2023 17:24:18 +0000
Date: Thu, 26 Oct 2023 01:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: marius.cristea@microchip.com, jic23@kernel.org, lars@metafoo.de,
	robh+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	marius.cristea@microchip.com
Subject: Re: [PATCH v2 2/2] iio: adc: adding support for pac193x
Message-ID: <202310260114.N4b9wmIC-lkp@intel.com>
References: <20231025134404.131485-3-marius.cristea@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025134404.131485-3-marius.cristea@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5e99f692d4e32e3250ab18d511894ca797407aec]

url:    https://github.com/intel-lab-lkp/linux/commits/marius-cristea-microchip-com/dt-bindings-iio-adc-adding-dt-bindings-for-PAC193X/20231025-214558
base:   5e99f692d4e32e3250ab18d511894ca797407aec
patch link:    https://lore.kernel.org/r/20231025134404.131485-3-marius.cristea%40microchip.com
patch subject: [PATCH v2 2/2] iio: adc: adding support for pac193x
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231026/202310260114.N4b9wmIC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310260114.N4b9wmIC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310260114.N4b9wmIC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/pac1934.c:1751:36: warning: 'pac1934_acpi_match' defined but not used [-Wunused-const-variable=]
    1751 | static const struct acpi_device_id pac1934_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/pac1934_acpi_match +1751 drivers/iio/adc/pac1934.c

  1749	
  1750	/* using MCHP1930 to be compatible with WINDOWS ACPI */
> 1751	static const struct acpi_device_id pac1934_acpi_match[] = {
  1752		{"MCHP1930", 0},
  1753		{ }
  1754	};
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
