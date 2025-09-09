Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C459350830
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429777; cv=none; b=Z86fj8LP1F6i7nqBoe6CAwBi/RGOQGUPnPViSA+Lc93J22BZfMEhW2KPIRbSd2cm0Zvaq6Ot8fc9BTMWBgX5q4FQ20H6oQ1U7QoIbAytNmD4/p4tvbezTcQNlRJmsGQpBpiqG7h8/Mmb8Vpy1Ja4khMO5TBnKY7DUuWVpesXU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429777; c=relaxed/simple;
	bh=P2RiVV9OO9gKFqLMsH8LzKPstcfnfZpmFWY2kQTsM7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d93xkDz35bd/7Ykj81M+CIFD4CXSsjXAX8g9SgYfT/RTNASbJyzDXut6lToMLi354Q/uWJNUxdmQ4qeAUhaGyvzi5WdqlP7EvCWTxGVHdh2zsREvsgw4SjYuOkFDI0GL+tBr2/NP7AcFx0U4oVveFmdgLpA8rYcrHAIXaypLRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNAcUYPx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNAcUYPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757429775; x=1788965775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2RiVV9OO9gKFqLMsH8LzKPstcfnfZpmFWY2kQTsM7s=;
  b=gNAcUYPx/m6KAhN3lGJLmXejjCipdP7jHur4cYV3ltt7eCItH5l+SiEX
   71c5GBVReIGgrhWejz8Op9J7vjyGct5tELrELHGlaTsRgQncaqudKUWtG
   TRM34/SMxvYQMtTRspW12T1J1CjcwXgVpaTY2MZymdgHShMMKk3DY+SQ4
   H9AQQYMVrq25KUlx4U+s9Dj+Prz1CDBP3geSgQAsf5bZPzwDrBBvfuZMV
   a6cHwHmyVkCm4K1D6YIZ1qMAHAo1Nw+X+Ji0qXUqJYTbxz9Fi1i9tKmJF
   bRYkdJ85TBQ/hfKRiBwWlp5qwRihsdcmt5/iHeGHRz1TYYMig2LvRI2D9
   A==;
X-CSE-ConnectionGUID: xUXToewESbukGavZ7omZXg==
X-CSE-MsgGUID: 0vxc/ZZ1RuObnx6NKOtKEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59780628"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59780628"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 07:56:13 -0700
X-CSE-ConnectionGUID: jqdgL587QQK3O4KwXJBxsg==
X-CSE-MsgGUID: My5l/R+lTS28aOjk4q7CxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="173228445"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Sep 2025 07:56:12 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvzlR-0004xX-2U;
	Tue, 09 Sep 2025 14:56:09 +0000
Date: Tue, 9 Sep 2025 22:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ioana Risteiu <Ioana.Risteiu@analog.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [linux-next:master 4425/7427] drivers/iio/adc/ad7779.c:644:undefined
 reference to `iio_backend_chan_enable'
Message-ID: <202509092211.N6B8XbDf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   65dd046ef55861190ecde44c6d9fcde54b9fb77d
commit: 711fb4e410288eaef896ef2ba91e63b8ffdf25f1 [4425/7427] iio: adc: update ad7779 to use IIO backend
config: arm-randconfig-003-20250908 (https://download.01.org/0day-ci/archive/20250909/202509092211.N6B8XbDf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509092211.N6B8XbDf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509092211.N6B8XbDf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.o: in function `ad7779_update_scan_mode':
>> drivers/iio/adc/ad7779.c:644:(.text+0xcc): undefined reference to `iio_backend_chan_enable'
>> arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.c:646:(.text+0xd4): undefined reference to `iio_backend_chan_disable'
   arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.o: in function `ad7779_set_data_lines':
>> drivers/iio/adc/ad7779.c:795:(.text+0x3128): undefined reference to `iio_backend_num_lanes_set'
   arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.o: in function `ad7779_setup_backend':
>> drivers/iio/adc/ad7779.c:881:(.text+0x3514): undefined reference to `devm_iio_backend_get'
>> arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.c:886:(.text+0x35d0): undefined reference to `devm_iio_backend_request_buffer'
>> arm-linux-gnueabi-ld: drivers/iio/adc/ad7779.c:890:(.text+0x3608): undefined reference to `devm_iio_backend_enable'


