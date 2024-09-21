Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3773C36C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 01:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726881086; cv=none; b=LAjJ2Q7pZmTw0l8m+rU0nN1Qvuzhg4DR2OXvt0zLYd+YGk2ZVLj9+MvbgcZ+mWyMnkJqx88EwOKebFo+KMGV4nuemvwanNNhqUH4BB0bwcaNM6DTOvHIlYkt9N9oa4cr9/SRALGwxtV/SCxDEInbq4OIMR5vlw3xwiXQ7izTsOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726881086; c=relaxed/simple;
	bh=knB1T1YQd0DVg/q5DSjwZOV+QhV/i2GJx7TftXT/vMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pttkS8i1WdPKIG3eWwTyGhqSYZcskYxLVXNFYsDsr6daNmJdor/9U5hwBcrcKsG8vP5KWBA8LVgnV81B1IoeaC9hKfOh9YKczjxMjpBrZgcbiYWCaocuss5KrV91hdqunsaEiEKo3I+sT4HZUM7saTQzUaU3BJhHxEu9X0xZ+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbkNmNg0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbkNmNg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726881084; x=1758417084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=knB1T1YQd0DVg/q5DSjwZOV+QhV/i2GJx7TftXT/vMw=;
  b=LbkNmNg0tNcREXAXTDQWcVblqIuNCQqyv3PBVXWnTLDhVUqsUSiT4jr0
   LRqsFQwAiDgNkvboPcS+7LfhUlao18vnLBj7/607XlOiLkKZl42uSTGZj
   zD6HKMldDoQi6AURSxBLOWMfkvWjqTwz9OCHoRe1k6U1uctCFdH3oHwtj
   0Te6DnemWWsX3Wsv8y3Pfw9rBfCnNGPZB+SmmkMxV/FlSiPbkkwN7cstm
   LTpUKfQm6DsZWoQW0Gy2bpfcIJ0hiqBU/za/If539ceLLVW/rSHIUufAV
   xGJUd3H8aEs/jXNjjoJy2cNvyHLeGJxMN2AyWJYOUlvVrfVeHY9z4DqQ6
   A==;
X-CSE-ConnectionGUID: OXo2UJqCRGetyXueQ95FhQ==
X-CSE-MsgGUID: BKKmPG2JQS6iPpXjjbM8Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25776274"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="25776274"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 18:11:23 -0700
X-CSE-ConnectionGUID: bPZnKP4qQsG0tk2teks7CA==
X-CSE-MsgGUID: vVZ0dxTkS3WZEUkcvmAmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="101325655"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2024 18:11:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sroec-000F0V-0k;
	Sat, 21 Sep 2024 01:11:18 +0000
Date: Sat, 21 Sep 2024 09:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Mariel Tinaco <Mariel.Tinaco@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] iio: dac: support the ad8460 Waveform DAC
Message-ID: <202409210849.cRodncgA-lkp@intel.com>
References: <20240912095435.18639-3-Mariel.Tinaco@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912095435.18639-3-Mariel.Tinaco@analog.com>

Hi Mariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on fec496684388685647652ab4213454fbabdab099]

