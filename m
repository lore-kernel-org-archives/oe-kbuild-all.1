Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A025B111AD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 08:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403420; cv=none; b=A7jIm/mPAA+cUn0X5Op6xg0zfyX1/UKfMhUQ9KPopYI2YXbIxjjS3OZGcC4DvBvrZjHfWjOvWRBSDYsPS29rVw2Lrvdu7u6N93l5aK5PETIcuYrZuqa5H+lhUsBR1JwtYemGUkmKj507r90oekQbUGVc1DIsnIeljJFx40tRLqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403420; c=relaxed/simple;
	bh=Jxm0+iHaq0TizvhCVc36yq0Rz2NgNjhOqPnEAAewsRA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=La2H9DMS8FIPSVMRkU3anbS8Nxy96gwmlflMszkKV+7RBCZsJRfQzHh01aH6iKBpWjnDG/YX4qP6ZFv9m3IF7cLuRqCQt59h58kpCPnTxVQ3JkggxYY4auKKtebdAHIZF3E5Im3IBO+iKLK4MkJAxkLv+ktgVLvi09Px7IrcqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Vt6Ht5vW2z6JBM4;
	Mon,  3 Jun 2024 16:26:02 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 00053140684;
	Mon,  3 Jun 2024 16:30:14 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Jun
 2024 09:30:14 +0100
Date: Mon, 3 Jun 2024 09:30:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: Julien Stephan <jstephan@baylibre.com>, <oe-kbuild-all@lists.linux.dev>,
	David Lechner <dlechner@baylibre.com>
Subject: Re: [jic23-iio:testing 62/78] drivers/iio/adc/ad7380.c:389:
 warning: Function parameter or struct member 'st' not described in
 'ad7380_update_xfers'
Message-ID: <20240603093014.00003b09@Huawei.com>
In-Reply-To: <202406022123.UCiKiwtQ-lkp@intel.com>
References: <202406022123.UCiKiwtQ-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Sun, 2 Jun 2024 21:09:56 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   f63207dfc09b1aec17b264e5ae62a49ceba05f50
> commit: a6717bfbc3423a935f0dfd3626fe339488ba57f4 [62/78] iio: adc: ad7380: add oversampling support
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240602/202406022123.UCiKiwtQ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406022123.UCiKiwtQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406022123.UCiKiwtQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/iio/adc/ad7380.c:389: warning: Function parameter or struct member 'st' not described in 'ad7380_update_xfers'
> >> drivers/iio/adc/ad7380.c:389: warning: Function parameter or struct member 'scan_type' not described in 'ad7380_update_xfers'
> >> drivers/iio/adc/ad7380.c:389: warning: Excess function parameter 'indio_dev' description in 'ad7380_update_xfers'
> >> drivers/iio/adc/ad7380.c:389: warning: Excess function parameter 'chan' description in 'ad7380_update_xfers'  
> 
Hmm. Too much going on yesterday so I guess I missed the warning in local builds.

Anyhow, 0-day to the rescue :)  I'll fix up once I'm on the right machine (probably this evening)

Jonathan

> 
> vim +389 drivers/iio/adc/ad7380.c
> 
>    381	
>    382	/**
>    383	 * ad7380_update_xfers - update the SPI transfers base on the current scan type
>    384	 * @indio_dev:	IIO device structure
>    385	 * @chan:	IIO channel
>    386	 */
>    387	static void ad7380_update_xfers(struct ad7380_state *st,
>    388					const struct iio_scan_type *scan_type)
>  > 389	{  
>    390		/*
>    391		 * First xfer only triggers conversion and has to be long enough for
>    392		 * all conversions to complete, which can be multiple conversion in the
>    393		 * case of oversampling. Technically T_CONVERT_X_NS is lower for some
>    394		 * chips, but we use the maximum value for simplicity for now.
>    395		 */
>    396		if (st->oversampling_ratio > 1)
>    397			st->xfer[0].delay.value = T_CONVERT_0_NS + T_CONVERT_X_NS *
>    398							(st->oversampling_ratio - 1);
>    399		else
>    400			st->xfer[0].delay.value = T_CONVERT_NS;
>    401	
>    402		st->xfer[0].delay.unit = SPI_DELAY_UNIT_NSECS;
>    403	
>    404		/*
>    405		 * Second xfer reads all channels. Data size depends on if resolution
>    406		 * boost is enabled or not.
>    407		 */
>    408		st->xfer[1].bits_per_word = scan_type->realbits;
>    409		st->xfer[1].len = BITS_TO_BYTES(scan_type->storagebits) *
>    410				  (st->chip_info->num_channels - 1);
>    411	}
>    412	
> 

