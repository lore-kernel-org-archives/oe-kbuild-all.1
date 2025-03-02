Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD561D7E26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740912280; cv=none; b=hMp+8uAlAVKub0EVu17NSL5aMVqIomAxMW+JNmqs6U6l62VmEYHfcGPew3zZNUQm3gX26C1wSVco6zKE7bM1OAoyojUfDNL498Cjm8hUIvpiwkafxSudTCMMVvJtvsldCV/hpofKx/pa1qnlgFMNxyX0Hu7ilDYyETFiJbUDyeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740912280; c=relaxed/simple;
	bh=JZcS/dfDHs8BK3SuZZhwRawDXjzK/bMHDHACUlf9zek=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=GDmwCKGNurrwUNtYVMx5QenU3whImeqRw2n3RGStH0tzR6EdW56lMf9lmetaByTpOWbFO18vHZ5jJJGAZzWG5b/R+su3rUqauPnLUhQXwuXE/I0AYv0S/LDpS4wOxDv7DJoJcujgrAh97cVVGO9EQVCdinydrtTrkPBx2vAflt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=KHrNOj7Z; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="KHrNOj7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQvvSAfClQxQS3OXN/wRKyr4X8vmwB6Lk7tLree07v4=;
  b=KHrNOj7ZGlaTm1kKM4499QECxOFwGyxNjiKgbjpfcptIiYduLcNAJH5F
   5TTB7wEtMdd6llOXtB0gc/zKHlpuVFKTsJTS8VOIaHunFk2MdfT1nI9il
   MzIkals4perNLUjScE05imm1MzC31K6WerkxdKINqYGudMGn3kb5EKOt2
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.13,327,1732575600"; 
   d="scan'208";a="110421708"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 11:43:24 +0100
Date: Sun, 2 Mar 2025 05:43:22 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
    oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:testing 82/172] drivers/iio/adc/ad4851.c:581:6-7: WARNING:
 Unsigned expression compared with zero: c < 0 (fwd)
Message-ID: <106a76ae-19b8-fa72-38fa-c82125552efc@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On line 581, c is unsigned, so it is not less than 0.

julia

---------- Forwarded message ----------
Date: Sun, 2 Mar 2025 14:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 82/172] drivers/iio/adc/ad4851.c:581:6-7: WARNING:
    Unsigned expression compared with zero: c < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   bd9ffb54e566ad6f94ec4293f82f06d417b6cfc8
commit: 6250803fe2ec92be32a4df1c3a39c4a460d5bd58 [82/172] iio: adc: ad4851: add ad485x driver
:::::: branch date: 27 hours ago
:::::: commit date: 2 weeks ago
config: m68k-randconfig-r064-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021430.iImts3C4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503021430.iImts3C4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/ad4851.c:581:6-7: WARNING: Unsigned expression compared with zero: c < 0

vim +581 drivers/iio/adc/ad4851.c