url:    https://github.com/intel-lab-lkp/linux/commits/Mariel-Tinaco/dt-bindings-iio-dac-add-docs-for-ad8460/20240912-175718
base:   fec496684388685647652ab4213454fbabdab099
patch link:    https://lore.kernel.org/r/20240912095435.18639-3-Mariel.Tinaco%40analog.com
patch subject: [PATCH v4 2/2] iio: dac: support the ad8460 Waveform DAC
config: sparc-randconfig-r071-20240921 (https://download.01.org/0day-ci/archive/20240921/202409210849.cRodncgA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210849.cRodncgA-lkp@intel.com/

smatch warnings:
drivers/iio/dac/ad8460.c:545 ad8460_write_event_value() warn: unsigned 'fault' is never less than zero.
drivers/iio/dac/ad8460.c:545 ad8460_write_event_value() warn: error code type promoted to positive: 'fault'
drivers/iio/dac/ad8460.c:567 ad8460_read_event_value() warn: unsigned 'fault' is never less than zero.
drivers/iio/dac/ad8460.c:567 ad8460_read_event_value() warn: error code type promoted to positive: 'fault'
drivers/iio/dac/ad8460.c:585 ad8460_write_event_config() warn: unsigned 'fault' is never less than zero.
drivers/iio/dac/ad8460.c:585 ad8460_write_event_config() warn: error code type promoted to positive: 'fault'
drivers/iio/dac/ad8460.c:605 ad8460_read_event_config() warn: unsigned 'fault' is never less than zero.
drivers/iio/dac/ad8460.c:605 ad8460_read_event_config() warn: error code type promoted to positive: 'fault'

vim +/fault +545 drivers/iio/dac/ad8460.c

   528	
   529	static int ad8460_write_event_value(struct iio_dev *indio_dev,
   530					    const struct iio_chan_spec *chan,
   531					    enum iio_event_type type,
   532					    enum iio_event_direction dir,
   533					    enum iio_event_info info, int val, int val2)
   534	{
   535		struct ad8460_state *state = iio_priv(indio_dev);
   536		unsigned int fault;
   537	
   538		if (type != IIO_EV_TYPE_THRESH)
   539			return -EINVAL;
   540	
   541		if (info != IIO_EV_INFO_VALUE)
   542			return -EINVAL;
   543	
   544		fault = ad8460_select_fault_type(chan->type, dir);
 > 545		if (fault < 0)
   546			return fault;
   547	
   548		return ad8460_set_fault_threshold(state, fault, val);
   549	}
   550	
   551	static int ad8460_read_event_value(struct iio_dev *indio_dev,
   552					   const struct iio_chan_spec *chan,
   553					   enum iio_event_type type,
   554					   enum iio_event_direction dir,
   555					   enum iio_event_info info, int *val, int *val2)
   556	{
   557		struct ad8460_state *state = iio_priv(indio_dev);
   558		unsigned int fault;
   559	
   560		if (type != IIO_EV_TYPE_THRESH)
   561			return -EINVAL;
   562	
   563		if (info != IIO_EV_INFO_VALUE)
   564			return -EINVAL;
   565	
   566		fault = ad8460_select_fault_type(chan->type, dir);
 > 567		if (fault < 0)
   568			return fault;
   569	
   570		return ad8460_get_fault_threshold(state, fault, val);
   571	}
   572	
   573	static int ad8460_write_event_config(struct iio_dev *indio_dev,
   574					     const struct iio_chan_spec *chan,
   575					     enum iio_event_type type,
   576					     enum iio_event_direction dir, int val)
   577	{
   578		struct ad8460_state *state = iio_priv(indio_dev);
   579		unsigned int fault;
   580	
   581		if (type != IIO_EV_TYPE_THRESH)
   582			return -EINVAL;
   583	
   584		fault = ad8460_select_fault_type(chan->type, dir);
 > 585		if (fault < 0)
   586			return fault;
   587	
   588		return ad8460_set_fault_threshold_en(state, fault, val);
   589	}
   590	
   591	static int ad8460_read_event_config(struct iio_dev *indio_dev,
   592					    const struct iio_chan_spec *chan,
   593					    enum iio_event_type type,
   594					    enum iio_event_direction dir)
   595	{
   596		struct ad8460_state *state = iio_priv(indio_dev);
   597		unsigned int fault;
   598		bool en;
   599		int ret;
   600	
   601		if (type != IIO_EV_TYPE_THRESH)
   602			return -EINVAL;
   603	
   604		fault = ad8460_select_fault_type(chan->type, dir);
 > 605		if (fault < 0)
   606			return fault;
   607	
   608		ret = ad8460_get_fault_threshold_en(state, fault, &en);
   609		if (ret)
   610			return ret;
   611	
   612		return en;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
