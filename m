Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D6649625
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720023; cv=none; b=EDpOxC5Ei19xDsGGtxoSGrx+D5Hv1HoJjdO5whkCmc4NByKRSKTrzo2LsmT3AAiKWRJpTsWSn4jQAQcgXASBCNS7v8hgVJK9fPrGVTtvA6MnaUmRdT74TaJUpIZq6j12eWWg4xCp2+Wh2/ZpSMu9gWrjjh72mDn5VYbOnuz3Ayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720023; c=relaxed/simple;
	bh=PQ7V6rD2P9x39nmk7eDs9I41Sn0gC/uQ92B893rTars=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Exeb1LUWoVEuRoZMvFnZErMX80i+h5KeH9RmNjy258TzlRecEJMwNnqmDRx/gX2H3A0YwTAOwh2+RZzFwsh6S2XESX0pO4IYN44zNL4DjVyR9W217afpILErW364vWYIk094HoxKbHiuObI4jiA09rRP+ZqBlu6zadFtL/PrXWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fU6K/7xx; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fU6K/7xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733720022; x=1765256022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PQ7V6rD2P9x39nmk7eDs9I41Sn0gC/uQ92B893rTars=;
  b=fU6K/7xxXOi1bxExEGverkCJWi+mGEwOeI6X8Fpxhts0Ep6KyxZGgOiT
   mBOW9+Q6G7iMo2DFYd3j2LgKhPd58WEeOpYjPo69Sb0H7aspyA0mqztD/
   f4O/SFewI3z+pFQknEqRz+uopIplv5IDZI2pxMz99oyFjdATKbSHP2Kg8
   ZirM74mqNbJhOMsQwcunQKGeMyGhG1U4YVwEsvIKp9fV9IFiDWzfu3xFI
   SGU7IXm1qoY0r03oX8MTIH0NIHkRqFFK3korfNbrHybXL4vWHTHtYcqEI
   q/CSq803+osusAsuYxE59hqS0M3caIs1f5X7MckYHWYW4pEOQTN9smWD1
   w==;
X-CSE-ConnectionGUID: NhghsJC6QFGW70qXA+kAFA==
X-CSE-MsgGUID: 4C3b7F5lS1CHzCjN5Cm9TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416603"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416603"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:53:41 -0800
X-CSE-ConnectionGUID: AQQ/g/CCTre82Y36bGKeFA==
X-CSE-MsgGUID: 3ZUJf1htRMmBDfg/PRTF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95407551"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:53:40 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVm5-0003w5-2o;
	Mon, 09 Dec 2024 04:53:37 +0000
Date: Mon, 9 Dec 2024 12:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 70/70] drivers/iio/adc/ad7124.c:973:2-3: Unneeded
 semicolon
