Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD0C1E52B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 22:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395748; cv=none; b=bqe8Yd2gE41kT2YIj7LXm/741FU8h3OBcwE9oFjMA8oWhzwpWC+HUs+G6LkmSQVr4N2GD4xKP/pHN8erd81lpjGPw/wTP6NoPSqkNx3DN6lanjXbFijTp3JDZfW4KWtW1vRfl2xvRMuOk8JEcjApGOwq5Sa8+nJBHoTXTKRQM7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395748; c=relaxed/simple;
	bh=FbPze8HhY/xsklIKldqKUR1sgQ6Rn5CkHNQmKMhwkOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5btXsNNFeHKMbXmdS15vMbjjceP7qDCLWb5JL56OeHEAvKUa2NxLFiP7vyRRakp9eh0gx+JOzs+UisFmDFXT5DxvQ+YAM2tcdzdhFxiKm90YyBAIS8V1tIWz/vmF2LMGEAcU3Am+1sBq79O6Z4CwEUiJ69gkZSnZlTHN47dIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOiACPU+; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOiACPU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706395746; x=1737931746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbPze8HhY/xsklIKldqKUR1sgQ6Rn5CkHNQmKMhwkOQ=;
  b=IOiACPU+WX6a6xjcLyd7QwbIzDwdvi9iVxBC7SZq+oAXWGFNL39lhjoT
   wAm4BLWIstxee2NCwfuSufmX+aF5R2tHCfdqD/Qci0DuNpWGGETFZ/zP6
   zcUPoECrXH0kUnzaC/XQ0wQy5sQeu7fY4aoSpG2pjOfOeuzVK6xpGJbFt
   D8BsoXpTWVj6eSnPMGwOsCHG7CsGY8W5qioL2hIeXgTeMo2E2c8fWbgLi
   Jh19WpN0H8cnuUWnNdphdB00Df2RryUEalntwtD5aWKbvMXP0PBJech/O
   SiJCp2vIWcAShGcZkuHzygZ7g0LYpjOsZyUKwpncIOmWfWKNsf083GHIM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393147529"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393147529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 14:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29152735"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jan 2024 14:49:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTrTx-0002oq-36;
	Sat, 27 Jan 2024 22:49:01 +0000
Date: Sun, 28 Jan 2024 06:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Popa <stefan.popa@analog.com>, Nuno Sa <nuno.sa@analog.com>
Subject: [jic23-iio:testing 49/62] drivers/iio/adc/ad7380.c:205:28: sparse:
 sparse: symbol 'ad7380_regmap_config' was not declared. Should it be static?
Message-ID: <202401280629.5kknB57C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   1380d453434e276355458e712c743dd071ca1fa7
commit: b93eb80bcbfcc83c8be426db0890d2afb73dcc95 [49/62] iio: adc: ad7380: new driver for AD7380 ADCs
config: x86_64-randconfig-121-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280629.5kknB57C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280629.5kknB57C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280629.5kknB57C-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad7380.c:205:28: sparse: sparse: symbol 'ad7380_regmap_config' was not declared. Should it be static?
>> drivers/iio/adc/ad7380.c:353:34: sparse: sparse: dubious: x & !y

