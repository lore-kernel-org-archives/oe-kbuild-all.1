Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142DE2D77EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 06:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754894802; cv=none; b=akJsD6uU2Flqz2votlXHUiOSvg7bY7Ipo2PHagh/icfQA8URztFdsiZq9LeKQ82/b9lz9KSgakzEnqQNyX9/SIjZg51OH8zOyXncUIMmM5KwjiqKit4yf6Ud9T5Nr3JjGWYuOTsRC19lFgdIFNVAkJkN0HFn0x6tlYV8iITEoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754894802; c=relaxed/simple;
	bh=jBo5UANno+XfA29YPINf2MeDmdVe/2QnIWuOgjuDJGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WTy3VLl/YXEQjjdyb5h9wFCydhJGt6i1sGpmfq0ms0xNFYo2jBL+S1ZmaiWX/k5vp+QJAFbj6TJ8qUULC3fPrsFITNbvo/OSkOSSXaHgI5rDy5zizxVuSbttjjhYI8Pf7zY1frWDmZ04Ct4ukuRwawgYGpYKCzu9hrOWc7RFAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEf4wJdn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEf4wJdn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b7892609a5so2196632f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Aug 2025 23:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754894798; x=1755499598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rZI4IZrSEWJ+0JsUHQ5F8RKmssnmQDDF0w+or3Wom0Y=;
        b=qEf4wJdnjxr52NdbQV2DtrQmS2zJAABAqmaYyVPRoekTPmXeS+DEWUJCGQjhIxlTIx
         OLFKtJgZP2aLrnyfkNANK1Nb/lIa8fb7W5Gi4JCkjWn0sSOlUQQfxZbVnsAmr+TRNrkb
         z1/cL6D/3XA52YBzePKljbt9911HMI6Gn5G0aPgEtlQUD0vaEw+uRRBrStRnVuuUmN8j
         XhNFQPTEcwezmfXCXPRdqvUGPpZi7N1+jrbezYBWhPd/ISKAfGcWssGEbZWOmBY7KtKG
         itVBr2IbAdUpPXmIlcHZ+quXREh9vSIYKPLr6wqkP8LIG5rt5O+a48aqZWN2XcmVH/1h
         Do7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754894798; x=1755499598;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZI4IZrSEWJ+0JsUHQ5F8RKmssnmQDDF0w+or3Wom0Y=;
        b=DhEV76Vv1t/aoV1DTb+YeaUv4jzLwSNuFvt9qH6TTdMl9zgB2LZX62+OpJ+iuTTFGW
         17ct8Tza2/3CPSw68ljl2kWkFyczM1lpNM1g9AeHxiPHbWS5vK+HBnRo/0G4u8WcL9Uw
         yj+HATj6Z3PvhkPL2ADJ5WDuCMSZ3e1ThPdV+8Yo5G/BfnXRnT2y3BAcpk5+TC+0l6+r
         1E8mjJp9TaAHuI5Ghb2H+n2MtTYUO4QCHspXZqo5GIqM+j88Jl24cBPb2I3LqS2QIdKV
         FXVaGgJiqIpRDfsOgJG3KLMq/4sXKr4XwArAnzQmE8jIc0oMmrhNmClUTJqFXgzyoXiJ
         v0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCU54XY5+ty8mAHU61dxEmD74GzebvLTtDi2UvRpC1t9G/aGvpbsnh1qSbix3e4Ag5iesKrq+sarZKpNblxh@lists.linux.dev
X-Gm-Message-State: AOJu0Ywme7OmvA8DQ4Syr5YJCyPuYlG0sigrIu5vgM/9YS6X3dLPBuG4
	CLYTMHZLqy6WOnbFZ+AbwbwhxsSGy0A0Te34Ooz6cLw9JwHtlIPBNCGV36KNRmZhqLA=