vim +644 drivers/iio/adc/ad7779.c

   634	
   635	static int ad7779_update_scan_mode(struct iio_dev *indio_dev,
   636					   const unsigned long *scan_mask)
   637	{
   638		struct ad7779_state *st = iio_priv(indio_dev);
   639		unsigned int c;
   640		int ret;
   641	
   642		for (c = 0; c < AD7779_NUM_CHANNELS; c++) {
   643			if (test_bit(c, scan_mask))
 > 644				ret = iio_backend_chan_enable(st->back, c);
   645			else
 > 646				ret = iio_backend_chan_disable(st->back, c);
   647			if (ret)
   648				return ret;
   649		}
   650	
   651		return 0;
   652	}
   653	
   654	static const struct iio_info ad7779_info = {
   655		.read_raw = ad7779_read_raw,
   656		.write_raw = ad7779_write_raw,
   657		.debugfs_reg_access = &ad7779_reg_access,
   658	};
   659	
   660	static const struct iio_info ad7779_info_data = {
   661		.read_raw = ad7779_read_raw,
   662		.write_raw = ad7779_write_raw,
   663		.debugfs_reg_access = &ad7779_reg_access,
   664		.update_scan_mode = &ad7779_update_scan_mode,
   665	};
   666	
   667	static const struct iio_enum ad7779_filter_enum = {
   668		.items = ad7779_filter_type,
   669		.num_items = ARRAY_SIZE(ad7779_filter_type),
   670		.get = ad7779_get_filter,
   671		.set = ad7779_set_filter,
   672	};
   673	
   674	static const struct iio_chan_spec_ext_info ad7779_ext_filter[] = {
   675		IIO_ENUM("filter_type", IIO_SHARED_BY_ALL, &ad7779_filter_enum),
   676		IIO_ENUM_AVAILABLE("filter_type", IIO_SHARED_BY_ALL,
   677					  &ad7779_filter_enum),
   678		{ }
   679	};
   680	
   681	#define AD777x_CHAN_S(index, _ext_info)					\
   682		{								\
   683			.type = IIO_VOLTAGE,					\
   684			.info_mask_separate = BIT(IIO_CHAN_INFO_CALIBSCALE)  |	\
   685					      BIT(IIO_CHAN_INFO_CALIBBIAS),	\
   686			.info_mask_shared_by_all = BIT(IIO_CHAN_INFO_SAMP_FREQ),\
   687			.address = (index),					\
   688			.indexed = 1,						\
   689			.channel = (index),					\
   690			.scan_index = (index),					\
   691			.ext_info = (_ext_info),				\
   692			.scan_type = {						\
   693				.sign = 's',					\
   694				.realbits = 24,					\
   695				.storagebits = 32,				\
   696				.endianness = IIO_BE,				\
   697			},							\
   698		}
   699	
   700	#define AD777x_CHAN_NO_FILTER_S(index)					\
   701		AD777x_CHAN_S(index, NULL)
   702	
   703	#define AD777x_CHAN_FILTER_S(index)					\
   704		AD777x_CHAN_S(index, ad7779_ext_filter)
   705	static const struct iio_chan_spec ad7779_channels[] = {
   706		AD777x_CHAN_NO_FILTER_S(0),
   707		AD777x_CHAN_NO_FILTER_S(1),
   708		AD777x_CHAN_NO_FILTER_S(2),
   709		AD777x_CHAN_NO_FILTER_S(3),
   710		AD777x_CHAN_NO_FILTER_S(4),
   711		AD777x_CHAN_NO_FILTER_S(5),
   712		AD777x_CHAN_NO_FILTER_S(6),
   713		AD777x_CHAN_NO_FILTER_S(7),
   714		IIO_CHAN_SOFT_TIMESTAMP(8),
   715	};
   716	
   717	static const struct iio_chan_spec ad7779_channels_filter[] = {
   718		AD777x_CHAN_FILTER_S(0),
   719		AD777x_CHAN_FILTER_S(1),
   720		AD777x_CHAN_FILTER_S(2),
   721		AD777x_CHAN_FILTER_S(3),
   722		AD777x_CHAN_FILTER_S(4),
   723		AD777x_CHAN_FILTER_S(5),
   724		AD777x_CHAN_FILTER_S(6),
   725		AD777x_CHAN_FILTER_S(7),
   726		IIO_CHAN_SOFT_TIMESTAMP(8),
   727	};
   728	
   729	static const struct iio_buffer_setup_ops ad7779_buffer_setup_ops = {
   730		.preenable = ad7779_buffer_preenable,
   731		.postdisable = ad7779_buffer_postdisable,
   732	};
   733	
   734	static const struct iio_trigger_ops ad7779_trigger_ops = {
   735		.validate_device = iio_trigger_validate_own_device,
   736	};
   737	
   738	static int ad7779_conf(struct ad7779_state *st, struct gpio_desc *start_gpio)
   739	{
   740		int ret;
   741	
   742		ret = ad7779_spi_write_mask(st, AD7779_REG_GEN_ERR_REG_1_EN,
   743					    AD7779_SPI_CRC_EN_MSK,
   744					    FIELD_PREP(AD7779_SPI_CRC_EN_MSK, 1));
   745		if (ret)
   746			return ret;
   747	
   748		ret = ad7779_spi_write_mask(st, AD7779_REG_GENERAL_USER_CONFIG_1,
   749					    AD7779_USRMOD_INIT_MSK,
   750					    FIELD_PREP(AD7779_USRMOD_INIT_MSK, 5));
   751		if (ret)
   752			return ret;
   753	
   754		ret = ad7779_spi_write_mask(st, AD7779_REG_DOUT_FORMAT,
   755					    AD7779_DCLK_CLK_DIV_MSK,
   756					    FIELD_PREP(AD7779_DCLK_CLK_DIV_MSK, 1));
   757		if (ret)
   758			return ret;
   759	
   760		ret = ad7779_spi_write_mask(st, AD7779_REG_ADC_MUX_CONFIG,
   761					    AD7779_REFMUX_CTRL_MSK,
   762					    FIELD_PREP(AD7779_REFMUX_CTRL_MSK, 1));
   763		if (ret)
   764			return ret;
   765	
   766		ret = ad7779_set_sampling_frequency(st, AD7779_DEFAULT_SAMPLING_FREQ);
   767		if (ret)
   768			return ret;
   769	
   770		gpiod_set_value(start_gpio, 0);
   771		/* Start setup time */
   772		fsleep(15);
   773		gpiod_set_value(start_gpio, 1);
   774		/* Start setup time */
   775		fsleep(15);
   776		gpiod_set_value(start_gpio, 0);
   777		/* Start setup time */
   778		fsleep(15);
   779	
   780		return 0;
   781	}
   782	
   783	static int ad7779_set_data_lines(struct iio_dev *indio_dev, u32 num_lanes)
   784	{
   785		struct ad7779_state *st = iio_priv(indio_dev);
   786		int ret;
   787	
   788		if (num_lanes != 1 && num_lanes != 2 && num_lanes != 4)
   789			return -EINVAL;
   790	
   791		ret = ad7779_set_sampling_frequency(st, num_lanes * AD7779_DEFAULT_SAMPLING_1LINE);
   792		if (ret)
   793			return ret;
   794	
 > 795		ret = iio_backend_num_lanes_set(st->back, num_lanes);
   796		if (ret)
   797			return ret;
   798	
   799		return ad7779_spi_write_mask(st, AD7779_REG_DOUT_FORMAT,
   800					     AD7779_DOUT_FORMAT_MSK,
   801					     FIELD_PREP(AD7779_DOUT_FORMAT_MSK, 2 - ilog2(num_lanes)));
   802	}
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