6250803fe2ec92 Antoniu Miclaus 2025-02-14  491
6250803fe2ec92 Antoniu Miclaus 2025-02-14  492  static int ad4851_calibrate(struct iio_dev *indio_dev)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  493  {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  494  	struct ad4851_state *st = iio_priv(indio_dev);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  495  	unsigned int opt_delay, num_lanes, delay, i, s, c;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  496  	enum iio_backend_interface_type interface_type;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  497  	DECLARE_BITMAP(pn_status, AD4851_MAX_LANES * AD4851_MAX_IODELAY);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  498  	bool status;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  499  	int ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  500
6250803fe2ec92 Antoniu Miclaus 2025-02-14  501  	ret = iio_backend_interface_type_get(st->back, &interface_type);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  502  	if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  503  		return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  504
6250803fe2ec92 Antoniu Miclaus 2025-02-14  505  	switch (interface_type) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  506  	case IIO_BACKEND_INTERFACE_SERIAL_CMOS:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  507  		num_lanes = indio_dev->num_channels;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  508  		break;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  509  	case IIO_BACKEND_INTERFACE_SERIAL_LVDS:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  510  		num_lanes = 1;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  511  		break;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  512  	default:
6250803fe2ec92 Antoniu Miclaus 2025-02-14  513  		return -EINVAL;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  514  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  515
6250803fe2ec92 Antoniu Miclaus 2025-02-14  516  	if (st->info->resolution == 16) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  517  		ret = iio_backend_data_size_set(st->back, 24);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  518  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  519  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  520
6250803fe2ec92 Antoniu Miclaus 2025-02-14  521  		ret = regmap_write(st->regmap, AD4851_REG_PACKET,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  522  				   AD4851_TEST_PAT | AD4857_PACKET_SIZE_24);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  523  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  524  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  525  	} else {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  526  		ret = iio_backend_data_size_set(st->back, 32);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  527  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  528  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  529
6250803fe2ec92 Antoniu Miclaus 2025-02-14  530  		ret = regmap_write(st->regmap, AD4851_REG_PACKET,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  531  				   AD4851_TEST_PAT | AD4858_PACKET_SIZE_32);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  532  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  533  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  534  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  535
6250803fe2ec92 Antoniu Miclaus 2025-02-14  536  	for (i = 0; i < indio_dev->num_channels; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  537  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_0(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  538  				   AD4851_TESTPAT_0_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  539  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  540  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  541
6250803fe2ec92 Antoniu Miclaus 2025-02-14  542  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_1(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  543  				   AD4851_TESTPAT_1_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  544  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  545  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  546
6250803fe2ec92 Antoniu Miclaus 2025-02-14  547  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_2(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  548  				   AD4851_TESTPAT_2_DEFAULT);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  549  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  550  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  551
6250803fe2ec92 Antoniu Miclaus 2025-02-14  552  		ret = regmap_write(st->regmap, AD4851_REG_TESTPAT_3(i),
6250803fe2ec92 Antoniu Miclaus 2025-02-14  553  				   AD4851_TESTPAT_3_DEFAULT(i));
6250803fe2ec92 Antoniu Miclaus 2025-02-14  554  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  555  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  556
6250803fe2ec92 Antoniu Miclaus 2025-02-14  557  		ret = iio_backend_chan_enable(st->back,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  558  					      indio_dev->channels[i].channel);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  559  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  560  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  561  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  562
6250803fe2ec92 Antoniu Miclaus 2025-02-14  563  	for (i = 0; i < num_lanes; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  564  		for (delay = 0; delay < AD4851_MAX_IODELAY; delay++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  565  			ret = iio_backend_iodelay_set(st->back, i, delay);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  566  			if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  567  				return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  568
6250803fe2ec92 Antoniu Miclaus 2025-02-14  569  			ret = iio_backend_chan_status(st->back, i, &status);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  570  			if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  571  				return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  572
6250803fe2ec92 Antoniu Miclaus 2025-02-14  573  			__assign_bit(i * AD4851_MAX_IODELAY + delay, pn_status,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  574  				     status);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  575  		}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  576  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  577
6250803fe2ec92 Antoniu Miclaus 2025-02-14  578  	for (i = 0; i < num_lanes; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  579  		c = ad4851_find_opt(pn_status, i * AD4851_MAX_IODELAY,
6250803fe2ec92 Antoniu Miclaus 2025-02-14  580  				    AD4851_MAX_IODELAY, &s);
6250803fe2ec92 Antoniu Miclaus 2025-02-14 @581  		if (c < 0)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  582  			return c;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  583
6250803fe2ec92 Antoniu Miclaus 2025-02-14  584  		opt_delay = s + c / 2;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  585  		ret = iio_backend_iodelay_set(st->back, i, opt_delay);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  586  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  587  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  588  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  589
6250803fe2ec92 Antoniu Miclaus 2025-02-14  590  	for (i = 0; i < indio_dev->num_channels; i++) {
6250803fe2ec92 Antoniu Miclaus 2025-02-14  591  		ret = iio_backend_chan_disable(st->back, i);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  592  		if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  593  			return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  594  	}
6250803fe2ec92 Antoniu Miclaus 2025-02-14  595
6250803fe2ec92 Antoniu Miclaus 2025-02-14  596  	ret = iio_backend_data_size_set(st->back, 20);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  597  	if (ret)
6250803fe2ec92 Antoniu Miclaus 2025-02-14  598  		return ret;
6250803fe2ec92 Antoniu Miclaus 2025-02-14  599
6250803fe2ec92 Antoniu Miclaus 2025-02-14  600  	return regmap_write(st->regmap, AD4851_REG_PACKET, 0);
6250803fe2ec92 Antoniu Miclaus 2025-02-14  601  }
6250803fe2ec92 Antoniu Miclaus 2025-02-14  602

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