X-Gm-Gg: ASbGncvBZwSlBXrfBlcZ77V8+/x8jfPy9vKEqrN27jCD4VqagXAWyYI0oBpzL2F5q8e
	tOslU2s1tjK7EngXVWMwfTvtt/ODh46w42GdQlAWLo830TMffgumWuIkUe4CGmoNs3/u6Y+1O2c
	aHaYcGeIY/QBo3qIgdz3ocToWJ9OTyzaOW5FuU+fd+vXMWgslfIZArOooXr6MYYhwDvU9jFQxUi
	xZ8Jtk8t/1W/IATj9oJ0e0MEYM/YnSWNs9a/JzsoCgWgkdbXJyY3ml9oQ1q17Qt/EWcj2Oe8IUC
	fZqJQcfcDtJjRTELyF+50O6Eioxc+T170t8zz2vbBm5RQA5iRPu9Rw2taN4kN/kfhFuYu6DG9Kq
	d4o3aJ5IMTv+Af00b4e3P/BNBNx+ta6v7azrxQ/C20K4=
X-Google-Smtp-Source: AGHT+IH+a64xEOPVPhERDfj/+owOAQRBVcZN1KIVGv8qfkFFGNlsOI9q9ejBHs8ooi13JqXBcw4o9g==
X-Received: by 2002:a5d:64c3:0:b0:3b7:8832:fdd5 with SMTP id ffacd0b85a97d-3b900b2c83bmr9256965f8f.16.1754894798292;
        Sun, 10 Aug 2025 23:46:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c3c33fesm40026751f8f.29.2025.08.10.23.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:46:37 -0700 (PDT)
Date: Mon, 11 Aug 2025 09:46:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ioana Risteiu <Ioana.Risteiu@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ramona Nechita <ramona.nechita@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ioana Risteiu <Ioana.Risteiu@analog.com>
Subject: Re: [PATCH v2 3/3] iio: adc: update ad7779 to use IIO backend
Message-ID: <202508090909.tqDX7ah1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806192502.10120-4-Ioana.Risteiu@analog.com>

Hi Ioana,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ioana-Risteiu/iio-adc-adi-axi-adc-add-axi_adc_num_lanes_set/20250807-032923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250806192502.10120-4-Ioana.Risteiu%40analog.com
patch subject: [PATCH v2 3/3] iio: adc: update ad7779 to use IIO backend
config: x86_64-randconfig-161-20250809 (https://download.01.org/0day-ci/archive/20250809/202508090909.tqDX7ah1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508090909.tqDX7ah1-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad7779.c:893 setup_back() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +893 drivers/iio/adc/ad7779.c

1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  879  static int setup_back(struct ad7779_state *st, struct iio_dev *indio_dev)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  880  {
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  881  	struct device *dev = &st->spi->dev;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  882  	int ret = -EINVAL;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  883  	int num_lanes;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  884  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  885  	indio_dev->info = &ad7779_info_data;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  886  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  887  	ret = ad7779_conf_channels(indio_dev, st);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  888  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  889  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  890  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  891  	st->back = devm_iio_backend_get(dev, NULL);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  892  	if (IS_ERR(st->back)) {
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06 @893  		dev_err_probe(dev, ret, "failed to get iio backend");

s/ret/PTR_ERR(st->back)/

1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  894  		return PTR_ERR(st->back);

Change this to:

	if (IS_ERR(st->back))
		return dev_err_probe(dev, PTR_ERR(st->back),
				     "failed to get iio backend");

1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  895  	}
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  896  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  897  	ret = devm_iio_backend_request_buffer(dev, st->back, indio_dev);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  898  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  899  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  900  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  901  	ret = devm_iio_backend_enable(dev, st->back);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  902  	if (ret)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  903  		return ret;
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  904  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  905  	ret = device_property_read_u32(dev, "adi,num-lanes", &num_lanes);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  906  	if (ret < 0)
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  907  		return ad7779_set_data_lines(indio_dev, 4);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  908  
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  909  	return ad7779_set_data_lines(indio_dev, num_lanes);
1d61d2e4f96ac5 Ioana Risteiu 2025-08-06  910  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