vim +/ad7380_regmap_config +205 drivers/iio/adc/ad7380.c

   204	
 > 205	const struct regmap_config ad7380_regmap_config = {
   206		.reg_bits = 3,
   207		.val_bits = 12,
   208		.reg_read = ad7380_regmap_reg_read,
   209		.reg_write = ad7380_regmap_reg_write,
   210		.max_register = AD7380_REG_ADDR_ALERT_HIGH_TH,
   211		.can_sleep = true,
   212	};
   213	
   214	static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
   215					     u32 writeval, u32 *readval)
   216	{
   217		struct ad7380_state *st = iio_priv(indio_dev);
   218		int ret;
   219	
   220		ret = iio_device_claim_direct_mode(indio_dev);
   221		if (ret)
   222			return ret;
   223	
   224		if (readval)
   225			ret = regmap_read(st->regmap, reg, readval);
   226		else
   227			ret = regmap_write(st->regmap, reg, writeval);
   228	
   229		iio_device_release_direct_mode(indio_dev);
   230	
   231		return ret;
   232	}
   233	
   234	static irqreturn_t ad7380_trigger_handler(int irq, void *p)
   235	{
   236		struct iio_poll_func *pf = p;
   237		struct iio_dev *indio_dev = pf->indio_dev;
   238		struct ad7380_state *st = iio_priv(indio_dev);
   239		struct spi_transfer xfer = {
   240			.bits_per_word = st->chip_info->channels[0].scan_type.realbits,
   241			.len = 4,
   242			.rx_buf = st->scan_data.raw,
   243		};
   244		int ret;
   245	
   246		ret = spi_sync_transfer(st->spi, &xfer, 1);
   247		if (ret)
   248			goto out;
   249	
   250		iio_push_to_buffers_with_timestamp(indio_dev, &st->scan_data,
   251						   pf->timestamp);
   252	
   253	out:
   254		iio_trigger_notify_done(indio_dev->trig);
   255	
   256		return IRQ_HANDLED;
   257	}
   258	
   259	static int ad7380_read_direct(struct ad7380_state *st,
   260				      struct iio_chan_spec const *chan, int *val)
   261	{
   262		struct spi_transfer xfers[] = {
   263			/* toggle CS (no data xfer) to trigger a conversion */
   264			{
   265				.speed_hz = AD7380_REG_WR_SPEED_HZ,
   266				.bits_per_word = chan->scan_type.realbits,
   267				.delay = {
   268					.value = 190, /* t[CONVERT] */
   269					.unit = SPI_DELAY_UNIT_NSECS,
   270				},
   271				.cs_change = 1,
   272				.cs_change_delay = {
   273					.value = 10, /* t[CSH] */
   274					.unit = SPI_DELAY_UNIT_NSECS,
   275				},
   276			},
   277			/* then read both channels */
   278			{
   279				.speed_hz = AD7380_REG_WR_SPEED_HZ,
   280				.bits_per_word = chan->scan_type.realbits,
   281				.rx_buf = &st->rx[0],
   282				.len = 4,
   283			},
   284		};
   285		int ret;
   286	
   287		ret = spi_sync_transfer(st->spi, xfers, ARRAY_SIZE(xfers));
   288		if (ret < 0)
   289			return ret;
   290	
   291		*val = sign_extend32(st->rx[chan->scan_index],
   292				     chan->scan_type.realbits - 1);
   293	
   294		return IIO_VAL_INT;
   295	}
   296	
   297	static int ad7380_read_raw(struct iio_dev *indio_dev,
   298				   struct iio_chan_spec const *chan,
   299				   int *val, int *val2, long info)
   300	{
   301		struct ad7380_state *st = iio_priv(indio_dev);
   302		int ret;
   303	
   304		switch (info) {
   305		case IIO_CHAN_INFO_RAW:
   306			ret = iio_device_claim_direct_mode(indio_dev);
   307			if (ret)
   308				return ret;
   309	
   310			ret = ad7380_read_direct(st, chan, val);
   311			iio_device_release_direct_mode(indio_dev);
   312	
   313			return ret;
   314		case IIO_CHAN_INFO_SCALE:
   315			if (st->vref) {
   316				ret = regulator_get_voltage(st->vref);
   317				if (ret < 0)
   318					return ret;
   319	
   320				*val = ret / 1000;
   321			} else {
   322				*val = AD7380_INTERNAL_REF_MV;
   323			}
   324	
   325			*val2 = chan->scan_type.realbits;
   326	
   327			return IIO_VAL_FRACTIONAL_LOG2;
   328		}
   329	
   330		return -EINVAL;
   331	}
   332	
   333	static const struct iio_info ad7380_info = {
   334		.read_raw = &ad7380_read_raw,
   335		.debugfs_reg_access = &ad7380_debugfs_reg_access,
   336	};
   337	
   338	static int ad7380_init(struct ad7380_state *st)
   339	{
   340		int ret;
   341	
   342		/* perform hard reset */
   343		ret = regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
   344					 AD7380_CONFIG2_RESET,
   345					 FIELD_PREP(AD7380_CONFIG2_RESET,
   346						    AD7380_CONFIG2_RESET_HARD));
   347		if (ret < 0)
   348			return ret;
   349	
   350		/* select internal or external reference voltage */
   351		ret = regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG1,
   352					 AD7380_CONFIG1_REFSEL,
 > 353					 FIELD_PREP(AD7380_CONFIG1_REFSEL, !!st->vref));
   354		if (ret < 0)
   355			return ret;
   356	
   357		/* SPI 1-wire mode */
   358		return regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
   359					  AD7380_CONFIG2_SDO,
   360					  FIELD_PREP(AD7380_CONFIG2_SDO, 1));
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
