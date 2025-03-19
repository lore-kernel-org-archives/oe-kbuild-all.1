Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB82F41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742369453; cv=none; b=vBvkSx/5WyWx7zHP7pVAh52Gvf0HBZF/eZQPoSPqfaBKoMIW0tFTujbdUb6+jZl4DBaZuQsxvpesdqiv7yS7qIz1QPYljR43PdnzPuHTvMlOaOYApzHgwhXyaxUHJMrTnVrWN1HANidrDm2xwVV/ZuW3JuDEeatTr/+pRXL1xeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742369453; c=relaxed/simple;
	bh=FxtC/71fN/jp/PoF5VZjaLvhgxA0JMySg0asGVugZiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QF9rX9ywxa5XrmMxTDIlyNrgGwf/tURQVdnphqNGc+TjseQ69qfNei0VmfPV4Pc/fIRKClyz/cTvPjLpg6+FmCXcl8KNiRJ/nAWQ7/de5hIhjD/EiFPTcFECFXe4ySm5krZiWuqb7pKTXgVx7PTOfqLRTOPhghC/rsPUERzYvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHliuxGr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHliuxGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742369451; x=1773905451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FxtC/71fN/jp/PoF5VZjaLvhgxA0JMySg0asGVugZiw=;
  b=EHliuxGrjNx86NOxSoHVfi7J4KxKqNJfqiu9xlnBVOat7k/szFTPnTC3
   QG6qZQJkLvTyNdIvQwMkRB7EUBoyYChu8iMWl051srj2NFD0NFOrj0NL+
   605q6QdlCmnIpilXGBahBJhLA7QKIrDdJzZnww5KX76fU2gvcJqAyopCA
   9yjcxTDdV2WTu9QgkK/BORcYsiHc7dpl6GPiIaNrmsLCoOTXZeR14l+R1
   97b9FNYOJMUjSDtYn1ueYrtJpE9g/bnE4TYgwpsyH5fm5uiF6hP9S1Zxp
   3lJyF5VWPwXF+ZNPoy5uLbGIQjqvFtsm9li1MmtAoUKgdDaRTVmvFlKPA
   A==;
X-CSE-ConnectionGUID: yaRJifqGR7+IJsWDevgTrw==
X-CSE-MsgGUID: zdsmXfi4RL6LPXhzJLSeXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43432895"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="43432895"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 00:30:50 -0700
X-CSE-ConnectionGUID: 1iz6noMLTAmaXS5ZH9g+TQ==
X-CSE-MsgGUID: Ox48mh8SSXysE0m7BRG7yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="145695654"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2025 00:30:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tunsz-000ETO-2r;
	Wed, 19 Mar 2025 07:30:45 +0000
Date: Wed, 19 Mar 2025 15:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: marius.cristea@microchip.com, jic23@kernel.org, lars@metafoo.de,
	robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, krzk+dt@kernel.org, conor+dt@kernel.org,
	oskar.andero@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	marius.cristea@microchip.com
Subject: Re: [PATCH v2 2/2] iio: adc: adding support for PAC194X
Message-ID: <202503191502.hwDCBZeN-lkp@intel.com>
References: <20250317090803.30003-3-marius.cristea@microchip.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317090803.30003-3-marius.cristea@microchip.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 577a66e2e634f712384c57a98f504c44ea4b47da]

url:    https://github.com/intel-lab-lkp/linux/commits/marius-cristea-microchip-com/dt-bindings-iio-adc-adding-support-for-PAC194X/20250317-171150
base:   577a66e2e634f712384c57a98f504c44ea4b47da
patch link:    https://lore.kernel.org/r/20250317090803.30003-3-marius.cristea%40microchip.com
patch subject: [PATCH v2 2/2] iio: adc: adding support for PAC194X
config: microblaze-randconfig-r131-20250319 (https://download.01.org/0day-ci/archive/20250319/202503191502.hwDCBZeN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250319/202503191502.hwDCBZeN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503191502.hwDCBZeN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/pac1944.c:813:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [assigned] [usertype] tmp_be16 @@
   drivers/iio/adc/pac1944.c:813:55: sparse:     expected unsigned short [usertype] value
   drivers/iio/adc/pac1944.c:813:55: sparse:     got restricted __be16 [assigned] [usertype] tmp_be16
>> drivers/iio/adc/pac1944.c:2148:80: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [addressable] [assigned] [usertype] tmp_be16 @@
   drivers/iio/adc/pac1944.c:2148:80: sparse:     expected unsigned short [usertype] value
   drivers/iio/adc/pac1944.c:2148:80: sparse:     got restricted __be16 [addressable] [assigned] [usertype] tmp_be16
>> drivers/iio/adc/pac1944.c:2936:79: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] @@
   drivers/iio/adc/pac1944.c:2936:79: sparse:     expected unsigned short [usertype] value
   drivers/iio/adc/pac1944.c:2936:79: sparse:     got restricted __be16 [usertype]
   drivers/iio/adc/pac1944.c:2953:72: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __be16 [usertype] @@
   drivers/iio/adc/pac1944.c:2953:72: sparse:     expected unsigned short [usertype] value
   drivers/iio/adc/pac1944.c:2953:72: sparse:     got restricted __be16 [usertype]

vim +813 drivers/iio/adc/pac1944.c

   794	
   795	static int pac1944_update_alert_16b(struct device *dev, u8 addr,
   796					    u32 mask, u16 value)
   797	{
   798		struct iio_dev *indio_dev = dev_to_iio_dev(dev);
   799		struct pac1944_chip_info *info = iio_priv(indio_dev);
   800		struct i2c_client *client = info->client;
   801		int ret;
   802		__be16 tmp_be16;
   803		u8 status[PAC1944_ALERT_ENABLE_REG_LEN];
   804	
   805		ret = pac1944_disable_alert_reg(dev, mask, &status[0]);
   806		if (ret) {
   807			dev_err(dev, "failing to write %s\n", __func__);
   808			return ret;
   809		}
   810	
   811		tmp_be16 = cpu_to_be16(value);
   812	
 > 813		ret = i2c_smbus_write_word_data(client, addr, tmp_be16);
   814		if (ret) {
   815			dev_err(dev, "failing to write %s\n", __func__);
   816			return ret;
   817		}
   818	
   819		return pac1944_restore_alert_reg(indio_dev, &status[0]);
   820	}
   821	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