Message-ID: <202412090110.LhEsqiLF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   8a31d35bedeefcd56f64a732b636d12d054d8555
commit: 8a31d35bedeefcd56f64a732b636d12d054d8555 [70/70] iio: adc: ad7124: Implement temperature measurement
config: m68k-randconfig-r053-20241208 (https://download.01.org/0day-ci/archive/20241209/202412090110.LhEsqiLF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412090110.LhEsqiLF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad7124.c:973:2-3: Unneeded semicolon

vim +973 drivers/iio/adc/ad7124.c

   857	
   858	static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
   859					       struct device *dev)
   860	{
   861		struct ad7124_state *st = iio_priv(indio_dev);
   862		struct ad7124_channel_config *cfg;
   863		struct ad7124_channel *channels;
   864		struct iio_chan_spec *chan;
   865		unsigned int ain[2], channel = 0, tmp;
   866		unsigned int num_channels;
   867		int ret;
   868	
   869		num_channels = device_get_child_node_count(dev);
   870	
   871		/*
   872		 * The driver assigns each logical channel defined in the device tree
   873		 * statically one channel register. So only accept 16 such logical
   874		 * channels to not treat CONFIG_0 (i.e. the register following
   875		 * CHANNEL_15) as an additional channel register. The driver could be
   876		 * improved to lift this limitation.
   877		 */
   878		if (num_channels > AD7124_MAX_CHANNELS)
   879			return dev_err_probe(dev, -EINVAL, "Too many channels defined\n");
   880	
   881		/* Add one for temperature */
   882		st->num_channels = min(num_channels + 1, AD7124_MAX_CHANNELS);
   883	
   884		chan = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
   885				    sizeof(*chan), GFP_KERNEL);
   886		if (!chan)
   887			return -ENOMEM;
   888	
   889		channels = devm_kcalloc(indio_dev->dev.parent, st->num_channels, sizeof(*channels),
   890					GFP_KERNEL);
   891		if (!channels)
   892			return -ENOMEM;
   893	
   894		indio_dev->channels = chan;
   895		indio_dev->num_channels = st->num_channels;
   896		st->channels = channels;
   897	
   898		device_for_each_child_node_scoped(dev, child) {
   899			ret = fwnode_property_read_u32(child, "reg", &channel);
   900			if (ret)
   901				return dev_err_probe(dev, ret,
   902						     "Failed to parse reg property of %pfwP\n", child);
   903	
   904			if (channel >= num_channels)
   905				return dev_err_probe(dev, -EINVAL,
   906						     "Channel index >= number of channels in %pfwP\n", child);
   907	
   908			ret = fwnode_property_read_u32_array(child, "diff-channels",
   909							     ain, 2);
   910			if (ret)
   911				return dev_err_probe(dev, ret,
   912						     "Failed to parse diff-channels property of %pfwP\n", child);
   913	
   914			if (!ad7124_valid_input_select(ain[0], st->chip_info) ||
   915			    !ad7124_valid_input_select(ain[1], st->chip_info))
   916				return dev_err_probe(dev, -EINVAL,
   917						     "diff-channels property of %pfwP contains invalid data\n", child);
   918	
   919			st->channels[channel].nr = channel;
   920			st->channels[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
   921							  AD7124_CHANNEL_AINM(ain[1]);
   922	
   923			cfg = &st->channels[channel].cfg;
   924			cfg->bipolar = fwnode_property_read_bool(child, "bipolar");
   925	
   926			ret = fwnode_property_read_u32(child, "adi,reference-select", &tmp);
   927			if (ret)
   928				cfg->refsel = AD7124_INT_REF;
   929			else
   930				cfg->refsel = tmp;
   931	
   932			cfg->buf_positive =
   933				fwnode_property_read_bool(child, "adi,buffered-positive");
   934			cfg->buf_negative =
   935				fwnode_property_read_bool(child, "adi,buffered-negative");
   936	
   937			chan[channel] = ad7124_channel_template;
   938			chan[channel].address = channel;
   939			chan[channel].scan_index = channel;
   940			chan[channel].channel = ain[0];
   941			chan[channel].channel2 = ain[1];
   942		}
   943	
   944		if (num_channels < AD7124_MAX_CHANNELS) {
   945			st->channels[num_channels] = (struct ad7124_channel) {
   946				.nr = num_channels,
   947				.ain = AD7124_CHANNEL_AINP(AD7124_INPUT_TEMPSENSOR) |
   948					AD7124_CHANNEL_AINM(AD7124_INPUT_AVSS),
   949				.cfg = {
   950					.bipolar = true,
   951				},
   952			};
   953	
   954			chan[num_channels] = (struct iio_chan_spec) {
   955				.type = IIO_TEMP,
   956				.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |
   957					BIT(IIO_CHAN_INFO_SCALE) | BIT(IIO_CHAN_INFO_OFFSET) |
   958					BIT(IIO_CHAN_INFO_SAMP_FREQ),
   959				.scan_type = {
   960					/*
   961					 * You might find it strange that a bipolar
   962					 * measurement yields an unsigned value, but
   963					 * this matches the device's manual.
   964					 */
   965					.sign = 'u',
   966					.realbits = 24,
   967					.storagebits = 32,
   968					.endianness = IIO_BE,
   969				},
   970				.address = num_channels,
   971				.scan_index = num_channels,
   972			};
 > 973		};
   974	
   975		return 0;
   976	}
   977	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
