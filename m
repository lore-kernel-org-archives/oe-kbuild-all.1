Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5A170A0B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316552; cv=none; b=Cz1UJ3WjyChBSwA2bA5Wh4gc/wLcervCXDJKerlI6hk0ob1brwZkXUOA09p6CFvWTgqmRUos6oQaqVS/+Bba/4S/rskNESLbpvyHararWye2Uyel+uow0xibMz7NSF4DJgmA+5AnGNWOSto01zihNRQz7WUbnPfbtuFOUg5Joek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316552; c=relaxed/simple;
	bh=4SorxWmczYWyGtKRkGL9aWjQEhQUjC9PUa+Uys2aHLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NOgkIZSu3g7qpFYcco+2osqvCaH7DjEPRSsaIMem+GZ0MYQjCnA87j/BGEVxL29TpP/rjtNhY8KA3UYNw6bPVDCJndOyPAJwSQ74kU1O5BVJ7Qt+RKo6o5sdo74C1cELqARf1LF4KUAHcqljWhcPZVasxtOOVm5IURbQ7fh9FoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vev2MPnF; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vev2MPnF"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso701308766b.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Nov 2024 01:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316549; x=1731921349; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1VCSi35Pnpy+RJV8R2Tk+aJNEVKY/wjSPAZ8KQBt7fA=;
        b=vev2MPnF0nuPNqVsiIwC4SDHy7XD1oXGBZqdkpe2PN13Hl/cUXEnP19SkBh21tpzDt
         2zQcLDmJuyM3kWj/AQxjSLG3uM0Sktm6aiBiuSagpnfy2dnCYOV0CgISYfolJDDhaoVQ
         7PLs1xHomtVaLl3GJ/dS/Npc0CFN/lhcRh2oH+fV7ip/c2FMijhJP408HEOps08uGGPS
         xqEs2NkkudewL1fYbjX9Nin4rk15TYPhDwRy37RVy4oWbnnqH+etYzGTlufcLkeSoP8L
         xAwI5cRySalvheguv9/uJcbCtWz7WLsrPxLiSpn3LY3wsd1dWnlgizFYcHEKCHek44eD
         ngnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316549; x=1731921349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VCSi35Pnpy+RJV8R2Tk+aJNEVKY/wjSPAZ8KQBt7fA=;
        b=DzhNamy2kbxwQ/cb3m/PN7T/XiJ8Ow2XDioJw6e3ZJm96oMRY2okE81LN7HXTllPXs
         2NXsBYbskBZsYfNTQnpfSKmlX4/GimBpHZ3r/up5ZifAOU4pXhYIYRr34OiepsGTM+kh
         9n0rfJNGdatQUJXftmyxcwtOuY0ifrMAnFH/TH6Wd9WFD26A4KuapvZ+GFBwCeWfSWe6
         LDLCBf39Nln9ov+brZXkhG7C5cpveMTS9moP9QdnrG7ppps9s7rWq9dPpXTICC2RpuCN
         mty0DToyPYxEV9p2ym4VQkZK98y0R3f4lgXRTI8KZmUmZxd93PeNTJQhUhze6HOuW3Rl
         wVvA==
X-Forwarded-Encrypted: i=1; AJvYcCWxKVidmQUUedScgpBFpeRL+oVPtQ0V0+xBBsoyhCNhneDPmSp0XgjAPTraTj7NJ65HhQPczE6s21TtHm2C@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt1qZMuAMMJZta1CLB9/dvqGV8d0b5D8mm+UlRWIrpNFhVn/Hz
	XsjT/unNIxY3lyTyoENFh9Xf1p1xCKzpL4nwO1586Kpjub2QlSZUCjt13hd1Gaw=
X-Google-Smtp-Source: AGHT+IFVeptHZM3VciSUgGtQ56bFk2XkT0Mi7Rva5vLWFJ1y6IwY1Wq4YpuShO2BdrGmAAe9jorzcA==
X-Received: by 2002:a17:907:2dab:b0:a99:f975:2e6 with SMTP id a640c23a62f3a-a9eeff3772amr1158164366b.35.1731316548829;
        Mon, 11 Nov 2024 01:15:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4c210sm569183966b.78.2024.11.11.01.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:15:48 -0800 (PST)
Date: Mon, 11 Nov 2024 12:15:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mircea Caprioru <mircea.caprioru@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibe.com>
Subject: Re: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
Message-ID: <bb25249b-62b8-4d7f-9ef3-cb5e1f8674ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108181813.272593-6-u.kleine-koenig@baylibre.com>

