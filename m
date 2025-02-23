Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52906146D59
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 20:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740343024; cv=none; b=LYBi6brh65tMSz+iJTTKabehpn9ueKz4+k/WW9ttZvSad0eXC3QbnH8o4ZwnmbbHRK2Jh334zhDKHXwWcYHApiEztn1k1tgXvO49+xF1nEp9CddFRLxeddmunj+OGoMAIGbW9u2qXeL38dMQfA9jKHlLWOb+nTObMCPvtvbZYhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740343024; c=relaxed/simple;
	bh=DHuj2VRV2SX8ikjeTKoEqOtF6SFL3KuLz/ueA6KljYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fr3pKgzVXQNyXqAcGLramoT7RDyogQInQD4tMiXInNUy7mIyn2Y7Z7zi+hUK/sGNGrs/oRkqg8m8B5xHHVZIhGuoprPfjMT92bZOR6ejlR8w8d8NtlNw0qQf/1fd/65bPF44Nw016YA6YOZ71ykSxH4Ft5/7R63dzwjsWOWgLT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzT6hwKz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzT6hwKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740343023; x=1771879023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHuj2VRV2SX8ikjeTKoEqOtF6SFL3KuLz/ueA6KljYU=;
  b=NzT6hwKzfQCfpBRxQF8ozEO08/r2pXbNStgoFLcNN8AbAw9KwpqXMdGA
   5fM2undaKNvEBuZC3c/Xp0OYUdzdZ/OMrQj7+NtudKW9EiPYNZgtJZGwB
   7uK+AMPbekqOlKzF6Y/mrSzJOWl7/+O0kIi4XoRlhvy3/wSEi15mEtJ7H
   FNxOdMwbCFr2+ULx2CrCQvSY0zz1H5uzjdbNnd3/xte751VHFQGG8mddK
   jlaG60U2mZh4HBR7Z9mNAwpMQVWEVEwG8mmWMcqw/cukeieIZvOkLevCk
   nzY5P8T0BhqSRHkmpugE+uBe8hhG9XXAbKiwmWpK+OAXjWp46pDixxmXi
   A==;
X-CSE-ConnectionGUID: NgQVoS0DS6ekwju1RG3o9Q==
X-CSE-MsgGUID: UEHDlYfIRaCJejr7w6qvxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="44875315"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="44875315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 12:37:02 -0800
X-CSE-ConnectionGUID: PoqpmjMFTZaKvbzQQr7xLw==
X-CSE-MsgGUID: y/BL7vliRa68ZaemuiSYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116385346"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2025 12:37:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmIig-0007aF-1I;
	Sun, 23 Feb 2025 20:36:58 +0000
Date: Mon, 24 Feb 2025 04:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Looijmans <mike.looijmans@topic.nl>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: [jic23-iio:testing 163/170] drivers/iio/adc/dln2-adc.c:318:17-18:
 Unneeded semicolon
Message-ID: <202502240432.9W9aV3lh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   faeaa1ec6c63b6676679f321601471772f2a0c9b
commit: c6696b480fd488c879428c6a8da763411cb854a5 [163/170] iio: adc: Switch to sparse friendly iio_device_claim/release_direct()
config: powerpc-randconfig-r051-20250223 (https://download.01.org/0day-ci/archive/20250224/202502240432.9W9aV3lh-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502240432.9W9aV3lh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/adc/dln2-adc.c:318:17-18: Unneeded semicolon

vim +318 drivers/iio/adc/dln2-adc.c

   304	
   305	static int dln2_adc_read_raw(struct iio_dev *indio_dev,
   306				     struct iio_chan_spec const *chan,
   307				     int *val,
   308				     int *val2,
   309				     long mask)
   310	{
   311		int ret;
   312		unsigned int microhertz;
   313		struct dln2_adc *dln2 = iio_priv(indio_dev);
   314	
   315		switch (mask) {
   316		case IIO_CHAN_INFO_RAW:
   317			if (!iio_device_claim_direct(indio_dev))
 > 318				return -EBUSY;;
   319	
   320			mutex_lock(&dln2->mutex);
   321			ret = dln2_adc_read(dln2, chan->channel);
   322			mutex_unlock(&dln2->mutex);
   323	
   324			iio_device_release_direct(indio_dev);
   325	
   326			if (ret < 0)
   327				return ret;
   328	
   329			*val = ret;
   330			return IIO_VAL_INT;
   331	
   332		case IIO_CHAN_INFO_SCALE:
   333			/*
   334			 * Voltage reference is fixed at 3.3v
   335			 *  3.3 / (1 << 10) * 1000000000
   336			 */
   337			*val = 0;
   338			*val2 = 3222656;
   339			return IIO_VAL_INT_PLUS_NANO;
   340	
   341		case IIO_CHAN_INFO_SAMP_FREQ:
   342			if (dln2->sample_period) {
   343				microhertz = 1000000000 / dln2->sample_period;
   344				*val = microhertz / 1000000;
   345				*val2 = microhertz % 1000000;
   346			} else {
   347				*val = 0;
   348				*val2 = 0;
   349			}
   350	
   351			return IIO_VAL_INT_PLUS_MICRO;
   352	
   353		default:
   354			return -EINVAL;
   355		}
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