Hi Uwe,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/iio-adc-ad7124-Don-t-create-more-channels-than-the-hardware-is-capable-of/20241109-022036
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241108181813.272593-6-u.kleine-koenig%40baylibre.com
patch subject: [PATCH 2/2] iio: adc: ad7124: Refuse invalid input specifiers
config: i386-randconfig-141-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090908.Ynrg4eS0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411090908.Ynrg4eS0-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7124.c:874 ad7124_parse_channel_config() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +874 drivers/iio/adc/ad7124.c

a6eaf02b82744b Jonathan Cameron  2024-02-18  824  static int ad7124_parse_channel_config(struct iio_dev *indio_dev,
a6eaf02b82744b Jonathan Cameron  2024-02-18  825  				       struct device *dev)
b3af341bbd9662 Stefan Popa       2018-11-13  826  {
b3af341bbd9662 Stefan Popa       2018-11-13  827  	struct ad7124_state *st = iio_priv(indio_dev);
7b8d045e497a04 Alexandru Tachici 2021-03-11  828  	struct ad7124_channel_config *cfg;
7b8d045e497a04 Alexandru Tachici 2021-03-11  829  	struct ad7124_channel *channels;
b3af341bbd9662 Stefan Popa       2018-11-13  830  	struct iio_chan_spec *chan;
b3af341bbd9662 Stefan Popa       2018-11-13  831  	unsigned int ain[2], channel = 0, tmp;
b3af341bbd9662 Stefan Popa       2018-11-13  832  	int ret;
b3af341bbd9662 Stefan Popa       2018-11-13  833  
a6eaf02b82744b Jonathan Cameron  2024-02-18  834  	st->num_channels = device_get_child_node_count(dev);
a6eaf02b82744b Jonathan Cameron  2024-02-18  835  	if (!st->num_channels)
a6eaf02b82744b Jonathan Cameron  2024-02-18  836  		return dev_err_probe(dev, -ENODEV, "no channel children\n");
b3af341bbd9662 Stefan Popa       2018-11-13  837  
b478bd5e22404e Uwe Kleine-König  2024-11-08  838  	if (st->num_channels > AD7124_MAX_CHANNELS) {
b478bd5e22404e Uwe Kleine-König  2024-11-08  839  		dev_warn(dev, "Limit number of channels to " __stringify(AD7124_MAX_CHANNELS) "\n");
b478bd5e22404e Uwe Kleine-König  2024-11-08  840  		st->num_channels = AD7124_MAX_CHANNELS;
b478bd5e22404e Uwe Kleine-König  2024-11-08  841  	}
b478bd5e22404e Uwe Kleine-König  2024-11-08  842  
b3af341bbd9662 Stefan Popa       2018-11-13  843  	chan = devm_kcalloc(indio_dev->dev.parent, st->num_channels,
b3af341bbd9662 Stefan Popa       2018-11-13  844  			    sizeof(*chan), GFP_KERNEL);
b3af341bbd9662 Stefan Popa       2018-11-13  845  	if (!chan)
b3af341bbd9662 Stefan Popa       2018-11-13  846  		return -ENOMEM;
b3af341bbd9662 Stefan Popa       2018-11-13  847  
7b8d045e497a04 Alexandru Tachici 2021-03-11  848  	channels = devm_kcalloc(indio_dev->dev.parent, st->num_channels, sizeof(*channels),
7b8d045e497a04 Alexandru Tachici 2021-03-11  849  				GFP_KERNEL);
7b8d045e497a04 Alexandru Tachici 2021-03-11  850  	if (!channels)
1478a388f4baaa Mircea Caprioru   2019-06-25  851  		return -ENOMEM;
1478a388f4baaa Mircea Caprioru   2019-06-25  852  
b3af341bbd9662 Stefan Popa       2018-11-13  853  	indio_dev->channels = chan;
b3af341bbd9662 Stefan Popa       2018-11-13  854  	indio_dev->num_channels = st->num_channels;
7b8d045e497a04 Alexandru Tachici 2021-03-11  855  	st->channels = channels;
b3af341bbd9662 Stefan Popa       2018-11-13  856  
a6eaf02b82744b Jonathan Cameron  2024-02-18  857  	device_for_each_child_node_scoped(dev, child) {
a6eaf02b82744b Jonathan Cameron  2024-02-18  858  		ret = fwnode_property_read_u32(child, "reg", &channel);
b3af341bbd9662 Stefan Popa       2018-11-13  859  		if (ret)
a6eaf02b82744b Jonathan Cameron  2024-02-18  860  			return ret;
b3af341bbd9662 Stefan Popa       2018-11-13  861  
a6eaf02b82744b Jonathan Cameron  2024-02-18  862  		if (channel >= indio_dev->num_channels)
a6eaf02b82744b Jonathan Cameron  2024-02-18  863  			return dev_err_probe(dev, -EINVAL,
f2a772c51206b0 Jonathan Cameron  2021-05-13  864  				"Channel index >= number of channels\n");
f2a772c51206b0 Jonathan Cameron  2021-05-13  865  
a6eaf02b82744b Jonathan Cameron  2024-02-18  866  		ret = fwnode_property_read_u32_array(child, "diff-channels",
b3af341bbd9662 Stefan Popa       2018-11-13  867  						     ain, 2);
b3af341bbd9662 Stefan Popa       2018-11-13  868  		if (ret)
a6eaf02b82744b Jonathan Cameron  2024-02-18  869  			return ret;
b3af341bbd9662 Stefan Popa       2018-11-13  870  
4112b30ba58b5c Uwe Kleine-König  2024-11-08  871  		if (!ad7124_valid_input_select(ain[0], st->chip_info) ||
4112b30ba58b5c Uwe Kleine-König  2024-11-08  872  		    !ad7124_valid_input_select(ain[1], st->chip_info))
4112b30ba58b5c Uwe Kleine-König  2024-11-08  873  			return dev_err_probe(dev, ret,

s/ret/-EINVAL/?

4112b30ba58b5c Uwe Kleine-König  2024-11-08 @874  					     "diff-channels property of %pfwP contains invalid data\n", child);
4112b30ba58b5c Uwe Kleine-König  2024-11-08  875  
7b8d045e497a04 Alexandru Tachici 2021-03-11  876  		st->channels[channel].nr = channel;
7b8d045e497a04 Alexandru Tachici 2021-03-11  877  		st->channels[channel].ain = AD7124_CHANNEL_AINP(ain[0]) |
b3af341bbd9662 Stefan Popa       2018-11-13  878  						  AD7124_CHANNEL_AINM(ain[1]);
7b8d045e497a04 Alexandru Tachici 2021-03-11  879  
61cbfb5368dd50 Dumitru Ceclan    2024-08-06  880  		cfg = &st->channels[channel].cfg;
a6eaf02b82744b Jonathan Cameron  2024-02-18  881  		cfg->bipolar = fwnode_property_read_bool(child, "bipolar");
b3af341bbd9662 Stefan Popa       2018-11-13  882  
a6eaf02b82744b Jonathan Cameron  2024-02-18  883  		ret = fwnode_property_read_u32(child, "adi,reference-select", &tmp);
b3af341bbd9662 Stefan Popa       2018-11-13  884  		if (ret)
7b8d045e497a04 Alexandru Tachici 2021-03-11  885  			cfg->refsel = AD7124_INT_REF;
b3af341bbd9662 Stefan Popa       2018-11-13  886  		else
7b8d045e497a04 Alexandru Tachici 2021-03-11  887  			cfg->refsel = tmp;
b3af341bbd9662 Stefan Popa       2018-11-13  888  
a6eaf02b82744b Jonathan Cameron  2024-02-18  889  		cfg->buf_positive =
a6eaf02b82744b Jonathan Cameron  2024-02-18  890  			fwnode_property_read_bool(child, "adi,buffered-positive");
a6eaf02b82744b Jonathan Cameron  2024-02-18  891  		cfg->buf_negative =
a6eaf02b82744b Jonathan Cameron  2024-02-18  892  			fwnode_property_read_bool(child, "adi,buffered-negative");
0eaecea6e4878a Mircea Caprioru   2019-06-25  893  
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  894  		chan[channel] = ad7124_channel_template;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  895  		chan[channel].address = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  896  		chan[channel].scan_index = channel;
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  897  		chan[channel].channel = ain[0];
d7857e4ee1ba69 Alexandru Tachici 2019-12-20  898  		chan[channel].channel2 = ain[1];
b3af341bbd9662 Stefan Popa       2018-11-13  899  	}
b3af341bbd9662 Stefan Popa       2018-11-13  900  
b3af341bbd9662 Stefan Popa       2018-11-13  901  	return 0;
b3af341bbd9662 Stefan Popa       2018-11-13  902  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

